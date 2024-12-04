-- Select data from the PRODUCT table
SELECT * FROM Warehouse_Management_System_DBMS_Project.PRODUCT;

-- Select data from the CATEGORY table
SELECT * FROM Warehouse_Management_System_DBMS_Project.CATEGORY;

-- Attempt to insert data into the PRODUCT table
INSERT INTO Warehouse_Management_System_DBMS_Project.PRODUCT
  (productName, CategoryId, Size, PricePerUnit, QuantityInStock, ADMIN_AdminID, SUPPLIER_SupplierID)
VALUES
  ('Unauthorized Product', 2, 'L', 39.99, 30, 1, 2);
-- Error: INSERT command denied to user 'Kalyan'@'localhost' for table 'PRODUCT'

-- Attempt to select data from the ADMIN table
SELECT * FROM Warehouse_Management_System_DBMS_Project.ADMIN;
-- Error: SELECT command denied to user 'Kalyan'@'localhost' for table 'ADMIN'


SELECT * FROM Warehouse_Management_System_DBMS_Project.SUPPLIER;




