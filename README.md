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

INSERT INTO products VALUES(1,'chair',550);
INSERT INTO products VALUES(2,'table',2020);

INSERT INTO orders VALUES(1,2);
INSERT INTO orders VALUES(2,1);

INSERT INTO users values(1,'Aditya',1);
INSERT INTO users values(2,'Rohan',2);

SELECT o.id AS order_id, c.name AS customer_name FROM users as c RIGHT JOIN orders as o ON c.order_id=o.id;
SELECT o.id AS order_id, p.name AS product_name FROM products as p RIGHT JOIN orders as o ON p.id=o.product_id;
SELECT c.name AS customer_name, COUNT(o.id) AS order_count FROM users as c RIGHT JOIN orders as o ON c.order_id=o.id GROUP BY c.name;