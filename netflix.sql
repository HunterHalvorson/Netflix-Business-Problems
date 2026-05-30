-- Netflix Project

DROP TABLE IF EXISTS netflix;
CREATE TABLE netflix
(
	show_id VARCHAR(6),
	type VARCHAR(10),
	title VARCHAR(150),
	director VARCHAR(208),
	casts VARCHAR(1000),
	country VARCHAR(150),
	date_added VARCHAR(50),
	release_year INT,
	rating VARCHAR(10),
	duration VARCHAR(15),
	listed_in VARCHAR(100),
	description VARCHAR(250)
);

SELECT * FROM netflix;


-- Analysis

-- Count Of Rows
SELECT 
	COUNT(*) as total_content
FROM 
	netflix;


-- Types of media (i.e Movie & TV Show)
SELECT
	DISTINCT type
FROM 
	netflix;

-- 15 Business Problems

-- 1. Count the number of Movies Vs TV Shows
SELECT
	type, 
	COUNT(*) as count
FROM 
	netflix
GROUP BY 
	type;

-- 2. Find the most common rating for movies and TV Shows
SELECT 
	type,
	rating
FROM 
	(
	SELECT 
		type,
		rating,
		COUNT(*),
		RANK() OVER(PARTITION BY type ORDER BY COUNT(*) DESC) as ranking
	FROM 
		netflix
	GROUP BY
		1, 2
	ORDER BY 
		1, 3 DESC
	) as t1 
WHERE 
	t1.ranking = 1;

-- 3. List all movies released in a specific year
SELECT 
	*
FROM
	netflix
WHERE
	type = 'Movie' AND release_year = 2020;


-- 4. Find the top 5 countries with the most content on netflix
SELECT
	UNNEST(STRING_TO_ARRAY(country, ',')) as new_country,
	COUNT(show_id) as total_content
FROM 
	netflix
GROUP BY 1
ORDER BY 
	2 DESC
LIMIT 
	5;

-- 5. Identify the longest movie
SELECT MAX(duration) 
FROM netflix
WHERE type = 'Movie';

-- 6. Find the content add in the last 5 years
SELECT *
FROM netflix
WHERE 
	TO_DATE(date_added, 'Month DD, YYYY') >= CURRENT_DATE - INTERVAL '5 years'; 

-- 7. Find all the movies/ TV shows by director 'Rajiv Chilaka'
SELECT *
FROM netflix
WHERE director ILIKE '%Rajiv Chilaka%';

-- 8. List all tv shows with more than 5 seasons
SELECT
	*
FROM
	netflix
WHERE
	type = 'TV Show' AND
	SPLIT_PART(duration, ' ', 1)::numeric > 5;

-- 9. Count the number of content items in each genre
SELECT
	UNNEST(STRING_TO_ARRAY(listed_in, ',')) as genre,
	COUNT(show_id) as total_content
FROM
	netflix
GROUP BY 
	1;




	
