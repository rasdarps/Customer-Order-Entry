**#Mini Customer Entry Project**

This project is a mini project on Customer Order Entry. It is useful for anyone who want to learn database from a beginner level with a mini project.
It simulates a business customer order entry where customer orders are entered in a database to track supply.

#PROBLEM STATEMENT

A company wishes to create a database for its order entry activities. A customer can place one or more orders, with each order for one or more products. Each order gives rise to one invoice, which can be paid by a number of methods, such as check, credit card, or cash. The name of the employee who initially processes the customer order is recorded. An employee in the Shipping Department is responsible for packaging the order and sending it to the
customer. If an ordered product is not in stock, Shipping send out what is in stock, so more than one shipment may be required to fulfil the order.

#ER DIAGRAM
An ER (Entity-Relationship) diagram is a graphical representation of entities and their relationships to each other in a database. It is a visual tool used to design and communicate the database schema. ER diagrams use symbols and connectors to represent entities, attributes, relationships, and cardinality.

#Model Flow Chart
A flowchart is a type of diagram that represents the steps or processes involved in a system or workflow. It is a visual tool that shows the sequence of steps, decision points, and branching paths in a process.

#Access Flow Chart
An Access flowchart is a type of diagram used to represent the logical flow of data within a database. It typically show the operation one has with access to the system


**#DATABASE**

A database is a collection of data that is organized and stored in a computer system, typically managed by a database management system (DBMS). A database allows users to store, retrieve, update, and delete data in a structured and efficient way. 

Databases are commonly used in various applications and industries, including business, finance, healthcare, education, and many others. They provide a way to manage and maintain large amounts of data, allowing for efficient and reliable storage and retrieval of information.

Some common examples of database management systems include MySQL, Oracle, Microsoft SQL Server, PostgreSQL, and MongoDB.

**#TABLES**

Tables are a fundamental part of relational databases, which are a type of database that stores data in tables and uses relationships between tables to manage and organize the data.

**#DATA TYPE**

data type is a classification of data based on the type of value it represents. Common data types include integers, floating-point numbers, characters, strings, Boolean values, arrays, and structures.

**#CONSTRAINTS**

Is a rule or restriction that is applied to a column or set of columns in a table, to ensure data integrity and consistency. Constraints can be used to enforce business rules, prevent invalid data from being entered into the database, and ensure that the data in the database is accurate and consistent.

**Some common types of constraints include:**

**#Primary key:** A primary key is a constraint that ensures that each record in a table is unique and can be easily referenced or linked to from other tables in the database.

**#Foreign key:** A foreign key is a constraint that establishes a relationship between two tables in the database, by linking a column in one table to the primary key of another table.

**#Unique:** A unique constraint ensures that the values in a column or set of columns are unique and cannot be duplicated in the same table.

**#Not null:** A not null constraint ensures that a column cannot have a null (empty) value.

**#Check:** A check constraint allows you to specify a condition that must be met for data to be inserted or updated in a table.

Constraints can be specified when creating a table or modifying an existing table, using SQL commands such as CREATE TABLE and ALTER TABLE. Constraints are an important part of database design, as they help to ensure data integrity and consistency, and prevent errors and inconsistencies in the database.

**In SQL we can use the following to interact with database and tables**

**#DDL** and **DML** are two categories of SQL (Structured Query Language) commands used in database management.

**#DDL** stands for Data Definition Language, and includes SQL commands used to define and modify the structure of database objects such as tables, indexes, views, and procedures. Examples of DDL commands include CREATE TABLE, ALTER TABLE, DROP TABLE, CREATE INDEX, and CREATE PROCEDURE. These commands do not manipulate data directly, but rather define or modify the structure of the database objects that contain data.

**#DML** stands for Data Manipulation Language, and includes SQL commands used to manipulate data within database objects. Examples of DML commands include SELECT, INSERT, UPDATE, and DELETE. These commands are used to retrieve, insert, update, and delete data in database tables.

The main difference between DDL and DML is that DDL commands are used to modify the structure of the database objects, while DML commands are used to manipulate the data stored within those objects. DDL commands are typically used less frequently than DML commands, as the structure of the database objects usually only needs to be modified when the schema of the database changes.

**BRIEF ABOUT THE PROJECT**

#A databse was created using the **CREATE DATABASE ** command

#Tables were created using the **CREATE TABLE** Command

**Tables used in the project**
1. Customer Table
2. Employee Table
3. Product Table
4. Order Table
5. Orderdetail Table
6. Invoice Table
7. Payment Method Table
8. Shipment Table
9. Shipment Method Table

The necessary constraints like Primary key, foreign key, not null, auto_increments and data types were employed to ensure data integrity and prevention of redundancy were applied to the tables.

**#INSERT STATEMENT** was used to insert records into the table

**#SELECT STATEMENT** was used to select records from the table

# TRIGGER STATEMENTS
a trigger is a special kind of stored procedure that is automatically executed in response to certain events or actions. These events or actions may include the insertion, deletion, or modification of data in a database table.
Triggers were used to create some trigger actions in some tables like stock level update and low stock alerts


**Author: Kwaku Darpah (Tech Enthusiast)**
Social Handles
YouTube: Kwaku The Analyst
Fbook: kwaku darpah
Twitter: Kwaku Darpah
Linkdin: Alex Ayensu Darpah
POWERED_BY_RICT
