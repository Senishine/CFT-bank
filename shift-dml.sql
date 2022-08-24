begin
  
insert into tarifs values (1,'����� �� ������ �������', 10);
insert into tarifs values (2,'����� �� �������� �����', 10);
insert into tarifs values (3,'����� �� ������������ �����', 10);

insert into product_type values (1, '������', to_date('01.01.2022','DD.MM.YYYY'), null, 1);
insert into product_type values (2, '�������', to_date('01.01.2022','DD.MM.YYYY'), null, 2);
insert into product_type values (3, '�����', to_date('01.01.2022','DD.MM.YYYY'), null, 3);

insert into clients values (1, '������� ���� ��������', '������, ���������� �������, �. ������', to_date('01.01.2001','DD.MM.YYYY'), '������, ���������� ������, �. ������, ��. ����������, �. 5', '2222 555555, ����� ��� �. ������, 10.01.2015');
insert into clients values (2, '������ ���� ���������', '������, ���������� �������, �. ����', to_date('01.01.2001','DD.MM.YYYY'), '������, ���������� ������, �. ����, ��. ���������, �. 3', '4444 666666, ����� ��� �. ����, 10.01.2015');
insert into clients values (3, '������ ���� ��������', '������, ���������� �������, �. ��������', to_date('01.01.2001','DD.MM.YYYY'), '������, ���������� ������, �. ��������, ��. �������, �. 7', '4444 666666, ����� ��� �. ����, 10.01.2015');
insert into clients values (4, '������� ����� ��������', '������, ���������� �������, �. ��������', to_date('01.01.1995','DD.MM.YYYY'), '������, ���������� ������, �. ��������, ��. ����������, �. 7', '4100 666666, ����� ��� �. ����, 10.01.2015');
insert into clients values (5, '�������� ����� ����������', '������, ���������� �������, �. �������', to_date('15.12.1990','DD.MM.YYYY'), '������, ���������� ������, �. �������, ��. �������, �. 7', '4222 666666, ����� ��� �. ����, 10.01.2015');
insert into clients values (6, '������� ������ ���������', '������, ���������� �������, �. ������', to_date('18.06.1981','DD.MM.YYYY'), '������, ���������� ������, �. ������, ��. ������������, �. 7', '4444 515999, ����� ��� �. ����, 10.01.2015');
insert into clients values (7, '�������� ������ ����������', '������, ���������� �������, �. �����', to_date('08.03.2085','DD.MM.YYYY'), '������, ���������� ������, �. �����, ��. ������, �. 7', '4444 60366, ����� ��� �. ����, 10.01.2015');
insert into clients values (8, '���������� ����� ��������', '������, ���������� �������, �. ��������', to_date('01.01.2001','DD.MM.YYYY'), '������, ���������� ������, �. ��������, ��. �������, �. 7', '4444 666666, ����� ��� �. ����, 10.01.2015');
insert into clients values (9, '����� ����� ����������', '������, ������������� �������, �. ������', to_date('01.01.2001','DD.MM.YYYY'), '������, ������������� ������, �. ������, ��. ����������, �. 2', '4444 666666, ����� ��� �. ����, 10.01.2015');
insert into clients values (10, '������� ������� ��������', '������, ������������� �������, �. �������', to_date('01.01.2001','DD.MM.YYYY'), '������, ������������� ������, �. �������, ��. �����������, �. 13', '4444 666666, ����� ��� �. ����, 10.01.2015');
insert into clients values (11, '������ ��������� ���������', '������, ������������� �������, �. ����', to_date('01.01.2001','DD.MM.YYYY'), '������, ���������� ������, �. ����, ��. ��������, �. 20', '4133 666599, ����� ��� �. ����, 10.01.2015');
insert into clients values (12, '��������� ���� ���������', '������, ��������� �������, �. �������', to_date('01.01.2001','DD.MM.YYYY'), '������, ���������� ������, �. �������, ��. ����������, �.15', '4444 641853, ����� ��� �. ����, 10.01.2015');

