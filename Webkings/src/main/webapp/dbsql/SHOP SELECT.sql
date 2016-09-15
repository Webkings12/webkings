select * from shop;
alter table shop
add (s_click number default 0);

select * from style;

create or replace view shopView
as
select  s.s_no, s.s_domain, s.s_name, s.s_bimage, s.s_simage, ST.ST_NAME,st.st_gender, s.s_regdate, s.s_click
from shop s, style st
where 1=1
and s.ST_NO = ST.ST_NO
and s.st_gender= st.st_gender
and s.s_payYn='Y';
