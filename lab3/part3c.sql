DROP PROCEDURE IF EXISTS transfer_funds;

DELIMITER $
CREATE PROCEDURE transfer_funds
(
    IN  fromProject INT,
    IN  toProject INT,
    IN  amount DOUBLE(10,2),
    OUT errorCode INT
)
procedure_body: BEGIN
    DECLARE originalFund INT;

    START TRANSACTION;

    SELECT funds INTO originalFund FROM Project WHERE projID = fromProject;

    IF ROW_COUNT() <= 0 THEN
        SET errorCode = -2;
        ROLLBACK;
        LEAVE procedure_body;
    END IF;

    SELECT funds FROM Project WHERE projID = toProject;

    IF ROW_COUNT() <= 0 THEN
        SET errorCode = -2;
        ROLLBACK;
        LEAVE procedure_body;
    END IF;

    IF originalFund < amount THEN
        SET errorCode = -1;
        ROLLBACK;
        LEAVE procedure_body;
    END IF;

    UPDATE Project SET funds = funds + amount WHERE projID = toProject;
    UPDATE Project SET funds = funds - amount WHERE projID = fromProject;

    COMMIT;
END;$
DELIMITER ;

SELECT * FROM Project;
CALL transfer_funds(100, 345, 1000, @error);
SELECT * FROM Project;
SELECT @error;
