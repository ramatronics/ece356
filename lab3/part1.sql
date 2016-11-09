CREATE INDEX salary_idx on Employee(salary) using BTREE;
CREATE INDEX dept_idx on Employee(deptID) using HASH;


SELECT * FROM employee
	WHERE salary >= 30000 AND salary <= 40000;

SELECT d.deptid,
    d.deptname,
    d.location,
    e.empid,
    e.empname,
    e.job,
    e.salary
FROM department d
	LEFT JOIN employee e
	ON d.deptid = e.deptid;