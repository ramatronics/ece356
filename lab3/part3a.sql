SET autocommit=1;

SELECT salary FROM Employee WHERE empID = 66;

/*CASE 1*/
START TRANSACTION;
UPDATE Employee SET salary = salary + 100000 WHERE empID = 66;
ROLLBACK;

SELECT salary FROM Employee WHERE empID = 66;

/*CASE 2*/
START TRANSACTION;
UPDATE Employee SET salary = salary + 100000 WHERE empID = 66;
COMMIT;
SELECT salary FROM Employee WHERE empID = 66;
