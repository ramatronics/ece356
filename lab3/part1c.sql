EXPLAIN SELECT * FROM Employee
			WHERE salary >= 30000 AND salary <= 40000;

EXPLAIN SELECT d.deptid,
		    d.deptname,
		    d.location,
		    e.empid,
		    e.empname,
		    e.job,
		    e.salary
		FROM Department d
			LEFT JOIN Employee e
			ON d.deptid = e.deptid;
