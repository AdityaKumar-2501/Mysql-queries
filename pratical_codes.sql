desc employee;
desc department;
use employees;

SELECT * FROM employee;
SELECT * FROM department;

-- 1. Query to display Employee Name, Job, Hire Date, Employee Number; for each employee with the Employee Number appearing first.
SELECT Eno , Ename, Job_type , Hire_date FROM employee;

-- 2. Query to display unique Jobs from the Employee Table.
SELECT DISTINCT Job_type FROM employee;

-- 3. Query to display the Employee Name concatenated by a Job separated by a comma.
Select CONCAT(Ename, " , " ,Job_type) AS Profile FROM employee; 

-- 4. Query to display all the data from the Employee Table. Separate each Column by a comma and name the said column as THE_OUTPUT.
SELECT CONCAT(Eno, ',', Ename , ',' , Job_type , ',' , SupervisorEno , ',' , Hire_date, ',' , Dno, ',' , Commission ,',', Salary) AS THE_OUTPUT FROM employee;

-- 5. Query to display the Employee Name and Salary of all the employees earning more than $2850.
SELECT Ename , Salary FROM employee
where Salary > 2850;

-- 6. Query to display Employee Name and Department Number for the Employee No= 79.
SELECT Ename , Dno FROM employee
WHERE Eno = 79;

-- 7. Query to display Employee Name and Salary for all employees whose salary is not in the range of $1500 and $2850.
SELECT Ename , Salary FROM employee
WHERE Salary NOT  BETWEEN 1500 AND 2850;

-- 8. Query to display Employee Name and Department No. of all the employees in Dept 10 and Dept 30 in the alphabetical order by name.
SELECT Ename , Dno FROM employee
Where Dno = 10 OR DNo = 30
order by Ename ASC;

-- 9. Query to display Name and Hire Date of every Employee who was hired in 1981.
SELECT Ename , Hire_date from employee
WHERE Hire_date LIKE '1981%';

-- 10. Query to display Name and Job of all employees who have not assigned a supervisor.
SELECT Ename , Job_type FROM employee
WHERE SupervisorEno IS NULL;

-- 11. Query to display the Name, Salary and Commission for all the employees who earn commission.
SELECT Ename, Salary , Commission FROM employee
WHERE Commission IS NOT NULL;

-- 12. Sort the data in descending order of Salary and Commission.
SELECT * FROM employee
order by Salary, Commission DESC;

-- 13. Query to display Name of all the employees where the third letter of their name is ‘A’.
SELECT Ename FROM employee
WHERE Ename Like '__A%';

-- 14. Query to display Name of all employees either have two ‘R’s or have two ‘A’s in their name and are either in Dept No = 30 or their Manger’s Employee No = 7788.
SELECT Ename FROM employee
WHERE (Ename like '%R%R%' OR Ename LIKE '%A%A%') AND (Dno = 30 OR SupervisorEno = 7788);

-- 15. Query to display Name, Salary and Commission for all employees whose Commission amount is greater than their Salary increased by 5%.
SELECT Ename, Salary , Commission FROM employee
WHERE Commission > (Salary + Salary*0.05);

-- 16. Query to display the Current Date along with the day name.
SELECT CURDATE() AS DATE , DAYNAME(CURDATE()) AS DAY;

-- 17. Query to display Name, Hire Date and Salary Review Date which is the 1st Monday after six months of employment.
SELECT y.Emp_name as "Name", y.Hiring_date,
	case
		when dayname(y.new_date) = "Tuesday" then adddate(y.new_date,interval 6 day)
        when dayname(y.new_date) = "Wednesday" then adddate(y.new_date,interval 5 day)
        when dayname(y.new_date) = "Thursday" then adddate(y.new_date,interval 4 day)
        when dayname(y.new_date) = "Friday" then adddate(y.new_date,interval 3 day)
        when dayname(y.new_date) = "Saturday" then adddate(y.new_date,interval 2 day)
        when dayname(y.new_date) = "Sunday" then adddate(y.new_date,interval 1 day)
        else y.new_date
	end as Salary_review_date
    
    from (
		SELECT x.Ename as "Emp_name",
			x.Hire_date as "Hiring_date",
            adddate(Hire_date, interval 6 month) new_date
            from(
				SELECT Ename, Hire_date
                From employee
                ) x
    ) y;

-- 18. Query to display Name and calculate the number of months between today and the date on which employee was hired of department ‘Purchase’.
SELECT Ename, timestampdiff(month,Hire_date,sysdate()) "Months"
FROM employee, department
WHERE employee.Dno = department.Dno AND Dname= "Purchase";

-- 19. Query to display the following for each employee <E-Name> earns < Salary> monthly but wants < 3 * Current Salary >. Label the Column as Dream Salary.
SELECT Ename, Salary , 3*Salary as "Dream Salary" from employee;

-- 20. Query to display Name with the 1st letter capitalized and all other letter lower case and length of their name of all the employees whose name starts with ‘J’, ’A’ and ‘M’.
SELECT concat(SUBSTR(Ename,1,1), LOWER(SUBSTR(Ename,2,Length(Ename)))) as 'Employee Name', length(Ename)
FROM employee
WHERE Ename LIKE "J%" OR Ename LIKE "A%" OR Ename LIKE "M%";

-- 21. Query to display Name, Hire Date and Day of the week on which the employee started.
SELECT Ename, Hire_date, dayname(Hire_date) Day
FROM employee;

-- 22. Query to display Name, Department Name and Department No for all the employees.
SELECT employee.Ename, department.Dname, department.Dno
FROM employee
left Join department on employee.Dno = department.Dno; 

