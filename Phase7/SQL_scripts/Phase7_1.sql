CREATE USER 'Sumanth'@'localhost' IDENTIFIED BY 'password1';
CREATE USER 'Kalyan'@'localhost' IDENTIFIED BY 'password';

GRANT SELECT, INSERT, UPDATE, CREATE ON `warehouse_management_system_dbms_project`.* TO 'Sumanth'@'localhost';
GRANT DELETE ON `warehouse_management_system_dbms_project`.`ADMIN` TO 'Sumanth'@'localhost';
GRANT DELETE ON `warehouse_management_system_dbms_project`.`CATEGORY` TO 'Sumanth'@'localhost';
GRANT DELETE ON `warehouse_management_system_dbms_project`.`SHIPMENT` TO 'Sumanth'@'localhost';
GRANT DELETE ON `warehouse_management_system_dbms_project`.`SUPPLIER` TO 'Sumanth'@'localhost';
GRANT DELETE ON `warehouse_management_system_dbms_project`.`TRANSACTION` TO 'Sumanth'@'localhost';


GRANT SELECT ON Warehouse_Management_System_DBMS_Project.`PRODUCT` TO 'Kalyan'@'localhost';
GRANT SELECT ON Warehouse_Management_System_DBMS_Project.`CATEGORY` TO 'Kalyan'@'localhost';

SHOW GRANTS FOR 'Kalyan'@'localhost';



-- Grant Regular User Access to the Summarized View
GRANT SELECT ON warehouse_management_system_dbms_project.vw_SupplierPerformance TO 'Kalyan'@'localhost';


ALTER TABLE Warehouse_Management_System_DBMS_Project.ADMIN
MODIFY COLUMN Password CHAR(64) NOT NULL;


INSERT INTO Warehouse_Management_System_DBMS_Project.ADMIN (Username, Password, Role, Email)
VALUES 
  ('admin1', SHA2('password1', 256), 'Manager', 'admin1@example.com'),
  ('admin2', SHA2('password2', 256), 'Supervisor', 'admin2@example.com'),
  ('admin3', SHA2('password3', 256), 'Manager', 'admin3@example.com');



DELIMITER $$

CREATE PROCEDURE Warehouse_Management_System_DBMS_Project.AuthenticateUser (
    IN inputUsername VARCHAR(50),
    IN inputPassword VARCHAR(50),
    OUT resultMessage VARCHAR(50)
)
BEGIN
    DECLARE storedPassword CHAR(64);
    DECLARE hashedInputPassword CHAR(64);

    -- Hash the input password using SHA2-256
    SET hashedInputPassword = SHA2(inputPassword, 256);

    -- Retrieve the stored hashed password for the given username
    SELECT Password INTO storedPassword
    FROM Warehouse_Management_System_DBMS_Project.ADMIN
    WHERE Username = inputUsername;

    -- Check if the username exists
    IF storedPassword IS NOT NULL THEN
        -- Compare the hashed passwords
        IF storedPassword = hashedInputPassword THEN
            SET resultMessage = 'Access granted';
        ELSE
            SET resultMessage = 'Access denied';
        END IF;
    ELSE
        SET resultMessage = 'Access denied';
    END IF;
END $$

DELIMITER ;







CALL Warehouse_Management_System_DBMS_Project.AuthenticateUser('admin1', 'password1', @result);
SELECT @result AS AuthenticationResult;



CALL Warehouse_Management_System_DBMS_Project.AuthenticateUser('nonexistent', 'password', @result);
SELECT @result AS AuthenticationResult;

ALTER TABLE Warehouse_Management_System_DBMS_Project.ADMIN
MODIFY COLUMN Email VARBINARY(255) NOT NULL;

SET @encryption_key = 'mysecretkey123';

-- Encrypt the Email column
UPDATE Warehouse_Management_System_DBMS_Project.ADMIN
SET Email = AES_ENCRYPT(Email, @encryption_key) where AdminId = 1;

select * from admin;

SET SQL_SAFE_UPDATES = 0;

SELECT 
    Username, 
    CONVERT(AES_DECRYPT(Email, @encryption_key) USING 'utf8') AS DecryptedEmail
FROM Warehouse_Management_System_DBMS_Project.ADMIN where AdminId = 1;


