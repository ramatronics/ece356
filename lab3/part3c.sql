DROP PROCEDURE IF EXISTS transfer_funds;

DELIMITER @@
DROP PROCEDURE IF EXISTS transfer_funds @@
Create PROCEDURE transfer_funds
(   IN fromProject INT,
    IN toProject INT,
    IN amount DOUBLE(10,2),
    OUT errorCode INT
)
BEGIN

DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
    SET errorCode = -1;
    ROLLBACK;
END;

START TRANSACTION;
    SET errorCode = 0;

    Update Project SET funds = funds - amount WHERE projID = fromProject;

    IF row_count() = 0 THEN
        SET errorCode = -1;
        ROLLBACK;
    elseIF (Select funds from Project where projID = fromProject) < 0 THEN
        SET errorCode = -2;
        ROLLBACK;
    END IF;

    UPDATE Project SET funds = funds + amount WHERE projID = toProject;

    IF row_count() = 0 THEN
        SET errorCode = -1;
        ROLLBACK;
    END IF;

COMMIT;
END @@
DELIMITER ;

SELECT * FROM Project;
CALL transfer_funds(100, 345, 1000, @error);
SELECT * FROM Project;
SELECT @error;
