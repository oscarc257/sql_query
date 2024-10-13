-- FURTHER STUDY 

-- FS1. Find the name and rating of the top rated apps in each category, 
-- among apps that have been installed at least 50,000 times.
SELECT app_name, rating, category FROM analytics
  WHERE (rating, category) in (
    SELECT MAX(rating), category FROM analytics
      WHERE min_installs >= 50000
      GROUP BY category
    )
  ORDER BY category;

-- FS2. Find all the apps that have a name similar to "facebook".
SELECT name
FROM analytics
WHERE name ILIKE '%facebook%';

-- FS3. Find all the apps that have more than 1 genre.

SELECT name, genres
FROM analytics
WHERE array_length(string_to_array(genres, ';'), 1) > 1;


-- FS4. Find all the apps that have education as one of their genres.
-- FS4. Find all apps that have 'Education' as one of their genres
SELECT name, genres
FROM analytics
WHERE 'Education' = ANY(string_to_array(genres, ';'));
