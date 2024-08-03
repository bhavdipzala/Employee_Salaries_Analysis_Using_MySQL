-- Salary Analysis of Employees in San Francisco City Using MySQL --


CREATE DATABASE SF_Salaries;

USE SF_Salaries;

-- *Import Dataset Via Table Data Import Wizard by Creating a new Table 'SF_Salaries.Salaries'.

-- Show salary data table.
SELECT * FROM Salaries;


-- query 1. Show the number of employees in the table.
SELECT COUNT(id) AS 'Num Of Emp'
FROM Salaries;
    
-- q2. Show the unique job titles in the table.
SELECT DISTINCT Jobtitle AS 'Unique Job Titles'
FROM Salaries;
    
-- q3. Show the job title and overtime pay for all the employees with overtime pay greater than 50,000.
SELECT Jobtitle, Overtimepay
FROM Salaries
WHERE Overtimepay > 50000;
    
-- q4. Show the average base pay, average overtime pay, average other pay and average total pay of all the employees.
SELECT 
ROUND(AVG(Basepay), 2) AS 'Avg Base Pay',
ROUND(AVG(Overtimepay), 2) AS 'Avg Overtime Pay',
ROUND(AVG(Otherpay), 2) AS 'Avg Other Pay',
ROUND(AVG(Totalpay), 2) AS 'Avg Total Pay'
FROM Salaries;
    
-- q5. Show the top 10 highest-paid employees based on total pay.
SELECT Employeename AS 'Top 10 Highest Paid Emps', Totalpay
FROM Salaries
ORDER BY Totalpay DESC
LIMIT 10;
    
-- q6. Show the total pay for each employee and highlight the percentage difference from the average total pay.

SELECT Employeename, Totalpay, Avgtotalpay, ROUND(((Totalpay - Avgtotalpay) / Avgtotalpay) * 100, 2) AS '% Diff'
FROM
(SELECT Employeename, Totalpay, ROUND((SELECT AVG(Totalpay) FROM Salaries), 2) AS Avgtotalpay
FROM Salaries)
AS Subquery;

-- OR, Another Simpler Solution,
SELECT Employeename, Totalpay, ROUND((SELECT AVG(Totalpay) FROM Salaries), 2) AS 'Avg Total Pay',
ROUND(((Totalpay - (SELECT AVG(Totalpay) FROM Salaries)) / (SELECT AVG(Totalpay) FROM Salaries)) * 100, 2) AS '% Diff'
FROM Salaries;


-- q7. Show the names and job titles of all employees who have the word 'Manager' in their job title.
SELECT Employeename, Jobtitle
FROM Salaries
WHERE Jobtitle LIKE '%Manager%';

-- q8. Show the names and job titles of all employees who do not have the word 'Manager' in their job titles.
SELECT Employeename, Jobtitle
FROM Salaries
WHERE Jobtitle NOT LIKE '%Manager%';

-- q9. Show the names and job titles of all employees except those with the job title 'DEPARTMENT HEAD V'.
SELECT Employeename, Jobtitle
FROM Salaries
WHERE Jobtitle <> 'DEPARTMENT HEAD V';

-- q10. Count the number of employees with a total pay between 50,000 and 75,000.
SELECT COUNT(Id) FROM Salaries
WHERE Totalpay >= 50000 AND Totalpay <= 75000;
-- OR
SELECT COUNT(Id) FROM Salaries
WHERE TotalPay Between 50000 AND 75000;

-- q11. Show the data of all employees who have a base pay of less than 50,000 or a total pay of greater than 100,000.
SELECT * FROM Salaries
WHERE Basepay < 50000 OR Totalpay > 100000;

-- q12. Show the data of all Managers (job title containing the word 'Manager') with a total pay benefits value between 125,000 and 150,000.
SELECT * FROM Salaries
WHERE Jobtitle LIKE '%Manager%' AND Totalpaybenefits BETWEEN 125000 AND 150000;

-- q13. Show the names of the top 3 highest-paid managers (based on total pay), including their job titles and total pay amounts.
SELECT Employeename AS 'Top 3 Higherst paid Managers', Jobtitle, Totalpay
FROM Salaries
WHERE Jobtitle LIKE '%Manager%'
ORDER BY Totalpay DESC
LIMIT 3;

-- q14. Show all job titles with an average base pay of at least 100,000 and order them by the average base pay in descending order.
SELECT Jobtitle, ROUND(AVG(Basepay), 2) AS 'Avg Base Pay' FROM Salaries
GROUP BY Jobtitle
HAVING AVG(Basepay) >= 100000
ORDER BY AVG(Basepay) DESC;

-- q15. Delete the columns named 'Notes' and 'Status'.
ALTER TABLE Salaries
DROP COLUMN Notes,
DROP COLUMN Status;

-- q16. Update the base pay of all Managers with the job title containing 'Manager' by increasing it by 10%.
UPDATE Salaries
SET Basepay = Basepay * 1.1
WHERE Jobtitle LIKE '%Manager%';
-- *If SAFE MODE is ENABLED, use this query first to DISABLE SAFE MODE.
SET SQL_SAFE_UPDATES = 0;

-- q17. i.  Count the number of employees who have zero overtime pay.
            SELECT COUNT(Id) FROM Salaries
            WHERE Overtimepay = 0;
--      ii. Delete the data of all employees who have zero Overtime Pay.
		    DELETE FROM Salaries
            WHERE Overtimepay = 0;
            
            
-- END --