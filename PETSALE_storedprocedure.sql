#Create The RETRIEVE_ALL stored procedure routine to retrieve all the records from the PETSALE table
DELIMITER //

CREATE PROCEDURE RETRIEVE_ALL()

BEGIN
   SELECT *  FROM PETSALE;
END //
DELIMITER ;

#calling the stored procedure
CALL RETRIEVE_ALL;

# dropping the stored procedure
DROP PROCEDURE RETRIEVE_ALL;

CALL RETRIEVE_ALL;

#create stored procedure routine named UPDATE_SALEPRICE with parameters Animal_ID and Animal_Health.
DELIMITER @
CREATE PROCEDURE UPDATE_SALEPRICE (IN Animal_ID INTEGER, IN Animal_Health VARCHAR(5))
BEGIN
    IF Animal_Health = 'BAD' THEN
        UPDATE PETSALE
        SET SALEPRICE = SALEPRICE - (SALEPRICE * 0.25)
        WHERE ID = Animal_ID;
    ELSEIF Animal_Health = 'WORSE' THEN
        UPDATE PETSALE
        SET SALEPRICE = SALEPRICE - (SALEPRICE * 0.5)
        WHERE ID = Animal_ID;
    ELSE
        UPDATE PETSALE
        SET SALEPRICE = SALEPRICE
        WHERE ID = Animal_ID;
    END IF;
END @

DELIMITER ;

#update the UPDATE_SALEPRICE routine to change sale pricce of animal id 1 having BAD health condition  
   CALL RETRIEVE_ALL;

   CALL UPDATE_SALEPRICE(1, 'BAD');

   CALL RETRIEVE_ALL;

#update the sale price of animal with ID 3 having WORSE health conditio
   CALL RETRIEVE_ALL;

   CALL UPDATE_SALEPRICE(3, 'WORSE');

   CALL RETRIEVE_ALL;

#drop stored procedure routine
   DROP PROCEDURE UPDATE_SALEPRICE;

   CALL UPDATE_SALEPRICE;
