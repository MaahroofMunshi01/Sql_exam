# E-Commerce Order Management System
create database exam_db;
use exam_db;


# create table Category
create table tbl_category(
cat_id int primary key auto_increment,
cat_name varchar(50));

# Create table products
create table tbl_products(
pro_id int primary key auto_increment,
name varchar(100),
cat_id int,
price int,
stock_quantity int,
add_date date,
foreign key (cat_id)
references tbl_category(cat_id));

# create table customer

create table tbl_customers(
cust_id int primary key auto_increment,
cust_name varchar(50),
email varchar(100),
phone_no int,
address varchar(50),
reg_date date);

# create table orders
create table tbl_orders(
ord_id int primary key auto_increment,
cust_id int,
ord_date date,
total_amt int,
ord_status varchar(40),
foreign key (cust_id)
references tbl_customers(cust_id)
);


# create table order_items

create table tbl_order_items(
order_item_id int primary key auto_increment,
ord_id int,
pro_id int,
quantity int,
sub_total int,
foreign key (ord_id)
references tbl_orders(ord_id),
foreign key (pro_id)
references tbl_products(pro_id));

# create table payments
create table tbl_payments(
payment_id int primary key auto_increment,
ord_id int,
payment_date date,
payment_method varchar(30),
payment_status varchar(20),
foreign key (ord_id)
references tbl_orders(ord_id));

# create table shipping

create table tbl_shipping(
ship_id int primary key auto_increment,
ord_id int,
ship_date date,
del_date date,
ship_status varchar(30),
foreign key (ord_id)
references tbl_orders(ord_id));
 
 
 # inserting records
 
 INSERT INTO tbl_category (cat_name)
VALUES
('Electronics'),
('Clothing'),
('Home Appliances'),
('Books'),
('Furniture'),
('Footwear'),
('Sports'),
('Accessories');


INSERT INTO tbl_products
(name, cat_id, price, stock_quantity, add_date)
VALUES
('Laptop', 1, 55000, 10, '2026-09-01'),
('T-Shirt', 2, 599, 50, '2026-09-03'),
('Washing Machine', 3, 25000, 8, '2026-09-05'),
('Python Programming Book', 4, 799, 25, '2026-09-07'),
('Wooden Table', 5, 8500, 12, '2026-09-10'),
('Running Shoes', 6, 2499, 30, '2026-09-12'),
('Football', 7, 899, 20, '2026-09-15'),
('Smart Watch', 8, 3999, 15, '2026-09-18');

INSERT INTO tbl_products
(name, cat_id, price, stock_quantity, add_date)
VALUES
('Wireless Headphones', 1, 2500, 0, CURDATE()),
('Bluetooth Speaker', 1, 1800, 0, CURDATE()),
('Gaming Mouse', 1, 1200, 10, CURDATE()),
('Keyboard', 1, 900, 15, CURDATE()),
('USB Cable', 1, 250, 0, CURDATE());

ALTER TABLE tbl_customers
MODIFY COLUMN phone_no VARCHAR(15);

INSERT INTO tbl_customers
(cust_name, email, phone_no, address, reg_date)
VALUES
('Rahul Shah', 'rahul@gmail.com', 9876543210,'Ahmedabad', '2026-09-01'),
('Priya Patel', 'priya@gmail.com',9876543211, 'Surat', '2026-09-03'),
('Amit Mehta', 'amit@gmail.com',9876543212, 'Vadodara', '2026-09-05'),
('Neha Desai', 'neha@gmail.com',9876543213, 'Rajkot', '2026-09-07'),
('Vikas Joshi', 'vikas@gmail.com',9876543214, 'Gandhinagar', '2026-09-10'),
('Sneha Trivedi', 'sneha@gmail.com',9876543215, 'Valsad', '2026-09-12'),
('Karan Patel', 'karan@gmail.com',9876543216, 'Anand', '2026-09-15'),
('Pooja Shah', 'pooja@gmail.com',9876543217, 'Bhavnagar', '2026-09-18');

INSERT INTO tbl_orders
(cust_id, ord_date, total_amt, ord_status)
VALUES
(1, '2026-10-01', 2500, 'Delivered'),
(1, '2026-10-05', 1800, 'Delivered'),
(1, '2026-10-10', 3200, 'Delivered'),
(1, '2026-10-15', 1500, 'Shipped'),
(2, '2026-10-02', 4000, 'Delivered'),
(2, '2026-10-08', 2200, 'Delivered'),
(2, '2026-10-12', 3500, 'Pending'),
(2, '2026-10-03', 1200, 'Delivered');


INSERT INTO tbl_orders
(cust_id, ord_date, total_amt, ord_status)
VALUES
(1, '2026-10-01', 55000, 'Delivered'),
(2, '2026-10-03', 1198, 'Delivered'),
(3, '2026-10-05', 25000, 'Shipped'),
(4, '2026-10-07', 1598, 'Processing'),
(5, '2026-10-10', 8500, 'Delivered'),
(6, '2026-10-12', 4998, 'Shipped'),
(7, '2026-10-15', 1798, 'Pending'),
(8, '2026-10-18', 3999, 'Processing');

