/* Lab 2 -part 4 - Creating a view */

USE ece356db_mrmohame;

DROP VIEW IF EXISTS EmpDepView;
CREATE VIEW EmpDepView AS
    SELECT e.empID, e.empName, e.job, d.deptName, d.location
      FROM Employee e
      LEFT JOIN Department d
        ON e.deptID = d.deptID;

-- Display all rows in table
SELECT * FROM EmpDepView;

-- Display rows for marketing department
SELECT * FROM EmpDepView WHERE deptName = 'marketing';

-- Display the employee name, the department and the project description
-- for all projects in which this employee works
SELECT edv.empName, edv.deptName, p.title
  FROM EmpDepView edv
      LEFT JOIN Assigned a
        ON edv.empID = a.empID
      LEFT JOIN Project p
        ON a.projID = p.projID;


/* Add some more rows to the Project table(needed for example below) */

INSERT INTO Project(projID, title, budget, funds) VALUES(645, 'Medical Center Construction', 10000000, 2500000);
INSERT INTO Project(projID, title, budget, funds) VALUES(623, '2013 Conference', 6500, 3000);
INSERT INTO Project(projID, title, budget, funds) VALUES(624, '2014 Conference', 7500, 7500);

DROP VIEW IF EXISTS
    ProjectLowBudget;

CREATE VIEW ProjectLowBudget AS
SELECT projID,title, budget  FROM Project WHERE budget <=500000;


/* Query using this view */
SELECT * FROM ProjectLowBudget WHERE title like "%Conference%";
