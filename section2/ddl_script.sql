drop table if exists public.customer        cascade;
drop table if exists public.sales_rep       cascade;
drop table if exists public.mfacturer       cascade;
drop table if exists public.car             cascade;
drop table if exists public.sales           cascade;

create table public.customer (
	id               bigserial    primary key,
	name             varchar(100) not null,              
    phone            varchar(45)  not null,              
    constraint uq1_customer unique (name, phone) 
);

create table public.sales_rep (
	id               bigserial    primary key,
	name             varchar(100) not null,              
    phone            varchar(45)  not null,              
    constraint uq1_sales_rep unique (name, phone) 
);

create table public.mfacturer (
	id               bigserial    primary key,
	name             varchar(100) not null,              
    phone            varchar(45)  not null,              
    constraint uq1_mfacturer unique (name, phone) 
);

create table public.car (
	id               bigserial    primary key,
    mfacturer_id     bigint       not null, 
	model_name       varchar(100) not null,              
    serial_num       varchar(45)  not null,              
    weight           decimal      not null,              
    price            decimal      not null,              
    constraint uq1_car unique (mfacturer_id, model_name, serial_num),  
	constraint fk1_car foreign key (mfacturer_id) references public.mfacturer (id)
);

create table public.sales (
	id               bigserial    primary key,
    car_id           bigint       not null, 
    sales_rep_id     bigint       not null, 
    customer_id      bigint       not null, 
    txn_date         date         not null,              
    constraint uq1_sales unique (car_id, sales_rep_id, customer_id),  
	constraint fk1_sales foreign key (car_id) references public.car (id),
    constraint fk2_sales foreign key (sales_rep_id) references public.sales_rep (id),
    constraint fk3_sales foreign key (customer_id) references public.customer (id)
);
