CREATE TABLE products(
    id INT PRIMARY KEY,
    name varchar(50),
    price INT
);

CREATE TABLE orders(
    id INT PRIMARY KEY,
    product_id INT,
    FOREIGN KEY (product_id) REFERENCES products(id)
);


CREATE TABLE users(
    id INT PRIMARY KEY,
    name varchar(50),
    order_id INT,
    FOREIGN KEY (order_id) REFERENCES orders(id)
);

CREATE TABLE order_items (
    id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);


INSERT INTO products VALUES(1,'chair',550);
INSERT INTO products VALUES(2,'table',2020);

INSERT INTO orders VALUES(1,2);
INSERT INTO orders VALUES(2,1);

INSERT INTO users values(1,'Aditya',1);
INSERT INTO users values(2,'Rohan',2);

INSERT INTO order_items VALUES (1, 1, 2, 50);
INSERT INTO order_items VALUES (2, 2, 1, 100);

SELECT o.id AS order_id, c.name AS customer_name FROM users as c JOIN orders as o ON c.order_id=o.id;
SELECT o.id AS order_id, p.name AS product_name, oi.quantity FROM orders AS o JOIN order_items oi ON o.id = oi.order_id JOIN products p ON oi.product_id = p.id;
SELECT c.name AS customer_name, COUNT(o.id) AS order_count FROM users as c JOIN orders as o ON c.order_id=o.id GROUP BY c.name;