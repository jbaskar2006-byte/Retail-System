-- ============================================================
-- SMART RETAIL ANALYTICS SYSTEM - DATABASE SCHEMA
-- Creates 4 databases: db_store1, db_store2, db_store3, db_master
-- ============================================================

-- ============================================================
-- STORE 1 DATABASE
-- ============================================================
DROP DATABASE IF EXISTS db_store1;
CREATE DATABASE db_store1 CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE db_store1;

CREATE TABLE customers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(15),
    is_regular BOOLEAN DEFAULT FALSE,
    email VARCHAR(100),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DOUBLE NOT NULL,
    cost_price DOUBLE NOT NULL,
    stock INT DEFAULT 0,
    expiry_date DATE,
    store_id INT DEFAULT 1,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    total_amount DOUBLE NOT NULL,
    order_type VARCHAR(20) DEFAULT 'store',
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE SET NULL
);

CREATE TABLE order_items (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DOUBLE,
    FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE
);

CREATE TABLE workers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(15),
    role VARCHAR(50),
    store_id INT DEFAULT 1,
    salary DOUBLE DEFAULT 0,
    hire_date DATE
);

CREATE TABLE attendance (
    id INT PRIMARY KEY AUTO_INCREMENT,
    worker_id INT NOT NULL,
    date DATE NOT NULL,
    status VARCHAR(10) DEFAULT 'present',
    FOREIGN KEY (worker_id) REFERENCES workers(id) ON DELETE CASCADE
);

CREATE TABLE salaries (
    id INT PRIMARY KEY AUTO_INCREMENT,
    worker_id INT NOT NULL,
    store_id INT DEFAULT 1,
    basic_salary DOUBLE DEFAULT 0,
    bonus DOUBLE DEFAULT 0,
    total_salary DOUBLE DEFAULT 0,
    month VARCHAR(20),
    paid_date DATE,
    FOREIGN KEY (worker_id) REFERENCES workers(id) ON DELETE CASCADE
);

CREATE TABLE advertisements (
    id INT PRIMARY KEY AUTO_INCREMENT,
    store_id INT DEFAULT 1,
    type VARCHAR(50),
    amount DOUBLE DEFAULT 0,
    month VARCHAR(20),
    date DATE,
    platform VARCHAR(50),
    impressions INT DEFAULT 0,
    conversions INT DEFAULT 0
);

CREATE TABLE loans (
    id INT PRIMARY KEY AUTO_INCREMENT,
    store_id INT DEFAULT 1,
    total_loan DOUBLE NOT NULL,
    interest_rate DOUBLE DEFAULT 0,
    emi_amount DOUBLE DEFAULT 0,
    remaining_balance DOUBLE DEFAULT 0,
    start_date DATE,
    end_date DATE,
    lender VARCHAR(100),
    status VARCHAR(20) DEFAULT 'active'
);

CREATE TABLE loan_payments (
    id INT PRIMARY KEY AUTO_INCREMENT,
    loan_id INT NOT NULL,
    store_id INT DEFAULT 1,
    amount_paid DOUBLE DEFAULT 0,
    payment_date DATE,
    month VARCHAR(20),
    FOREIGN KEY (loan_id) REFERENCES loans(id) ON DELETE CASCADE
);

-- ============================================================
-- STORE 2 DATABASE
-- ============================================================
DROP DATABASE IF EXISTS db_store2;
CREATE DATABASE db_store2 CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE db_store2;

CREATE TABLE customers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(15),
    is_regular BOOLEAN DEFAULT FALSE,
    email VARCHAR(100),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DOUBLE NOT NULL,
    cost_price DOUBLE NOT NULL,
    stock INT DEFAULT 0,
    expiry_date DATE,
    store_id INT DEFAULT 2,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    total_amount DOUBLE NOT NULL,
    order_type VARCHAR(20) DEFAULT 'store',
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE SET NULL
);

CREATE TABLE order_items (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DOUBLE,
    FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE
);

CREATE TABLE workers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(15),
    role VARCHAR(50),
    store_id INT DEFAULT 2,
    salary DOUBLE DEFAULT 0,
    hire_date DATE
);

CREATE TABLE attendance (
    id INT PRIMARY KEY AUTO_INCREMENT,
    worker_id INT NOT NULL,
    date DATE NOT NULL,
    status VARCHAR(10) DEFAULT 'present',
    FOREIGN KEY (worker_id) REFERENCES workers(id) ON DELETE CASCADE
);

CREATE TABLE salaries (
    id INT PRIMARY KEY AUTO_INCREMENT,
    worker_id INT NOT NULL,
    store_id INT DEFAULT 2,
    basic_salary DOUBLE DEFAULT 0,
    bonus DOUBLE DEFAULT 0,
    total_salary DOUBLE DEFAULT 0,
    month VARCHAR(20),
    paid_date DATE,
    FOREIGN KEY (worker_id) REFERENCES workers(id) ON DELETE CASCADE
);

