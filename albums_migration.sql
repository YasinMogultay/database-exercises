USE codeup_test_db;

DROP TABLE IF EXISTS albums;

CREATE TABLE IF NOT EXISTS albums (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    artist VARCHAR(50),
    name VARCHAR (20),
    release_date INT,
    sales DECIMAL(10,2),
    genre VARCHAR (200),
    PRIMARY KEY (id)
);