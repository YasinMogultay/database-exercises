USE codeup_test_db;

DROP TABLE IF EXISTS albums;

CREATE TABLE albums (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    artist VARCHAR(50),
    name VARCHAR (20),
    release_date INT,
    sales FLOAT(6,2),
    genre VARCHAR (200),
    PRIMARY KEY (id)
);