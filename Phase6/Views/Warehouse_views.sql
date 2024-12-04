-- View for Product Inventory
CREATE VIEW vw_ProductInventory AS
SELECT 
    p.productID,
    p.productName,
    c.CategoryName,
    p.Size,
    p.PricePerUnit,
    p.QuantityInStock,
    s.SupplierName,
    w.WarehouseID,
    l.Country,
    l.State
FROM PRODUCT p
JOIN CATEGORY c ON p.CategoryId = c.CategoryID
JOIN SUPPLIER s ON p.SUPPLIER_SupplierID = s.SupplierID
JOIN STORAGE st ON p.productID = st.PRODUCT_productID
JOIN WAREHOUSE w ON st.WAREHOUSE_WarehouseID = w.WarehouseID
JOIN LOCATION l ON w.LocationId = l.locationId;

-- View for Order Summary
CREATE VIEW vw_OrderSummary AS
SELECT 
    o.OrderId,
    o.OrderDate,
    o.Quantity,
    o.OrderStatus,
    o.Amount,
    sk.FullName AS ShopkeeperName,
    s.ShipmentStatus,
    s.TrackingNumber,
    t.PaymentMethod
FROM `ORDER` o
JOIN SHOPKEEPER sk ON o.ShopkeeperId = sk.ShopkeeperID
LEFT JOIN SHIPMENT s ON o.OrderId = s.OrderId
LEFT JOIN TRANSACTION t ON o.OrderId = t.OrderId;

-- View for Warehouse Capacity
CREATE VIEW vw_WarehouseCapacity AS
SELECT 
    w.WarehouseID,
    l.Country,
    l.State,
    l.ZipCode,
    w.MaxCapacity,
    w.CurrentCapacity,
    w.AvailableSpace,
    (w.CurrentCapacity * 100.0 / w.MaxCapacity) AS OccupancyPercentage
FROM WAREHOUSE w
JOIN LOCATION l ON w.LocationId = l.locationId;

-- View for Product Performance
CREATE VIEW vw_ProductPerformance AS
SELECT 
    p.productID,
    p.productName,
    c.CategoryName,
    SUM(o.Quantity) AS TotalQuantitySold,
    SUM(o.Amount) AS TotalRevenue,
    AVG(o.Amount / o.Quantity) AS AverageSellingPrice
FROM PRODUCT p
JOIN CATEGORY c ON p.CategoryId = c.CategoryID
JOIN `ORDER` o ON p.productID = o.OrderId
GROUP BY p.productID, p.productName, c.CategoryName;

-- View for Supplier Performance
CREATE VIEW vw_SupplierPerformance AS
SELECT 
    s.SupplierID,
    s.SupplierName,
    s.ContactPerson,
    s.Email,
    COUNT(DISTINCT p.productID) AS TotalProductsSupplied,
    SUM(p.QuantityInStock) AS TotalInventorySupplied
FROM SUPPLIER s
JOIN PRODUCT p ON s.SupplierID = p.SUPPLIER_SupplierID
GROUP BY s.SupplierID, s.SupplierName, s.ContactPerson, s.Email;

-- View for Borrow Request Status
CREATE VIEW vw_BorrowRequestStatus AS
SELECT 
    br.RequestID,
    br.RequestDate,
    br.BorrowStatus,
    p.productName,
    sk.FullName AS ShopkeeperName,
    sk.Email AS ShopkeeperEmail
FROM BORROWREQUEST br
JOIN PRODUCT p ON br.ProductID = p.productID
JOIN SHOPKEEPER sk ON br.ShopkeeperID = sk.ShopkeeperID;