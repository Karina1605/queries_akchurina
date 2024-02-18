-- create tables
create table customer(
	customer_id int,
	first_name varchar(50),
	last_name varchar(50),
	gender varchar(30),
	dob varchar(50),
	job_title varchar(50),
	job_industry_category varchar(50),
	wealth_segment varchar(50),
	deseased_indicator varchar(50),
	owns_car varchar(30),
	address varchar(50),
	postcode varchar(30),
	state varchar(30),
	country varchar(30),
    property_valuation int)

create table transaction(
	transaction_id int4,
	product_id int,
	customer_id int,
	transaction_date varchar(30),
	online_order varchar(30),
	order_status varchar(30),
	brand varchar(30),
	product_line varchar(30),
	product_class varchar(30),
	product_size varchar(30),
	list_price float4,
	standard_cost float4)

-- TASKS --
	
--#1
select distinct brand
from transaction t
where t.standard_cost  > 1500;

--#2
select * from transaction t 
where t.order_status = 'Approved' and
t.transaction_date >= '01.04.2017' and t.transaction_date <='09.04.2017'

--#3
select /*distinct*/ c.job_title  from customer c 
where c.job_industry_category in ('IT', 'Financial Services') and
c.job_title like 'Senior%';

--#4
select t.brand 
from transaction t join customer c on t.customer_id  = c.customer_id 
where c.job_industry_category ='Financial Services'

--#5
select distinct c.customer_id, c.first_name, c.last_name from customer c 
left join transaction t 
on c.customer_id = t.customer_id 
where t.brand in ( 'Giant Bicycles', 'Norco Bicycles', 'Trek Bicycles')
limit 10;

--#6
select distinct c.* from customer c left join transaction t
on c.customer_id = t.customer_id 
where t.customer_id is null

--#7
with cte as (select max(t2.standard_cost) from transaction t2) 
select c.*  from transaction t join customer c 
on t.customer_id = c.customer_id 
where t.standard_cost in (select * from cte limit 1)

--#8
select c.* from transaction t join customer c 
on t.customer_id = c.customer_id 
where c.job_industry_category in ('IT', 'Health')
and t.order_status = 'Approved'
