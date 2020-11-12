
select * from pj_basket;


select * from pj_basket;

alter table pj_customer drop column grade;

drop table pj_order;

create table pj_order(
or_Number number(10),
or_Date date,
or_TotalCost number(10),
or_DeliveryLocation varchar2(20),
or_DeliveryState char(1));

select * from PJ_CUSTOMER;

select * from pj_pet;

alter table pj_pet modify(petNumber number(36));
alter table pj_pet modify(pet_name varchar2(100));
alter table pj_pet modify(pet_sex varchar2(100));
alter table pj_pet modify(pet_type varchar2(100));
alter table pj_pet modify(pet_age number(36));