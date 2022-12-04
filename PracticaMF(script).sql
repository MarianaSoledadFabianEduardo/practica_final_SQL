create schema practicamf authorization ckuqrdql

create table practicamf.colors(
id_color varchar(20) not null, --pk
color_name varchar(200) not null,
description varchar(512) null
);

alter table practicamf.colors 
add constraint id_colors_pk primary key(id_color);

create table practicamf.currency(
currency_type varchar(20) not null, --pk
currency_name varchar(200) not null,
description varchar(512) null
);

alter table practicamf.currency 
add constraint currency_type_pk primary key(currency_type);

create table practicamf.vehicles(
id_car varchar(20) not null, --pk
plate varchar(20) not null,
id_color varchar(20) not null, --fk table colors --> id_color
km_tot varchar(20) not null,
dt_purchase date not null
);

alter table practicamf.vehicles  
add constraint id_cars_pk primary key(id_car);

alter table practicamf.vehicles  
add constraint car_color_fk foreign key(id_color)
references practicamf.colors(id_color);

create table practicamf.revisions(
id_car varchar(20) not null, --pk, fk table vehicles --> id_car
dt_rev date not null, --pk
km_rev varchar(20) not null, 
currency_type varchar(20) not null, -- fk table currency --> currency_type
rev_price varchar(20) not null,
description varchar(512) null
);

alter table practicamf.revisions
add constraint revs_pk primary key(id_car, dt_rev);

alter table practicamf.revisions
add constraint id_cars_fk foreign key(id_car)
references practicamf.vehicles(id_car);

alter table practicamf.revisions  
add constraint currencies_fk foreign key(currency_type)
references practicamf.currency(currency_type);

create table practicamf.brands(
id_brand varchar(20) not null, --pk
brand_name varchar(200) not null,
description varchar(512) null
);

alter table practicamf.brands
add constraint brands_pk primary key(id_brand);

create table practicamf.association(
id_group varchar(20) not null, --pk
car_group_name varchar(200) not null,
description varchar(512) null
);

alter table practicamf.association 
add constraint groups_pk primary key(id_group);

create table practicamf.insurances(
id_insurance varchar(20) not null, --pk
company_name varchar(200) not null,
description varchar(512) null
);

alter table practicamf.insurances 
add constraint insurances_pk primary key(id_insurance);

create table practicamf.brand_group(
id_car varchar(20) not null, --pk, fk table vehicles --> id_car
id_brand varchar(20) not null, --pk, fk table brands --> id_brand
id_group varchar(20) not null, --pk, fk table association --> id_group 
model_name varchar(20) not null, 
description varchar(512) null
);

alter table practicamf.brand_group 
add constraint brand_groups_pk primary key(id_car, id_brand, id_group);

alter table practicamf.brand_group 
add constraint id_cars_fk foreign key(id_car)
references practicamf.vehicles(id_car);

alter table practicamf.brand_group  
add constraint brands_fk foreign key(id_brand)
references practicamf.brands(id_brand);

alter table practicamf.brand_group  
add constraint groups_fk foreign key(id_group)
references practicamf.association(id_group);

create table practicamf.insurance_policy(
id_car varchar(20) not null, --pk, fk table vehicles --> id_car
id_insurance varchar(20) not null, --pk, fk table insurance --> id_insurance 
policy_number varchar(50) not null, 
description varchar(512) null
);

alter table practicamf.insurance_policy  
add constraint insurances_policies_pk primary key(id_car, id_insurance);

alter table practicamf.insurance_policy  
add constraint id_cars_fk foreign key(id_car)
references practicamf.vehicles(id_car);

alter table practicamf.insurance_policy  
add constraint insurances_fk foreign key(id_insurance)
references practicamf.insurances(id_insurance);

insert into practicamf.colors(id_color, color_name, description) values('01','Rojo','');
insert into practicamf.colors(id_color, color_name, description) values('02','Blanco','');
insert into practicamf.colors(id_color, color_name, description) values('03','Azul','');
insert into practicamf.colors(id_color, color_name, description) values('04','Negro','');

