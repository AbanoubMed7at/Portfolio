DROP DATABASE IF EXISTS Sales;
CREATE DATABASE IF NOT EXISTS Sales;
USE  Sales;

-- -----------------------------------------------------------
DROP TABLE IF EXISTS 	sales,
						customers,
						items,
						companies;


DROP TABLE IF EXISTS sales;

CREATE TABLE sales 
(
    purchase_number INT NOT NULL AUTO_INCREMENT,
    date_of_purchase DATE NOT NULL,
    customer_id INT,
    item_code VARCHAR(255),
	PRIMARY KEY (purchase_number),
	FOREIGN KEY (customer_id) REFERENCES customers (customer_id) ON DELETE CASCADE,
	FOREIGN KEY (item_code) REFERENCES items (item_code) ON DELETE CASCADE
);

INSERT INTO sales (date_of_purchase, customer_id, item_code)
VALUES ('2023-08-01', 1, 'A01');

SELECT * FROM sales;

-- -----------------------------------------------------------

DROP TABLE IF EXISTS customers;

CREATE TABLE customers 
(
    customer_id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255),
    email_address VARCHAR(255),
    number_of_complains INT DEFAULT 0,
    PRIMARY KEY (customer_id),
    UNIQUE KEY (email_address)
);

INSERT INTO customers (first_name, last_name, email_address)
VALUES ('Jacob', 'Grey', 'jacobgrey@gmail.com');

SELECT * FROM customers;

-- alter table customer
-- add unique key (email_address);

-- -----------------------------------------------------------

DROP TABLE IF EXISTS items;

CREATE TABLE items 
(
    item_code VARCHAR(255) NOT NULL,
    item VARCHAR(255) NOT NULL,
    unit_price VARCHAR(255),
    company_id int,
    PRIMARY KEY (item_code),
    FOREIGN KEY (company_id) REFERENCES companies (company_id) ON DELETE CASCADE
);

INSERT INTO items (item_code, item, unit_price, company_id)
VALUES ('A01', 'Pen', '$2.99', 1);

SELECT * FROM items;

-- -----------------------------------------------------------

DROP TABLE IF EXISTS companies;

CREATE TABLE companies 
(
    company_id INT NOT NULL AUTO_INCREMENT,
    company_name VARCHAR(255) NOT NULL,
    headquarters_phonenumber VARCHAR(255),
    PRIMARY KEY (company_id)
);

INSERT INTO companies (company_name, headquarters_phonenumber)
VALUES ('Company A', '+1 (202) 555-0196');

SELECT * FROM companies;

-- alter table companies
-- modify company_name varchar(255) null;

-- -----------------------------------------------------------