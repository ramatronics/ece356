
/* Lab 2- Part 2- Add  constraints to DB

 You must add to each table:
 a) Primary key constrains
 b) A referential integrity constrains

*/
SET default_storage_engine=INNODB;

/* 2.a - Add primary key constrains
Example, for the Department table you can do this with the commands:

ALTER TABLE Department ADD PRIMARY KEY(deptID);
or
DROP TABLE IF EXISTS Department;
CREATE TABLE Department(deptID INT PRIMARY KEY,deptName VARCHAR(100),location VARCHAR(100));

/* 2.b - Add referential integrity constrains
Example, Employee table has a column that depends on column   deptID of the Dep[artment table

You will add the following to your CREATE statement (or you can use an ALTER command as well):

foreign key (deptID) references Department(deptID)

DROP TABLE IF EXISTS Employee;
CREATE TABLE Employee(empID INT PRIMARY KEY,empName VARCHAR(100),job VARCHAR(100),deptID INT,salary INT,
foreign key (deptID) references Department(deptID) );

/* Tables created in lab 1 */

USE ece356db_mrmohame;

DROP TABLE IF EXISTS Department;
CREATE TABLE Department(deptID INT,deptName VARCHAR(100),location VARCHAR(100));

INSERT INTO Department(deptID, deptName, location) VALUES(3, 'marketing', 'Waterloo');
INSERT INTO Department(deptID, deptName, location) VALUES(7, 'research', 'Guelph');
INSERT INTO Department(deptID, deptName, location) VALUES(12, 'software', 'Toronto');
INSERT INTO Department(deptID, deptName, location) VALUES(13, 'computing', 'Toronto');



DROP TABLE IF EXISTS Employee;
CREATE TABLE Employee(empID INT,empName VARCHAR(100),job VARCHAR(100),deptID INT,salary INT,
						primary key (empID));

INSERT INTO Employee(empID, empName, job, deptID, salary) VALUES(23, 'Smith', 'programmer', 12, 35000);
INSERT INTO Employee(empID, empName, job, deptID, salary) VALUES(45, 'Kelly', 'engineer', 7, 37000);
INSERT INTO Employee(empID, empName, job, deptID, salary) VALUES(56, 'Herr', 'janitor', 7, 26000);
INSERT INTO Employee(empID, empName, job, deptID, salary) VALUES(89, 'Williams', 'analyst', 12, 36000);
INSERT INTO Employee(empID, empName, job, deptID, salary) VALUES(77, 'Hergot', 'secretary', 7, 28000);
INSERT INTO Employee(empID, empName, job, deptID, salary) VALUES(66, 'Hess', 'technician', 7, 32000);
INSERT INTO Employee(empID, empName, job, deptID, salary) VALUES(92, 'Mays', 'engineer', 7, 45000);
INSERT INTO Employee(empID, empName, job, deptID, salary) VALUES(68, 'Morris', 'secretary', 3, 23000);
INSERT INTO Employee(empID, empName, job, deptID, salary) VALUES(69, 'Maria', 'engineer', 3, 32000);


-- For the Assigned table, you need ti specify a
-- primary key that includes two columns
DROP TABLE IF EXISTS Project;
CREATE TABLE Project(projID INT,title VARCHAR(100),budget INT,funds INT,
						primary key (projID));

INSERT INTO Project(projID, title, budget, funds) VALUES(345, 'compiler', 500000, 250000);
INSERT INTO Project(projID, title, budget, funds) VALUES(123, 'display', 650000, 370000);


DROP TABLE IF EXISTS Assigned;
CREATE TABLE Assigned(empID INT,projID INT,role VARCHAR(100),


						foreign key (empID)
						references employee (empID)
						on delete cascade,

						foreign key (projID)
						references project (projID)
						on delete cascade);

INSERT INTO Assigned(empID, projID, role) VALUES(23, 345, 'programmer');
INSERT INTO Assigned(empID, projID, role) VALUES(23, 123, 'programmer');
INSERT INTO Assigned(empID, projID, role) VALUES(66, 123, 'programmer');
INSERT INTO Assigned(empID, projID, role) VALUES(77, 123, 'secretary');
INSERT INTO Assigned(empID, projID, role) VALUES(45, 123, 'manager');
INSERT INTO Assigned(empID, projID, role) VALUES(89, 345, 'manager');
INSERT INTO Assigned(empID, projID, role) VALUES(92, 123, 'engineer');



/* Tables created in lab 2 */


DROP TABLE IF EXISTS SupplyData;


CREATE TABLE SupplyData(supplyID INT,
supplyDescription VARCHAR(100),
unitDescription VARCHAR(100),
costPerunit DECIMAL(8,2),
typeID INT,
typeDescription VARCHAR(100) );


INSERT INTO SupplyData VALUES (100,'Big WallCalendar',
'Item', 30.00, 1, 'Office Supplies');

INSERT INTO SupplyData VALUES (101,'Colour Stickers',
'1 Sheet of 10', 5.50, 1, 'Office Supplies');

INSERT INTO SupplyData VALUES (102,'Printer Paper',
'8.5 inches  x 11 inches 500 sheets', 20.50, 1, 'Office Supplies');

INSERT INTO SupplyData VALUES (103,'Laptop computer',
'Item', 1000.00, 1, 'Office Supplies');


INSERT INTO SupplyData VALUES (104,'Vacum',
'Item', 1000.00, 2, 'Cleaning Supplies');

INSERT INTO SupplyData VALUES (105,'Displosable Gloves',
'One pair', 10.00, 2, 'Cleaning Supplies');

INSERT INTO SupplyData VALUES (106,'Trash Cans',
'Item', 20.00, 2, 'Cleaning Supplies');

INSERT INTO SupplyData VALUES (107,'Bleach',
'5.38 L', 2.50, 2, 'Cleaning Supplies');


DROP TABLE IF EXISTS SupplyType;

CREATE TABLE SupplyType(typeID INT,
typeDescription VARCHAR(100),
primary key (typeID)
);
INSERT INTO SupplyType (typeID, typeDescription)
SELECT DISTINCT typeID, typeDescription
FROM SupplyData;

DROP TABLE IF EXISTS Supply;

CREATE TABLE Supply(supplyID INT,
supplyDescription VARCHAR(100),
unitDescription VARCHAR(100),
costPerunit DECIMAL(8,2),
typeID INT,
primary key (supplyID),

foreign key (typeID)
references supplyType(typeID)
on delete cascade
);
INSERT INTO Supply (supplyID, supplyDescription, unitDescription, costPerunit, typeID)
SELECT supplyID, supplyDescription, unitDescription, costPerunit, typeID
FROM SupplyData;

DROP TABLE IF EXISTS ProjectSupply;
CREATE TABLE ProjectSupply(projectID INT, uses INT, item VARCHAR(100), supplyID INT,
							foreign key (supplyID)
							references supply(supplyID)
							on delete cascade,
							primary key(projectID, supplyID)
							);

INSERT INTO ProjectSupply VALUES(123,10,'Laptop Computers', 103);
INSERT INTO ProjectSupply VALUES(345,2,'Vacums', 104);
INSERT INTO ProjectSupply VALUES(345,15,'Colour Stickers', 101);
