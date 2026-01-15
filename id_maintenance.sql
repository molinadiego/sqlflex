CREATE DATABASE id_maitenance;

USE id_maitenance;

CREATE TABLE property_managements(
id_pm INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(100) NOT NULL,
address VARCHAR(100) NOT NULL,
apartment VARCHAR(10),
city VARCHAR(50) NOT NULL,
state VARCHAR(20) NOT NULL,
zip_code INT NOT NULL,
phone VARCHAR(20) NOT NULL,
email VARCHAR(100) NOT NULL
);

CREATE TABLE properties(
id_property INT PRIMARY KEY AUTO_INCREMENT,
address VARCHAR(100) NOT NULL,
apartment VARCHAR(10),
city VARCHAR(50) NOT NULL,
state VARCHAR(20) NOT NULL,
zip_code INT NOT NULL,
id_pm INT NOT NULL,
FOREIGN KEY (id_pm) REFERENCES property_managements(id_pm)
);

CREATE TABLE tenants(
id_tenant INT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
id INT NOT NULL,
phone VARCHAR(20) NOT NULL,
email VARCHAR(100) 
);

CREATE TABLE rental_agreement(
id_ra INT PRIMARY KEY AUTO_INCREMENT,
id_property INT NOT NULL,
id_tenant INT NOT NULL,
date_move_in DATE NOT NULL,
date_move_out DATE NOT NULL,
FOREIGN KEY (id_property) REFERENCES properties(id_property),
FOREIGN KEY (id_tenant) REFERENCES tenants(id_tenant),
CONSTRAINT uc_agreement UNIQUE(id_property,id_tenant)
);

CREATE TABLE work_orders(
id_wo INT PRIMARY KEY AUTO_INCREMENT,
date_received DATE NOT NULL,
date_done DATE NOT NULL,
id_property INT NOT NULL,
id_tenant INT NOT NULL,
FOREIGN KEY (id_property) REFERENCES properties(id_property),
FOREIGN KEY (id_tenant) REFERENCES tenants(id_tenant)
);

CREATE TABLE contractors(
id_contractor INT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
phone VARCHAR(20) NOT NULL,
email VARCHAR(100) NOT NULL,
profession VARCHAR(100) NOT NULL
);

CREATE TABLE works(
id_work INT PRIMARY KEY AUTO_INCREMENT,
id_wo INT NOT NULL,
id_contractor INT NOT NULL,
description VARCHAR(255) NOT NULL,
price DECIMAL (10,2) NOT NULL,
FOREIGN KEY (id_wo) REFERENCES work_orders(id_wo),
FOREIGN KEY (id_contractor) REFERENCES contractors(id_contractor)
);


CREATE TABLE invoices(
id_invoice INT PRIMARY KEY AUTO_INCREMENT,
id_wo INT NOT NULL UNIQUE,
date DATE NOT NULL,
total_price DECIMAL (10,2) NOT NULL,
paid TINYINT (1) NOT NULL DEFAULT 0,
FOREIGN KEY (id_wo) REFERENCES work_orders(id_wo)
);



