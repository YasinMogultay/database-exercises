USE codeup_test_db

DROP TABLE IF EXISTS books;

CREATE TABLE books (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    title VARCHAR (10) NOT NULL,
    author VARCHAR (20) NOT NULL DEFAULT 'UNKNOWN',
    date_published TIMESTAMP NOT NULL DEFAULT NOW(),
    description VARCHAR (30) NOT NULL,
    bestseller_weeks INT NOT NULL DEFAULT 0,
    PRIMARY KEY (id)
);