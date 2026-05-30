use dbeh;
create database dbeh;
## Create table

CREATE TABLE student (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100)
);

## Insert values

INSERT INTO student VALUES
(1, 'Amit', 'amit@gmail.com'),
(2, 'Priya', 'priya@gmail.com'),
(3, 'Rahul', 'rahul@gmail.com'),
(4, 'Sneha', 'sneha@gmail.com'),
(5, 'Ragini', 'RKha78@gmail.com');


## Try to insert the record no 5 again

INSERT INTO student VALUES
(5, 'Ragini', 'RKha78@gmail.com');                  -- error 1062: Duplicate Entry



## Exception Handling with Stored procedure

## Without Handling Exceptions

DELIMITER //

CREATE PROCEDURE trial()
BEGIN

	SELECT * FROM Sales;       -- continue -- 1146 table doesnt exist
	SELECT * FROM student;

    INSERT INTO student 
    VALUES (5, 'Ragini', 'RKha78@gmail.com');

    SELECT * FROM student;

END //

DELIMITER ;

CALL trial();

drop procedure trial;



## Using Error Code:

drop procedure demo;


DELIMITER //

CREATE PROCEDURE demo()
BEGIN
    DECLARE CONTINUE HANDLER FOR 1146 
        SELECT 'Table not Created';

    DECLARE CONTINUE HANDLER FOR 1062 
        SELECT 'Duplicate Entry';

    SELECT * FROM student;

    SELECT * FROM Sales;

    INSERT INTO student 
    VALUES (5, 'Ragini', 'RKha78@gmail.com');

    SELECT * FROM t1;

END //

DELIMITER ;

CALL demo();


## Using SQLSTATE

DELIMITER //

CREATE PROCEDURE demo_sqlstate()
BEGIN
    DECLARE CONTINUE HANDLER FOR SQLSTATE '42S02' 
        SELECT 'Table not Created';

    DECLARE CONTINUE HANDLER FOR SQLSTATE '23000' 
        SELECT 'Duplicate Entry';

    SELECT * FROM student;

    SELECT * FROM Sales;

    INSERT INTO student 
    VALUES (5, 'Ragini', 'RKha78@gmail.com');

    SELECT * FROM t1;
END //

DELIMITER ;

call demo_sqlstate();


## Using Generic Handler :- SQLEXCEPTION

DELIMITER //

CREATE PROCEDURE demo_generic()
BEGIN
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION 
        SELECT 'Some error occurred';

    SELECT * FROM student2;

    SELECT * FROM Sales;

    INSERT INTO student 
    VALUES (5, 'Ragini', 'RKha78@gmail.com');

    SELECT * FROM t1;
END //

DELIMITER ;

CALL demo_generic();


## Exception Handling with Exit Handler

DELIMITER //

CREATE PROCEDURE demo_exit()
BEGIN
    DECLARE EXIT HANDLER FOR 1146
    BEGIN
        SELECT 'Table not found, stopping execution';
    END;

    SELECT * FROM student2;  -- This will cause error 1146

    SELECT 'This will NOT execute';

END //

DELIMITER ;

call demo_exit;  