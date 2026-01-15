DROP DATABASE IF EXISTS id_maitenance;
CREATE DATABASE id_maitenance;
USE id_maitenance;

-- =====================
-- TABLES
-- =====================

CREATE TABLE property_managements (
  id_pm INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  address VARCHAR(100) NOT NULL,
  apartment VARCHAR(10),
  city VARCHAR(50) NOT NULL,
  state VARCHAR(20) NOT NULL,
  zip_code INT NOT NULL,
  phone VARCHAR(20) NOT NULL,
  email VARCHAR(100) NOT NULL
);

CREATE TABLE properties (
  id_property INT AUTO_INCREMENT PRIMARY KEY,
  address VARCHAR(100) NOT NULL,
  apartment VARCHAR(10),
  city VARCHAR(50) NOT NULL,
  state VARCHAR(20) NOT NULL,
  zip_code INT NOT NULL,
  id_pm INT NOT NULL,
  FOREIGN KEY (id_pm) REFERENCES property_managements(id_pm)
);

CREATE TABLE tenants (
  id_tenant INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  id INT NOT NULL,
  phone VARCHAR(20) NOT NULL,
  email VARCHAR(100)
);

CREATE TABLE rental_agreement (
  id_ra INT AUTO_INCREMENT PRIMARY KEY,
  id_property INT NOT NULL,
  id_tenant INT NOT NULL,
  date_move_in DATE NOT NULL,
  date_move_out DATE NOT NULL,
  UNIQUE (id_property, id_tenant),
  FOREIGN KEY (id_property) REFERENCES properties(id_property),
  FOREIGN KEY (id_tenant) REFERENCES tenants(id_tenant)
);

CREATE TABLE work_orders (
  id_wo INT AUTO_INCREMENT PRIMARY KEY,
  date_received DATE NOT NULL,
  date_done DATE NOT NULL,
  id_property INT NOT NULL,
  id_tenant INT NOT NULL,
  FOREIGN KEY (id_property) REFERENCES properties(id_property),
  FOREIGN KEY (id_tenant) REFERENCES tenants(id_tenant)
);

CREATE TABLE contractors (
  id_contractor INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  phone VARCHAR(20) NOT NULL,
  email VARCHAR(100) NOT NULL,
  profession VARCHAR(100) NOT NULL
);

CREATE TABLE works (
  id_work INT AUTO_INCREMENT PRIMARY KEY,
  id_wo INT NOT NULL,
  id_contractor INT NOT NULL,
  description VARCHAR(255) NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (id_wo) REFERENCES work_orders(id_wo),
  FOREIGN KEY (id_contractor) REFERENCES contractors(id_contractor)
);

CREATE TABLE invoices (
  id_invoice INT AUTO_INCREMENT PRIMARY KEY,
  id_wo INT NOT NULL UNIQUE,
  date DATE NOT NULL,
  total_price DECIMAL(10,2) NOT NULL,
  paid TINYINT(1) DEFAULT 0,
  FOREIGN KEY (id_wo) REFERENCES work_orders(id_wo)
);


USE id_maitenance;

-- property_managements
INSERT INTO property_managements (name, address, apartment, city, state, zip_code, phone, email) VALUES

('Silver State Property Management', '301 Business Center Dr', NULL, 'Las Vegas', 'NV', 89102, '702-555-1101', 'contact1@silver.com'),
('Desert Home Management', '302 Business Center Dr', NULL, 'Las Vegas', 'NV', 89103, '702-555-1102', 'contact2@desert.com'),
('Nevada Residential Group', '303 Business Center Dr', NULL, 'Las Vegas', 'NV', 89104, '702-555-1103', 'contact3@nevada.com'),
('Red Rock Property Services', '304 Business Center Dr', NULL, 'Las Vegas', 'NV', 89105, '702-555-1104', 'contact4@red.com'),
('Sun Valley Management', '305 Business Center Dr', NULL, 'Las Vegas', 'NV', 89106, '702-555-1105', 'contact5@sun.com'),
('High Roller Property Mgmt', '306 Business Center Dr', NULL, 'Las Vegas', 'NV', 89107, '702-555-1106', 'contact6@high.com'),
('Oasis Residential', '307 Business Center Dr', NULL, 'Las Vegas', 'NV', 89108, '702-555-1107', 'contact7@oasis.com'),
('Vegas Prime Management', '308 Business Center Dr', NULL, 'Las Vegas', 'NV', 89109, '702-555-1108', 'contact8@vegas.com'),
('Sierra Nevada Properties', '309 Business Center Dr', NULL, 'Las Vegas', 'NV', 89110, '702-555-1109', 'contact9@sierra.com'),
('Golden West Management', '310 Business Center Dr', NULL, 'Las Vegas', 'NV', 89111, '702-555-1110', 'contact10@golden.com'),
('Henderson Living', '311 Business Center Dr', NULL, 'Henderson', 'NV', 89022, '702-555-1111', 'contact11@henderson.com'),
('Green Valley Property Mgmt', '312 Business Center Dr', NULL, 'Henderson', 'NV', 89023, '702-555-1112', 'contact12@green.com'),
('Pinnacle Nevada', '313 Business Center Dr', NULL, 'Henderson', 'NV', 89024, '702-555-1113', 'contact13@pinnacle.com'),
('Cornerstone Property Services', '314 Business Center Dr', NULL, 'Henderson', 'NV', 89025, '702-555-1114', 'contact14@cornerstone.com'),
('Valleywide Management', '315 Business Center Dr', NULL, 'Henderson', 'NV', 89026, '702-555-1115', 'contact15@valleywide.com');

