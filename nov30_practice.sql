create DATABASE PRACTICE_SETDemo;
Go
USE PRACTICE_SETDemo;
Go
--first problem

CREATE TABLE SUBJECT(
Sub_ID int,
Subject varchar(20),
constraint PK_Subject_SubID primary key (Sub_ID)
)
Go

CREATE TABLE STUDENT(
Stud_ID int primary key,   --- Names??
Name varchar(10),
MARKS INT,
Sub_ID INT  FOREIGN KEY REFERENCES SUBJECT(Sub_ID)
)
Go
declare @i int =100;

while(@i<104)
begin
 select rand()*100 +101 ,'IT' 
union select rand()*100 +102,'ENGLISH' 
union select rand()*100 +103,'ACCOUNTS'
union select rand()*100 +104,'MATHS'
set @i+=1;
end
Go

 select rand()*100 +101 ,'IT' 
union select rand()*100 +102,'ENGLISH' 
union select rand()*100 +103,'ACCOUNTS'
union select rand()*100 +104,'MATHS'
GO 4


INSERT INTO STUDENT
VALUES(1,'A',50,101),
(2,'B',40,102),
(3,'C',30,101),
(4,'D',60,103),
(5,E,45,103),
(6,'F',77,102),
(7,'G',88,104)


--1. Find the maximum marks. 

SELECT MAX(Marks) AS MaxMarks
FROM STUDENT;


-- 2. Find the minimum marks.  

SELECT MIN(Marks) AS MinMarks
FROM STUDENT;

-- 3. Find the maximum marks for each subject.

SELECT SB.Subject,MAX(S.MARKS) AS MaxMarks
FROM STUDENT S
join SUBJECT SB on S.Sub_ID=SB.Sub_ID
group by SB.Subject
order by SB.Subject;


--4. Find the minimum marks for each subject.

SELECT SB.Subject,MIN(S.MARKS) AS MinMarks
FROM STUDENT S
join SUBJECT SB on S.Sub_ID=SB.Sub_ID
group by SB.Subject
order by SB.Subject;


--5. Find the Average marks subject wise.

SELECT SB.Subject,AVG(S.MARKS) AS MaxMarks
FROM STUDENT S
join SUBJECT SB on S.Sub_ID=SB.Sub_ID
group by S.Sub_ID,SB.Subject;




CREATE TABLE DEPARTMENT(
DEPT_ID int primary key,
Dept_details varchar(50)
)

CREATE TABLE EMPLOYEE(
ID int primary key,
Name varchar(10),
SALARY INT,
DEPT_ID INT  FOREIGN KEY REFERENCES DEPARTMENT(DEPT_ID)
)



---second problem

INSERT INTO DEPARTMENT(DEPT_ID, Dept_details ) select 101,'IT'
INSERT INTO DEPARTMENT(DEPT_ID, Dept_details) select 101,'IT'
INSERT INTO DEPARTMENT(DEPT_ID, Dept_details) select 102,'HR'
INSERT INTO DEPARTMENT(DEPT_ID, Dept_details) select 103,'ACCOUNT'
INSERT INTO DEPARTMENT(DEPT_ID, Dept_details) select 104,'ADMIN'


INSERT INTO EMPLOYEE
VALUES(1,'A',5000,101),
(2,'B',4000,102),
(3,'C',3000,101),
(4,'D',6000,103),
(5,'E',3500,103),
(6,'F',2799,102),
(7,'G',3800,104)

--1) Find the maximum salary ?  6000

SELECT MAX(SALARY) AS MaxSalary
FROM EMPLOYEE;



--2) find the minimum salary ? 2799

SELECT MIN(SALARY) AS MaxSalary
FROM EMPLOYEE;


--3) Find the Maximum salary department wise

SELECT MAX(E.SALARY) AS HighestSalary,DP.Dept_details
FROM EMPLOYEE E
join DEPARTMENT DP on E.DEPT_ID=DP.DEPT_ID
group by E.Dept_ID,DP.Dept_details
ORDER BY DP.Dept_details;


--4) Find the Minimum salary department wise.

SELECT MIN(E.SALARY) AS LowestSalary,DP.Dept_details
FROM EMPLOYEE E
join DEPARTMENT DP on E.DEPT_ID=DP.DEPT_ID
group by E.Dept_ID,DP.Dept_details
ORDER BY DP.Dept_details;




--5) Find the Average salary of each department.

SELECT AVG(E.SALARY) AS AverageSalary,DP.Dept_details
FROM EMPLOYEE E
join DEPARTMENT DP on E.DEPT_ID=DP.DEPT_ID
group by E.Dept_ID,DP.Dept_details
ORDER BY DP.Dept_details;