CREATE TABLE advertisements (
    id INT PRIMARY KEY AUTO_INCREMENT,
    store_id INT DEFAULT 2,
    type VARCHAR(50),
    amount DOUBLE DEFAULT 0,
    month VARCHAR(20),
    date DATE,
    platform VARCHAR(50),
    impressions INT DEFAULT 0,
    conversions INT DEFAULT 0
);

CREATE TABLE loans (
    id INT PRIMARY KEY AUTO_INCREMENT,
    store_id INT DEFAULT 2,
    total_loan DOUBLE NOT NULL,
    interest_rate DOUBLE DEFAULT 0,
    emi_amount DOUBLE DEFAULT 0,
    remaining_balance DOUBLE DEFAULT 0,
    start_date DATE,
    end_date DATE,
    lender VARCHAR(100),
    status VARCHAR(20) DEFAULT 'active'
);

CREATE TABLE loan_payments (
    id INT PRIMARY KEY AUTO_INCREMENT,
    loan_id INT NOT NULL,
    store_id INT DEFAULT 2,
    amount_paid DOUBLE DEFAULT 0,
    payment_date DATE,
    month VARCHAR(20),
    FOREIGN KEY (loan_id) REFERENCES loans(id) ON DELETE CASCADE
);

-- ============================================================
-- STORE 3 DATABASE
-- ============================================================
DROP DATABASE IF EXISTS db_store3;
CREATE DATABASE db_store3 CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE db_store3;

CREATE TABLE customers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(15),
    is_regular BOOLEAN DEFAULT FALSE,
    email VARCHAR(100),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DOUBLE NOT NULL,
    cost_price DOUBLE NOT NULL,
    stock INT DEFAULT 0,
    expiry_date DATE,
    store_id INT DEFAULT 3,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    total_amount DOUBLE NOT NULL,
    order_type VARCHAR(20) DEFAULT 'store',
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE SET NULL
);

CREATE TABLE order_items (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DOUBLE,
    FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE
);

CREATE TABLE workers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(15),
    role VARCHAR(50),
    store_id INT DEFAULT 3,
    salary DOUBLE DEFAULT 0,
    hire_date DATE
);

CREATE TABLE attendance (
    id INT PRIMARY KEY AUTO_INCREMENT,
    worker_id INT NOT NULL,
    date DATE NOT NULL,
    status VARCHAR(10) DEFAULT 'present',
    FOREIGN KEY (worker_id) REFERENCES workers(id) ON DELETE CASCADE
);

CREATE TABLE salaries (
    id INT PRIMARY KEY AUTO_INCREMENT,
    worker_id INT NOT NULL,
    store_id INT DEFAULT 3,
    basic_salary DOUBLE DEFAULT 0,
    bonus DOUBLE DEFAULT 0,
    total_salary DOUBLE DEFAULT 0,
    month VARCHAR(20),
    paid_date DATE,
    FOREIGN KEY (worker_id) REFERENCES workers(id) ON DELETE CASCADE
);

CREATE TABLE advertisements (
    id INT PRIMARY KEY AUTO_INCREMENT,
    store_id INT DEFAULT 3,
    type VARCHAR(50),
    amount DOUBLE DEFAULT 0,
    month VARCHAR(20),
    date DATE,
    platform VARCHAR(50),
    impressions INT DEFAULT 0,
    conversions INT DEFAULT 0
);

CREATE TABLE loans (
    id INT PRIMARY KEY AUTO_INCREMENT,
    store_id INT DEFAULT 3,
    total_loan DOUBLE NOT NULL,
    interest_rate DOUBLE DEFAULT 0,
    emi_amount DOUBLE DEFAULT 0,
    remaining_balance DOUBLE DEFAULT 0,
    start_date DATE,
    end_date DATE,
    lender VARCHAR(100),
    status VARCHAR(20) DEFAULT 'active'
);

CREATE TABLE loan_payments (
    id INT PRIMARY KEY AUTO_INCREMENT,
    loan_id INT NOT NULL,
    store_id INT DEFAULT 3,
    amount_paid DOUBLE DEFAULT 0,
    payment_date DATE,
    month VARCHAR(20),
    FOREIGN KEY (loan_id) REFERENCES loans(id) ON DELETE CASCADE
);

-- ============================================================
-- MASTER DATABASE (Analytics Engine)
-- ============================================================
DROP DATABASE IF EXISTS db_master;
CREATE DATABASE db_master CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE db_master;

CREATE TABLE ai_decisions (
    id INT PRIMARY KEY AUTO_INCREMENT,
    store_id INT,
    category VARCHAR(50),
    message TEXT,
    decision_type VARCHAR(30),
    alert_type VARCHAR(20) DEFAULT 'info',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE system_alerts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    store_id INT,
    alert_type VARCHAR(20),
    title VARCHAR(200),
    message TEXT,
    is_read BOOLEAN DEFAULT FALSE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE daily_reports (
    id INT PRIMARY KEY AUTO_INCREMENT,
    report_date DATE,
    store_id INT,
    total_revenue DOUBLE DEFAULT 0,
    total_orders INT DEFAULT 0,
    total_profit DOUBLE DEFAULT 0,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);