-- properties
INSERT INTO properties (address, apartment, city, state, zip_code, id_pm) VALUES

('1001 Boulder Hwy', '20B', 'Henderson', 'NV', 89014, 1),
('1002 Flamingo Rd', '10B', 'Las Vegas', 'NV', 89109, 2),
('1003 Sunset Rd', '5B', 'Henderson', 'NV', 89014, 3),
('1004 Flamingo Rd', '18B', 'Las Vegas', 'NV', 89109, 4),
('1005 Stephanie St', '24B', 'Henderson', 'NV', 89014, 5),
('1006 Tropicana Ave', '10B', 'Las Vegas', 'NV', 89109, 6),
('1007 Boulder Hwy', '24B', 'Henderson', 'NV', 89014, 7),
('1008 Spring Mountain Rd', '4B', 'Las Vegas', 'NV', 89109, 8),
('1009 Stephanie St', '13B', 'Henderson', 'NV', 89014, 9),
('1010 Sahara Ave', '13B', 'Las Vegas', 'NV', 89109, 10),
('1011 Green Valley Pkwy', '8B', 'Henderson', 'NV', 89014, 11),
('1012 Spring Mountain Rd', '16B', 'Las Vegas', 'NV', 89109, 12),
('1013 Warm Springs Rd', '12B', 'Henderson', 'NV', 89014, 13),
('1014 Sahara Ave', '1B', 'Las Vegas', 'NV', 89109, 14),
('1015 Warm Springs Rd', '7B', 'Henderson', 'NV', 89014, 15);

-- tenants
INSERT INTO tenants (first_name, last_name, id, phone, email) VALUES

('Michael', 'Johnson', 800100, '702-444-2100', 'michael.johnson@gmail.com'),
('Sarah', 'Martinez', 800101, '702-444-2101', 'sarah.martinez@gmail.com'),
('David', 'Smith', 800102, '702-444-2102', 'david.smith@gmail.com'),
('Emily', 'Brown', 800103, '702-444-2103', 'emily.brown@gmail.com'),
('James', 'Garcia', 800104, '702-444-2104', 'james.garcia@gmail.com'),
('Laura', 'Wilson', 800105, '702-444-2105', 'laura.wilson@gmail.com'),
('Daniel', 'Taylor', 800106, '702-444-2106', 'daniel.taylor@gmail.com'),
('Jessica', 'Anderson', 800107, '702-444-2107', 'jessica.anderson@gmail.com'),
('Robert', 'Hernandez', 800108, '702-444-2108', 'robert.hernandez@gmail.com'),
('Amanda', 'Moore', 800109, '702-444-2109', 'amanda.moore@gmail.com'),
('Jose', 'Lopez', 800110, '702-444-2110', 'jose.lopez@gmail.com'),
('Maria', 'Clark', 800111, '702-444-2111', 'maria.clark@gmail.com'),
('Anthony', 'Lewis', 800112, '702-444-2112', 'anthony.lewis@gmail.com'),
('Nicole', 'Walker', 800113, '702-444-2113', 'nicole.walker@gmail.com'),
('Brian', 'Hall', 800114, '702-444-2114', 'brian.hall@gmail.com');

-- rental_agreement
INSERT INTO rental_agreement (id_property, id_tenant, date_move_in, date_move_out) VALUES

