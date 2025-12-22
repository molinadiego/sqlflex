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
