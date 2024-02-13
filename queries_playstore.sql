SELECT * FROM analytics WHERE id = 1880;
--Find the app with an ID of 1880--

SELECT id,app_name FROM analytics WHERE last_updated = '2018-08-01';
--Find the ID and app name for all apps that were last updated on August 01, 2018--

SELECT category,COUNT(*) FROM analytics GROUP BY category;
--Count the number of apps in each category, e.g. “Family | 1972”--

SELECT * FROM analytics ORDER BY reviews desc LIMIT 5;
--Find the top 5 most-reviewed apps and the number of reviews for each--

SELECT * FROM analytics WHERE rating >= 4.8 ORDER BY reviews desc LIMIT 1 ;
--Find the app that has the most reviews with a rating greater than equal to 4.8 --

 SELECT category, AVG(rating) AS avg FROM analytics GROUP BY category ORDER BY avg desc;
 --Find the average rating for each category ordered by the highest rated to lowest rated--

 SELECT app_name,price,rating FROM analytics WHERE rating < 3 ORDER BY price desc LIMIT 1;
-- Find the name, price, and rating of the most expensive app with a rating that’s less than 3--

 SELECT app_name, min_installs FROM analytics WHERE min_installs <= 50 AND rating IS NOT NULL ORDER BY rating desc;
 --Find all apps with a min install not exceeding 50, that have a rating. Order your results by highest rated first--

SELECT app_name,rating FROM analytics WHERE rating < 3 AND reviews >= 10000;
--Find the names of all apps that are rated less than 3 with at least 10000 reviews--

SELECT * FROM analytics WHERE price BETWEEN .10 and 1.00 ORDER BY reviews desc LIMIT 10;
--Find the top 10 most-reviewed apps that cost between 10 cents and a dollar--

SELECT * FROM analytics WHERE last_updated = (SELECT MIN(last_updated) FROM analytics);
--Find the most out of date app--

SELECT * FROM analytics WHERE price = (SELECT MAX(price) FROM analytics);
--Find the most expensive app--

SELECT SUM(reviews) AS total_reviews FROM analytics ;
--Count all the reviews in the Google Play Store--

SELECT category FROM analytics GROUP BY category HAVING COUNT(*) > 300;
--Find all the categories that have more than 300 apps in them--

playstore=# SELECT app_name,min_installs,reviews, min_installs/reviews AS proportion FROM analytics WHERE min_installs >
= 100000 ORDER BY proportion desc LIMIT 1;
--Find the app that has the highest proportion of min_installs to reviews, among apps that have been installed at least 100,000 times--
-- Display the name of the app along with the number of reviews, the min_installs, and the proportion--