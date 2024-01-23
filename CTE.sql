## CTE
WITH cte AS(
SELECT avg(salary) AS avg_salary from salaries)
SELECT
	*
from
	salaries s
		Join
    employees e On s.emp_no = s.emp_no And e.gender = 'F'
		cross Join
	cte c;
    
