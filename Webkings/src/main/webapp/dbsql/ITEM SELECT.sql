select * from item;
select * from shop;
select * from item_type;
select * from itemview;

--아이템 뷰 CREATE
--create or replace view ItemView
--as
--select  i.i_no,  S.S_DOMAIN, i.i_image, i.i_name, i.i_saleprice, s_name,
--        s.s_age, it.it_gender, it.it_name
--from shop s, item i, item_type it;

--alter table item
--add(I_SALEPRICE NUMBER);


--전체 조회 등록순
select * from itemview
where 1=1
and it_gender = ''
order by s.s_no desc;

--낮은 가격순
select * from itemview
where 1=1
and it_gender = ''
order by i_saleprice desc;

--높은 가격순
select * from itemview
where 1=1
and it_gender = ''
order by i_saleprice asc;

--가격순 상세
select * from itemview
where 1=1
and it_gender = ''
and i_saleprice between '' and ''
order by s.s_no desc;

--연령대별
select * from itemview
where 1=1
and it_gender = ''
and s_age=''
order by s.s_no desc;

--상품별
select * from itemview
where 1=1
and it_gender = ''
and it_name=''
order by s.s_no desc;

--조건 검색 (상품이름)
select * from itemview
where 1=1
and it_gender = ''
and i_name = '%'|| 'ss' || '%'
order by s.s_no desc;

--조건 검색 (상품이름, 가격)
select * from itemview
where 1=1
and it_gender = ''
and i_name = '%'|| 'ss' || '%'
and i_saleprice between 1 and 999
order by s.s_no desc;

--조건 검색 (상품이름, 가격, 연령대)
select * from itemview
where 1=1
and it_gender = ''
and i_name = '%'|| 'ss' || '%'
and i_saleprice between 1 and 999
and s_age=''
order by s.s_no desc;

