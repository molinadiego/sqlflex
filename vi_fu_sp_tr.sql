-- Views.

-- 1. Órdenes de trabajo con datos de propiedad y tenant
CREATE VIEW vw_work_orders_detail AS
SELECT wo.id_wo, wo.date_received, wo.date_done,
       p.address AS property_address,
       t.first_name, t.last_name
FROM work_orders wo
JOIN properties p ON wo.id_property = p.id_property
JOIN tenants t ON wo.id_tenant = t.id_tenant;


-- 2. Trabajos realizados con contratistas
CREATE VIEW vw_works_contractors AS
SELECT w.id_work, w.description, w.price,
       c.first_name, c.last_name, c.profession
FROM works w
JOIN contractors c ON w.id_contractor = c.id_contractor;


-- 3. Facturas con estado de pago
CREATE VIEW vw_invoices_status AS
SELECT i.id_invoice, i.date, i.total_price,
       CASE WHEN i.paid = 1 THEN 'PAID' ELSE 'PENDING' END AS status
FROM invoices i;


-- 4. Propiedades por administración
CREATE VIEW vw_properties_management AS
SELECT pm.name AS management_name, p.address, p.city, p.state
FROM property_managements pm
JOIN properties p ON pm.id_pm = p.id_pm;


-- 5. Total facturado por work order
CREATE VIEW vw_total_by_work_order AS
SELECT wo.id_wo, SUM(w.price) AS total
FROM work_orders wo
JOIN works w ON wo.id_wo = w.id_wo
GROUP BY wo.id_wo;

-- Functions.

DELIMITER //

-- 1. Total de una work order
CREATE FUNCTION fn_work_order_total(p_id_wo INT)
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE total INT;
  SELECT IFNULL(SUM(price),0)
  INTO total
  FROM works
  WHERE id_wo = p_id_wo;
  RETURN total;
END;
//


-- 2. Total facturado por propiedad
CREATE FUNCTION fn_total_by_property(p_id_property INT)
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE total INT;
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

-- 1. Crear una factura automáticamente
CREATE PROCEDURE sp_create_invoice(IN p_id_wo INT)
BEGIN
  INSERT INTO invoices (id_wo, date, total_price, paid)
  VALUES (
    p_id_wo,
    CURDATE(),
    fn_work_order_total(p_id_wo),
    0
  );
END;
//


-- 2. Marcar factura como pagada
CREATE PROCEDURE sp_pay_invoice(IN p_id_invoice INT)
BEGIN
  UPDATE invoices
  SET paid = 1
  WHERE id_invoice = p_id_invoice;
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
  UPDATE invoices
  SET total_price = fn_work_order_total(NEW.id_wo)
  WHERE id_wo = NEW.id_wo;
END;
//


-- 2. Validar fechas de work order
CREATE TRIGGER trg_validate_work_order_dates
BEFORE INSERT ON work_orders
FOR EACH ROW
BEGIN
  IF NEW.date_done < NEW.date_received THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'date_done cannot be before date_received';
  END IF;
END;
//
DELIMITER ;