insert into products values (1, 1, '��������� ������� � ��������� �.�.', 1, to_date('01.06.2022','DD.MM.YYYY'), null);
insert into products values (2, 1, '��������� ������� � �������� �.�.', 2, to_date('01.06.2022','DD.MM.YYYY'), null);
insert into products values (3, 1, '��������� ������� � ��������� �.�.', 7, to_date('15.06.2022','DD.MM.YYYY'), null);
insert into products values (4, 1, '��������� ������� � �������� �.�.', 2, to_date('20.06.2022','DD.MM.YYYY'), null);
insert into products values (5, 1, '��������� ������� � ��������� �.�.', 7, to_date('09.06.2022','DD.MM.YYYY'), null);
insert into products values (6, 1, '��������� ������� � ��������� �.�.', 1, to_date('14.07.2022','DD.MM.YYYY'), null);
insert into products values (7, 1, '��������� ������� � �������� �.�.', 3, to_date('06.07.2022','DD.MM.YYYY'), null);
insert into products values (8, 1, '��������� ������� � ��������� �.�.', 5, to_date('09.07.2022','DD.MM.YYYY'), null);
insert into products values (9, 1, '��������� ������� � �������� �.�.', 6, to_date('01.03.2022','DD.MM.YYYY'), null);
insert into products values (10, 1, '��������� ������� � ������������ �.�.', 8, to_date('11.05.2022','DD.MM.YYYY'), null);
insert into products values (11, 1, '��������� ������� � ����� �.�.', 9, to_date('20.05.2022','DD.MM.YYYY'), null);
insert into products values (12, 1, '��������� ������� � �������� �.�.', 10, to_date('01.04.2022','DD.MM.YYYY'), null);
insert into products values (13, 1, '��������� ������� � �������� �.�.', 11, to_date('15.04.2022','DD.MM.YYYY'), null);
insert into products values (14, 1, '��������� ������� � ���������� �.�.', 12, to_date('16.03.2022','DD.MM.YYYY'), null);

insert into products values (15, 3, '��������� ������� � �������� �.�.', 3, to_date('01.08.2022','DD.MM.YYYY'), null);
insert into products values (16, 3, '��������� ������� � �������� �.�.', 4, to_date('05.07.2022','DD.MM.YYYY'), null);
insert into products values (17, 3, '��������� ������� � ��������� �.�.', 7, to_date('01.05.2022','DD.MM.YYYY'), null);
insert into products values (18, 3, '��������� ������� � ��������� �.�.', 5, to_date('01.08.2022','DD.MM.YYYY'), null);
insert into products values (19, 3, '��������� ������� � �������� �.�.', 6, to_date('09.08.2022','DD.MM.YYYY'), null);
insert into products values (20, 3, '��������� ������� � ������������ �.�.', 8, to_date('01.08.2022','DD.MM.YYYY'), null);
insert into products values (21, 3, '��������� ������� � ����� �.�.', 9, to_date('12.05.2022','DD.MM.YYYY'), null);
insert into products values (22, 3, '��������� ������� � �������� �.�.', 10, to_date('15.05.2022','DD.MM.YYYY'), null);
insert into products values (23, 3, '��������� ������� � �������� �.�.', 11, to_date('30.06.2022','DD.MM.YYYY'), null);
insert into products values (24, 3, '��������� ������� � ���������� �.�.', 12, to_date('20.07.2022','DD.MM.YYYY'), null);

insert into products values (25, 2, '���������� ������� � �������� �.�.', 2, to_date('01.08.2022','DD.MM.YYYY'), null);
insert into products values (26, 2, '���������� ������� � ��������� �.�.', 1, to_date('03.07.2022','DD.MM.YYYY'), null);
insert into products values (27, 2, '���������� ������� � �������� �.�.', 3, to_date('15.08.2022','DD.MM.YYYY'), null);
insert into products values (28, 2, '���������� ������� � �������� �.�.', 4, to_date('06.08.2022','DD.MM.YYYY'), null);
insert into products values (29, 2, '���������� ������� � ��������� �.�.', 7, to_date('08.07.2022','DD.MM.YYYY'), null);
insert into products values (30, 2, '���������� ������� � ��������� �.�.', 5, to_date('14.05.2022','DD.MM.YYYY'), null);
insert into products values (31, 2, '���������� ������� � �������� �.�.', 6, to_date('01.03.2022','DD.MM.YYYY'), null);
insert into products values (32, 2, '���������� ������� � ������������ �.�.', 8, to_date('06.05.2022','DD.MM.YYYY'), null);
insert into products values (33, 2, '���������� ������� � ����� �.�.', 9, to_date('01.04.2022','DD.MM.YYYY'), null);
insert into products values (34, 2, '���������� ������� � �������� �.�.', 10, to_date('11.04.2022','DD.MM.YYYY'), null);
insert into products values (35, 2, '���������� ������� � �������� �.�.', 11, to_date('20.04.2022','DD.MM.YYYY'), null);