(1, 1, '2022-06-01', '2023-06-01'),
(2, 2, '2022-06-16', '2023-06-16'),
(3, 3, '2022-07-01', '2023-07-01'),
(4, 4, '2022-07-16', '2023-07-16'),
(5, 5, '2022-07-31', '2023-07-31'),
(6, 6, '2022-08-15', '2023-08-15'),
(7, 7, '2022-08-30', '2023-08-30'),
(8, 8, '2022-09-14', '2023-09-14'),
(9, 9, '2022-09-29', '2023-09-29'),
(10, 10, '2022-10-14', '2023-10-14'),
(11, 11, '2022-10-29', '2023-10-29'),
(12, 12, '2022-11-13', '2023-11-13'),
(13, 13, '2022-11-28', '2023-11-28'),
(14, 14, '2022-12-13', '2023-12-13'),
(15, 15, '2022-12-28', '2023-12-28');

-- work_orders
INSERT INTO work_orders (date_received, date_done, id_property, id_tenant) VALUES

('2024-01-05', '2024-01-07', 1, 1),
('2024-01-09', '2024-01-11', 2, 2),
('2024-01-13', '2024-01-15', 3, 3),
('2024-01-17', '2024-01-19', 4, 4),
('2024-01-21', '2024-01-23', 5, 5),
('2024-01-25', '2024-01-27', 6, 6),
('2024-01-29', '2024-01-31', 7, 7),
('2024-02-02', '2024-02-04', 8, 8),
('2024-02-06', '2024-02-08', 9, 9),
('2024-02-10', '2024-02-12', 10, 10),
('2024-02-14', '2024-02-16', 11, 11),
('2024-02-18', '2024-02-20', 12, 12),
('2024-02-22', '2024-02-24', 13, 13),
('2024-02-26', '2024-02-28', 14, 14),
('2024-03-01', '2024-03-03', 15, 15);

-- contractors
INSERT INTO contractors (first_name, last_name, phone, email, profession) VALUES

('John', 'Miller', '702-555-3101', 'john.miller@contractorsnv.com', 'Plumber'),
('Rebecca', 'Stone', '702-555-3102', 'rebecca.stone@contractorsnv.com', 'Electrician'),
('Carlos', 'Ramirez', '702-555-3103', 'carlos.ramirez@contractorsnv.com', 'HVAC Technician'),
('Steven', 'White', '702-555-3104', 'steven.white@contractorsnv.com', 'Carpenter'),
('Linda', 'Nguyen', '702-555-3105', 'linda.nguyen@contractorsnv.com', 'Painter'),
('Mark', 'Davis', '702-555-3106', 'mark.davis@contractorsnv.com', 'Plumber'),
('Angela', 'Brooks', '702-555-3107', 'angela.brooks@contractorsnv.com', 'Electrician'),
('Jose', 'Vega', '702-555-3108', 'jose.vega@contractorsnv.com', 'HVAC Technician'),
('Paul', 'Anderson', '702-555-3109', 'paul.anderson@contractorsnv.com', 'Handyman'),
('Kevin', 'Scott', '702-555-3110', 'kevin.scott@contractorsnv.com', 'Carpenter'),
('Maria', 'Flores', '702-555-3111', 'maria.flores@contractorsnv.com', 'Plumber'),
('Thomas', 'Reed', '702-555-3112', 'thomas.reed@contractorsnv.com', 'Electrician'),
('Luis', 'Morales', '702-555-3113', 'luis.morales@contractorsnv.com', 'HVAC Technician'),
('Brian', 'Young', '702-555-3114', 'brian.young@contractorsnv.com', 'Handyman'),
('Sandra', 'Kim', '702-555-3115', 'sandra.kim@contractorsnv.com', 'Painter');

-- works
INSERT INTO works (id_wo, id_contractor, description, price) VALUES

(1, 1, 'Water leak under kitchen sink', 174),
(2, 2, 'Air conditioner not cooling', 215),
(3, 3, 'Electrical breaker keeps tripping', 325),
(4, 4, 'Bathroom faucet dripping', 343),
(5, 5, 'Garage door not opening', 349),
(6, 6, 'Ceiling fan making noise', 150),
(7, 7, 'Dishwasher not draining', 274),
(8, 8, 'Wall outlet not working', 271),
(9, 9, 'Heater not turning on', 153),
(10, 10, 'Toilet continuously running', 139),
(11, 11, 'Water heater pilot light out', 365),
(12, 12, 'Smoke detector replacement', 402),
(13, 13, 'Broken window latch', 427),
(14, 14, 'Clogged shower drain', 164),
(15, 15, 'Exterior light not turning on', 281);

-- invoices
INSERT INTO invoices (id_wo, date, total_price, paid) VALUES

