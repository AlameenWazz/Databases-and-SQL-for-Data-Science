#update Rose's balance as well as the ShoeShop balance in the BankAccounts table. Then we also have to update Boots stock in the ShoeShop table. After Boots, also to buy Rose a pair of Trainers.
DELIMITER //

#create a stored procedure routine named TRANSACTION_ROSE that includes TCL commands COMMIT and ROLLBACK.
CREATE PROCEDURE TRANSACTION_ROSE()
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;
    START TRANSACTION;
    UPDATE BankAccounts
    SET Balance = Balance-200
    WHERE AccountName = 'Rose';

    UPDATE BankAccounts
    SET Balance = Balance+200
    WHERE AccountName = 'Shoe Shop';

    UPDATE ShoeShop
    SET Stock = Stock-1
    WHERE Product = 'Boots';

    UPDATE BankAccounts
    SET Balance = Balance-300
    WHERE AccountName = 'Rose';

    COMMIT;
END //

#checking if transactiion was successfully committed or not.
DELIMITER ;

CALL TRANSACTION_ROSE;

SELECT * FROM BankAccounts;

SELECT * FROM ShoeShop;

#Create a stored procedure TRANSACTION_JAMES
DELIMITER //

CREATE PROCEDURE TRANSACTION_JAMES()

BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;

    UPDATE BankAccounts
    SET Balance = Balance-1200
    WHERE AccountName = 'James';

    UPDATE BankAccounts
    SET Balance = Balance+1200
    WHERE AccountName = 'Shoe Shop';

    UPDATE ShoeShop
    SET Stock = Stock-4
    WHERE Product = 'Trainers';

    UPDATE BankAccounts
    SET Balance = Balance-150
    WHERE AccountName = 'James';

    COMMIT;

END //

DELIMITER ; 
