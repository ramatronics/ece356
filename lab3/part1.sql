CREATE INDEX salary_idx on Employee(salary) USING BTREE;
CREATE INDEX dept_idx on Employee(deptID) USING HASH;

SELECT * FROM Employee WHERE salary >= 30000 AND salary <= 40000;

SELECT d.deptid,
    d.deptname,
    d.location,
    e.empid,
    e.empname,
    e.job,
    e.salary
FROM Department d
	LEFT JOIN Employee e
	ON d.deptid = e.deptid;
