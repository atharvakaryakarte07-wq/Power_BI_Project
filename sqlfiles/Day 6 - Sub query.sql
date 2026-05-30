use db3;
show tables;

## Q1 Find students who scored more than the average marks of all students.
SELECT * FROM students
where marks > (select avg(marks) from students);

## Q2 Find students who belong to the same city as Ishani Gupta (without hardcoding 'Mumbai')
SELECT * FROM students
where city = (select city from students where name = "Ishani Gupta");

## Q3 Find students whose marks are greater than the lowest scorer.
Select * from students
where marks > (select marks from students order by marks asc limit 1);

Select * from students
where marks > (select min(marks) from students);

## Q4 Find students whose marks are the highest.
Select * from students
where marks = (select max(marks) from students);

## Q5 Show students who scored less than the highest scorer.
select * from students
where marks < (select max(marks) from students);

## Q6 Find students who scored more than all students from Mumbai.
select * from students 
where marks >  (select MAX(marks) from students where city = "Mumbai");

## With all fucntion
select * from students 
where marks > ALL (select marks from students where city = "Mumbai");

## Q7 Find students whose marks are above the average marks of BCA students.
select * from students 
where marks > (select avg(marks) from students where course = "BCA");


## With IN fucntion
## Q8 Find cities where at least one student scored above 80.
select DISTINCT city from students 
where city in (select city from students where marks > 80);

## Q9 A university wants to identify students who live in cities where top performers (marks > 99) are present.
select * from students  
where city in (select DISTINCT city from students where marks > 99);

## Q10 Find students who live in cities where at least one student has scored more than 90 marks.
select * from students  
where city in (select city from students where marks > 90);

## Q11 Find students from cities where no student has scored less than 40 marks.
select * from students
where city not in (select city from students where marks < 40);

##Homework

##Q12 Find students from cities where no student has scored less than 35 marks
select * from students
where city not in (select city from students where marks < 35);

##Q13 find students who scored more than at least one student from Pune
select * from students 
where marks > (select min(marks) from students where city = "Pune");

##Q14 find students who scored more than at least one student from 	the 'BCA' course
select * from students
where marks > any (select min(marks) from students where course = 'BCA');

## Q15 find students who scored more than every student from Mumbai
select * from students
where marks > (select max(marks) from students where city = "Mumbai");

## find students whose mark are higher than all students from the MCA course
select * from students 
where marks > (select max(marks) from students where course = "MCA");



## Correlated queries

CREATE TABLE Employee (
    Eid INT,
    Name VARCHAR(50),
    Address VARCHAR(50)
);

INSERT INTO Employee
VALUES
(1,'Rahul Sharma','Delhi'),
(2,'Priya Mehta','Pune'),
(3,'Amit Verma','Mumbai'),
(4,'Sneha Iyer','Chennai'),
(5,'Rohan Das','Hyderabad'),
(6,'Neha Kapoor','Delhi'),
(7,'Arjun Nair','Bangalore'),
(8,'Kavita Joshi','Pune'),
(9,'Vikram Singh','Mumbai'),
(10,'Pooja Shah','Ahmedabad');


CREATE TABLE Department (

    Did VARCHAR(5),

    Dname VARCHAR(50),

    Eid INT

);

INSERT INTO Department

VALUES

('D1','Human Resources',3),

('D2','Information Technology',7),

('D3','Finance',2),

('D4','Marketing',10),

('D5','Operations',5);

##Exists returns a boolean value

## Q1 A company wants to identify all employees who are currently assigned to at least one department. 
#Some employees may not yet be assigned, so only those with a valid department mapping should be displayed.
select * from employee e 
where exists (select * from department d 
                 where e.Eid = d.Eid);
                 
                 
##Q2 The HR team wants to find employees who are not yet assigned to any department so they can allocate them to appropriate teams.
select * from employee e 
where NOT exists (select * from department d 
                 where e.Eid = d.Eid);                 
                 
## Q3 The IT head wants a list of employees who are specifically 
#working in the "Information Technology' department for an internal audit
select * from employee e 
where exists (select * from department d where e.Eid = d.Eid and d.Dname = "Information Technology");

##using join
select e.* from employee e inner join department d on e.Eid = d.Eid where d.Dname = "Information Technology";

##Q4 The management wants to identify employees who are working accross multiple departments
#(e.g. handling multiple responsibilities) to evaluate workload distribution 

select e.name from employee e where exists (select count(*) from department d where d.Eid = e.Eid) > 1;


##Q5 The company wants to extract the list of employees who are part of either 
#Finance or Human resources departments for a policy update
select * from employee e 
where exists (select * from department d where e.Eid = d.Eid and d.Dname in ("Finance", "Human Resources"));
