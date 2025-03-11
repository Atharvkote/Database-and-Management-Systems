INSERT INTO users (username, email)
VALUES ('Atharva', 'atharva@example.com'),
       ('Bhushan', 'bhushan@example.com'),
       ('Sairaj', 'sairaj@example.com');

INSERT INTO products (product_name, price)
VALUES ('Laptop', 999.99),
       ('Smartphone', 499.99),
       ('Tablet', 299.99);

INSERT INTO orders (user_id, product_id, quantity)
VALUES (1, 1, 2),
       (2, 2, 1),
       (3, 3, 3);
