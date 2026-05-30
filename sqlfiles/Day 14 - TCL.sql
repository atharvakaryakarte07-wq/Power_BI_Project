create database db707;

use db707;

CREATE TABLE accounts (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    balance INT
);

INSERT INTO accounts VALUES
(1, 'Amit', 5000),
(2, 'Neha', 7000),
(3, 'Rahul', 6000);

SELECT * FROM accounts;



## #######################################################

SELECT * FROM accounts;

START TRANSACTION;

UPDATE accounts SET balance = balance - 1000 WHERE id = 1;

SAVEPOINT sp1;

UPDATE accounts SET balance = balance - 500 WHERE id = 1;

SAVEPOINT sp2;

UPDATE accounts SET balance = balance - 200 WHERE id = 1;

-- Rollback to sp2
ROLLBACK TO sp2;

select * From accounts; 

-- Again rollback to sp1
ROLLBACK TO sp1;

rollback;
-- You can still continue working
UPDATE accounts SET balance = balance - 300 WHERE id = 1;

COMMIT;                -- Saves Changes Permenantly


## IMP Points for TCL:-

/*
ROLLBACK & SAVEPOINT (Notes):
🔹 1. Full ROLLBACK
Cancels entire transaction
All changes are undone
All SAVEPOINTs are deleted
Transaction ends

✅ After this:

Cannot use old savepoints ❌
Must use START TRANSACTION again ✅

2. ROLLBACK TO SAVEPOINT
Cancels changes up to that savepoint
Transaction continues
Savepoints are still available

✅ After this:

Can continue queries ✅
Can rollback again to same/different savepoint ✅
 ------------------------------------------------------------------------
| Feature                      | ROLLBACK         | ROLLBACK TO SAVEPOINT |
| ---------------------------- | ---------------- | --------------------- |
| Scope                        | Full transaction | Partial               |
| Savepoints                   | Deleted ❌        | Remain ✅             |
| Transaction                  | Ends ❌           | Continues ✅          |
| Need START TRANSACTION again | Yes ✅            | No ❌                 |
 -------------------------------------------------------------------------
 
 
 4. Important Rules
After COMMIT → ❌ No rollback possible
After ROLLBACK → ❌ No savepoints exist
Savepoints work only inside active transaction
Cannot rollback forward, only backward


