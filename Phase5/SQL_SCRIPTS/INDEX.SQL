CREATE INDEX idx_admin_username ON ADMIN(Username);
CREATE INDEX idx_admin_email ON ADMIN(Email);


CREATE INDEX idx_shopkeeper_username ON SHOPKEEPER(Username);
CREATE INDEX idx_shopkeeper_email ON SHOPKEEPER(Email);
CREATE INDEX idx_shopkeeper_admin_id ON SHOPKEEPER(ADMIN_AdminID);


CREATE INDEX idx_category_name ON CATEGORY(CategoryName);


CREATE INDEX idx_supplier_name ON SUPPLIER(SupplierName);
CREATE INDEX idx_supplier_admin_id ON SUPPLIER(ADMIN_AdminID);


CREATE INDEX idx_location_zipcode ON LOCATION(ZipCode);
CREATE INDEX idx_location_country ON LOCATION(Country);
CREATE INDEX idx_location_state ON LOCATION(State);


CREATE INDEX idx_product_name ON PRODUCT(productName);
CREATE INDEX idx_product_category ON PRODUCT(CategoryId);
CREATE INDEX idx_product_admin_id ON PRODUCT(ADMIN_AdminID);
CREATE INDEX idx_product_supplier_id ON PRODUCT(SUPPLIER_SupplierID);


CREATE INDEX idx_warehouse_location ON WAREHOUSE(LocationId);
CREATE INDEX idx_warehouse_admin_id ON WAREHOUSE(ADMIN_AdminID);


CREATE INDEX idx_borrowrequest_date ON BORROWREQUEST(RequestDate);
CREATE INDEX idx_borrowrequest_product ON BORROWREQUEST(ProductID);
CREATE INDEX idx_borrowrequest_shopkeeper ON BORROWREQUEST(ShopkeeperID);


CREATE INDEX idx_stockaudit_date ON STOCKAUDIT(AuditDate);


CREATE INDEX idx_order_date ON `ORDER`(OrderDate);
CREATE INDEX idx_order_status ON `ORDER`(OrderStatus);
CREATE INDEX idx_order_shopkeeper ON `ORDER`(ShopkeeperId);


CREATE INDEX idx_shipment_date ON SHIPMENT(ShipmentDate);
CREATE INDEX idx_shipment_status ON SHIPMENT(ShipmentStatus);
CREATE INDEX idx_shipment_order ON SHIPMENT(OrderId);
CREATE INDEX idx_shipment_warehouse ON SHIPMENT(WAREHOUSE_WarehouseID);


CREATE INDEX idx_transaction_date ON `TRANSACTION`(TransactionDate);
CREATE INDEX idx_transaction_order ON `TRANSACTION`(OrderId);


CREATE INDEX idx_storage_warehouse ON STORAGE(WAREHOUSE_WarehouseID);