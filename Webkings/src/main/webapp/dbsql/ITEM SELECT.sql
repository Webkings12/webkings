select * from item;
select * from shop;
select * from item_type;
select * from itemview;

--������ �� CREATE
--create or replace view ItemView
--as
--select  i.i_no,  S.S_DOMAIN, i.i_image, i.i_name, i.i_saleprice, s_name,
--        s.s_age, it.it_gender, it.it_name
--from shop s, item i, item_type it;

--alter table item
--add(I_SALEPRICE NUMBER);


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