-- 23. Query to display Unique Listing of all Jobs that are in Department number 30.
SELECT distinct Job_type
FROM employee
Where Dno = 30;

-- 24. Query to display Name, Dept Name of all employees who have an ‘A’ in their name.
SELECT Ename, department.Dname
FROM employee
left JOIN department on employee.Dno = department.Dno
WHERE Ename LIKE "%A%";

-- 25. Query to display Name, Job, Department No. And Department Name for all the employees working at the Dallas location.
SELECT Ename, Job_type, department.Dno, department.Dname
From employee
LEFT JOIN department on employee.Dno = department.Dno
WHERE department.Location = "Dallas";

-- 26. Query to display Name and Employee no. Along with their supervisor’s Name and the supervisor’s employee no; along with the Employees’ Name who do not have a supervisor.
SELECT E.Ename, E.Eno, E.SupervisorEno , S.Ename
FROM employee E
Left Join employee S on E.SupervisorEno = S.Eno;

-- 27. Query to display Name, Dept No. And Salary of any employee whose department No. and salary matches both the department no. And the salary of any employee who earns a commission.
SELECT 
    Ename, Dno, Salary
FROM
    EMPLOYEE
WHERE
    (Dno , Salary) IN (SELECT 
            Dno, Salary
        FROM
            EMPLOYEE
        WHERE
            Commission > 0);

-- 28. Query to display Name and Salaries represented by asterisks, where each asterisk (*) signifies $100.
SELECT Ename, lpad("",Salary/100,"*") Salaries FROM employee;

-- 29. Query to display the Highest, Lowest, Sum and Average Salaries of all the employees
SELECT max(Salary) Highest, min(Salary) Lowest, sum(Salary) Sum, avg(Salary) Average FROM employee;

-- 30. Query to display the number of employees performing the same Job type functions.
SELECT count(Eno)
FROM employee
group by Job_type;

-- 31. Query to display the total number of supervisors without listing their names.
SELECT COUNT(distinct SupervisorEno)
From employee;

-- 32. Query to display the Department Name, Location Name, No. of Employees and the average salary for all employees in that department.
SELECT Dname, Location, count(Eno), avg(Salary)
From employee
left join department on employee.Dno = department.Dno
group by Dname;

-- 33. Query to display Name and Hire Date for all employees in the same dept. as Blake.
SELECT Ename, Hire_date
From employee
Where Dno = (SELECT Dno FROM employee WHERE Ename = "Blake");

-- 34. Query to display the Employee No. And Name for all employees who earn more than the average salary.
SELECT Eno, Ename
From employee
WHERE Salary > (SELECT avg(Salary) from employee);

-- 35. Query to display Employee Number and Name for all employees who work in a department with any employee whose name contains a ‘T’.
SELECT Eno, Ename From employee
WHERE Dno in (SELECT Dno FROM employee WHERE Ename LIKE "%T%");

-- 36. Query to display the names and salaries of all employees who report to supervisor named ‘King’
SELECT Ename, Salary
FROM employee
WHERE SupervisorEno = (SELECT Eno from employee Where Ename = "King");

-- 37. Query to display the department no, name and job for all employees in the Sales department
SELECT employee.Dno, Ename, Job_type
FROM employee
lEFT JOIN department on employee.Dno = department.Dno
WHERE Dname = "Sales";

-- 38. Display names of employees along with their department name who have more than 20 years experience
SELECT Ename, department.Dname
FROM employee, department
WHERE timestampdiff(year,Hire_date,sysdate()) > 20 AND employee.Dno = department.Dno;

-- 39. Display total number of departments at each location
SELECT Location, COUNT(distinct Dname) 'No of departments' from department
group by Location;

-- 40. Find the department name in which at least 20 employees work in.
SELECT c.Dno as Dno, department.Dname, c.Count 
FROM (
		SELECT COUNT(employee.Dno) as Count,
        employee.Dno as Dno
        FROM employee
        GROUP by employee.Dno
	) c
LEFT JOIN department on c.Dno = department.Dno
WHERE c.Count >= 20;


-- 41. Query to find the employee’ name who is not supervisor and name of supervisor supervising more than 5 employees.
SELECT 
    ENAME AS 'Employee Name'
FROM
    employee
WHERE
    Eno NOT IN (SELECT 
            SupervisorEno
        FROM
            employee
        WHERE
            SupervisorEno IS NOT NULL) 
UNION 
select ENAME from employee where Eno in  (SELECT 
    customTable.SupervisorEno
FROM
    (SELECT 
        SupervisorEno, COUNT(Eno) AS 'NoOfEmployee'
    FROM
        employee
    WHERE
        SupervisorEno IS NOT NULL
    GROUP BY (SupervisorEno)) customTable
WHERE
    customTable.NoOfEmployee > 5);

-- 42. Query to display the job type with maximum and minimum employees

SELECT 
    x.Job_Type, MIN(x.EmpMin) 'No. Of Employee' 
FROM
    (
    SELECT 
        Job_Type, COUNT(ENo) AS 'EmpMin'
    FROM
        employee
    GROUP BY (Job_type) ORDER BY EmpMin ASC
    ) x 
UNION
SELECT 
    y.Job_Type , MAX(y.EmpMax)
FROM
    (
    SELECT 
        Job_Type, COUNT(ENo) AS 'EmpMax'
    FROM
        employee
    GROUP BY (Job_type) ORDER BY EmpMax DESC
    ) y;
    