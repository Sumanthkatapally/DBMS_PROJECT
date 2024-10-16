DROP DATABASE IF EXISTS `Warehouse_Management_System_DBMS_Project`;
CREATE DATABASE IF NOT EXISTS `Warehouse_Management_System_DBMS_Project`;
USE `Warehouse_Management_System_DBMS_Project` ;

-- -----------------------------------------------------
-- Table `Warehouse_Management_System_DBMS_Project`.`ADMIN`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Warehouse_Management_System_DBMS_Project`.`ADMIN` (
  `AdminID` INT NOT NULL AUTO_INCREMENT,
  `Username` VARCHAR(50) NOT NULL,
  `Password` VARCHAR(50) NOT NULL,
  `Role` ENUM('Manager', 'Supervisor') NOT NULL,
  `Email` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`AdminID`));


-- -----------------------------------------------------
-- Table `Warehouse_Management_System_DBMS_Project`.`SHOPKEEPER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Warehouse_Management_System_DBMS_Project`.`SHOPKEEPER` (
  `ShopkeeperID` INT NOT NULL AUTO_INCREMENT,
  `Username` VARCHAR(100) NOT NULL,
  `Password` VARCHAR(100) NOT NULL,
  `FullName` VARCHAR(100) NULL DEFAULT NULL,
  `Email` VARCHAR(100) NOT NULL,
  `ADMIN_AdminID` INT NOT NULL,
  PRIMARY KEY (`ShopkeeperID`),
  CONSTRAINT `fk_SHOPKEEPER_ADMIN1`
    FOREIGN KEY (`ADMIN_AdminID`)
    REFERENCES `Warehouse_Management_System_DBMS_Project`.`ADMIN` (`AdminID`));


-- -----------------------------------------------------
-- Table `Warehouse_Management_System_DBMS_Project`.`CATEGORY`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Warehouse_Management_System_DBMS_Project`.`CATEGORY` (
  `CategoryID` INT NOT NULL AUTO_INCREMENT,
  `CategoryName` VARCHAR(255) NOT NULL,
  `Description` TEXT NULL ,
  `CreatedDate` DATE NOT NULL,
  `Seasonality` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`CategoryID`));


-- -----------------------------------------------------
-- Table `Warehouse_Management_System_DBMS_Project`.`SUPPLIER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Warehouse_Management_System_DBMS_Project`.`SUPPLIER` (
  `SupplierID` INT NOT NULL AUTO_INCREMENT,
  `SupplierName` VARCHAR(100) NOT NULL,
  `ContactPerson` VARCHAR(100) NOT NULL,
  `Email` VARCHAR(100) NOT NULL,
  `SuppliedCloths` VARCHAR(100) NOT NULL,
  `ADMIN_AdminID` INT NOT NULL,
  PRIMARY KEY (`SupplierID`),
  CONSTRAINT `fk_SUPPLIER_ADMIN1`
    FOREIGN KEY (`ADMIN_AdminID`)
    REFERENCES `Warehouse_Management_System_DBMS_Project`.`ADMIN` (`AdminID`));


-- -----------------------------------------------------
-- Table `Warehouse_Management_System_DBMS_Project`.`LOCATION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Warehouse_Management_System_DBMS_Project`.`LOCATION` (
  `locationId` INT NOT NULL AUTO_INCREMENT,
  `ZipCode` VARCHAR(50) NOT NULL,
  `Email` VARCHAR(100) NOT NULL,
  `Street` VARCHAR(50) NOT NULL,
  `ManagerName` VARCHAR(55) NULL,
  `Country` VARCHAR(55) NOT NULL,
  `OpeningHours` VARCHAR(100) NULL,
  `State` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`locationId`));


