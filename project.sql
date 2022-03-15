-- I have chosen the Netflix dataset because I am considering signing up for a package
-- but have very little knowledge about netflix.

-- 1.
-- Therefore, my first step is to understand each of the 2 netflix datasets
-- by diplaying what each columns data is showing 
-- The 2 datasets table both have the same title column only
SELECT * FROM Project.imdb_scores;
SELECT * FROM Project.netflix_movies;

-- 2.
-- Total Movies "Average IMDB"
SELECT AVG(imdb_score) AS 'Average IMDB' FROM Project.imdb_scores;

-- 3.
-- I am really interested in English movies, e.g., variety/how many in english, genre
-- 3a. First, will show wide variety of lanuages available
SELECT * FROM Project.netflix_movies
GROUP BY language; 

-- 3b. Find all Movie Titles available in "English"
SELECT * FROM Project.netflix_movies
WHERE language LIKE '%English%';

-- 4. To show total No. of Movies in "English"
SELECT COUNT(Language) AS 'Total No. of English Movies' FROM project.netflix_movies 
WHERE Language LIKE '%English%';  

-- 5a. Create conditions based on Language. If first name contains "eng" and "span"
SELECT Title, CASE 
WHEN Language LIKE '%eng%' THEN 'English Movies' 
WHEN Language LIKE '%span%' THEN 'Spanish Movies'
ELSE 'Other' END AS 'Groups'
FROM project.netflix_movies;

-- 5b. Grouping 5a. e.g. Movie Titles "English", "Spanish" or "Other" in ascending order
SELECT Title, CASE 
WHEN Language LIKE '%eng%' THEN 'English Movies' 
WHEN Language LIKE '%span%' THEN 'Spanish Movies'
ELSE 'Other' END AS 'Groups'
FROM Project.netflix_movies
GROUP BY Title 
ORDER BY 2 Asc; 

-- 6a. JOINS: INNER JOIN combine the 2 datasets together based on movie "Titles"
SELECT * FROM Project.netflix_movies nm
INNER JOIN Project.imdb_scores s 
ON nm.Title = s.Title;
-- NOTE above Title Column shown twice e.g. because in both dataset

-- 6b. JOINS: INNER JOIN combine the 2 datasets together based on movie "Titles" BUT
-- only showing Title once, with IMDB Score column e.g. useful to "Create a View".
SELECT nm.Title, nm.Genre, nm.Premiere, nm.Runtime, nm.Language,  
s.imdb_score
FROM Project.netflix_movies nm
INNER JOIN Project.imdb_scores s 
ON nm.Title = s.Title;

-- 6c. only showing 6b. above for all Movies available in English 
SELECT nm.Title, nm.Genre, nm.Premiere, nm.Runtime, nm.Language,  
s.imdb_score
FROM Project.netflix_movies nm
INNER JOIN Project.imdb_scores s 
ON nm.Title = s.Title
WHERE nm.Language = 'English';

-- 6.d same as 6c. above but in decending order
SELECT nm.Title, nm.Genre, nm.Premiere, nm.Runtime, nm.Language,  
s.imdb_score
FROM Project.netflix_movies nm
INNER JOIN Project.imdb_scores s 
ON nm.Title = s.Title
WHERE nm.Language = 'English'
ORDER BY s.imdb_score DESC;

-- 7a. Find the 'Average IMDB Score by Genre' in decending order.
SELECT Genre, AVG(s.imdb_score) AS 'Average IMDB Score' FROM Project.netflix_movies nm
INNER JOIN Project.imdb_scores s 
ON nm.Title = s.Title
GROUP BY Genre
ORDER BY s.imdb_score DESC;

-- 7b. The Top 5 'Average IMDB Score' by Genre
SELECT Genre, AVG(s.imdb_score) AS 'Average IMDB Score' FROM Project.netflix_movies nm
INNER JOIN Project.imdb_scores s 
ON nm.Title = s.Title
GROUP BY Genre
ORDER BY s.imdb_score DESC
LIMIT 5;

-- 7c. The Bottom 5 'Average IMDB Score' by Genre
SELECT Genre, AVG(s.imdb_score) AS 'Average IMDB Score' FROM Project.netflix_movies nm
INNER JOIN Project.imdb_scores s 
ON nm.Title = s.Title
GROUP BY Genre
ORDER BY s.imdb_score ASC
LIMIT 5;

 