(1, '2024-02-10', 478, 1),
(2, '2024-02-13', 462, 1),
(3, '2024-02-16', 215, 0),
(4, '2024-02-19', 405, 1),
(5, '2024-02-22', 214, 1),
(6, '2024-02-25', 367, 0),
(7, '2024-02-28', 348, 1),
(8, '2024-03-02', 162, 1),
(9, '2024-03-05', 412, 0),
(10, '2024-03-08', 335, 1),
(11, '2024-03-11', 259, 1),
(12, '2024-03-14', 210, 0),
(13, '2024-03-17', 196, 1),
(14, '2024-03-20', 363, 1),
(15, '2024-03-23', 246, 0);

-- Views.

-- 1. Órdenes de trabajo con datos de propiedad y tenant
CREATE OR REPLACE VIEW vw_work_orders_detail AS
SELECT wo.id_wo,
      wo.date_received,
      wo.date_done,
      p.address AS property_address,
      CONCAT(t.first_name, ' ', t.last_name) AS tenant_name
FROM work_orders wo
JOIN properties p ON wo.id_property = p.id_property
JOIN tenants t ON wo.id_tenant = t.id_tenant;


-- 2. Trabajos realizados con contratistas
CREATE OR REPLACE VIEW vw_works_contractors AS
SELECT w.id_work,
      w.description,
      w.price,
      CONCAT(c.first_name, ' ', c.last_name) AS contractor_name,
      c.profession
FROM works w
JOIN contractors c ON w.id_contractor = c.id_contractor;


-- 3. Facturas con estado de pago
CREATE OR REPLACE VIEW vw_invoices_status AS
SELECT i.id_invoice,
      i.date,
      i.total_price,
      CASE
        WHEN i.paid = 1 THEN 'PAID'
        ELSE 'PENDING'
      END AS status
FROM invoices i;


-- 4. Propiedades por administración
CREATE OR REPLACE VIEW vw_properties_management AS
SELECT pm.name AS management_name,
      p.address,
      p.city,
      p.state
FROM property_managements pm
JOIN properties p ON pm.id_pm = p.id_pm;


-- 5. Total por work order (calculado desde works)
CREATE OR REPLACE VIEW vw_total_by_work_order AS
SELECT wo.id_wo,
      IFNULL(SUM(w.price),0) AS total
FROM work_orders wo
LEFT JOIN works w ON wo.id_wo = w.id_wo
GROUP BY wo.id_wo;

-- Functions.

DELIMITER //

-- 1. Total de una work order
CREATE FUNCTION fn_work_order_total(p_id_wo INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
  DECLARE total DECIMAL(10,2);

  SELECT IFNULL(SUM(price),0)
  INTO total
  FROM works
  WHERE id_wo = p_id_wo;

  RETURN total;
END;
//


-- 2. Total facturado por propiedad
CREATE FUNCTION fn_total_by_property(p_id_property INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
  DECLARE total DECIMAL(10,2);

  SELECT IFNULL(SUM(i.total_price),0)
  INTO total
  FROM invoices i
  JOIN work_orders wo ON i.id_wo = wo.id_wo
  WHERE wo.id_property = p_id_property;

  RETURN total;
END;
//
DELIMITER ;


-- Stored procedures.

DELIMITER //

-- 1. Crear factura automáticamente (si no existe)
CREATE PROCEDURE sp_create_invoice(IN p_id_wo INT)
BEGIN
  IF NOT EXISTS (SELECT 1 FROM invoices WHERE id_wo = p_id_wo) THEN
    INSERT INTO invoices (id_wo, date, total_price, paid)
    VALUES (
      p_id_wo,
      CURDATE(),
      fn_work_order_total(p_id_wo),
      0
    );
  END IF;
END;
//


-- 2. Marcar factura como pagada
CREATE PROCEDURE sp_pay_invoice(IN p_id_invoice INT)
BEGIN
  UPDATE invoices
  SET paid = 1
  WHERE id_invoice = p_id_invoice
    AND paid = 0;
END;
//
DELIMITER ;


-- Triggers.

DELIMITER //

-- 1. Actualizar total de factura al insertar un trabajo
CREATE TRIGGER trg_update_invoice_after_work
AFTER INSERT ON works
FOR EACH ROW
BEGIN
  IF EXISTS (SELECT 1 FROM invoices WHERE id_wo = NEW.id_wo) THEN
    UPDATE invoices
    SET total_price = fn_work_order_total(NEW.id_wo)
    WHERE id_wo = NEW.id_wo;
  END IF;
END;
//


-- 2. Validar fechas de work order
CREATE TRIGGER trg_validate_work_order_dates
BEFORE INSERT ON work_orders
FOR EACH ROW
BEGIN
  IF NEW.date_done IS NOT NULL
    AND NEW.date_done < NEW.date_received THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'date_done cannot be before date_received';
  END IF;
END;
//
DELIMITER ;

