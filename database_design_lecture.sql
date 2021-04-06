CREATE DATABASE IF NOT EXISTS design_test_db;

USE design_test_db;

DROP TABLE IF EXISTS quote_topic;
DROP TABLE IF EXISTS quotes;
DROP TABLE IF EXISTS topics;
DROP TABLE IF EXISTS authors;

CREATE TABLE quotes (
id INT UNSIGNED NOT NULL AUTO_INCREMENT,
author_first_name VARCHAR(50) DEFAULT 'NONE',
author_last_name  VARCHAR(100) NOT NULL,
content TEXT NOT NULL,
PRIMARY KEY (id)
);

CREATE TABLE authors (
 id INT UNSIGNED NOT NULL AUTO_INCREMENT,
 first_name VARCHAR(50),
 last_name  VARCHAR(100) NOT NULL,
 PRIMARY KEY (id)
);

ALTER TABLE quotes DROP COLUMN author_first_name;
ALTER TABLE quotes DROP COLUMN author_last_name;
ALTER TABLE quotes ADD COLUMN author_id INT UNSIGNED NOT NULL;
ALTER TABLE quotes ADD FOREIGN KEY (author_id) REFERENCES authors(id) ON DELETE NO ACTION ON UPDATE CASCADE ;

INSERT INTO authors(first_name, last_name) VALUES
('Yasin', 'Mogultay'),
('Carlos', 'Padilla'),
('William', 'Baldridge');

INSERT INTO quotes(author_id, content)
VALUES ((select id from authors where first_name = 'Yasin' and last_name = 'Mogultay'),
        'I love coding.');
INSERT INTO quotes(author_id, content)
VALUES ((select id from authors where first_name = 'Yasin' and last_name = 'Mogultay'),
        'Use your time efficient.');
INSERT INTO quotes(author_id, content)
VALUES ((select id from authors where first_name = 'Carlos' and last_name = 'Padilla'),
        'Studying is important.');
INSERT INTO quotes(author_id, content)
VALUES ((select id from authors where first_name = 'William' and last_name = 'Baldridge'),
        'Learning is never ends.');
INSERT INTO quotes(author_id, content)
VALUES ((select id from authors where first_name = 'Yasin' and last_name = 'Mogultay'),
        'Your learn from your mistakes.');

SELECT a.last_name, a.first_name, content
FROM authors as a
JOIN quotes q on a.id = q.author_id
WHERE last_name = 'Mogultay';


CREATE TABLE topics (
id INT UNSIGNED NOT NULL AUTO_INCREMENT,
name VARCHAR(255),
PRIMARY KEY (id)
);

INSERT INTO topics(name) VALUES
('Coding'),
('Life'),
('Cooking'),
('Sports'),
('Travel');


CREATE TABLE quote_topic (
quote_id INTEGER UNSIGNED NOT NULL,
topic_id INTEGER UNSIGNED NOT NULL,
FOREIGN KEY (quote_id) REFERENCES quotes(id),
FOREIGN KEY (topic_id) REFERENCES topics(id)
);

INSERT INTO quote_topic (quote_id, topic_id) VALUES
(1,1), (2,2), (3,1), (4,2), (5,5),
(2,1), (2,3), (3,4), (4,1), (4,3), (5,2);



SELECT id FROM quotes;
SELECT id FROM authors;
SELECT * FROM topics;
SELECT * FROM quote_topic;