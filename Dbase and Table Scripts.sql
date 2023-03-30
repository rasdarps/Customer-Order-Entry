/*scripts for creating the database*/
CREATE DATABASE adv_dbase_project;

/*Tables Creation Scripts*/
CREATE TABLE Customer (
  customerNo INT AUTO_INCREMENT NOT NULL,
  customerName VARCHAR(20) NOT NULL,
  customerStreet VARCHAR(20),
  customerCity VARCHAR(20),
  customerState VARCHAR(20),
  customerZipCode VARCHAR(20),
  custTelNo VARCHAR(15) NOT NULL,
  custFaxNo VARCHAR(15),
  DOB DATE,
  maritalStatus ENUM('single', 'married', 'widow', 'widower', 'divorced'),
  creditRating VARCHAR(20) NOT NULL,
  PRIMARY KEY (customerNo),
  UNIQUE (custTelNo),
  UNIQUE (custFaxNo)
);

CREATE TABLE Employee (
  employeeNo INT AUTO_INCREMENT NOT NULL,
  title VARCHAR(20),
  firstName VARCHAR(20) NOT NULL,
  middleName VARCHAR(20),
  lastName VARCHAR(20) NOT NULL,
  address VARCHAR(50),
  workTelExt VARCHAR(15) UNIQUE NOT NULL,
  homeTelNo VARCHAR(15) UNIQUE,
  empEmailAddress VARCHAR(20) UNIQUE,
  socialSecurityNumber VARCHAR(20),
  DOB DATE,
  position VARCHAR(20),
  sex ENUM ('male', 'female') NOT NULL,
  salary DECIMAL(10,2),
  dateStarted DATE NOT NULL,
  PRIMARY KEY (employeeNo),
  UNIQUE (socialSecurityNumber)
);

CREATE TABLE Product (
  productNo INT AUTO_INCREMENT NOT NULL,
  productName VARCHAR(50) UNIQUE NOT NULL,
  serialNo VARCHAR(20) NOT NULL,
  unitPrice DECIMAL(10,2) NOT NULL,
  quantityOnHand INT default(0),
  reorderLevel INT,
  reorderQuantity INT,
  reorderLeadTime varchar(50),
  PRIMARY KEY (productNo),
  UNIQUE (serialNo)
);

CREATE TABLE Orders(
  orderNo INT AUTO_INCREMENT  NOT NULL,
  orderDate DATE NOT NULL,
  billingStreet VARCHAR(20),
  billingCity VARCHAR(20),
  billingState VARCHAR(20),
  billingZipCode VARCHAR(20),
  promisedDate DATE,
  status ENUM ('processing', 'delivered'),
  customerNo INT NOT NULL,
  employeeNo INT NOT NULL,
  PRIMARY KEY (orderNo),
  FOREIGN KEY (customerNo) REFERENCES Customer(customerNo) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (employeeNo) REFERENCES Employee(employeeNo) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE OrderDetail (
  orderdetailNo INT AUTO_INCREMENT  NOT NULL,
  orderNo INT NOT NULL,
  productNo INT NOT NULL,
  quantityOrdered INT NOT NULL,
  PRIMARY KEY (orderdetailNo),
  FOREIGN KEY (orderNo) REFERENCES Orders(orderNo) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (productNo) REFERENCES Product(productNo) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE PaymentMethod (
  pMethodNo INT AUTO_INCREMENT NOT NULL,
  paymentMethod ENUM ('cash', 'check','credit card') NOT NULL,
  PRIMARY KEY (pMethodNo)
);

CREATE TABLE invoice (
  invoiceNo INT AUTO_INCREMENT NOT NULL,
  dateRaised DATE NOT NULL,
  datePaid DATE ,
  creditCardNo VARCHAR(20),
  holdersName VARCHAR(50),
  expiryDate DATE,
  orderNo INT NOT NULL,
  pMethodNo INT NOT NULL,
  PRIMARY KEY (invoiceNo),
  FOREIGN KEY (orderNo) REFERENCES Orders(orderNo) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (pMethodNo) REFERENCES PaymentMethod(pMethodNo) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE ShipmentMethod (
  sMethodNo INT AUTO_INCREMENT NOT NULL,
  shipmentMethod ENUM ('air', 'land','sea') NOT NULL,
  PRIMARY KEY (sMethodNo)
);

CREATE TABLE Shipment (
  shipmentNo INT AUTO_INCREMENT NOT NULL,
  quantity INT NOT NULL,
  shipmentDate DATE NOT NULL,
  completeStatus ENUM('pending', 'partial', 'shipped') NOT NULL,
  orderNo INT NOT NULL,
  productNo INT NOT NULL,
  employeeNo INT NOT NULL,
  sMethodNo INT NOT NULL,
  PRIMARY KEY (shipmentNo),
  FOREIGN KEY (orderNo) REFERENCES Orders(orderNo) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (productNo) REFERENCES product(productNo) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (employeeNo) REFERENCES Employee(employeeNo) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (sMethodNo) REFERENCES ShipmentMethod(sMethodNo) ON DELETE CASCADE ON UPDATE CASCADE
);
