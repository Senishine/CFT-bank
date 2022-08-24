-- Сформируйте отчет, который содержит все счета, относящиеся к продуктам типа ДЕПОЗИТ, принадлежащих клиентам, у которых нет открытых продуктов типа КРЕДИТ.
SELECT deposit_acc.* FROM (
    SELECT a.* FROM accounts a, products p
    WHERE 
        a.product_ref = p.id AND
        p.id = (SELECT id from product_type where name = 'ДЕПОЗИТ')
) deposit_acc, (    
    SELECT id FROM clients WHERE id NOT IN (
        SELECT distinct p.client_ref FROM products p
             WHERE
                p.id = (SELECT id from product_type where name = 'КРЕДИТ')
    )
    /*
        SELECT c.id FROM clients c LEFT JOIN products p
        ON c.id = p.client_ref AND p.id = (SELECT id from product_type where name = 'КРЕДИТ')
        GROUP BY c.id
        HAVING COUNT(p.id) = 0;
    */
) clients_without_credit
WHERE deposit_acc.client_ref = clients_without_credit.id;

-- Сформируйте выборку, который содержит средние движения по счетам в рамках одного произвольного дня, в разрезе типа продукта.  
-- Вариант 1: все дни по типам продуктов и дням
SELECT 
    pt.name product_type,
    -- учитываем направление движения
    r.oper_date, AVG(CASE WHEN r.dt = 1 THEN -r.sum ELSE r.sum END) average 
FROM product_type pt JOIN products p 
        ON pt.id = p.product_type_id 
    JOIN accounts a 
        ON a.product_ref = p.id 
    JOIN records r 
        ON a.id = r.acc_ref
    GROUP BY pt.id, pt.name, r.oper_date
    ORDER BY r.oper_date desc;

-- Вариант 2: один конкретно заданный день по типам продуктов
SELECT 
    pt.name product_type,
    -- учитываем направление движения
    r.oper_date, AVG(CASE WHEN r.dt = 1 THEN -r.sum ELSE r.sum END) average 
FROM product_type pt JOIN products p 
        ON pt.id = p.product_type_id 
    JOIN accounts a 
        ON a.product_ref = p.id 
    JOIN records r 
        ON a.id = r.acc_ref
    WHERE r.oper_date = to_date('01.06.22', 'DD.MM.YY')
    GROUP BY pt.id, pt.name, r.oper_date
    ORDER BY r.oper_date desc;


-- Сформируйте выборку, в который попадут клиенты, у которых были операции по счетам за прошедший месяц от текущей даты. Выведите клиента и сумму операций за день в разрезе даты.
SELECT 
    c.id, 
    c.name, 
    c.passport, 
    r.oper_date, 
    sum(CASE WHEN r.dt = 1 THEN -r.sum ELSE r.sum END) sum 
FROM records r JOIN accounts a ON r.acc_ref = a.id JOIN clients c ON c.id = a.client_ref
    WHERE r.oper_date >= ADD_MONTHS(SYSDATE, -1)
    GROUP BY c.id, c.name, c.passport, r.oper_date
    ORDER BY r.oper_date desc;

-- В результате сбоя в базе данных разъехалась информация между остатками и операциями по счетам. Напишите нормализацию (процедуру выравнивающую данные), которая найдет такие счета и восстановит остатки по счету.
CREATE OR REPLACE PROCEDURE adjust_saldo IS
    CURSOR broken_accs IS
        SELECT a.id id, real_values.saldo saldo 
        FROM 
            accounts a, 
            (SELECT r.acc_ref, sum(case when r.dt = 1 then -r.sum else r.sum end) saldo FROM records r GROUP BY r.acc_ref) real_values
        -- выбираем все счета где сальдо не равно сумме всех операций по этому счету
        WHERE a.id = real_values.acc_ref AND a.saldo <> real_values.saldo;
    broken_accs_row broken_accs%ROWTYPE;
BEGIN
    OPEN broken_accs;
        LOOP
            FETCH broken_accs INTO broken_accs_row;
            EXIT WHEN broken_accs%NOTFOUND;
            UPDATE accounts a SET a.saldo = broken_accs_row.saldo
            WHERE a.id = broken_accs_row.id;
        END LOOP;
    CLOSE broken_accs;
