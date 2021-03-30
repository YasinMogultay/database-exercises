USE codeup_test_db

DROP TABLE IF EXISTS pizzas;

CREATE TABLE pizzas (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(20),
    phone_number VARCHAR(10),
    address VARCHAR(30),
    pizza_size VARCHAR (10),
    total_cost DECIMAL(6,2),
    description VARCHAR (20),
    delivered BOOL NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW(),
    PRIMARY KEY (id)
);