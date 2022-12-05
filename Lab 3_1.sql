USE sakila;

-- Activity 1
-- Drop column picture from staff.
SELECT * FROM staff;

ALTER TABLE staff
DROP COLUMN picture;

SELECT * FROM staff;

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