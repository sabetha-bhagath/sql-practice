CREATE TABLE Gdata(
 	username VARCHAR(10),
	activity  VARCHAR(10),
	start_date DATE,
	end_date  DATE
 ); 
 
 INSERT INTO Gdata (username, activity, start_date, end_date)
VALUES
('joe', 'Travel', to_date('2020-02-11','yyyy/mm/dd'),to_date('2020-02-18','yyyy/mm/dd'));

select * from gdata;
with cte as

(select username,activity,start_date,end_date, row_number() over(partition by username order by username) ref,
count(*) over(partition by username order by username ) cnt from gdata)

select username,activity,start_date,end_date from cte where ref =2 or cnt=1;
