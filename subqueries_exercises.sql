# TODO:Find all the employees with the same hire date as employee 101010 using a subquery. 69 Rows

SELECT * FROM employees
WHERE hire_date IN (
    SELECT hire_date
    FROM employees
    WHERE emp_no = '101010'
    );

# TODO:Find all the titles held by all employees with the first name Aamod.
SELECT title FROM titles
WHERE emp_no IN (
    SELECT emp_no
    FROM employees
    WHERE first_name = 'Aamod'
    GROUP BY title
    );

# TODO:Find all the current department managers that are female.
SELECT first_name, last_name from employees
WHERE emp_no IN (
    select emp_no
    from dept_manager
    WHERE gender = 'f'
    AND to_date > NOW()
    );

# TODO : Find all the department names that currently have female managers.

SELECT dept_name
FROM departments
WHERE dept_no IN (
    select dept_no
    from dept_manager dm
    JOIN  employees as e on dm.emp_no = e.emp_no
    WHERE gender = 'f'
    AND to_date > NOW()
    );

# TODO: Find the first and last name of the employee with the highest salary
SELECT first_name, last_name FROM employees
WHERE emp_no IN (
    SELECT emp_no
    FROM salaries
    where salary = (select max(salary) from salaries)
    AND to_date > NOW()
    );

select * from employees Limit 5;
