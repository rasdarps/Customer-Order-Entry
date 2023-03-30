/*SAMPLE QUERIES*/
/*1. Selecting all records from a customer table*/
SELECT * FROM customers;

/*2. Retrieve the product name and price of all products that are currently out of stock:*/
SELECT productName, unitPrice, quantityOnHand 
FROM product 
WHERE quantityOnHand = 10;

/*3. Retrieve the name, contact and order number of customers who have placed an order: */
SELECT DISTINCT customer.customerName, customer.custTelNo, orders.orderNo 
FROM customer 
INNER JOIN orders ON customer.customerNo = orders.customerNo;

/*4. Retrieve the name of the employee who processed each order: */
SELECT orders.orderNo, employee.firstName, employee.lastName 
FROM orders 
INNER JOIN employee ON orders.employeeNo = employee.employeeNo;


/*5. Retrieve all outstanding orders and their total amounts*/
SELECT orders.orderDate,orderdetail.orderNo,productName,orderdetail.quantityOrdered,unitPrice,
(quantityOrdered * unitPrice) AS total
FROM orderdetail 
INNER JOIN orders ON orderdetail.orderNo=orders.orderNo
INNER JOIN product ON orderdetail.productNo = product.productNo;