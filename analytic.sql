alter table joins rename column  cl to c1;

******************************************************************

select * from joins;
 alter table joins add name varchar(20);
 
 update joins set name ='aaa' ;
 
 select a.c1,b.c2 from joins a left join joins1 b on a.c1=b.c2;
 
 select * from joins;
 
 insert into joins1 values(6);
 alter table joins drop column name;
 
 select * from employee1;
 
 select * from(select emp_id,emp_name,salary,skill_set,
rank() over(order by salary desc) rnk from employee1) where rnk<=3;

select emp_id,emp_name,lag(emp_id) over(order by emp_id) lag from employee1;
 