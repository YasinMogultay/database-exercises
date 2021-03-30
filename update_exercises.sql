USE codeup_test_db;

SELECT * FROM albums;
UPDATE albums SET sales = sales * 10;

SELECT  release_date AS 'Released before 1980', name AS 'albums relased' FROM albums WHERE release_date < 1980;
UPDATE albums SET release_date = 1800 WHERE release_date < 1980;

SELECT * FROM albums WHERE artist = 'Michael Jackson';