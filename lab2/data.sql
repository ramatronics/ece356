INSERT INTO Department(deptID, deptName, location) VALUES(3, 'marketing', 'Waterloo');
INSERT INTO Department(deptID, deptName, location) VALUES(7, 'research', 'Guelph');
INSERT INTO Department(deptID, deptName, location) VALUES(12, 'software', 'Toronto');
INSERT INTO Department(deptID, deptName, location) VALUES(13, 'computing', 'Toronto');



INSERT INTO Employee(empName, job, deptID, salary) VALUES('Smith', 'programmer', 12, 35000);
INSERT INTO Employee(empName, job, deptID, salary) VALUES('Kelly', 'engineer', 7, 37000);
INSERT INTO Employee(empName, job, deptID, salary) VALUES('Herr', 'janitor', 7, 26000);
INSERT INTO Employee(empName, job, deptID, salary) VALUES('Williams', 'analyst', 12, 36000);
INSERT INTO Employee(empName, job, deptID, salary) VALUES('Hergot', 'secretary', 7, 28000);
INSERT INTO Employee(empName, job, deptID, salary) VALUES('Hess', 'technician', 7, 32000);
INSERT INTO Employee(empName, job, deptID, salary) VALUES('Mays', 'engineer', 7, 45000);
INSERT INTO Employee(empName, job, deptID, salary) VALUES('Morris', 'secretary', 3, 23000);
INSERT INTO Employee(empName, job, deptID, salary) VALUES('Maria', 'engineer', 3, 32000);



INSERT INTO Project(projID, title, budget, funds) VALUES(345, 'compiler', 500000, 250000);
INSERT INTO Project(projID, title, budget, funds) VALUES(123, 'display', 650000, 370000);


INSERT INTO Assigned(empID, projID, role) VALUES(1, 345, 'programmer');
INSERT INTO Assigned(empID, projID, role) VALUES(1, 123, 'programmer');
INSERT INTO Assigned(empID, projID, role) VALUES(6, 123, 'programmer');
INSERT INTO Assigned(empID, projID, role) VALUES(5, 123, 'secretary');
INSERT INTO Assigned(empID, projID, role) VALUES(2, 123, 'manager');
INSERT INTO Assigned(empID, projID, role) VALUES(4, 345, 'manager');
INSERT INTO Assigned(empID, projID, role) VALUES(7, 123, 'engineer');
