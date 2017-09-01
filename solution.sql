DROP DATABASE IF EXISTS project4_rk;

CREATE DATABASE project4_rk;

USE project4_rk;

-- sample record
-- 1,The Nightmare Before Christmas,1993,3.9,4568

CREATE TABLE imdb_data (movie_id int, movie_name string, release_year int, rating int, duration int) ROW FORMAT DELIMITED FIELDS TERMINATED BY ',';

load data local inpath '/home/rajesh.kancharla_outlook/project4/source_data.txt' into table imdb_data;

-- 1) The total number of movies
SELECT '[1] The total number of movies';
SELECT COUNT(*) FROM imdb_data;

-- 2) The maximum rating of movies
SELECT '[2] The maximum rating of movies';
SELECT MAX(rating) FROM imdb_data;

-- 3) The number of movies that have maximum rating
-- SELECT COUNT(*) FROM imdb_data WHERE rating = (SELECT MAX(rating) FROM imdb_data);
-- Subqueries are not supported in Hive. So, we need to use the below:

SELECT '[3] The number of movies that have maximum rating';
SELECT COUNT(*) FROM imdb_data WHERE rating = 4;

-- 4) The movies with ratings 1 and 2
SELECT '[4] The movies with ratings 1 and 2';
SELECT * FROM imdb_data WHERE rating BETWEEN 1 and 2;

-- 5) The list of years and number of movies released each year
SELECT '[5] The list of years and number of movies released each year';
SELECT release_year, COUNT(DISTINCT movie_name) FROM imdb_data GROUP BY release_year;

-- 6) The number of movies that have a runtime of two hours
SELECT '[6] The number of movies that have a runtime of two hours';
SELECT COUNT(*) FROM imdb_data WHERE duration = (2*60*60);