insert into accounts values (1, '��������� ���� ��� �������� �.�.', -2000, 1, to_date('01.06.2022','DD.MM.YYYY'), null, 1, '45502810401020000022');
insert into accounts values (2, '��������� ���� ��� ������� �.�.', -20000, 2, to_date('01.08.2022','DD.MM.YYYY'), null, 1, '45502810401020000158');
insert into accounts values (3, '��������� ���� ��� ��������� �.�.', -29000, 7, to_date('15.06.2022','DD.MM.YYYY'), null, 1, '45502810401020000164');
insert into accounts values (4, '��������� ���� ��� �������� �.�.', -2000, 4, to_date('06.07.2022','DD.MM.YYYY'), null, 1, '45502810401020000176');
insert into accounts values (5, '��������� ���� ��� �������� �.�.', -16000, 1, to_date('14.07.2022','DD.MM.YYYY'), null, 1, '45502810401020000180');
insert into accounts values (6, '��������� ���� ��� ��������� �.�.', -12000, 5, to_date('09.07.2022','DD.MM.YYYY'), null, 1, '45502810401020000190');
insert into accounts values (7, '��������� ���� ��� �������� �.�.', -1300000, 6, to_date('01.03.2022','DD.MM.YYYY'), null, 1, '45502810401020000020');
insert into accounts values (8, '��������� ���� ��� ����������� �.�', 0, 8, to_date('11.05.2022','DD.MM.YYYY'), null, 1, '45502810401020000163');
insert into accounts values (9, '��������� ���� ��� ����� �.�.', 0, 9, to_date('20.05.2022','DD.MM.YYYY'), null, 1, '45502810401020000140');
insert into accounts values (10, '��������� ���� ��� �������� �.�.', 0, 10, to_date('01.04.2022','DD.MM.YYYY'), null, 1, '45502810401020000141');
insert into accounts values (11, '��������� ���� ��� ������� �.�', -500000, 11, to_date('15.04.2022','DD.MM.YYYY'), null, 1, '45502810401020000142');
insert into accounts values (12, '��������� ���� ��� ���������� �.�.', 0, 12, to_date('16.03.2022','DD.MM.YYYY'), null, 1, '45502810401020000143');

insert into accounts values (13, '���������� ���� ��� ������� �.�.', 11400, 2, to_date('01.08.2022','DD.MM.YYYY'), null, 2, '42301810400000000144');
insert into accounts values (14, '���������� ���� ��� �������� �.�.', 112000, 1, to_date('01.06.2022','DD.MM.YYYY'), null, 1, '45502810401020000045');
insert into accounts values (15, '���������� ���� ��� ��������� �.�.', 0, 7, to_date('15.06.2022','DD.MM.YYYY'), null, 1, '45502810401020000046');
insert into accounts values (16, '���������� ���� ��� �������� �.�.', 15000, 4, to_date('06.07.2022','DD.MM.YYYY'), null, 1, '45502810401020000047');
insert into accounts values (17, '���������� ���� ��� �������� �.�.', 0, 1, to_date('14.07.2022','DD.MM.YYYY'), null, 1, '45502810401020000048');
insert into accounts values (18, '���������� ���� ��� ��������� �.�.', 0, 5, to_date('09.07.2022','DD.MM.YYYY'), null, 1, '45502810401020000049');
insert into accounts values (19, '���������� ���� ��� �������� �.�.', 100000, 6, to_date('01.03.2022','DD.MM.YYYY'), null, 1, '45502810401020000050');
insert into accounts values (20, '���������� ���� ��� ����������� �.�', 7000, 8, to_date('11.05.2022','DD.MM.YYYY'), null, 1, '45502810401020000051');
insert into accounts values (21, '���������� ���� ��� ����� �.�.', 8000, 9, to_date('20.05.2022','DD.MM.YYYY'), null, 1, '45502810401020000052');
insert into accounts values (22, '���������� ���� ��� �������� �.�.', 6000, 10, to_date('01.04.2022','DD.MM.YYYY'), null, 1, '45502810401020000053');
insert into accounts values (23, '���������� ���� ��� ������� �.�', 9000, 11, to_date('15.04.2022','DD.MM.YYYY'), null, 1, '45502810401020000062');
insert into accounts values (24, '���������� ���� ��� ���������� �.�.', 0, 12, to_date('16.03.2022','DD.MM.YYYY'), null, 1, '45502810401020000070');


