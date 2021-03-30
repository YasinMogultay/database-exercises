USE bank_db;

DROP TABLE IF EXISTS transactions;

CREATE TABLE transactions (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    data TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    description VARCHAR (20),
    memo VARCHAR (80),
    amount DECIMAL (6,2) NOT NULL,
    transaction_successful BOOL,

);