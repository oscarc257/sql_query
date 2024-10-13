-- Comments in SQL Start with dash-dash --

-- Add product “chair” with price 44.00 and can_be_returned of false
INSERT INTO products (name, price, can_be_returned) 
VALUES ('chair', 44.00, FALSE);

-- Add product “stool” with price 25.99 and can_be_returned of true
INSERT INTO products (name, price, can_be_returned) 
VALUES ('stool', 25.99, TRUE);

-- Add product “table” with price 124.00 and can_be_returned of false
INSERT INTO products (name, price, can_be_returned) 
VALUES ('table', 124.00, FALSE);

-- Display all rows and columns
SELECT * FROM products;

-- Display all names of the products
SELECT name FROM products;

-- Display all names and prices of the products
SELECT name, price FROM products;

-- Add product “lamp” with price 34.50 and can_be_returned of true
INSERT INTO products (name, price, can_be_returned) 
VALUES ('lamp', 34.50, TRUE);

-- Display products that can be returned
SELECT * FROM products WHERE can_be_returned = TRUE;

-- Display products with price less than 44.00
SELECT * FROM products WHERE price < 44.00;

.-- Display products with price between 22.50 and 99.99
SELECT * FROM products WHERE price BETWEEN 22.50 AND 99.99;

-- Apply $20 discount on all products
UPDATE products SET price = price - 20;

-- Remove products with price less than $25
DELETE FROM products WHERE price < 25.00;

-- Increase price by $20 for remaining products
UPDATE products SET price = price + 20;

-- Update all products to be returnable
UPDATE products SET can_be_returned = TRUE;