insert into practicamf.vehicles(id_car, plate, id_color, km_tot, dt_purchase) values('C0001','AAA','01','160000','20191001');
insert into practicamf.vehicles(id_car, plate, id_color, km_tot, dt_purchase) values('C0002','BBB','02','32000','20220130');
insert into practicamf.vehicles(id_car, plate, id_color, km_tot, dt_purchase) values('C0003','CCC','03','2150','20220130');
insert into practicamf.vehicles(id_car, plate, id_color, km_tot, dt_purchase) values('C0004','DDD','01','22','20220130');
insert into practicamf.vehicles(id_car, plate, id_color, km_tot, dt_purchase) values('C0005','FFF','04','0','20221101');
insert into practicamf.vehicles(id_car, plate, id_color, km_tot, dt_purchase) values('C0006','GGG','01','0','20221101');
insert into practicamf.vehicles(id_car, plate, id_color, km_tot, dt_purchase) values('C0007','HHH','02','0','20221101');
insert into practicamf.vehicles(id_car, plate, id_color, km_tot, dt_purchase) values('C0008','III','03','0','20221101');
insert into practicamf.vehicles(id_car, plate, id_color, km_tot, dt_purchase) values('C0009','JJJ','02','550000','20170510');
insert into practicamf.vehicles(id_car, plate, id_color, km_tot, dt_purchase) values('C0010','KKK','03','82000','20220930');
insert into practicamf.vehicles(id_car, plate, id_color, km_tot, dt_purchase) values('C0011','MMM','02','12000','20220930');
insert into practicamf.vehicles(id_car, plate, id_color, km_tot, dt_purchase) values('C0012','NNN','03','16000','20220130');
insert into practicamf.vehicles(id_car, plate, id_color, km_tot, dt_purchase) values('C0013','LLL','02','7000','20220130');
insert into practicamf.vehicles(id_car, plate, id_color, km_tot, dt_purchase) values('C0014','OOO','04','82000','20210130');
insert into practicamf.vehicles(id_car, plate, id_color, km_tot, dt_purchase) values('C0015','MMM','01','50000','20210130');

insert into practicamf.currency(currency_type, currency_name, description) values('1','dollar','');
insert into practicamf.currency(currency_type, currency_name, description) values('2','euro','');

insert into practicamf.revisions(id_car, dt_rev, km_rev, currency_type, rev_price, description) values('C0001','20221201','150000','1','120000','');
insert into practicamf.revisions(id_car, dt_rev, km_rev, currency_type, rev_price, description) values('C0002','20221201','22000','2','170000','');
insert into practicamf.revisions(id_car, dt_rev, km_rev, currency_type, rev_price, description) values('C0003','20220130','0','2','70000','');
insert into practicamf.revisions(id_car, dt_rev, km_rev, currency_type, rev_price, description) values('C0004','20220130','0','2','170000','');
insert into practicamf.revisions(id_car, dt_rev, km_rev, currency_type, rev_price, description) values('C0005','20221101','0','1','70000','');
insert into practicamf.revisions(id_car, dt_rev, km_rev, currency_type, rev_price, description) values('C0006','20221101','0','1','70000','');
insert into practicamf.revisions(id_car, dt_rev, km_rev, currency_type, rev_price, description) values('C0007','20221101','0','1','170000','');
insert into practicamf.revisions(id_car, dt_rev, km_rev, currency_type, rev_price, description) values('C0008','20221101','0','1','170000','');
insert into practicamf.revisions(id_car, dt_rev, km_rev, currency_type, rev_price, description) values('C0009','20221201','540000','2','70000','');
insert into practicamf.revisions(id_car, dt_rev, km_rev, currency_type, rev_price, description) values('C0010','20221201','72000','2','70000','');
insert into practicamf.revisions(id_car, dt_rev, km_rev, currency_type, rev_price, description) values('C0011','20221201','2000','2','70000','');
insert into practicamf.revisions(id_car, dt_rev, km_rev, currency_type, rev_price, description) values('C0012','20221201','6000','2','70000','');
insert into practicamf.revisions(id_car, dt_rev, km_rev, currency_type, rev_price, description) values('C0013','20220130','0','1','70000','');
insert into practicamf.revisions(id_car, dt_rev, km_rev, currency_type, rev_price, description) values('C0014','20221201','72000','1','70000','');
insert into practicamf.revisions(id_car, dt_rev, km_rev, currency_type, rev_price, description) values('C0015','20221201','40000','1','300000','');

insert into practicamf.brands(id_brand, brand_name, description) values('M001','Audi','');
insert into practicamf.brands(id_brand, brand_name, description) values('M002','Seat','');
insert into practicamf.brands(id_brand, brand_name, description) values('M003','VW','');
insert into practicamf.brands(id_brand, brand_name, description) values('M004','Toyota','');
insert into practicamf.brands(id_brand, brand_name, description) values('M005','Lexus','');
insert into practicamf.brands(id_brand, brand_name, description) values('M006','BMW','');
insert into practicamf.brands(id_brand, brand_name, description) values('M007','Mini','');
insert into practicamf.brands(id_brand, brand_name, description) values('M008','Rolls Royce','');