-- -----------------------------------------------------
-- Table `Warehouse_Management_System_DBMS_Project`.`PRODUCT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Warehouse_Management_System_DBMS_Project`.`PRODUCT` (
  `productID` INT NOT NULL AUTO_INCREMENT,
  `productName` VARCHAR(100) NOT NULL,
  `CategoryId` INT NOT NULL,
  `Size` VARCHAR(50) NOT NULL,
  `PricePerUnit` DECIMAL(10,2) NOT NULL,
  `QuantityInStock` INT NOT NULL,
  `ADMIN_AdminID` INT NOT NULL,
  `SUPPLIER_SupplierID` INT NOT NULL,
  PRIMARY KEY (`productID`),
  CONSTRAINT `fk_PRODUCT_Category`
    FOREIGN KEY (`CategoryId`)
    REFERENCES `Warehouse_Management_System_DBMS_Project`.`CATEGORY` (`CategoryID`),
  CONSTRAINT `fk_PRODUCT_ADMIN1`
    FOREIGN KEY (`ADMIN_AdminID`)
    REFERENCES `Warehouse_Management_System_DBMS_Project`.`ADMIN` (`AdminID`),
  CONSTRAINT `fk_PRODUCT_SUPPLIER1`
    FOREIGN KEY (`SUPPLIER_SupplierID`)
    REFERENCES `Warehouse_Management_System_DBMS_Project`.`SUPPLIER` (`SupplierID`));


-- -----------------------------------------------------
-- Table `Warehouse_Management_System_DBMS_Project`.`WAREHOUSE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Warehouse_Management_System_DBMS_Project`.`WAREHOUSE` (
  `WarehouseID` INT NOT NULL AUTO_INCREMENT,
  `LocationId` INT NOT NULL,
  `MaxCapacity` INT NOT NULL,
  `CurrentCapacity` INT NOT NULL,
  `AvailableSpace` INT NOT NULL,
  `ADMIN_AdminID` INT NOT NULL,
  PRIMARY KEY (`WarehouseID`),
  CONSTRAINT `fk_WAREHOUSE_LOCATION`
    FOREIGN KEY (`LocationId`)
    REFERENCES `Warehouse_Management_System_DBMS_Project`.`LOCATION` (`locationId`),
  CONSTRAINT `fk_WAREHOUSE_ADMIN1`
    FOREIGN KEY (`ADMIN_AdminID`)
    REFERENCES `Warehouse_Management_System_DBMS_Project`.`ADMIN` (`AdminID`));


