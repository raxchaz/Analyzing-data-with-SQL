SELECT 
    employee_name,
    salary,
    CASE
        WHEN salary > 5000 THEN 'High Salary'
        WHEN salary BETWEEN 3000 AND 5000 THEN 'Medium Salary'
        ELSE 'Low Salary'
    END AS salary_category
FROM employees;