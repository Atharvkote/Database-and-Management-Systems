ALTER TABLE users ADD phone_number VARCHAR(15);

ALTER TABLE products ADD stock INT DEFAULT 0;

ALTER TABLE orders ADD shipping_address VARCHAR(255);
