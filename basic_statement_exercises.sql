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
-- 7) grunge, alternative rock

SELECT name
FROM albums
WHERE release_date BETWEEN 1989 AND 1999;
/*
8)
'The Bodyguard'
'Jagged Little Pill'
'Come On Over'
'Falling into You'
'Let\'s Talk About Love'
'Dangerous'
'The Immaculate Collection'
'Titanic: Music from the Motion Picture'
'Metallica'
'Nevermind'
'Supernatural'
*/

SELECT name AS low_selling_albums
FROM albums
WHERE sales < 20;
/*
9) 
'Grease: The Original Soundtrack from the Motion Picture'
'Bad'
'Sgt. Pepper\'s Lonely Hearts Club Band'
'Dirty Dancing'
'Let\'s Talk About Love'
'Dangerous'
'The Immaculate Collection'
'Abbey Road'
'Born in the U.S.A.'
'Brothers in Arms'
'Titanic: Music from the Motion Picture'
'Nevermind'
'The Wall'
*/

DESCRIBE albums;