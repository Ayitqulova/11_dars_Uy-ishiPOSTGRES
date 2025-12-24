-- Active: 1766377822680@@127.0.0.1@5432@N26
CREATE TABLE customer(
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(20),
    city VARCHAR(30)
);


CREATE TABLE products(
    id  SERIAL PRIMARY KEY,
    name VARCHAR(30),
    price INT
);

CREATE TABLE orders(
    id  SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customer(id) on delete CASCADE,
    order_date DATE 
);

CREATE TABLE order_items(
    id  SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(id) on delete CASCADE,
    product_id INT REFERENCES products(id) on delete CASCADE,
    quantity INT
);

INSERT INTO customer (full_name, city) VALUES
('Ayitqulova Guliza', 'Andijan'),
('Toxtaboyeva Muslima', 'Tashkent'),
('Torabekova Shirin', 'Tashkent'),
('Abdullayev Abduqodir', 'Tashkent'),
('Alimjonov Abdulbosid', 'Andijan'),
('Marufxonov Orifxon', 'Namangan'),
('Ismoilova Malika', 'Samarkand'),
('Qodirov Jamshid', 'Bukhara'),
('Karimova Dilnoza', 'Tashkent'),
('Usmonov Azizbek', 'Fergana'),
('Rasulova Mohira', 'Andijan'),
('Shodmonov Bekzod', 'Namangan'),
('Yusupova Nilufar', 'Samarkand'),
('Turgunov Sardor', 'Jizzakh'),
('Rahimova Munisa', 'Tashkent'),
('Solijonov Doston', 'Fergana'),
('Nazarova Shahnoza', 'Bukhara'),
('Qobilov Javlon', 'Andijan'),
('Eshmatova Sevara', 'Khorezm');



INSERT INTO products (name, price)
VALUES
('Samsung Galaxy A14', 210),
('Samsung Galaxy A24', 250),
('Samsung Galaxy A34', 320),
('Samsung Galaxy A54', 380),
('Redmi Note 12', 230),
('Redmi Note 13', 270),
('iPhone 11', 520),
('iPhone 12', 650),
('iPhone 13', 780),
('iPhone SE 2022', 490);

INSERT INTO orders (customer_id, order_date)
VALUES
(1, '2025-12-23'),
(2, '2025-10-16'),
(1, '2025-10-25'),
(2, '2025-11-13'),
(6, '2025-11-06'),
(4, '2025-09-08'),
(5, '2025-08-16'),
(2, '2025-12-06'),
(8, '2025-07-07'),
(9, '2025-11-29'),
(10, '2025-09-23');


INSERT INTO order_items (order_id, product_id, quantity)
VALUES
(1, 1, 1),
(1, 3, 2),
(2, 2, 1),
(2, 5, 1),
(3, 4, 2),
(3, 6, 1),
(4, 1, 3),
(5, 7, 1),
(6, 8, 2),
(7, 9, 1);



SELECT * FROM customer;

SELECT * FROM customer
WHERE city = 'Tashkent';


SELECT * FROM products
WHERE price > 100;

SELECT * FROM products
ORDER BY price DESC;


SELECT DISTINCT city FROM customer; 


SELECT * FROM orders
WHERE order_date BETWEEN '2025-12-23' AND '2025-12-23' 

SELECT count(*) FROM orders;


SELECT city, COUNT(*) AS Mijoz_soni FROM customer GROUP BY city;


SELECT oi.product_id, p.name,  COUNT(*) AS total_orders FROM order_items oi INNER JOIN products p ON oi.product_id = p.id GROUP BY product_id, p.name;


SELECT name, price FROM products 
WHERE price = (SELECT MIN(price) FROM products) OR
 price = (SELECT MAX(price) FROM products);

SELECT p.name, COUNT(oi.quantity) AS Soni FROM order_items oi 
INNER JOIN products p ON p.id = oi.product_id 
GROUP BY  p.name;

SELECT p.name, COUNT(*) AS Miqdori FROM order_items oi INNER JOIN products p ON p.id = oi.product_id GROUP BY p.name HAVING COUNT(*) > 1;


SELECT 
    o.id AS order_id,
    c.full_name 
    FROM orders o INNER JOIN customer c ON c.id = o.customer_id;


SELECT 
    oi.order_id AS order_id,
    p.name,
    oi.quantity
    FROM order_items oi INNER JOIN 
