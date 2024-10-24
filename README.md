# online-retail-application-database

Creating the database by the name of the ecommerce_db .

Use the ecommerce_id of the database and create tables with the names of the [Users,Products,Orders,
Orderitems]

Table Explanation
Users Table

Purpose: The Users table stores all the necessary information about customers who register on the e-commerce platform. Each user is assigned a unique user_id to identify them within the system.
Columns:
user_id: Unique identifier for each user (Primary Key).
first_name and last_name: The user's first and last names.
email: User's email address, which is unique for each user.
password: A hashed or encrypted version of the user's password.
address: The user's physical address, which could be used for shipping or billing purposes.
phone_number: The user's contact number for communication.
created_at: The timestamp when the user was created.
Products Table

Purpose: The Products table holds information about the various products available for sale in the online store.
Columns:
product_id: Unique identifier for each product (Primary Key).
product_name: The name of the product (e.g., "Laptop").
description: A detailed description of the product, providing information to customers.
price: The cost of the product.
stock_quantity: The number of units available in stock.
created_at: The timestamp when the product was added to the store.
Orders Table

Purpose: The Orders table tracks customer orders. Each order has a unique ID and is associated with a user.
Columns:
order_id: Unique identifier for each order (Primary Key).
user_id: Foreign key linking the order to a specific user in the Users table.
order_date: The date and time when the order was placed.
total_amount: The total cost of the order.
status: The current status of the order (e.g., "Pending", "Completed", "Shipped").
Order Items Table

Purpose: The OrderItems table links individual products to specific orders. This enables an order to contain multiple products, making it a many-to-many relationship between Orders and Products.
Columns:
order_item_id: Unique identifier for each order item (Primary Key).
order_id: Foreign key linking the order item to an order in the Orders table.
product_id: Foreign key linking the order item to a product in the Products table.
quantity: The quantity of the product ordered.
price: The price of the product at the time of the order.
Payments Table

Purpose: The Payments table stores information about the payments made by customers for their orders. Each payment is associated with an order.
Columns:
payment_id: Unique identifier for each payment (Primary Key).
order_id: Foreign key linking the payment to a specific order in the Orders table.
payment_date: The date and time when the payment was made.
payment_method: The method of payment (e.g., "Credit Card", "PayPal").
payment_status: The current status of the payment (e.g., "Completed", "Pending").
amount: The total amount paid.
Theory Behind the Database Structure
This e-commerce database is designed using the relational database model, which organizes data into related tables. Each table represents a specific entity (e.g., users, products, orders) and establishes relationships between entities through foreign keys. Here's the theoretical breakdown:

Normalization:

The structure follows database normalization principles to avoid redundancy. For example, instead of storing product details in the orders table, we create a separate Products table and use product_id in the OrderItems table to link orders to products. This ensures data consistency, especially when product details like prices or descriptions change.
Relationships:

One-to-Many Relationship: A user can place many orders, but an order is placed by only one user. This is achieved by using the user_id as a foreign key in the Orders table.
Many-to-Many Relationship: A single order can contain multiple products, and the same product can appear in many different orders. This is modeled through the OrderItems table, which breaks this down into two one-to-many relationships.
Example: Order #1 can contain Product #1 (Laptop) and Product #2 (Smartphone), and Product #2 can appear in both Order #1 and Order #2.
Data Integrity:

Primary Keys: Each table has a primary key to ensure that each row can be uniquely identified. This prevents duplication of records.
Foreign Keys: Foreign keys ensure that the relationships between tables are maintained. For instance, the Orders table cannot reference a non-existent user because the user_id in Orders must exist in the Users table.
Scalability:

This database can scale to handle larger amounts of data by adding more rows to each table. For instance, the Products table can hold thousands of products, and the Orders table can grow as more orders are placed.
Transaction Management:

E-commerce platforms require consistent and reliable transaction management. Using this structure, it is possible to handle critical operations like order placement and payment processing as atomic transactions, meaning that either all parts of the operation succeed (e.g., items are added to the order, payment is processed), or none do.
Core Features of the Database Design
User Authentication and Authorization:

The Users table supports user accounts and encrypted passwords, making it a foundation for secure login functionality.
Product Management:

The Products table allows the platform to manage and update available items, including prices, descriptions, and stock levels.
Order Tracking:

The Orders table records each purchase made by users, storing critical information like total amount, order date, and order status. This is crucial for order fulfillment and customer service.
Payment Processing:

The Payments table allows tracking of payment methods, statuses, and amounts, ensuring that each order is correctly paid before processing.



![Screenshot 2024-10-24 135444](https://github.com/user-attachments/assets/aa4ffa4d-8431-4236-a018-c90e0ade2680)
![Screenshot 2024-10-24 135537](https://github.com/user-attachments/assets/27a1c14f-97f7-400b-8a8d-5b20df99f4ff)
![Screenshot 2024-10-24 135621](https://github.com/user-attachments/assets/11595bb5-613a-4fd9-8d24-195fa465b83a)
![Screenshot 2024-10-24 135658](https://github.com/user-attachments/assets/884a88a5-2275-4e70-81a9-0996367671d8)
![Screenshot 2024-10-24 140134](https://github.com/user-attachments/assets/941a7f63-1eb2-4220-b1ac-9271aa30e168)
![Screenshot 2024-10-24 140326](https://github.com/user-attachments/assets/c6cb7577-c676-4116-8d03-089389cfab10)


