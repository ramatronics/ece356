DROP PROCEDURE IF EXISTS increase_salary_proc;

DELIMITER $
CREATE PROCEDURE increase_salary_proc
(
    IN inEmpID INT,
    IN inPercentage DOUBLE(4, 2)
)
BEGIN
    DECLARE raised INT;
    DECLARE pIncrease DOUBLE(7,4);

    SELECT salary INTO raised FROM Employee WHERE empID = inEmpID;
    SET pIncrease = inPercentage / 100;

    SET raised = raised * pIncrease + raised;

    UPDATE  Employee
    SET     salary = raised
    WHERE   empID = inEmpID;
END;$
DELIMITER ;

SELECT salary FROM Employee WHERE empID = 45;
CALL increase_salary_proc(45, 12.5);
SELECT salary FROM Employee WHERE empID = 45;
