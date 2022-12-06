USE sakila;

-- Activity 1
-- 1. Drop column picture from staff.
SELECT * FROM staff;

ALTER TABLE staff
DROP COLUMN picture;

SELECT * FROM staff;

-- 2. A new person is hired to help Jon. 
-- Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
SELECT * FROM staff;
SELECT * FROM customer;
SELECT * FROM customer WHERE first_name = 'TAMMY' AND last_name = 'SANDERS';
DELETE FROM staff WHERE staff_id=3;
-- 
-- to update the database:
-- 1. new row in staff with Tammy Sanders infos.
-- 2. add new colum with customer_id into staff database, so we have a link from staff to customer.  

ALTER TABLE staff
MODIFY customer_id int DEFAULT 0 AFTER store_id;

-- 1. 
INSERT INTO staff( first_name, last_name, address_id, email, store_id, active, username, password, last_update, customer_id)
VALUES (
'TAMMY', 
'SANDERS', 
(SELECT address_id FROM customer WHERE first_name = 'TAMMY' AND last_name = 'SANDERS'),
(SELECT email FROM customer WHERE first_name = 'TAMMY' AND last_name = 'SANDERS'),
(SELECT store_id from customer WHERE first_name = 'TAMMY' AND last_name = 'SANDERS'),
'1',
'','','2022-12-06 08:00:00', (SELECT customer_id from customer WHERE first_name = 'TAMMY' AND last_name = 'SANDERS') );

SELECT * FROM staff;

-- 3. Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. 
-- You can use current date for the rental_date column in the rental table. Hint: Check the columns in 
-- the table rental and see what information you would need to add there. You can query those pieces of information. 
-- For eg., you would notice that you need customer_id information as well. 
-- To get that you can use the following query:

SELECT * FROM rental;
SELECT MAX(rental_id)+1 FROM rental;
SELECT * FROM film;
SELECT * FROM inventory;
SELECT MIN(inventory_id) FROM inventory WHERE film_id = (SELECT film_id FROM film WHERE title = 'Academy Dinosaur') AND store_id = '1';

-- without the "id"-column because this one should autoincrement!
INSERT INTO rental(rental_date, inventory_id, customer_id, return_date, staff_id, last_update)
VALUES ( 
('2022-12-06 08:00:00'),
(SELECT MIN(inventory_id) FROM inventory WHERE film_id = (SELECT film_id FROM film WHERE title = 'Academy Dinosaur') AND store_id = '1'),
(SELECT customer_id FROM customer WHERE first_name = 'CHARLOTTE' AND last_name = 'HUNTER'),
'2022-12-06 08:00:00',
(SELECT staff_id FROM staff WHERE first_name = 'Mike' AND last_name = 'Hillyer'),
'2022-12-06 08:00:00');

SELECT * FROM rental;

-- Activity 2 --> max. 1 - 1 1/2 hour.
-- 1. Use dbdiagram.io or draw.io to propose a new structure for the Sakila database.

-- Address / Location
SELECT * FROM address; -- replace city_id by city and add a new column with country
-- maybe drop the table and put the address into the relevant tables (customer, staff, store).
-- keep address, district, city, postal_code, country, phone
SELECT * FROM city; -- drop, see address
SELECT * FROM country; -- drop, see address

-- Category
SELECT * FROM film;
SELECT * FROM film_category; -- drop this table and add a new column "category_id" in film (14 columns in film)
SELECT * FROM category;

-- Actors
SELECT * FROM film;
SELECT * FROM film_actor; -- important because it connects 
SELECT * FROM actor;

-- Language
SELECT * FROM film; -- since we only have films in english we could drop the "language" table. 
-- But it is an important table if there are more languages than english. Replace language-ID by language.
SELECT * FROM language;

select COUNT(DISTINCT language_id) FROM film;

-- 
SELECT * FROM film_text; -- included in film, drop it.

-- 
SELECT * FROM customer; -- add address
SELECT * FROM store; -- drop it because not a lot of stores. But it does make sense to have a separate table.

SELECT * FROM payment; -- drop and add amount, payment_ID and payment_date into the "rental" - table.
SELECT * FROM rental; -- new colum with store_id

SELECT * FROM inventory;
SELECT * FROM staff;

-- 2. Define primary keys and foreign keys for the new database.