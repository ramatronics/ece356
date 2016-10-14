
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


DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Department;
CREATE TABLE Department(deptID INT PRIMARY KEY,deptName VARCHAR(100),location VARCHAR(100));
ALTER TABLE Department ADD PRIMARY KEY(deptID);

DROP TABLE IF EXISTS Employee;
CREATE TABLE Employee(empID INT PRIMARY KEY,empName VARCHAR(100),job VARCHAR(100),deptID INT,salary INT);
ALTER TABLE Employee ADD FOREIGN KEY(deptID) REFERENCES Department(deptID);

DROP TABLE IF EXISTS Project;
CREATE TABLE Project(projID INT PRIMARY KEY, title VARCHAR(100),budget INT,funds INT);

-- For the Assigned table, you need ti specify a
-- primary key that includes two columns
DROP TABLE IF EXISTS Assigned;
CREATE TABLE Assigned(empID INT,projID INT,role VARCHAR(100));
ALTER TABLE Assigned ADD PRIMARY KEY (empID, projID);


/* Tables created in lab 2 */





DROP TABLE IF EXISTS SupplyType;

CREATE TABLE SupplyType(typeID INT AUTO_INCREMENT,
typeDescription VARCHAR(100),
PRIMARY KEY (typeID));

DROP TABLE IF EXISTS Supply;

CREATE TABLE Supply(supplyID INT,
supplyDescription VARCHAR(100),
unitDescription VARCHAR(100),
costPerunit DECIMAL(8,2),
typeID INT
);

INSERT INTO SupplyType (typeDescription) VALUES ("testing");
INSERT INTO SupplyType (typeDescription) VALUES ("testing");
INSERT INTO SupplyType (typeDescription) VALUES ("testing");
INSERT INTO SupplyType (typeDescription) VALUES ("testing");
INSERT INTO SupplyType (typeDescription) VALUES ("testing");
INSERT INTO SupplyType (typeDescription) VALUES ("testing");




/* Add here statements to create your ProjectSupply table ( from your solution to part 1), adding primary key and foreign key constrains. */


CREATE TABLE ProjectSupply(projectID INT,
supplyID INT, supplyCount Int);
Alter Table ProjectSupply Add Primary Key (projectID, supplyID);
Alter Table ProjectSupply Add Foreign Key (supplyID) references Supply(supplyID);
Alter Table ProjectSupply Add Foreign Key (projectID) references Project(projID);

/* Reinsert data into all tables

You can use the INSERT statements provided in createTables.sql, and in  your solution for part1 (in your modified part1.sql)




*/
