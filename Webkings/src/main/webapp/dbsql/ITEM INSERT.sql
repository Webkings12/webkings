select * from item;
select * from item_type;


select item_type_seq.nextval from dual;
select * from freeboard;


create sequence item_type_seq
start with 1
increment by 1
nocache;


select * from freeboard;

select it_name from item_type;

delete from item_type;



insert into item_type(it_no, it_name, it_gender)
values(item_type_seq.nextval,'OUTER','F');
insert into item_type(it_no, it_name, it_gender)
values(item_type_seq.nextval,'TOP','F');
insert into item_type(it_no, it_name, it_gender)
values(item_type_seq.nextval,'BOTTOM','F');
insert into item_type(it_no, it_name, it_gender)
values(item_type_seq.nextval,'ONEPIECE','F');
insert into item_type(it_no, it_name, it_gender)
values(item_type_seq.nextval,'BAG','F');
insert into item_type(it_no, it_name, it_gender)
values(item_type_seq.nextval,'SHOES','F');
insert into item_type(it_no, it_name, it_gender)
values(item_type_seq.nextval,'ACC/ETC','F');
insert into item_type(it_no, it_name, it_gender)
values(item_type_seq.nextval,'BEAUTY','F');
insert into item_type(it_no, it_name, it_gender)
values(item_type_seq.nextval,'UNDERWEAR','F');
insert into item_type(it_no, it_name, it_gender)
values(item_type_seq.nextval,'BEACHWEAR','F');

insert into item_type(it_no, it_name, it_gender)
values(item_type_seq.nextval,'OUTER','M');
insert into item_type(it_no, it_name, it_gender)
values(item_type_seq.nextval,'TOP','M');
insert into item_type(it_no, it_name, it_gender)
values(item_type_seq.nextval,'BOTTOM','M');
insert into item_type(it_no, it_name, it_gender)
values(item_type_seq.nextval,'BAG','M');
insert into item_type(it_no, it_name, it_gender)
values(item_type_seq.nextval,'SHOES','M');
insert into item_type(it_no, it_name, it_gender)
values(item_type_seq.nextval,'ACC/ETC','M');






