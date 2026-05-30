create database db3;

use db3;

select * from students;

## Q1 Manager wants to see Data from Pune
select * from students
where city = 'Pune';

## Q2 Manager wants to see Data from Pune and Mumbai
select * from students
where city = "Pune" or city = "Mumbai";

## 	Q3 The college wants to identify students who scored more than 80 marks. Write a query to find students with marks greater than 80
select * from students
where marks > 80;

## 	Q4 The admin wants a list of students who belong to Mumbai.
select * from students
where city = 'Mumbai';

## Q5 The BCA department wants to see only their students.
select * from students
where course = "BCA";

## Q6 Students scoring below 40 need special attention.
SELECT * FROM students
where marks < 40;

## Q7 Find students younger than 22 who scored above 75.
select * from students
where age < 22 and marks > 75;

## Q7 Management wants students from Mumbai who scored more than 70.
select * from students
where city = "Mumbai" and marks > 70;

## Q8 Find students from Pune who scored more than 70 and belong to BCA course.
select * from students
where city = "Pune" and marks > 70 and course = "BCA";

## Q9 Show students who are either from Mumbai OR have marks greater than 90
select * from students
where city = "Mumbai" or marks > 90;

## Q10 Find students from Delhi who scored between 60 and 80.
select * from students
where city = "Delhi" and marks >= 60 and marks <= 80;


## Q11 Find students who: are from Pune and marks > 80 OR course = 'MCA'
select * from students
where city = "Pune" and (marks > 80 or course = "MCA"); 

##SORTING(order by)

##Q1 Show students sorted by marks (highest to lowest)
select * from students
order by marks DESC;

## Q2 Display students sorted by name (A–Z)
select * from students
order by name ASC;

## Q3 Show students sorted by course, and within each course, highest marks first.
select * from students
order by course ASC, marks DESC;