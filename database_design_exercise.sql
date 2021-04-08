# TODO: For a given ad, what is the email address of the user that created it?

SELECT user_email
FROM users u
         JOIN ads a ON u.id = a.id
WHERE title = 'some title';

# TODO: For a given ad, what category, or categories, does it belong to?

SELECT name
FROM ads a
         JOIN ads_categories ac ON a.id = ac.ads_id
         JOIN categories c on ac.category_id = c.id
WHERE title = 'ad category';

# TODO: For a given category, show all the ads that are in that category.

SELECT *
FROM ads a
         JOIN ads_categories ac ON a.id = ac.ads_id
         JOIN categories c on ac.category_id = c.id
WHERE name = 'ad category';

# TODO: For a given user, show all the ads they have posted.

SELECT *
FROM ads a
         JOIN users u on u.id = a.user_id
WHERE user_email IN (
    SELECT *
    FROM ads
    WHERE user_email = 'user mail'
);

CREATE DATABASE IF NOT EXISTS adlister_app;

USE adlister_app;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS ads;
DROP TABLE IF EXISTS ads_categories;
DROP TABLE IF EXISTS categories;

CREATE TABLE users
(
    id            INT UNSIGNED NOT NULL AUTO_INCREMENT,
    user_email    VARCHAR(50)  NOT NULL,
    user_password VARCHAR(50)  NOT NULL,
    primary key (id)
);

CREATE TABLE ads
(
    id          INT UNSIGNED NOT NULL AUTO_INCREMENT,
    title       VARCHAR(50)  NOT NULL,
    description VARCHAR(50)  NOT NULL,
    PRIMARY KEY (id),
    user_id     INT UNSIGNED NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users (id)
);

CREATE TABLE categories
(
    id   INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(50),
    PRIMARY KEY (id)
);

CREATE TABLE ads_categories
(
    ads_id      INTEGER UNSIGNED NOT NULL,
    category_id INTEGER UNSIGNED NOT NULL,
    FOREIGN KEY (ads_id) REFERENCES ads (id),
    FOREIGN KEY (category_id) REFERENCES categories (id)
);




