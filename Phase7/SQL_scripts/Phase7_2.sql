-- Create a new table
CREATE TABLE Warehouse_Management_System_DBMS_Project.TEST_TABLE (
  TestID INT PRIMARY KEY,
  TestName VARCHAR(50)
);

-- Insert data into the PRODUCT table
INSERT INTO Warehouse_Management_System_DBMS_Project.PRODUCT
  (productName, CategoryId, Size, PricePerUnit, QuantityInStock, ADMIN_AdminID, SUPPLIER_SupplierID)
VALUES
  ('New Product', 1, 'M', 29.99, 50, 1, 1);
  
  SELECT * FROM sakila.actor;
  
DELETE FROM Warehouse_Management_System_DBMS_Project.`PRODUCT` WHERE productID = 1; -- Error: Access denied
DELETE FROM Warehouse_Management_System_DBMS_Project.`ORDER` WHERE OrderId = 1;   -- Error: Access denied

SELECT * FROM Warehouse_Management_System_DBMS_Project. vw_SupplierPerformance;