INSERT INTO tbl_orders
(cust_id, ord_date, total_amt, ord_status)
VALUES
(1, '2026-09-10', 2500, 'Cancelled');

INSERT INTO tbl_orders
(cust_id, ord_date, total_amt, ord_status)
VALUES
(1, CURDATE(), 5000, 'Pending');

INSERT INTO tbl_order_items
(ord_id, pro_id, quantity, sub_total)
VALUES
(1, 1, 1, 55000),
(2, 2, 2, 1198),
(3, 3, 1, 25000),
(4, 4, 2, 1598),
(5, 5, 1, 8500),
(6, 6, 2, 4998),
(7, 7, 2, 1798),
(8, 8, 1, 3999);


INSERT INTO tbl_payments
(ord_id, payment_date, payment_method, payment_status)
VALUES
(1, '2026-10-01', 'UPI', 'Paid'),
(2, '2026-10-03', 'Credit Card', 'Paid'),
(3, '2026-10-05', 'Debit Card', 'Paid'),
(4, '2026-10-07', 'UPI', 'Pending'),
(5, '2026-10-10', 'Cash', 'Paid'),
(6, '2026-10-12', 'Net Banking', 'Paid'),
(7, '2026-10-15', 'UPI', 'Pending'),
(8, '2026-10-18', 'Credit Card', 'Paid');

INSERT INTO tbl_payments
(ord_id, payment_date, payment_method, payment_status)
VALUES
(18, '2026-10-01', 'UPI', 'Paid');

INSERT INTO tbl_shipping
(ord_id, ship_date, del_date, ship_status)
VALUES
(1, '2026-10-02', '2026-10-05', 'Delivered'),
(2, '2026-10-04', '2026-10-07', 'Delivered'),
(3, '2026-10-06', NULL, 'In Transit'),
(4, NULL, NULL, 'Processing'),
(5, '2026-10-11', '2026-10-14', 'Delivered'),
(6, '2026-10-13', NULL, 'In Transit'),
(7, NULL, NULL, 'Pending'),
(8, NULL, NULL, 'Processing');

# Q - 1 (2) : 
UPDATE tbl_products
SET stock_quantity = stock_quantity - 2
WHERE pro_id = 1;

# Q-1 (3) :
delete from tbl_orders
where ord_status = "Cancelled"
and ord_Date < date_sub(curdate(),interval 30 day);

# Q-2 (1) :
select * from tbl_orders where 
ord_date >= date_sub(curdate(),interval 6 Month);


# Q-2 (2) : 
 select * from tbl_products 
 order by price desc limit 5;

# Q-2(3)
SELECT cust_id, cust_name
FROM tbl_customers
WHERE cust_id IN (
    SELECT cust_id
    FROM tbl_orders
    GROUP BY cust_id
    HAVING COUNT(ord_id) > 3
);

# Q-3 
# 1 :
SELECT *
FROM tbl_orders
WHERE ord_status = 'Pending'
  AND ord_id IN (
      SELECT ord_id
      FROM tbl_payments
      WHERE payment_status = 'Paid'
  );

# 2
SELECT *
FROM tbl_products
WHERE NOT (stock_quantity = 0);

# 3
SELECT *
FROM tbl_customers
WHERE reg_date >= '2023-01-01'

UNION

SELECT *
FROM tbl_customers
WHERE cust_id IN (
    SELECT cust_id
    FROM tbl_orders
    GROUP BY cust_id
    HAVING SUM(total_amt) > 10000
);

# Q-4 
# 1 :
SELECT *
FROM tbl_products
ORDER BY price DESC;

# 2:
SELECT
    cust_id,
    COUNT(ord_id) AS total_orders
FROM tbl_orders
GROUP BY cust_id;


# 3 :

select sum(price) as total_revenue from tbl_products group by cat_id;

# Q-5 :
 # 1 :
 SELECT SUM(total_amt) AS total_revenue
FROM tbl_orders;

# 2 :
SELECT
    pro_id,
    SUM(quantity) AS total_quantity_sold
FROM tbl_order_items
GROUP BY pro_id
ORDER BY total_quantity_sold DESC
LIMIT 1;

# 3 :
 SELECT AVG(total_amt) AS average_order_value
FROM tbl_orders;

# Q-6 :
SELECT ord_id, cust_id, ord_date, total_amt
FROM tbl_orders;

SELECT *
FROM tbl_payments;

# Q- 7 :
# 1 :
SELECT
    p.pro_id,
    p.name AS product_name,
    c.cat_name AS category_name,
    p.price,
    p.stock_quantity
FROM tbl_products p
INNER JOIN tbl_category c
    ON p.cat_id = c.cat_id;
    
# 2 :

