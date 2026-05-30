create database db8;

use db8;

create table employee
(emp_id int primary key, 
emp_name varchar(50));

select * from employee;

insert into employee
values 
(1, 'Rahul'),
(2, 'Geeta'),
(3, 'Michael'),
(4, 'Janet'),
(5, 'Pratik');


insert into employee
values 
(null, 'ABC');

drop table employee;


## Q1 Very IMP:
/* A company wants to store employee data with the following rules:
1.Every employee must have a unique ID
2.Email must be unique
3.Name cannot be empty
4.Age must be at least 18
5.Salary should default to 25,000 if not provided
6.Employee must belong to a valid department
7.Later company may change/remove constraints */

Create table department
(dep_id int primary key, dept_name varchar(50) unique);

create table employees
(emp_id int primary key, 
emp_name varchar(50) not null, 
email varchar(50) unique, 
age int check(age >= 18), 
salaey decimal(10,2) default  25000,
dep_id int,

foreign key (dep_id)
references department(dep_id)
);

show tables;

desc department;

desc employees;

show create table department;

show create table employees;



## Add new field phone

alter table employees
add phone varchar(15);


## Make phone unique

alter table employees
add unique(phone);


## increase the length of name

alter table employees
modify name varchar(100);

## Alter the default salary to 30K

alter table employees
alter salary set default 30000;

## drop email unique constraint

alter table employees
drop index email;     -- need to use index for unique

## Drop Primary Key

alter table employees
drop Primary Key;

## Drop foreign key

show create table employees;

alter table employees
drop foreign Key employees_ibfk_1;     

Drop table employees;

select * From Employees;

## add constraint

create table employees(
emp_id INT Primary key,
email varchar(50) unique,
name varchar(50) NOT NULL,
age INT check (age >= 18),
salary decimal(10,2) default 25000,
dept_id INT,

constraint dept_fk
foreign key (dept_id)
references department(dept_id)
);


show create table employees;


## Drop Foreign key

alter table employees
drop foreign Key dept_fk;

## delete check constraint

alter table employees
drop check employees_chk_1;

drop table employees;

## Check and FK      -- fk and check keys are assigned a different constraint names in 'show create table - Form editor' command, 
                      -- so while dropping them we can not directly use these constraints name 
                      -- we will need to use the names in 'show create table - form editor' or assign a different constraints names while creating the table
                      -- like below
                        

create table employees(
emp_id INT Primary key,
email varchar(50) unique,
name varchar(50) NOT NULL,
age INT,
salary decimal(10,2) default 25000,
dept_id INT,

constraint dept_fk
foreign key (dept_id)
references department(dept_id),

constraint age_chk
check (age >= 18)
);


## Drop both FK and Check

## Drop Foreign key

alter table employees
drop foreign Key dept_fk;

## delete check constraint

alter table employees
drop check age_chk;
