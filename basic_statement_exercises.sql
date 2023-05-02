USE albums_db;
SHOW TABLES;
SELECT *
FROM albums;
-- 2) primary key = 'id' column
-- 3) name column = name of each album
-- 4) sales column = number of sales in millions

SELECT *
FROM albums
WHERE artist = 'Pink Floyd';
-- 5) 'The Dark Side of the Moon' and 'The Wall'

SELECT name, release_date
FROM albums
WHERE name LIKE "Sgt. Pepper's%";
-- 6) released in 1967

SELECT name, genre
FROM albums
WHERE name = "Nevermind";
-- 8) grunge, alternative rock

SELECT name AS low_selling_albums, sales
FROM albums
WHERE sales < 20;
-- 9) see output for low_selling_album list