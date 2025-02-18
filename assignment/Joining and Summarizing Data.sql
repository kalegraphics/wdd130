-- W05 Assignment: Joining and Summarizing Data

-- Question 1: Select images for Impressionism style
SELECT title, image_url FROM artwork 
WHERE style = 'Impressionism';

-- Question 2: Search for images with 'flower' in the subject
SELECT title, image_url FROM artwork 
WHERE subject LIKE '%flower%';

-- Question 3: List all artists and their related artworks
SELECT artist.first_name, artist.last_name, artwork.title 
FROM artist 
JOIN artwork ON artist.artist_id = artwork.artist_id;

-- Question 4: List all subscriptions with magazine name and subscriber details
SELECT magazine.name, subscriber.last_name, subscriber.first_name 
FROM subscription
JOIN magazine ON subscription.magazine_id = magazine.magazine_id
JOIN subscriber ON subscription.subscriber_id = subscriber.subscriber_id
ORDER BY magazine.name;

-- Question 5: List all magazines that Samantha Sanders subscribes to
SELECT magazine.name 
FROM subscription
JOIN magazine ON subscription.magazine_id = magazine.magazine_id
JOIN subscriber ON subscription.subscriber_id = subscriber.subscriber_id
WHERE subscriber.first_name = 'Samantha' AND subscriber.last_name = 'Sanders';

-- Question 6: List first five Customer Service employees alphabetically
SELECT first_name, last_name 
FROM employee
WHERE department = 'Customer Service'
ORDER BY last_name ASC
LIMIT 5;

-- Question 7: Get the current salary and department of Berni Genin
SELECT salary, department 
FROM employee_salary
WHERE employee_id = (SELECT employee_id FROM employee WHERE first_name = 'Berni' AND last_name = 'Genin')
ORDER BY salary_date DESC
LIMIT 1;

-- Question 8: Get the average quantity of all bike stocks
SELECT ROUND(AVG(quantity)) AS avg_stock FROM bike_inventory;

-- Question 9: Show bikes that need to be reordered (quantity = 0), ordered by product_name
SELECT DISTINCT product_name 
FROM bike_inventory
WHERE quantity = 0
ORDER BY product_name;

-- Question 10: Count number of bikes in each category at Baldwin Bikes store (store_id = 2)
SELECT category.name, SUM(inventory.quantity) AS total_stock
FROM inventory
JOIN product ON inventory.product_id = product.product_id
JOIN category ON product.category_id = category.category_id
WHERE inventory.store_id = 2
GROUP BY category.name
ORDER BY total_stock ASC;

-- Question 11: Count total number of employees
SELECT COUNT(*) AS total_employees FROM employee;

-- Question 12: Get the average salaries in each department below 60,000
SELECT department, FORMAT(AVG(salary), '0,0.00') AS avg_salary
FROM employee_salary
GROUP BY department
HAVING AVG(salary) < 60000;

-- Question 13: Count female employees in each department
SELECT department, COUNT(*) AS female_count 
FROM employee
WHERE gender = 'Female'
GROUP BY department
ORDER BY department;
