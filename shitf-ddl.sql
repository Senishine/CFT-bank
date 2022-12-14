DECLARE
    type table_type is table of VARCHAR2(50);
    tables table_type := table_type('RECORDS', 'ACCOUNTS', 'PRODUCTS', 'PRODUCT_TYPE', 'TARIFS', 'CLIENTS');
BEGIN
    FOR i IN 1..tables.COUNT LOOP   
        BEGIN
         EXECUTE IMMEDIATE 'DROP TABLE ' || tables(i);
        EXCEPTION
        WHEN OTHERS THEN
          IF SQLCODE != -942 THEN
             RAISE;
          END IF;    
        END;
    END LOOP;
END;
/


CREATE TABLE CLIENTS (
    ID NUMBER(10) PRIMARY KEY,
    NAME VARCHAR2(1000) NOT NULL,
    PLACE_OF_BIRTH VARCHAR2(1000) NOT NULL,
    DATE_OF_BIRTH DATE NOT NULL,
    ADDRESS VARCHAR2(1000) NOT NULL,
    PASSPORT VARCHAR2(100) NOT NULL
);

CREATE TABLE TARIFS (
    ID NUMBER(10) PRIMARY KEY,
    NAME VARCHAR2(100) NOT NULL,
    COST NUMBER(10,2) NOT NULL
);

CREATE TABLE PRODUCT_TYPE(
    ID NUMBER(10) PRIMARY KEY,
    NAME VARCHAR2(100) NOT NULL,
    BEGIN_DATE DATE DEFAULT SYSDATE NOT NULL,
    END_DATE DATE,
    TARIF_REF NUMBER(10) NOT NULL,
    FOREIGN KEY(TARIF_REF)
        REFERENCES TARIFS(ID) 
        ON DELETE CASCADE
);


CREATE TABLE PRODUCTS(
    ID NUMBER(10) PRIMARY KEY,
    PRODUCT_TYPE_ID NUMBER(10) NOT NULL,
    NAME VARCHAR2(100) NOT NULL,
    CLIENT_REF NUMBER(10) NOT NULL,
    OPEN_DATE DATE DEFAULT SYSDATE NOT NULL,
    CLOSE_DATE DATE,
    FOREIGN KEY(PRODUCT_TYPE_ID)
        REFERENCES PRODUCT_TYPE(ID)
        ON DELETE CASCADE,
    FOREIGN KEY (CLIENT_REF)
        REFERENCES CLIENTS(ID)
        ON DELETE CASCADE
);

CREATE TABLE ACCOUNTS(
    ID NUMBER(10) PRIMARY KEY,
    NAME VARCHAR2(100) NOT NULL,
    SALDO NUMBER(10,2) NOT NULL,
    CLIENT_REF NUMBER(10) NOT NULL,
    OPEN_DATE DATE DEFAULT SYSDATE NOT NULL,
    CLOSE_DATE DATE,
    PRODUCT_REF NUMBER(10) NOT NULL,
    ACC_NUM VARCHAR2(25),
        FOREIGN KEY(PRODUCT_REF)
        REFERENCES PRODUCTS(ID)
        ON DELETE CASCADE,
    FOREIGN KEY (CLIENT_REF)
        REFERENCES CLIENTS(ID)
        ON DELETE CASCADE
);

CREATE TABLE RECORDS(
    ID NUMBER(10) PRIMARY KEY,
    DT NUMBER(1) NOT NULL,
    SUM NUMBER(10,2) NOT NULL,
    ACC_REF NUMBER(10) NOT NULL,
    OPER_DATE DATE,
        FOREIGN KEY(ACC_REF)
        REFERENCES ACCOUNTS(ID)
        ON DELETE CASCADE    
);


CREATE OR REPLACE TRIGGER append_saldo
   AFTER INSERT OR UPDATE OR DELETE ON records
   FOR EACH ROW
    DECLARE
        record_sum NUMBER(10, 2);
        dt NUMBER(1);
        acc_ref NUMBER(10);
    BEGIN
        IF INSERTING THEN
            dt := :new.dt;
            record_sum := :new.sum;
            acc_ref := :new.acc_ref;
        ELSIF UPDATING THEN
            dt := :new.dt;
            record_sum := :new.sum - :old.sum;
            acc_ref := :new.acc_ref;
        ELSIF DELETING THEN
            dt := :old.dt;
            record_sum := -:old.sum;
            acc_ref := :old.acc_ref;
        END IF;
        IF dt = 1 THEN
            record_sum := -record_sum;
        END IF;
        UPDATE accounts a SET a.saldo = a.saldo + record_sum
        WHERE a.id = acc_ref;
END;