select o.ord_date,o.total_amt,o.ord_status,c.cust_name,c.email, c.phone_no, c.address, c.reg_date
from tbl_orders o left join tbl_customers c on o.cust_id = c.cust_id;

# 3 :
select o.ord_date,o.total_amt,o.ord_status,s.ship_date,s.del_date,s.ship_status
from tbl_orders o right join tbl_shipping s on o.ord_id=s.ord_id;


# 4 :
select o.ord_date,o.total_amt,o.ord_status,c.cust_name,c.email, c.phone_no, c.address, c.reg_date
from tbl_orders o left join tbl_customers c on o.cust_id = c.cust_id 
UNION 
select o.ord_date,o.total_amt,o.ord_status,c.cust_name,c.email, c.phone_no, c.address, c.reg_date
from tbl_orders o right join tbl_customers c on o.cust_id = c.cust_id;

# Q-8 :
# 1 
select *
FROM tbl_orders
WHERE cust_id IN (
    SELECT cust_id FROM tbl_customers
    WHERE reg_date > '2022-12-31'
);

# 2 :
SELECT cust_id, cust_name
FROM tbl_customers
WHERE cust_id = (
    SELECT cust_id
    FROM tbl_orders
    GROUP BY cust_id
    ORDER BY SUM(total_amt) DESC
    LIMIT 1
);

# 3 :
	SELECT pro_id, name
FROM tbl_products
WHERE pro_id NOT IN (
    SELECT pro_id FROM tbl_order_items
);

# Q-9 :
# 1:
# Orders per month
SELECT YEAR(ord_date) AS yr, MONTH(ord_date) AS mth, COUNT(*) AS total_orders
FROM tbl_orders
GROUP BY YEAR(ord_date), MONTH(ord_date)
ORDER BY yr, mth;

# 2 :-- Delivery time (days between ship_date and del_date)
SELECT ord_id, ship_date, del_date,
       DATEDIFF(del_date, ship_date) AS delivery_days
FROM tbl_shipping
WHERE del_date IS NOT NULL;

# 3 Format order date as DD-MM-YYYY
SELECT ord_id, DATE_FORMAT(ord_date, '%d-%m-%Y') AS order_date_formatted
FROM tbl_orders;

# Q-10
-- 1 Product names in uppercase
SELECT pro_id, UPPER(name) AS product_name_upper
FROM tbl_products;

-- 2  Trim whitespace from customer names
SELECT cust_id, TRIM(cust_name) AS clean_name
FROM tbl_customers;

-- 3 Replace missing emails with "Not Provided"
SELECT cust_id, cust_name,
       COALESCE(NULLIF(TRIM(email), ''), 'Not Provided') AS email
FROM tbl_customers;

# Q-11 : 
-- 1 Rank customers by total spending
SELECT c.cust_id, c.cust_name,
       SUM(o.total_amt) AS total_spent,
       RANK() OVER (ORDER BY SUM(o.total_amt) DESC) AS spending_rank
FROM tbl_customers c
JOIN tbl_orders o ON c.cust_id = o.cust_id
GROUP BY c.cust_id, c.cust_name;

-- 2 Cumulative total revenue per month
WITH monthly AS (
    SELECT DATE_FORMAT(ord_date, '%Y-%m') AS month,
           SUM(total_amt) AS revenue
    FROM tbl_orders
    GROUP BY DATE_FORMAT(ord_date, '%Y-%m')
)
SELECT month, revenue,
       SUM(revenue) OVER (ORDER BY month) AS cumulative_revenue
FROM monthly;

-- 3 Running total of orders placed
SELECT ord_id, ord_date,
       COUNT(*) OVER (ORDER BY ord_date, ord_id) AS running_total_orders
FROM tbl_orders;

# Q- 12 :
-- 1 Loyalty_Status for customers
SELECT c.cust_id, c.cust_name,
       COALESCE(SUM(o.total_amt), 0) AS total_spent,
       CASE
           WHEN COALESCE(SUM(o.total_amt), 0) > 50000 THEN 'Gold'
           WHEN COALESCE(SUM(o.total_amt), 0) BETWEEN 20000 AND 50000 THEN 'Silver'
           ELSE 'Bronze'
       END AS Loyalty_Status
FROM tbl_customers c
LEFT JOIN tbl_orders o ON c.cust_id = o.cust_id
GROUP BY c.cust_id, c.cust_name;

-- 2 Categorize products by units sold
SELECT p.pro_id, p.name,
       COALESCE(SUM(oi.quantity), 0) AS units_sold,
       CASE
           WHEN COALESCE(SUM(oi.quantity), 0) > 500 THEN 'Best Seller'
           WHEN COALESCE(SUM(oi.quantity), 0) BETWEEN 200 AND 500 THEN 'Popular'
           ELSE 'Regular'
       END AS product_category
FROM tbl_products p
LEFT JOIN tbl_order_items oi ON p.pro_id = oi.pro_id
GROUP BY p.pro_id, p.name;