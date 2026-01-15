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


