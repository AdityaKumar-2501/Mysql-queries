desc employee;

-- 1. Query to display Employee Name, Job, Hire Date, Employee Number; for each employee with the Employee Number appearing first.
SELECT Eno , Ename, Job_type , Hire_date FROM employee;

-- 2. Query to display unique Jobs from the Employee Table.
SELECT DISTINCT Job_type FROM employee;

-- 3. Query to display the Employee Name concatenated by a Job separated by a comma.
Select CONCAT(Ename, "," ,Job_type) AS Profile FROM employee; 

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
order by Ename ASC

-- 9. Query to display Name and Hire Date of every Employee who was hired in 1981.
-- 10. Query to display Name and Job of all employees who have not assigned a supervisor.
-- 11. Query to display the Name, Salary and Commission for all the employees who earn commission.
-- 12. Sort the data in descending order of Salary and Commission.
-- 13. Query to display Name of all the employees where the third letter of their name is ‘A’.
-- 14. Query to display Name of all employees either have two ‘R’s or have two ‘A’s in their name and are either in Dept No = 30 or their Manger’s Employee No = 7788.
-- 15. Query to display Name, Salary and Commission for all employees whose Commission amount is greater than their Salary increased by 5%.
-- 16. Query to display the Current Date along with the day name.
-- 17. Query to display Name, Hire Date and Salary Review Date which is the 1st Monday after six months of employment.
-- 18. Query to display Name and calculate the number of months between today and the date on which employee was hired of department ‘Purchase’.
-- 19. Query to display the following for each employee <E-Name> earns < Salary> monthly but wants < 3 * Current Salary >. Label the Column as Dream Salary.
-- 20. Query to display Name with the 1st letter capitalized and all other letter lower case and length of their name of all the employees whose name starts with ‘J’, ’A’ and ‘M’.
-- 21. Query to display Name, Hire Date and Day of the week on which the employee started.
-- 22. Query to display Name, Department Name and Department No for all the employees.
-- 23. Query to display Unique Listing of all Jobs that are in Department number 30.
-- 24. Query to display Name, Dept Name of all employees who have an ‘A’ in their name.
-- 25. Query to display Name, Job, Department No. And Department Name for all the employees working at the Dallas location.
-- 26. Query to display Name and Employee no. Along with their supervisor’s Name and the supervisor’s employee no; along with the Employees’ Name who do not have a supervisor.
-- 27. Query to display Name, Dept No. And Salary of any employee whose department No. and salary matches both the department no. And the salary of any employee who earns a commission.
-- 28. Query to display Name and Salaries represented by asterisks, where each asterisk (*) signifies $100.
-- 29. Query to display the Highest, Lowest, Sum and Average Salaries of all the employees
-- 30. Query to display the number of employees performing the same Job type functions.
-- 31. Query to display the total number of supervisors without listing their names.
-- 32. Query to display the Department Name, Location Name, No. of Employees and the average salary for all employees in that department.
-- 33. Query to display Name and Hire Date for all employees in the same dept. as Blake.
-- 34. Query to display the Employee No. And Name for all employees who earn more than the average salary.
-- 35. Query to display Employee Number and Name for all employees who work in a department with any employee whose name contains a ‘T’.
-- 36. Query to display the names and salaries of all employees who report to supervisor named ‘King’
-- 37. Query to display the department no, name and job for all employees in the Sales department
-- 38. Display names of employees along with their department name who have more than 20 years experience
-- 39. Display total number of departments at each location
-- 40. Find the department name in which at least 20 employees work in.
-- 41. Query to find the employee’ name who is not supervisor and name of supervisor supervising more than 5 employees.
-- 42. Query to display the job type with maximum and minimum employees