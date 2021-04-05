create database join_test_db;

show databases;

CREATE TABLE roles (
id INT UNSIGNED NOT NULL AUTO_INCREMENT,
name VARCHAR(100) NOT NULL,
PRIMARY KEY (id)
);

CREATE TABLE users (
id INT UNSIGNED NOT NULL AUTO_INCREMENT,
name VARCHAR(100) NOT NULL,
email VARCHAR(100) NOT NULL,
role_id INT UNSIGNED DEFAULT NULL,
PRIMARY KEY (id),
FOREIGN KEY (role_id) REFERENCES roles (id)
);

INSERT INTO roles (name) VALUES ('admin');
INSERT INTO roles (name) VALUES ('author');
INSERT INTO roles (name) VALUES ('reviewer');
INSERT INTO roles (name) VALUES ('commenter');

INSERT INTO users (name, email, role_id) VALUES
('bob', 'bob@example.com', 1),
('joe', 'joe@example.com', 2),
('sally', 'sally@example.com', 3),
('adam', 'adam@example.com', 3),
('jane', 'jane@example.com', null),
('mike', 'mike@example.com', null);

select * from roles;
select * from users;

# inserted 4 new users to users table

INSERT INTO users(name,email,role_id) VALUES
('Sam','sam@example.com', 2),
('Michael','michael@example.com',2),
('Casey','casey@example.com', null),
('Justin','Justin@example.com', null);

# JOIN example
SELECT r.name,  u.name, u.email FROM roles AS r
JOIN users  AS u ON r.id = u.role_id;

# RIGHT JOIN example
SELECT r.name, u.name, u.email FROM roles AS r
RIGHT JOIN users AS u ON r.id = u.role_id;

# LEFT JOIN example
SELECT r.name, COUNT(*) FROM roles AS r
LEFT JOIN users AS u ON r.id = u.role_id;

# counting the number of users (u.role_id) for each role
SELECT r.name, COUNT(u.role_id) as Users FROM users as u
RIGHT JOIN roles as r ON u.role_id = r.id
GROUP BY r.id;

# === SECOND PART ===
SELECT COUNT (DISTINCT dept_name) FROM departments;

# each department along with the name of the current manager for that department.
SELECT departments.dept_name as Department_Name, concat(employees.first_name, ' ', employees.last_name) as Department_Manager
FROM employees
JOIN dept_manager on employees.emp_no = dept_manager.emp_no
JOIN departments on dept_manager.dept_no = departments.dept_no WHERE dept_manager.to_date > NOW() group by dept_name order by dept_name;

# Find the name of all departments currently managed by women.
SELECT departments.dept_name as Department_Name, concat(employees.first_name, ' ', employees.last_name) as Department_Manager
FROM employees
JOIN dept_manager on employees.emp_no = dept_manager.emp_no
JOIN departments on dept_manager.dept_no = departments.dept_no WHERE dept_manager.to_date > NOW() AND gender = 'f' group by dept_name order by dept_name;

# Find the current titles of employees currently working in the Customer Service department.
SELECT titles.title as TITLE, COUNT(de.dept_name)  as TOTAL
FROM titles
JOIN dept_emp as e on titles.emp_no = e.emp_no
JOIN departments as de on e.dept_no = de.dept_no
WHERE de.dept_no = 'd009' AND e.to_date > NOW() AND titles.to_date > NOW() group by titles.title;



# Find the current salary of all current managers.
SELECT d.dept_name as Department_Name, concat(e.first_name, ' ', e.last_name) as Department_Manager, salaries.salary as Salary
FROM salaries
JOIN dept_manager dm on salaries.emp_no = dm.emp_no
JOIN employees e on dm.emp_no = e.emp_no
JOIN departments d on dm.dept_no = d.dept_no WHERE dm.to_date > NOW() AND salaries.to_date > NOW() order by dept_name;

# Find the names of all current employees, their department name, and their current manager's name .
SELECT concat(e.first_name, ' ', e.last_name) as Department_Manager,
