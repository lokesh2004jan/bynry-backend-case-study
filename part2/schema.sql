-- Company Table
CREATE TABLE company (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255)
);

-- Warehouse Table
CREATE TABLE warehouse (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255),
  company_id BIGINT,
  FOREIGN KEY (company_id) REFERENCES company(id)
);

-- Product Table
CREATE TABLE product (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255),
  sku VARCHAR(100) UNIQUE,
  price DECIMAL(10, 2),
  is_bundle BOOLEAN DEFAULT FALSE
);

-- Inventory Table
CREATE TABLE inventory (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  product_id BIGINT,
  warehouse_id BIGINT,
  quantity INT,
  FOREIGN KEY (product_id) REFERENCES product(id),
  FOREIGN KEY (warehouse_id) REFERENCES warehouse(id)
);

-- Inventory Log Table
CREATE TABLE inventory_log (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  product_id BIGINT,
  warehouse_id BIGINT,
  quantity_change INT,
  reason VARCHAR(255),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (product_id) REFERENCES product(id),
  FOREIGN KEY (warehouse_id) REFERENCES warehouse(id)
);

-- Supplier Table
CREATE TABLE supplier (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255),
  contact_email VARCHAR(255)
);

-- Product-Supplier (Many-to-Many)
CREATE TABLE product_supplier (
  product_id BIGINT,
  supplier_id BIGINT,
  PRIMARY KEY (product_id, supplier_id),
  FOREIGN KEY (product_id) REFERENCES product(id),
  FOREIGN KEY (supplier_id) REFERENCES supplier(id)
);

-- Bundle Products (Self-relation)
CREATE TABLE bundle_products (
  bundle_id BIGINT,
  component_id BIGINT,
  quantity INT,
  PRIMARY KEY (bundle_id, component_id),
  FOREIGN KEY (bundle_id) REFERENCES product(id),
  FOREIGN KEY (component_id) REFERENCES product(id)
);
