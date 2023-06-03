create table dup_practice(id number,name varchar(10));



select * from dup_practice;

select id,count(*) emp_count from dup_practice where name='aaa' group by id;
select id,count(*) emp_count from dup_practice  group by id having count(*)>1;

delete from dup_practice where id not in (select max(id) from dup_practice group by id);


with dup_rec as(
select id,name, row_number() over(partition by id,name order by id) d_count from dup_practice
)
delete from dup_rec where d_count>1;

delete d1 from dup_practice d1,dup_practice d2 where d1.id>d2.id and d1.name=d2.name;

select * from employee1;

select substr(emp_name,1,4) new_str from employee1;

select * from employee1 order by city_name asc,salary desc;

select emp_name,replace(emp_name,' ','-') newname from employee1;

select emp_id,emp_name from(select emp_id,emp_name,salary,rank() over(order by salary asc) rnk from employee1
)where rnk<=2;

drop table users;
create table users
(
user_id int primary key,
user_name varchar(30) not null,
email varchar(50));

insert into users values

(5, 'Robin', 'robin@gmail.com');

select * from 
(
select user_id,user_name,email,
row_number() over(partition by user_name order by user_name)as cnt from users) where cnt>1;

select user_id, user_name, email
from (
select *,
row_number() over (partition by user_name order by user_id) as rn
from users u
order by user_id) x
where x.rn <> 1;

drop table employee;
create table employee
( emp_ID int primary key
, emp_NAME varchar(50) not null
, DEPT_NAME varchar(50)
, SALARY int);

insert into employee values(101, 'Mohan', 'Admin', 4000);
insert into employee values(102, 'Rajkumar', 'HR', 3000);
insert into employee values(103, 'Akbar', 'IT', 4000);
insert into employee values(104, 'Dorvin', 'Finance', 6500);
insert into employee values(105, 'Rohit', 'HR', 3000);
insert into employee values(106, 'Rajesh',  'Finance', 5000);
insert into employee values(107, 'Preet', 'HR', 7000);
insert into employee values(108, 'Maryam', 'Admin', 4000);
insert into employee values(109, 'Sanjay', 'IT', 6500);
insert into employee values(110, 'Vasudha', 'IT', 7000);
insert into employee values(111, 'Melinda', 'IT', 8000);
insert into employee values(112, 'Komal', 'IT', 10000);
insert into employee values(113, 'Gautham', 'Admin', 2000);
insert into employee values(114, 'Manisha', 'HR', 3000);
insert into employee values(115, 'Chandni', 'IT', 4500);
insert into employee values(116, 'Satya', 'Finance', 6500);
insert into employee values(117, 'Adarsh', 'HR', 3500);
insert into employee values(118, 'Tejaswi', 'Finance', 5500);
insert into employee values(119, 'Cory', 'HR', 8000);
insert into employee values(120, 'Monica', 'Admin', 5000);
insert into employee values(121, 'Rosalin', 'IT', 6000);
insert into employee values(122, 'Ibrahim', 'IT', 8000);
insert into employee values(123, 'Vikram', 'IT', 8000);
insert into employee values(124, 'Dheeraj', 'IT', 11000);

select * from employee;

select * from(select emp_id,emp_name,dept_name,salary,row_number() over(order by emp_id desc) num from employee) where num=2;

select * from(select emp_id,emp_name,dept_name,salary,
max(salary) over(partition by dept_name) max_sal,
min(salary) over(partition by dept_name) min_sal from employee) a where
a.salary=max_sal or a.salary=min_sal;

drop table doctors;
create table doctors
(
id int primary key,
name varchar(50) not null,
speciality varchar(100),
hospital varchar(50),
city varchar(50),
consultation_fee int
);

select a.* from doctors a join doctors b on a.hospital=b.hospital 
and a.id != b.id;
drop table login_details;
create table login_details(
login_id int primary key,
user_name varchar(50) not null,
login_date date);