insert into accounts values (25, '��������� ���� ��� ������� �.�.', 8000, 3, to_date('01.08.2022','DD.MM.YYYY'), null, 3, '40817810700000000015');
insert into accounts values (26, '��������� ���� ��� �������� �.�.', 0, 4, to_date('05.07.2022','DD.MM.YYYY'), null, 3, '40817810700000000016');
insert into accounts values (27, '��������� ���� ��� ��������� �.�.',0, 7, to_date('01.05.2022','DD.MM.YYYY'), null, 3, '40817810700000000017');
insert into accounts values (28, '��������� ���� ��� ��������� �.�.', 5000, 5, to_date('01.08.2022','DD.MM.YYYY'), null, 3, '40817810700000000018');
insert into accounts values (29, '��������� ���� ��� �������� �.�.', 0, 6, to_date('09.08.2022','DD.MM.YYYY'), null, 3, '40817810700000000019');
insert into accounts values (30, '��������� ���� ��� ����������� �.�.', 0, 8, to_date('01.08.2022','DD.MM.YYYY'), null, 3, '40817810700000000020');
insert into accounts values (31, '��������� ���� ��� ����� �.�.', 62000, 9, to_date('12.05.2022','DD.MM.YYYY'), null, 3, '40817810700000000021');
insert into accounts values (32, '��������� ���� ��� �������� �.�.', 0, 10, to_date('15.05.2022','DD.MM.YYYY'), null, 3, '40817810700000000022');
insert into accounts values (33, '��������� ���� ��� ������� �.�.', 18000, 11, to_date('30.06.2022','DD.MM.YYYY'), null, 3, '40817810700000000023');
insert into accounts values (34, '��������� ���� ��� ���������� �.�.', 0, 12, to_date('20.07.2022','DD.MM.YYYY'), null, 3, '40817810700000000024');

insert into records values (1, 1, 5000, 1, to_date('01.06.2022','DD.MM.YYYY'));
insert into records values (2, 0, 1000, 1, to_date('01.07.2022','DD.MM.YYYY'));
insert into records values (3, 0, 2000, 1, to_date('01.08.2022','DD.MM.YYYY'));
insert into records values (4, 0, 3000, 1, to_date('02.08.2022','DD.MM.YYYY'));
insert into records values (5, 1, 5000, 1, to_date('03.08.2022','DD.MM.YYYY'));
insert into records values (6, 0, 3000, 1, to_date('04.08.2022','DD.MM.YYYY'));

insert into records values (7, 0, 10000, 13, to_date('01.08.2022','DD.MM.YYYY'));
insert into records values (8, 1, 1000, 13, to_date('05.08.2022','DD.MM.YYYY'));
insert into records values (9, 1, 2000, 13, to_date('06.08.2022','DD.MM.YYYY'));
insert into records values (10, 1, 5000, 13, to_date('07.08.2022','DD.MM.YYYY'));
insert into records values (11, 0, 6000, 13, to_date('08.08.2022','DD.MM.YYYY'));
insert into records values (12, 0, 3400, 13, to_date('08.08.2022','DD.MM.YYYY'));

insert into records values (13, 0, 120000, 14, to_date('08.07.2022','DD.MM.YYYY'));
insert into records values (14, 1, 1000, 14, to_date('05.08.2022','DD.MM.YYYY'));
insert into records values (15, 1, 2000, 14, to_date('06.08.2022','DD.MM.YYYY'));
insert into records values (16, 1, 5000, 14, to_date('09.08.2022','DD.MM.YYYY'));

