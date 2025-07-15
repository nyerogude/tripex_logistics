-- Drop existing tables if re-running
DROP TABLE IF EXISTS inventory_movements;
DROP TABLE IF EXISTS procurement_orders;
DROP TABLE IF EXISTS warehouses;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS suppliers;

-- Suppliers Table
CREATE TABLE suppliers (
    supplier_id INT PRIMARY KEY AUTO_INCREMENT,
    supplier_name VARCHAR(100),
    location VARCHAR(100),
    contact_email VARCHAR(150),
    rating DECIMAL(2,1),
    active_status BOOLEAN,
    joined_date DATE
);

-- Products Table
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    category VARCHAR(50),
    unit_price DECIMAL(10,2),
    unit_of_measure VARCHAR(20),
    reorder_level INT,
    active_status BOOLEAN
);

-- Warehouses Table
CREATE TABLE warehouses (
    warehouse_id INT PRIMARY KEY AUTO_INCREMENT,
    location VARCHAR(100),
    capacity INT,
    manager_name VARCHAR(100)
);

-- Procurement Orders Table
CREATE TABLE procurement_orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    supplier_id INT,
    product_id INT,
    order_date DATE,
    quantity_ordered INT,
    unit_cost DECIMAL(10,2),
    delivery_due_date DATE,
    actual_delivery_date DATE,
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Inventory Movements Table
CREATE TABLE inventory_movements (
    movement_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    warehouse_id INT,
    movement_date DATE,
    movement_type ENUM('IN', 'OUT'),
    quantity INT,
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (warehouse_id) REFERENCES warehouses(warehouse_id)
);
