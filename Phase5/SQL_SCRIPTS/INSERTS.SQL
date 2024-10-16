
INSERT INTO ADMIN (Username, Password, Role, Email) VALUES
('john_doe', 'password123', 'Manager', 'john.doe@gmail.com'),
('jane_smith', 'adminpass', 'Supervisor', 'jane.smith@gmail.com'),
('alice_lee', 'leealice456', 'Manager', 'alice.lee@gmail.com'),
('bob_jones', 'bobsecurepass', 'Supervisor', 'bob.jones@gmail.com'),
('susan_clark', 'clarksecure123', 'Manager', 'susan.clark@gmail.com');


INSERT INTO SHOPKEEPER (Username, Password, FullName, Email, ADMIN_AdminID) VALUES
('David', 'shopper123', 'David Johnson', 'david.johnson@gmail.com', 1),
('Emily', 'shopper456', 'Emily Davis', 'emily.davis@gmail.com', 2),
('Brown', 'shopper789', 'Michael Brown', 'michael.brown@gmail.com', 3),
('Sarah', 'shopper101', 'Sarah Wilson', 'sarah.wilson@gmail.com', 4),
('James', 'shopper202', 'James Miller', 'james.miller@gmail.com', 5);
	

INSERT INTO CATEGORY (CategoryName, Description, CreatedDate, Seasonality) VALUES
('Summer Collection', 'Light and breezy fabrics perfect for summer.', '2023-06-01', 'Summer'),
('Winter Wear', 'Heavy and warm clothing for winter.', '2023-10-01', 'Winter'),
('Spring Collection', 'Floral and light spring designs.', '2023-03-01', 'Spring'),
('Fall Collection', 'Warm autumn colors and designs.', '2023-09-01', 'Fall'),
('Accessories', 'Various fashion accessories for all seasons.', '2023-05-15', 'All Seasons');


INSERT INTO SUPPLIER (SupplierName, ContactPerson, Email, SuppliedCloths, ADMIN_AdminID) VALUES
('Fabric World', 'George Thomas', 'george.thomas@gmail.com', 'Cotton, Silk', 1),
('Textile Co', 'Laura Anderson', 'laura.anderson@gmail.com', 'Wool, Denim', 2),
('Cloth Suppliers Inc', 'Kevin White', 'kevin.white@gmail.com', 'Linen, Polyester', 3),
('Global Fabrics', 'Angela Green', 'angela.green@gmail.com', 'Leather, Velvet', 4),
('Elite Clothings', 'Matthew Hall', 'matthew.hall@gmail.com', 'Satin, Silk', 5);

INSERT INTO LOCATION (ZipCode, Email, Street, ManagerName, Country, OpeningHours, State) VALUES
('10001', 'john@warehouse.com', '5th Ave', 'John Snow', 'USA', '9 AM - 5 PM', 'NY'),
('20002', 'lannister@warehouse.com', 'Broadway St', 'Cersei Lannister', 'USA', '10 AM - 6 PM', 'CA'),
('30003', 'targaryen@warehouse.com', 'Elm St', 'Daenerys Targaryen', 'USA', '8 AM - 4 PM', 'TX'),
('40004', 'stark@warehouse.com', 'Main St', 'Arya Stark', 'USA', '7 AM - 3 PM', 'FL'),
('50005', 'jeff@warehouse.com', 'Sunset Blvd', 'Jeff Bezos', 'USA', '11 AM - 7 PM', 'NV');


INSERT INTO PRODUCT (productName, CategoryId, Size, PricePerUnit, QuantityInStock, ADMIN_AdminID, SUPPLIER_SupplierID) VALUES
('Cotton Shirt', 1, 'L', 19.99, 50, 1, 1),
('Woolen Jacket', 2, 'M', 49.99, 30, 2, 2),
('Silk Scarf', 5, 'One Size', 14.99, 100, 3, 3),
('Denim Jeans', 1, 'XL', 39.99, 40, 4, 4),
('Leather Gloves', 2, 'M', 24.99, 20, 5, 5);


INSERT INTO WAREHOUSE (LocationId, MaxCapacity, CurrentCapacity, AvailableSpace, ADMIN_AdminID) VALUES
(1, 1000, 800, 200, 1),
(2, 1500, 1000, 500, 2),
(3, 2000, 1800, 200, 3),
(4, 1200, 900, 300, 4),
(5, 1700, 1500, 200, 5);


INSERT INTO BORROWREQUEST (RequestDate, BorrowStatus, ProductID, ShopkeeperID) VALUES
('2024-08-01', 'Pending', 1, 1),
('2024-08-02', 'Approved', 2, 2),
('2024-08-03', 'Rejected', 3, 3),
('2024-08-04', 'Pending', 4, 4),
('2024-08-05', 'Approved', 5, 5);


INSERT INTO STOCKAUDIT (WarehouseID, AuditDate, AuditorName, Discrepancies) VALUES
(1, '2024-09-01', 'Tom Hardy', 'No discrepancies'),
(2, '2024-09-02', 'Emma Watson', 'Minor stock issues'),
(3, '2024-09-03', 'Chris Evans', 'Overstock in section B'),
(4, '2024-09-04', 'Scarlett Johansson', 'Missing items in section D'),
(5, '2024-09-05', 'Robert Downey Jr', 'Stock mismatch in section A');


INSERT INTO ORDER (OrderDate, Quantity, OrderStatus, Amount, ShopkeeperId) VALUES
('2024-09-01', 10, 'Shipped', 199.90, 1),
('2024-09-02', 5, 'Delivered', 99.95, 2),
('2024-09-03', 20, 'Processing', 399.80, 3),
('2024-09-04', 15, 'Canceled', 299.85, 4),
('2024-09-05', 8, 'Pending', 159.92, 5);


INSERT INTO SHIPMENT (ShipmentDate, ShipmentStatus, TrackingNumber, OrderId, WAREHOUSE_WarehouseID) VALUES
('2024-09-06', 'Shipped', 'TRK12345', 1, 1),
('2024-09-07', 'Delivered', 'TRK12346', 2, 2),
('2024-09-08', 'In Transit', 'TRK12347', 3, 3),
('2024-09-09', 'Processing', 'TRK12348', 4, 4),
('2024-09-10', 'Pending', 'TRK12349', 5, 5);


INSERT INTO TRANSACTION (TransactionDate, PaymentMethod, TotalAmount, OrderId, Invoice) VALUES
('2024-09-06', 'Credit Card', 199.90, 1, NULL),
('2024-09-07', 'PayPal', 99.95, 2, NULL),
('2024-09-08', 'Bank Transfer', 399.80, 3, NULL),
('2024-09-09', 'Debit Card', 299.85, 4, NULL),
('2024-09-10', 'Credit Card', 159.92, 5, NULL);


INSERT INTO STORAGE (PRODUCT_productID, WAREHOUSE_WarehouseID, CarbonFootprint) VALUES
(1, 1, 2.34567),
(2, 2, 1.98765),
(3, 3, 3.45678),
(4, 4, 1.23456),
(5, 5, 2.87654);