insert into records values (17, 1, 100000, 2, to_date('01.08.2022','DD.MM.YYYY'));
insert into records values (18, 0, 50000, 2, to_date('02.08.2022','DD.MM.YYYY'));
insert into records values (19, 0, 20000, 2, to_date('05.08.2022','DD.MM.YYYY'));
insert into records values (20, 0, 30000, 2, to_date('12.08.2022','DD.MM.YYYY'));
insert into records values (21, 1, 50000, 2, to_date('13.08.2022','DD.MM.YYYY'));
insert into records values (22, 0, 30000, 2, to_date('14.08.2022','DD.MM.YYYY'));

insert into records values (23, 1, 50000, 3, to_date('15.06.2022','DD.MM.YYYY'));
insert into records values (24, 0, 7000, 3, to_date('01.07.2022','DD.MM.YYYY'));
insert into records values (25, 0, 3000, 3, to_date('10.07.2022','DD.MM.YYYY'));
insert into records values (26, 0, 3000, 3, to_date('30.07.2022','DD.MM.YYYY'));
insert into records values (27, 0, 5000, 3, to_date('03.08.2022','DD.MM.YYYY'));
insert into records values (28, 0, 3000, 3, to_date('04.08.2022','DD.MM.YYYY'));

insert into records values (29, 1, 5000, 4, to_date('06.07.2022','DD.MM.YYYY'));
insert into records values (30, 0, 1000, 4, to_date('30.07.2022','DD.MM.YYYY'));
insert into records values (31, 0, 2000, 4, to_date('20.08.2022','DD.MM.YYYY'));

insert into records values (32, 1, 25000, 5, to_date('14.07.2022','DD.MM.YYYY'));
insert into records values (33, 0, 5000, 5, to_date('02.08.2022','DD.MM.YYYY'));
insert into records values (34, 0, 4000, 5, to_date('20.08.2022','DD.MM.YYYY'));

insert into records values (35, 1, 15000, 6, to_date('06.07.2022','DD.MM.YYYY'));
insert into records values (36, 0, 1000, 6, to_date('30.07.2022','DD.MM.YYYY'));
insert into records values (37, 0, 2000, 6, to_date('20.08.2022','DD.MM.YYYY'));

insert into records values (38, 1, 1500000, 7, to_date('02.03.2022','DD.MM.YYYY'));
insert into records values (39, 0, 100000, 7, to_date('30.05.2022','DD.MM.YYYY'));
insert into records values (40, 0, 100000, 7, to_date('30.07.2022','DD.MM.YYYY'));

insert into records values (41, 1, 700000, 10, to_date('15.04.2022','DD.MM.YYYY'));
insert into records values (42, 0, 200000, 10, to_date('01.06.2022','DD.MM.YYYY'));

insert into records values (43, 0, 100000, 16, to_date('01.08.2022','DD.MM.YYYY'));

insert into records values (44, 0, 15000, 19, to_date('01.05.2022','DD.MM.YYYY'));

insert into records values (45, 0, 7000, 20, to_date('01.05.2022','DD.MM.YYYY'));

insert into records values (46, 0, 8000, 21, to_date('25.05.2022','DD.MM.YYYY'));

insert into records values (47, 0, 6000, 22, to_date('23.04.2022','DD.MM.YYYY'));

insert into records values (48, 0, 9000, 23, to_date('15.04.2022','DD.MM.YYYY'));

insert into records values (49, 0, 8000, 25, to_date('15.08.2022','DD.MM.YYYY'));

insert into records values (50, 0, 9000, 28, to_date('01.08.2022','DD.MM.YYYY'));
insert into records values (51, 1, 4000, 28, to_date('09.08.2022','DD.MM.YYYY'));

insert into records values (52, 0, 133000, 31, to_date('30.05.2022','DD.MM.YYYY'));
insert into records values (53, 1, 9000, 31, to_date('12.06.2022','DD.MM.YYYY'));
insert into records values (54, 1, 24000, 31, to_date('03.07.2022','DD.MM.YYYY'));
insert into records values (55, 1, 38000, 31, to_date('08.08.2022','DD.MM.YYYY'));

insert into records values (56, 0, 18000, 33, to_date('30.06.2022','DD.MM.YYYY'));

commit;

end;
/