CREATE DATABASE universe;

USE universe;

DROP TABLE customers;
DROP TABLE pages;
DROP TABLE customer_visits;
DROP TABLE customer_phones;
DROP TABLE customer_connections;

-- This table has a primary key and a timestamp colum (dimension table)
CREATE TABLE customers
(
    customer_id INTEGER IDENTITY (1024, 1),
    username VARCHAR(32) NOT NULL,
    email VARCHAR(64) NOT NULL,
    first_name VARCHAR(64) NOT NULL,
    last_name VARCHAR(64) NOT NULL,
    position_id INTEGER NOT NULL DEFAULT 1,
    current_score DECIMAL(5,2) NOT NULL DEFAULT 0.00,
    created datetime NOT NULL,
    modified datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (customer_id)
);

-- This table has just a primary key, without a timestamp column
CREATE TABLE pages
(
     page_id INTEGER IDENTITY (2048, 1),
     page_name VARCHAR(64) NOT NULL,
     current_priority DECIMAL(5,2) NOT NULL DEFAULT 1.00,
     PRIMARY KEY (page_id)
);

-- This table has a primary key, with a timestamp column
CREATE TABLE customer_visits
(
     visit_id INTEGER IDENTITY (4096, 1),
     customer_id INTEGER NOT NULL,
     page_id INTEGER NOT NULL,
     created datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
     PRIMARY KEY (visit_id)
);

-- This table has a timestamp column but no primary key
CREATE TABLE customer_phones
(
    customer_id INTEGER NOT NULL,
    phone_type VARCHAR(16) NOT NULL,
    phone_number VARCHAR(16) NOT NULL,
    modified datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- This table has no primary keys or timestamp columns
CREATE TABLE customer_connections
(
    customer_id INTEGER NOT NULL, -- customer id of the person that is followed
    follower_id INTEGER NOT NULL, -- customer id of the person the is following
);


