create database dbtrigger;



Use dbtrigger;

## Create Table

CREATE TABLE students1(
    id INT,
    name VARCHAR(50)
);

## Insert Values

INSERT INTO students1
VALUES
(1, 'Amit'),
(2, 'Neha'),
(3, 'Rahul'),
(4, 'Sneha'),
(5, 'Karan'),
(6, 'Pooja'),
(7, 'Arjun'),
(8, 'Meena'),
(9, 'Rohit'),
(10, 'Anjali');

select * From students1;

## Create log table

CREATE TABLE log (
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    student_name VARCHAR(50),
    log_date_time DATETIME,
    action_type VARCHAR(10)
);


## Create trigger whenever any operation on Students1 table happens this trigger will execute and record a log

## Insert Trigger

DELIMITER //

CREATE TRIGGER ins_trigger_demo
AFTER INSERT
ON students1
FOR EACH ROW
BEGIN
    INSERT INTO log(student_id, student_name, log_date_time, action_type)
    VALUES (NEW.id, NEW.name, NOW(), 'INSERT');
END //

DELIMITER ;

## Update Trigger

DELIMITER //

CREATE TRIGGER upd_trigger_demo
AFTER UPDATE
ON students1
FOR EACH ROW
BEGIN
    INSERT INTO log(student_id, student_name, log_date_time, action_type)
    VALUES (NEW.id, NEW.name, NOW(), 'UPDATE');
END //

DELIMITER ;


## Delete Trigger:

DELIMITER //

CREATE TRIGGER del_trigger_demo
AFTER DELETE
ON students1
FOR EACH ROW
BEGIN
    INSERT INTO log(student_id, student_name, log_date_time, action_type)
    VALUES (OLD.id, OLD.name, NOW(), 'DELETE');
END //

DELIMITER ;

select * From log;

## Test the trigger is wotking or not:


INSERT INTO students1 VALUES (1, 'Amit');

set sql_safe_updates = 0;

UPDATE students1
SET name = 'Sam'
WHERE id = 1;
 
DELETE FROM students1
WHERE id = 2;

SELECT * FROM log;

## Triggers present in your Database:

SELECT trigger_name, event_manipulation, event_object_table
FROM information_schema.triggers
WHERE trigger_schema = DATABASE();



## In case you are getting records twice

TRUNCATE TABLE log;
TRUNCATE TABLE students1;





