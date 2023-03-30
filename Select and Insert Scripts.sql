/*SELECTION AND INSERT SCRIPTS*/

SELECT * FROM customer LIMIT 10;
/*inserting into customers table*/
INSERT INTO customer(customerNo,customerName,customerStreet,customerCity,customerState,customerZipCode,custTelNo,custFaxNo,DOB,maritalStatus,creditRating)
VALUE(1, 'Kofi Manu', '4th Street Pine Avenue', 'Ridge', 'Accra', 2334, '0504987876', '0248987509' ,'1980-12-3', 'Married', 4),
	 (2, 'Ada Mansa', '5th Street Adum', 'Adum', 'Kumasi', 0334, '0504965876', '0348987509' ,'1990-10-23', 'Married', 5),
     (3, 'Ataa Adwoa', '7th Street Takoradi', 'Takoradi', 'Secondi/Takoradi', 0098, '0544987876', '0508987509', '1995-5-6', 'Single', 3);
     
SELECT * FROM employee LIMIT 10;
/*inserting into employees table*/
INSERT INTO employee(title, firstName, middleName, lastName, address, workTelExt, homeTelNo, empEmailAddress, socialSecurityNumber, DOB, position, sex, salary, dateStarted)
VALUE('Mr','Seth', 'Kofi', 'Mensah', 'P O Box ks 4508, Adum-Kumasi', '0509878765', '0320987676', 'kofi@test.com', '9098787656', '1970-6-13', 'Sales Officer', 'Male', 4000, '2020-3-12'),
	 ('Mrs','Mercy', 'Adwoa', 'Mansah', 'P O Box ks 308, Sunyani', '0309878765', '0420987676', 'mercy@test.com', '5558787656', '1979-10-17', 'Sales Officer', 'Female', 3500, '2021-5-9'),
     ('Miss','Rhoda', 'Naa', 'Adawaa', 'P O Box ks 508, Ridge- Accra', '0209878765', '0520987676', 'naa@test.com', '7654787656', '1990-6-9', 'Sales Officer', 'Female', 4000, '2022-12-16');
     
SELECT * FROM product LIMIT 10;     
/*inserting into customers table*/
INSERT INTO product(productName, serialNo, unitPrice, quantityOnHand, reorderLevel, reorderQuantity, reorderLeadTime)
VALUE('HP Laptop i5', 'hp1234256', 4000, 10, 5, 10, '5 days'),
	 ('Dell Laptop i3', 'del1234986', 3000, 10, 5, 10, '5 days'),
     ('Lenovo Laptop i7', 'len1774256', 6000, 10, 5, 10, '5 days');
     
SELECT * FROM orders LIMIT 10;
/*inserting into orders table*/
INSERT INTO orders(orderDate, billingStreet, billingCity, billingState, billingZipCode, promisedDate, status, customerNo, employeeNo)
VALUE(curdate(), '3rd street, Kotobabi', 'Kotobabi', 'Accra', 3344, '2023-3-25', 'processing', 1, 1 ),
	 (curdate(), '2nd street', 'Adum', 'Kumasi', 7844, '2023-3-26', 'processing', 2, 2 ),
     (curdate(), '7th street', 'Secondi', 'Takoradi', 6544, '2023-3-29', 'processing', 3, 3 );
     
SELECT * FROM orderdetail LIMIT 10;
/*inserting into order details table*/
INSERT INTO orderdetail(orderNo, productNo, quantityOrdered)
VALUE(1,2,5),
	 (2,3,5),
     (3,1,5);
     
SELECT * FROM PaymentMethod LIMIT 10;
/*inserting into Payment Method table*/
INSERT INTO PaymentMethod(paymentMethod)
VALUE('cash'),
	 ('check'),
     ('credit card');
     
SELECT * FROM invoice LIMIT 10;
/*inserting into invoice table*/
INSERT INTO invoice(dateRaised, datePaid, creditCardNo, holdersName, expiryDate, orderNo, pMethodNo)
VALUE(curdate(), curdate(), 9087876564, 'Emmanuel Mensah', '2025-09-25', 1, 3),
	 (curdate(), curdate(), 1437876590, 'John Doe', '2024-04-24', 1, 3),
     (curdate(), curdate(), 4567876587, 'Emmanuel Mensah', '2023-12-25', 1, 3);
     

SELECT * FROM shipmentmethod LIMIT 10;
/*inserting into Shipment Method table*/
INSERT INTO ShipmentMethod(shipmentMethod)
VALUE('air'),
	 ('sea'),
     ('land');
     

SELECT * FROM shipment LIMIT 10;
/*inserting into Shipment table*/
INSERT INTO Shipment(quantity, shipmentDate, completeStatus, orderNo, productNo, employeeNo, sMethodNo)
VALUE(5, curdate(), 'shipped', 1, 1, 1, 3),
	 (5, curdate(), 'shipped', 2, 2, 2, 1),
     (5, curdate(), 'shipped', 3, 3, 1, 2);