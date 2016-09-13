select * from item;
select * from shop;
select * from item_type;
select * from itemview;

--������ �� CREATE
--CREATE OR REPLACE FORCE VIEW WEBKING.ITEMVIEW
--(I_NO, S_DOMAIN, I_IMAGE, I_NAME, I_SALEPRICE, 
-- S_NAME, S_AGE, IT_GENDER, IT_NAME, I_CLICK,I_PRICE, I_REGDATE
-- )
--AS 
--select  i.i_no,  S.S_DOMAIN, i.i_image, i.i_name, i.i_saleprice, s_name,
--        s.s_age, it.it_gender, it.it_name, i.i_click, i.i_price, i.i_regdate
--from shop s, item i, item_type it
--where 1=1 
--and s.s_no=i.s_no
--and i.it_no=it.it_no;

--0911
--alter table item add(I_ClICK number DEFAULT 0  NOT NULL);
--select * from item;

--alter table item
--add(I_SALEPRICE NUMBER);

--alter table item
--add(I_PRICE NUMBER);
--��ü ��ȸ ��ϼ�
select * from itemview
where 1=1
and it_gender = ''
order by s.s_no desc;

--���� ���ݼ�
select * from itemview
where 1=1
and it_gender = ''
order by i_saleprice desc;

--���� ���ݼ�
select * from itemview
where 1=1
and it_gender = ''
order by i_saleprice asc;

--���ݼ� ��
select * from itemview
where 1=1
and it_gender = ''
and i_saleprice between '' and ''
order by s.s_no desc;

--���ɴ뺰
select * from itemview
where 1=1
and it_gender = ''
and s_age=''
order by s.s_no desc;

--��ǰ��
select * from itemview
where 1=1
and it_gender = ''
and it_name=''
order by s.s_no desc;

--���� �˻� (��ǰ�̸�)
select * from itemview
where 1=1
and it_gender = ''
and i_name = '%'|| 'ss' || '%'
order by s.s_no desc;

--���� �˻� (��ǰ�̸�, ����)
select * from itemview
where 1=1
and it_gender = ''
and i_name = '%'|| 'ss' || '%'
and i_saleprice between 1 and 999
order by s.s_no desc;

--���� �˻� (��ǰ�̸�, ����, ���ɴ�)
select * from itemview
where 1=1
and it_gender = ''
and i_name = '%'|| 'ss' || '%'
and i_saleprice between 1 and 999
and s_age=''
order by s.s_no desc;

select * from itemview
order by i_click desc

--날짜비교함수
select * from itemview
where 1=1
and to_char(i_regdate+1, 'yyyymmdd') >= to_char(sysdate,'yyyymmdd'); 