-- -----------------------------------------------------
-- Table `Warehouse_Management_System_DBMS_Project`.`BORROWREQUEST`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Warehouse_Management_System_DBMS_Project`.`BORROWREQUEST` (
  `RequestID` INT NOT NULL AUTO_INCREMENT,
  `RequestDate` DATE NOT NULL,
  `BorrowStatus` VARCHAR(50) NOT NULL,
  `ProductID` INT NOT NULL,
  `ShopkeeperID` INT NOT NULL,
  PRIMARY KEY (`RequestID`),
  CONSTRAINT `fk_rq_product`
    FOREIGN KEY (`ProductID`)
    REFERENCES `Warehouse_Management_System_DBMS_Project`.`PRODUCT` (`productID`),
  CONSTRAINT `fk_rq_shopkeeper`
    FOREIGN KEY (`ShopkeeperID`)
    REFERENCES `Warehouse_Management_System_DBMS_Project`.`SHOPKEEPER` (`ShopkeeperID`));


-- -----------------------------------------------------
-- Table `Warehouse_Management_System_DBMS_Project`.`STOCKAUDIT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Warehouse_Management_System_DBMS_Project`.`STOCKAUDIT` (
  `AuditID` INT NOT NULL AUTO_INCREMENT,
  `WarehouseID` INT NOT NULL,
  `AuditDate` DATE NOT NULL,
  `AuditorName` VARCHAR(50) NOT NULL,
  `Discrepancies` TEXT NULL,
  PRIMARY KEY (`AuditID`, `WarehouseID`),
  CONSTRAINT `fk_WarehouseID`
    FOREIGN KEY (`WarehouseID`)
    REFERENCES `Warehouse_Management_System_DBMS_Project`.`WAREHOUSE` (`WarehouseID`));


-- -----------------------------------------------------
-- Table `Warehouse_Management_System_DBMS_Project`.`ORDER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Warehouse_Management_System_DBMS_Project`.`ORDER` (
  `OrderId` INT NOT NULL AUTO_INCREMENT,
  `OrderDate` DATE NOT NULL,
  `Quantity` INT NOT NULL,
  `OrderStatus` VARCHAR(50) NOT NULL,
  `Amount` DECIMAL(10,2) NOT NULL,
  `ShopkeeperId` INT NOT NULL,
  PRIMARY KEY (`OrderId`),
  CONSTRAINT `ShopkeeperId`
    FOREIGN KEY (`ShopkeeperId`)
    REFERENCES `Warehouse_Management_System_DBMS_Project`.`SHOPKEEPER` (`ShopkeeperID`));


-- -----------------------------------------------------
-- Table `Warehouse_Management_System_DBMS_Project`.`SHIPMENT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Warehouse_Management_System_DBMS_Project`.`SHIPMENT` (
  `ShipmentId` INT NOT NULL AUTO_INCREMENT,
  `ShipmentDate` DATE NOT NULL,
  `ShipmentStatus` VARCHAR(45) NOT NULL,
  `TrackingNumber` VARCHAR(45) NOT NULL,
  `OrderId` INT NOT NULL,
  `WAREHOUSE_WarehouseID` INT NOT NULL,
  PRIMARY KEY (`ShipmentId`),
  CONSTRAINT `fk_OrderId`
    FOREIGN KEY (`OrderId`)
    REFERENCES `Warehouse_Management_System_DBMS_Project`.`ORDER` (`OrderId`),
  CONSTRAINT `fk_Shipment_WAREHOUSE1`
    FOREIGN KEY (`WAREHOUSE_WarehouseID`)
    REFERENCES `Warehouse_Management_System_DBMS_Project`.`WAREHOUSE` (`WarehouseID`));


-- -----------------------------------------------------
-- Table `Warehouse_Management_System_DBMS_Project`.`TRANSACTION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Warehouse_Management_System_DBMS_Project`.`TRANSACTION` (
  `TransactionId` INT NOT NULL AUTO_INCREMENT,
  `TransactionDate` DATE NOT NULL,
  `PaymentMethod` VARCHAR(45) NOT NULL,
  `TotalAmount` DECIMAL(10,2) NOT NULL,
  `OrderId` INT NOT NULL,
  `Invoice` LONGBLOB,
  PRIMARY KEY (`TransactionId`),
  CONSTRAINT `fk_Transaction_OrderId`
    FOREIGN KEY (`OrderId`)
    REFERENCES `Warehouse_Management_System_DBMS_Project`.`ORDER` (`OrderId`));


-- -----------------------------------------------------
-- Table `Warehouse_Management_System_DBMS_Project`.`STORAGE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Warehouse_Management_System_DBMS_Project`.`STORAGE` (
  `PRODUCT_productID` INT NOT NULL AUTO_INCREMENT,
  `WAREHOUSE_WarehouseID` INT NOT NULL,
  `CarbonFootprint` DECIMAL(10,5) NULL,
  PRIMARY KEY (`PRODUCT_productID`, `WAREHOUSE_WarehouseID`),
  CONSTRAINT `fk_PRODUCT_has_WAREHOUSE_PRODUCT1`
    FOREIGN KEY (`PRODUCT_productID`)
    REFERENCES `Warehouse_Management_System_DBMS_Project`.`PRODUCT` (`productID`),
  CONSTRAINT `fk_PRODUCT_has_WAREHOUSE_WAREHOUSE1`
    FOREIGN KEY (`WAREHOUSE_WarehouseID`)
    REFERENCES `Warehouse_Management_System_DBMS_Project`.`WAREHOUSE` (`WarehouseID`));


