SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

USE employees;

DESCRIBE departments;

DESCRIBE dept_emp;

DESCRIBE dept_manager;

DESCRIBE employees;

DESCRIBE salaries;

DESCRIBE titles;

# ===========

USE codeup_test_db;

SELECT * FROM albums;

DESCRIBE albums;

ALTER TABLE albums
    ADD UNIQUE (artist,name);


INSERT INTO albums(artist, name, release_date, genre, sales) VALUES
('Michael Jackson', 'Thriller', '1982', 'POP','46');