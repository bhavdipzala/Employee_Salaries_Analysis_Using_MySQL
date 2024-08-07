# Salary Analysis of Employees in San Francisco City Using MySQL

### Overview and Objective
The project involves writing an SQL script to perform various SQL queries using MySQL to analyze and gain insights from a dataset containing around 149,000 employees' salaries data in San Francisco City. The dataset was obtained from the Kaggle: [SF_Salaries](https://www.kaggle.com/datasets/kaggle/sf-salaries) site and can be accessed from the [Dataset.csv](Dataset.csv) file.
The analysis addresses a range of problem statements outlined [below](#Problem-Statements-and-Queries-Addressed), aimed at understanding employee compensation, its distribution, and various job titles.


### Dataset Description
The dataset includes the following columns:
- `Id:` Unique identifier for each employee
- `EmployeeName`
- `JobTitle`
- `BasePay:` Base Salary
- `OvertimePay`
- `OtherPay:` Other forms of compensation
- `Benefits:` Employee benefits
- `TotalPay:` Total compensation (BasePay + OvertimePay + OtherPay)
- `TotalPayBenefits:` Total compensation including benefits
- `Year:` Year of salary data


### Problem Statements and Queries Addressed
1.	Show the number of employees in the table.
2.	Show the unique job titles in the table.
3.	Show the job title and overtime pay for all the employees with overtime pay greater than 50,000.
4.	Show the average base pay, average overtime pay, average other pay and average total pay of all the employees.
5.	Show the top 10 highest-paid employees based on total pay.
6.	Show the total pay for each employee and highlight the percentage difference from the average total pay.
7.	Show the names and job titles of all employees who have the word 'Manager' in their job title.
8.	Show the names and job titles of all employees who do not have the word 'Manager' in their job titles.
9.	Show the names and job titles of all employees except those with the job title 'DEPARTMENT HEAD V'.
10.	Count the number of employees with a total pay between 50,000 and 75,000.
11.	Show the data of all employees who have a base pay of less than 50,000 or a total pay of greater than 100,000.
12.	Show the data of all Managers (job title containing the word 'Manager') with a total pay benefits value between 125,000 and 150,000.
13.	Show the names of the top 3 highest-paid managers (based on total pay), including their job titles and total pay amounts.
14.	Show all job titles with an average base pay of at least 100,000 and order them by the average base pay in descending order.
15.	Delete the columns named 'Notes' and 'Status'.
16.	Update the base pay of all Managers with the job title containing 'Manager' by increasing it by 10%.
17.	i.  Count the number of employees who have zero overtime pay.
    ii. Delete the data of all employees who have zero Overtime Pay.
