insert into public.customer (name, phone) values ('Customer A', '912345671');
insert into public.customer (name, phone) values ('Customer B', '912345672');
insert into public.customer (name, phone) values ('Customer C', '912345673');
insert into public.customer (name, phone) values ('Customer D', '912345674');

insert into public.sales_rep (name, phone) values ('Sales Rep A', '812345671');
insert into public.sales_rep (name, phone) values ('Sales Rep B', '812345672');
insert into public.sales_rep (name, phone) values ('Sales Rep C', '812345673');
insert into public.sales_rep (name, phone) values ('Sales Rep D', '812345674');

insert into public.mfacturer (name, phone) values ('Tesla', '712345671');
insert into public.mfacturer (name, phone) values ('Toyota', '712345672');
insert into public.mfacturer (name, phone) values ('Honda',  '712345673');
insert into public.mfacturer (name, phone) values ('Porsche', '712345674');

insert into public.car (mfacturer_id, model_name, serial_num, weight, price) values (1, 'X', 'TSLAX-1234567890', 2300, 500000);
insert into public.car (mfacturer_id, model_name, serial_num, weight, price) values (1, '3', 'TSLA3-1234567890', 2000, 350000);
insert into public.car (mfacturer_id, model_name, serial_num, weight, price) values (2, 'Purius',  'TOYOTA-1234567890', 1800, 100000);
insert into public.car (mfacturer_id, model_name, serial_num, weight, price) values (2, 'Corolla', 'TOYOTA-1234567891', 1700, 80000);
insert into public.car (mfacturer_id, model_name, serial_num, weight, price) values (3, 'Shuttle',  'HONDA-1234567890', 1800, 80000);
insert into public.car (mfacturer_id, model_name, serial_num, weight, price) values (3, 'Civic', 'HONDA-1234567891', 1700, 100000);
insert into public.car (mfacturer_id, model_name, serial_num, weight, price) values (4, '911', 'TSLAX-1234567890', 2500, 350000);
insert into public.car (mfacturer_id, model_name, serial_num, weight, price) values (4, 'Taycan', 'TSLA3-1234567890', 2700, 450000);
insert into public.car (mfacturer_id, model_name, serial_num, weight, price) values (3, 'Shuttle',  'HONDA-1234567892', 1800, 80000);
insert into public.car (mfacturer_id, model_name, serial_num, weight, price) values (3, 'Civic', 'HONDA-1234567893', 1700, 100000);
insert into public.car (mfacturer_id, model_name, serial_num, weight, price) values (3, 'Shuttle',  'HONDA-1234567894', 1800, 80000);
insert into public.car (mfacturer_id, model_name, serial_num, weight, price) values (3, 'Civic', 'HONDA-1234567895', 1700, 100000);

insert into public.car (mfacturer_id, model_name, serial_num, weight, price) values (1, '3', 'TSLA3-1234567891', 2000, 350000);
insert into public.car (mfacturer_id, model_name, serial_num, weight, price) values (2, 'Purius',  'TOYOTA-1234567892', 1800, 100000);
insert into public.car (mfacturer_id, model_name, serial_num, weight, price) values (2, 'Corolla', 'TOYOTA-1234567893', 1700, 80000);
insert into public.car (mfacturer_id, model_name, serial_num, weight, price) values (2, 'Corolla', 'TOYOTA-1234567894', 1700, 80000);
insert into public.car (mfacturer_id, model_name, serial_num, weight, price) values (4, '911', 'TSLAX-12345678911', 2500, 350000);
insert into public.car (mfacturer_id, model_name, serial_num, weight, price) values (4, '911', 'TSLAX-12345678912', 2500, 350000);

insert into public.sales (car_id, sales_rep_id, customer_id, txn_date) values (1, 1, 1, TO_DATE('2020-05-21','YYYY-MM-DD'));
insert into public.sales (car_id, sales_rep_id, customer_id, txn_date) values (2, 2, 2, TO_DATE('2020-03-21','YYYY-MM-DD'));
insert into public.sales (car_id, sales_rep_id, customer_id, txn_date) values (3, 4, 3, TO_DATE('2020-04-21','YYYY-MM-DD'));
insert into public.sales (car_id, sales_rep_id, customer_id, txn_date) values (4, 3, 4, TO_DATE('2020-06-21','YYYY-MM-DD'));
insert into public.sales (car_id, sales_rep_id, customer_id, txn_date) values (5, 1, 3, TO_DATE('2020-05-21','YYYY-MM-DD'));
insert into public.sales (car_id, sales_rep_id, customer_id, txn_date) values (6, 4, 4, TO_DATE('2020-07-21','YYYY-MM-DD'));
insert into public.sales (car_id, sales_rep_id, customer_id, txn_date) values (7, 3, 2, TO_DATE('2020-08-21','YYYY-MM-DD'));
insert into public.sales (car_id, sales_rep_id, customer_id, txn_date) values (8, 2, 4, TO_DATE('2020-05-21','YYYY-MM-DD'));
insert into public.sales (car_id, sales_rep_id, customer_id, txn_date) values (9, 2, 4, TO_DATE('2020-08-21','YYYY-MM-DD'));
insert into public.sales (car_id, sales_rep_id, customer_id, txn_date) values (10, 2, 4, TO_DATE('2020-08-21','YYYY-MM-DD'));
insert into public.sales (car_id, sales_rep_id, customer_id, txn_date) values (11, 4, 3, TO_DATE('2020-08-21','YYYY-MM-DD'));
insert into public.sales (car_id, sales_rep_id, customer_id, txn_date) values (12, 4, 3, TO_DATE('2020-08-21','YYYY-MM-DD'));

insert into public.sales (car_id, sales_rep_id, customer_id, txn_date) values (13, 2, 3, TO_DATE('2020-08-21','YYYY-MM-DD'));
insert into public.sales (car_id, sales_rep_id, customer_id, txn_date) values (14, 1, 1, TO_DATE('2020-08-21','YYYY-MM-DD'));
insert into public.sales (car_id, sales_rep_id, customer_id, txn_date) values (15, 3, 2, TO_DATE('2020-08-21','YYYY-MM-DD'));
insert into public.sales (car_id, sales_rep_id, customer_id, txn_date) values (16, 4, 4, TO_DATE('2020-08-21','YYYY-MM-DD'));
insert into public.sales (car_id, sales_rep_id, customer_id, txn_date) values (17, 1, 2, TO_DATE('2020-08-21','YYYY-MM-DD'));
insert into public.sales (car_id, sales_rep_id, customer_id, txn_date) values (18, 2, 1, TO_DATE('2020-08-21','YYYY-MM-DD'));