## create database

create database db1;

## use database
use db1;

## see tables present in the database

show tables;

##create table

create table employee(
emp_id int, 
emp_name varchar(50), 
salary decimal(10,2)
);

## insert values 

insert into employee
values 
(1, "Ram", 99000), 
(2, "Harry", 100000),
(3, "Hermione", 105000),
(4, "Vikas", 990000),
(5, "Mohit", 980000);

## select the values 

select * from employee;


## update salary of ram to 100000

update employee
set salary = 100000
where emp_id = 1;


set sql_safe_updates = 0;

alter table employee
add column dept varchar(50);

update employee
set dept = 'HR'
where emp_id = 1;

select * from employee;

update employee
set dept = 'Finance'
where emp_id = 2;

update employee 
set dept = 'Accounts'
where emp_id = 3;

update employee 
set dept = 'IT'
WHERE emp_id = 4;

update employee 
set dept = 'Marketing'
where emp_id = 5;

## Delete the employee record where emp_id = 3

delete from employee
where emp_id = 3;

delete from employee
where salary > 100000;

truncate table employee;

drop table employee;