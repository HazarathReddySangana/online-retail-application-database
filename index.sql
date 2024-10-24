CREATE database ecommerce_db;
 
 use ecommerce_db;
 create table Users(
 user_id int auto_increment primary key,
 first_name varchar(50),
 last_name varchar(50),
 email varchar(100),
 user_password varchar(20),
 address text,
 phone_number varchar(30),
 created_at timestamp default current_timestamp
 );
 
 CREATE TABLE Products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100),
    prod_description TEXT,
    price DECIMAL(10, 2),
    stock_quantity INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10, 2),
    status VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);
 
 CREATE TABLE OrderItems (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

CREATE TABLE Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method VARCHAR(50),
    payment_status VARCHAR(50),
    amount DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

INSERT INTO Users (first_name, last_name, email, user_password, address, phone_number)
VALUES('balaji', 'dondapati', 'balajidondapati@gmail.com', 'b@laji', 'trichy', '9874561230');
INSERT INTO Users (first_name, last_name, email, user_password, address, phone_number)
values('hazarath', 'reddy', 'hazarathreddy@gmail.com', 's@ini13', 'nellore', '7410852963');

INSERT INTO Products (product_name, prod_description, price, stock_quantity)
VALUES('Laptop', '15 inch laptop with 8GB RAM and 256GB SSD', 799.99, 10),
('Smartphone', '6 inch smartphone with 64GB storage', 499.99, 20),
('earphones', 'wired (or) bluethoot', 185.22, 5);

INSERT INTO Orders (user_id, total_amount, status)
VALUES 
(1, 799.99, 'Pending'),
(2, 499.99, 'Completed');

INSERT INTO OrderItems (order_id, product_id, quantity, price)
VALUES 
(1, 1, 1, 799.99),
(2, 2, 1, 499.99);

select *from users;

select * from products;

select * from orders;

select * from orderitems;

select product_id, product_name, prod_description from products
where product_id=1;

SELECT Orders.order_id, Orders.order_date, Products.product_name, OrderItems.quantity, OrderItems.price
FROM Orders
JOIN OrderItems ON Orders.order_id = OrderItems.order_id
JOIN Products ON OrderItems.product_id = Products.product_id
WHERE Orders.order_id = 1;
