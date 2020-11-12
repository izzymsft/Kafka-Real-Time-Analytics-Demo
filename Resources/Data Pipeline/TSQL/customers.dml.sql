
USE universe;

INSERT INTO customers (username, email, first_name, last_name, created) VALUES
('israelekpo', 'israel@microsoft.com', 'Israel', 'Ekpo', CURRENT_TIMESTAMP),
('joshuaekpo', 'joshua@microsoft.com', 'Joshua', 'Ekpo', CURRENT_TIMESTAMP),
('angelekpo', 'angel@microsoft.com', 'Angel', 'Ekpo', CURRENT_TIMESTAMP),
('alexvirtue', 'alex@microsoft.com', 'Alex', 'Ekpo', CURRENT_TIMESTAMP);

INSERT INTO pages (page_name) VALUES
('Home Page'),
('Contact Us Page'),
('About Us Page'),
('Products Page');

INSERT INTO customer_visits (customer_id, page_id) VALUES
(1024, 2048),
(1024, 2049),
(1024, 2050),
(1024, 2051),
(1025, 2048),
(1025, 2049),
(1025, 2050),
(1025, 2051),
(1026, 2048),
(1026, 2049),
(1026, 2050),
(1026, 2051),
(1027, 2048),
(1027, 2049),
(1027, 2050),
(1027, 2051);

INSERT INTO customer_phones (customer_id, phone_type, phone_number) VALUES
(1024, 'home', '305-555-1212'),
(1025, 'home', '954-555-1212'),
(1026, 'home', '561-555-1212'),
(1027, 'home', '786-555-1212'),
(1024, 'work', '630-555-1212'),
(1025, 'work', '591-555-1212'),
(1026, 'work', '202-555-1212'),
(1027, 'work', '301-555-1212');

INSERT INTO customer_connections (customer_id, follower_id) VALUES
(1024, 1025),
(1024, 1026),
(1024, 1027),
(1025, 1024),
(1026, 1024),
(1027, 1024);


SELECT * FROM customers;
SELECT * FROM pages;
SELECT * FROM customer_visits;
SELECT * FROM customer_phones;
SELECT * FROM customer_connections;