-- Comments in SQL Start with dash-dash --

-- 1. Find the app with an ID of 1880
SELECT * FROM analytics WHERE id = 1880;

-- 2. Find the ID and app name for all apps last updated on August 01, 2018
SELECT id, name FROM analytics WHERE last_updated = '2018-08-01';

-- 3. Count the number of apps in each category
SELECT category, COUNT(*) AS app_count 
FROM analytics 
GROUP BY category;

-- 4. Find the top 5 most-reviewed apps and their review counts
SELECT name, reviews 
FROM analytics 
ORDER BY reviews DESC 
LIMIT 5;

-- 5. Find the app with the most reviews and a rating >= 4.8
SELECT name, reviews 
FROM analytics 
WHERE rating >= 4.8 
ORDER BY reviews DESC 
LIMIT 1;

-- 6. Find the average rating for each category, ordered from highest to lowest
SELECT category, AVG(rating) AS avg_rating 
FROM analytics 
GROUP BY category 
ORDER BY avg_rating DESC;

-- 7. Find the name, price, and rating of the most expensive app with a rating < 3
SELECT name, price, rating 
FROM analytics 
WHERE rating < 3 
ORDER BY price DESC 
LIMIT 1;

-- 8. Find all apps with min installs <= 50 and a rating, ordered by rating
SELECT name, min_installs, rating 
FROM analytics 
WHERE min_installs <= 50 AND rating IS NOT NULL 
ORDER BY rating DESC;

-- 9. Find all apps with a rating < 3 and at least 10,000 reviews
SELECT name 
FROM analytics 
WHERE rating < 3 AND reviews >= 10000;

-- 10. Find the top 10 most-reviewed apps with a price between $0.10 and $1.00
SELECT name, reviews 
FROM analytics 
WHERE price BETWEEN 0.10 AND 1.00 
ORDER BY reviews DESC 
LIMIT 10;

-- 11. Find the most out-of-date app
SELECT name, last_updated 
FROM analytics 
WHERE last_updated = (SELECT MIN(last_updated) FROM analytics);

-- 12. Find the most expensive app
SELECT name, price 
FROM analytics 
WHERE price = (SELECT MAX(price) FROM analytics);

-- 13. Count all the reviews in the Google Play Store
SELECT SUM(reviews) AS total_reviews 
FROM analytics;

-- 14. Find all categories with more than 300 apps
SELECT category 
FROM analytics 
GROUP BY category 
HAVING COUNT(*) > 300;

-- 15. Find the app with the highest ratio of min_installs to reviews for apps with at least 100,000 installs
SELECT name, reviews, min_installs, 
       (CAST(min_installs AS FLOAT) / reviews) AS install_to_review_ratio 
FROM analytics 
WHERE min_installs >= 100000 
ORDER BY install_to_review_ratio DESC 
LIMIT 1;