END adjust_saldo;
/

--begin
--    adjust_saldo();
--end;
--/

-- Сформируйте выборку, который содержит информацию о клиентах, которые полностью погасили кредит, но при этом не закрыли продукт и пользуются им дальше (по продукту есть операция новой выдачи кредита).
SELECT DISTINCT  c.* FROM clients c, (
    -- оставляем только те продукты где баланс по всем счетам положительный
    SELECT p.id, p.client_ref FROM products p JOIN accounts a ON p.id = a.product_ref
        WHERE p.id = (SELECT id FROM product_type pt WHERE pt.name = 'КРЕДИТ') 
            AND p.close_date is NULL
        GROUP BY p.id, p.client_ref
        HAVING MIN(a.saldo) >= 0
) saldo
WHERE saldo.client_ref = c.id;

-- Закройте продукты (установите дату закрытия равную текущей) типа КРЕДИТ, у которых произошло полное погашение, но при этом не было повторной выдачи.
UPDATE products p SET p.close_date = SYSDATE
WHERE p.id IN (
    SELECT p.id FROM products p JOIN accounts a ON p.id = a.product_ref JOIN records r ON a.id = r.acc_ref
                WHERE p.id = (SELECT id FROM product_type pt WHERE pt.name = 'КРЕДИТ')
                -- провереряем что продукт не закрыт
                    AND p.close_date IS NULL AND r.dt = 1
                GROUP BY p.id
                -- все счета должны быть с положительным сальдо, а также нет повторной выдачи денег records.dt = 1
                HAVING MIN(a.saldo) >= 0 AND COUNT(r.id) = 1
);

-- Закройте возможность открытия (установите дату окончания действия) для типов продуктов, по счетам продуктов которых, не было движений более одного месяца.
-- Вариант 1: закрываем счета, где не было движений за последний месяц
UPDATE product_type pt SET pt.end_date = SYSDATE
WHERE pt.end_date IS NULL AND pt.id IN (
    SELECT pt.id FROM product_type pt, products p, accounts a LEFT JOIN records r ON a.id = r.acc_ref AND r.oper_date >= ADD_MONTHS(SYSDATE, -1)
        WHERE  pt.id = p.product_type_id AND p.id = a.product_ref
        GROUP BY pt.id
        HAVING COUNT(r.id) = 0
);
-- Вариант 2: закрываем счета, где не было движений в течение какого либо месяца
UPDATE product_type pt SET pt.end_date = SYSDATE
WHERE pt.end_date IS NULL AND pt.id IN (
WITH
    all_opers AS (
        SELECT pt.id, pt.name, r.oper_date 
            FROM product_type pt, products p, accounts a, records r
            WHERE pt.id = p.product_type_id AND p.id = a.product_ref AND a.id = r.acc_ref
    ),
    diff AS (
        SELECT ao1.id, ao1.name, ao1.oper_date, min(ao2.oper_date) next_oper 
            FROM all_opers ao1, all_opers ao2
        WHERE ao1.id = ao2.id AND ao1.oper_date < ao2.oper_date
        GROUP BY ao1.id, ao1.name, ao1.oper_date
    )
    SELECT DISTINCT id FROM diff WHERE ADD_MONTHS(NEXT_OPER, -1) >= OPER_DATE
);

-- В модель данных добавьте сумму договора по продукту. Заполните поле для всех продуктов суммой максимальной дебетовой операции по счету для продукта типа КРЕДИТ, и суммой максимальной кредитовой операции по счету продукта для продукта типа ДЕПОЗИТ или КАРТА.
ALTER TABLE products ADD contract_sum NUMBER(10,2);

UPDATE products p SET contract_sum = (
    SELECT MAX(r.sum) FROM accounts a JOIN records r ON p.id = a.product_ref AND r.acc_ref = a.id
        WHERE ((p.product_type_id = (SELECT id FROM product_type WHERE name = 'КРЕДИТ') AND r.dt = 1) OR r.dt = 0)
        GROUP BY p.id
)
WHERE p.contract_sum IS NULL;