insert into practicamf.association(id_group, car_group_name, description) values('G001','VAN','');
insert into practicamf.association(id_group, car_group_name, description) values('G002','Toyota','');
insert into practicamf.association(id_group, car_group_name, description) values('G003','BMW','');

insert into practicamf.brand_group(id_car, id_brand, id_group, model_name, description) values('C0001','M001','G001','A3','');
insert into practicamf.brand_group(id_car, id_brand, id_group, model_name, description) values('C0002','M001','G001','TT','');
insert into practicamf.brand_group(id_car, id_brand, id_group, model_name, description) values('C0003','M003','G001','Cali','');
insert into practicamf.brand_group(id_car, id_brand, id_group, model_name, description) values('C0004','M004','G002','Rav4','');
insert into practicamf.brand_group(id_car, id_brand, id_group, model_name, description) values('C0005','M003','G001','Transporter','');
insert into practicamf.brand_group(id_car, id_brand, id_group, model_name, description) values('C0006','M003','G001','Cali','');
insert into practicamf.brand_group(id_car, id_brand, id_group, model_name, description) values('C0007','M001','G001','TT','');
insert into practicamf.brand_group(id_car, id_brand, id_group, model_name, description) values('C0008','M004','G002','Cruiser','');
insert into practicamf.brand_group(id_car, id_brand, id_group, model_name, description) values('C0009','M002','G001','Ibiza','');
insert into practicamf.brand_group(id_car, id_brand, id_group, model_name, description) values('C0010','M002','G001','Ibiza','');
insert into practicamf.brand_group(id_car, id_brand, id_group, model_name, description) values('C0011','M003','G001','Transporter','');
insert into practicamf.brand_group(id_car, id_brand, id_group, model_name, description) values('C0012','M005','G002','UX','');
insert into practicamf.brand_group(id_car, id_brand, id_group, model_name, description) values('C0013','M002','G001','Alhambra','');
insert into practicamf.brand_group(id_car, id_brand, id_group, model_name, description) values('C0014','M001','G001','Q3','');
insert into practicamf.brand_group(id_car, id_brand, id_group, model_name, description) values('C0015','M008','G003','Cullinan','');

insert into practicamf.insurances(id_insurance, company_name, description) values('A0001','Mapfre','');
insert into practicamf.insurances(id_insurance, company_name, description) values('A0002','MMT','');
insert into practicamf.insurances(id_insurance, company_name, description) values('A0003','AXA','');

insert into practicamf.insurance_policy(id_car, id_insurance, policy_number, description) values('C0001','A0001','1000','');
insert into practicamf.insurance_policy(id_car, id_insurance, policy_number, description) values('C0002','A0002','1001','');
insert into practicamf.insurance_policy(id_car, id_insurance, policy_number, description) values('C0003','A0003','1002','');
insert into practicamf.insurance_policy(id_car, id_insurance, policy_number, description) values('C0004','A0001','1003','');
insert into practicamf.insurance_policy(id_car, id_insurance, policy_number, description) values('C0005','A0001','1004','');
insert into practicamf.insurance_policy(id_car, id_insurance, policy_number, description) values('C0006','A0002','1005','');
insert into practicamf.insurance_policy(id_car, id_insurance, policy_number, description) values('C0007','A0003','1006','');
insert into practicamf.insurance_policy(id_car, id_insurance, policy_number, description) values('C0008','A0001','1007','');
insert into practicamf.insurance_policy(id_car, id_insurance, policy_number, description) values('C0009','A0001','1008','');
insert into practicamf.insurance_policy(id_car, id_insurance, policy_number, description) values('C0010','A0002','1009','');
insert into practicamf.insurance_policy(id_car, id_insurance, policy_number, description) values('C0011','A0003','1010','');
insert into practicamf.insurance_policy(id_car, id_insurance, policy_number, description) values('C0012','A0001','1011','');
insert into practicamf.insurance_policy(id_car, id_insurance, policy_number, description) values('C0013','A0001','1012','');
insert into practicamf.insurance_policy(id_car, id_insurance, policy_number, description) values('C0014','A0002','1013','');
insert into practicamf.insurance_policy(id_car, id_insurance, policy_number, description) values('C0015','A0003','1014','');

