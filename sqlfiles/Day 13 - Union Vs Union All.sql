Use db7;

CREATE TABLE classA (
    name VARCHAR(50)
);

INSERT INTO classA VALUES
('Amit'),
('Neha'),
('Rahul');

CREATE TABLE classB (
    name VARCHAR(50)
);

INSERT INTO classB VALUES
('Neha'),
('Karan'),
('Sneha');


## Union

SELECT name FROM classA
UNION
SELECT name FROM classB;             -- Duplicates will be Removed

## Union All

SELECT name FROM classA
UNION ALL
SELECT name FROM classB;               -- Duplicates will be there