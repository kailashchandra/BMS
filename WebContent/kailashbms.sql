drop table bid_251_try;

 create table bid_251_try
(id number primary key,
name varchar2(50),
status number,
created_date date,
expiry_date date);

insert into bid_251_try values(1,'Kailash',1,'20jan2016','22may2020' );
insert into bid_251_try values(2,'Navodita',2,'22jan2020','22jun2020');
insert into bid_251_try values(3,'Himanshu',3,'20jan2016','22jun2020');
insert into bid_251_try values(4,'Mayank',4,'1aug2020','2mar2018');
insert into bid_251_try values(5,'Rajal',2,'1aug2020','2mar2018');
insert into bid_251_try values(6,'Manaswini',3,'1aug2020','2mar2018');
insert into bid_251_try values(7,'Supriyo',1,'1aug2020','2mar2018');
select * from bid_251_try; where id=1;
select * from bid_251_try where name='ram';
select *  from bid_251_try where created_date= to_char(created_date, 'dd-mon-yyyy hh12:mi:ss');
select * from ref_data_val_251;
select id, name,created_date, expiry_date, (select value from ref_data_val_251 where reference_id=3 and id=status) as status from bid_251_try;
delete from BID_251_TRY where id=4;