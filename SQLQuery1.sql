create table table1(
id int not null identity(1,1),
email varchar(50),
number char(10)
)
insert into table1
select 'abc1@gmail.com','ghgttt'
union select 'abc2@gmail.com','1234567890'
union select 'abc3@gmail.com','1234567891'
union select 'abc4@gmail.com','1234567892'
union select 'abc5@gmail.com','1234567893'
union select 'abc6@gmail.com','12347894'
union select 'abD6@gmail.com','123494'
union select 'abF6@gmail.com','12344'
union select 'abTT6@gmail.com','1234'

select * from table1

select STUFF(email,2,CHARINDEX('@',email)-1,'****')as value from table1

select * from EMPLOYEE
select top 1 salary from (select distinct top 5 salary from EMPLOYEE order by salary desc ) as value123
order by salary

select * from EMPLOYEE
go

with cte 
as
(
select name,DEPARTMENT.Dept_details, salary,DENSE_RANK() over (partition by EMPLOYEE.dept_id order by salary desc) AS dr
from EMPLOYEE  inner join DEPARTMENT 
on EMPLOYEE.DEPT_ID=DEPARTMENT.DEPT_ID

)
select * from cte where dr = 1


select email, REPLACE(number,' ','')  from table1
select email, LTRIM(RTRIM(number)) as num from table1


abTT6@gmail.com	1234

select *, SUBSTRING(email,1,CHARINDEX('@',email)-1) as value from table1
select *, CHARINDEX('@',email), left(email, CHARINDEX('@',email) - 1) as value from table1

Alter table table1
add isNum as isnumeric(number)

a b  c
1 3	4
2 5 7

create table table2(
a int,
b int, 
c as a+b
)
go 
insert into table2 select 1,4
union select 5,11
select * from table2




CREATE TABLE RandomNumbers (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Number INT NOT NULL,
    InsertedAt DATETIME DEFAULT GETDATE(),
	loopNum int,

);

alter table RandomNumbers alter column Number char(5)


go

alter  PROCEDURE InsertNum
AS
BEGIN
    declare @cur_time datetime,@end_time datetime;
	SET @end_time = dateadd(HOUR, 2, getdate());
	declare @loopNum INT;
	SET @loopNum=1;
    
    WHILE 1 = 1
    BEGIN
	    SET @cur_time =GETDATE()
       
        DECLARE @RandomNumber INT,@innerloopnum INT;
		DECLARE @RandomChar CHAR(9);


		SET @innerloopnum=1;
		while @innerloopnum<=100
		BEGIN 

		SET @RandomNumber = FLOOR(RAND() *  100000);

		SET @RandomChar =RIGHT(rtrim('0000'+ CAST(@RandomNumber AS CHAR(5))),5);

		IF NOT EXISTS (SELECT 1 FROM RandomNumbers WHERE Number = @RandomChar)
        BEGIN
			INSERT INTO RandomNumbers (Number,loopNum)
			values( @RandomChar,@loopNum) 
		END

        SET @innerloopnum+=1;
	END
		
       IF(@cur_time>@end_time)
	   BEGIN
	      BREAK;
	   END

	    SET @loopNum+=1;
		WAITFOR DELAY '00:02:00';

    END

END;
go




    DECLARE @RandomNumber INT,@RandomChar char(8);
SET @RandomNumber =FLOOR(RAND() *  10000);

SET @RandomChar =RIGHT(rtrim('000'+ CAST(@RandomNumber AS CHAR(4))),4);
select @RandomChar


truncate table  randomNumbers


EXEC InsertNum;

