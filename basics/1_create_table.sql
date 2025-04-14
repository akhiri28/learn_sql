CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    country VARCHAR(50)
);

INSERT INTO customers (customer_id, customer_name, city, country) VALUES
(1, 'Alice Johnson', 'New York', 'USA'),
(2, 'Bob Smith', 'Los Angeles', 'USA'),
(3, 'Charlie Brown', 'London', 'UK'),
(4, 'David White', 'Berlin', 'Germany'),
(5, 'Emma Davis', 'Paris', 'France'),
(6, 'Frank Wilson', 'Toronto', 'Canada'),
(7, 'Grace Adams', 'Sydney', 'Australia'),
(8, 'Henry Clark', 'Dubai', 'UAE'),
(9, 'Ivy Lewis', 'Rome', 'Italy'),
(10, 'Jack Miller', 'Madrid', 'Spain'),
(11, 'Kathy Evans', 'Amsterdam', 'Netherlands'),
(12, 'Leo Scott', 'Tokyo', 'Japan'),
(13, 'Mia Turner', 'Seoul', 'South Korea'),
(14, 'Noah Carter', 'Mexico City', 'Mexico'),
(15, 'Olivia Parker', 'São Paulo', 'Brazil'),
(16, 'Paul Harris', 'Mumbai', 'India'),
(17, 'Quinn Mitchell', 'Singapore', 'Singapore'),
(18, 'Rachel Nelson', 'Cairo', 'Egypt'),
(19, 'Samuel Wright', 'Johannesburg', 'South Africa'),
(20, 'Tina Baker', 'Moscow', 'Russia');


CREATE TABLE suppliers (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(100),
    city VARCHAR(50),
    country VARCHAR(50)
);

INSERT INTO suppliers (supplier_id, supplier_name, city, country) VALUES
(101, 'TechWorld Ltd.', 'San Francisco', 'USA'),
(102, 'Gadgets Inc.', 'London', 'UK'),
(103, 'ElectroSupplies', 'Berlin', 'Germany'),
(104, 'Smart Devices', 'Paris', 'France'),
(105, 'FastElectronics', 'Toronto', 'Canada'),
(106, 'VisionTech', 'Sydney', 'Australia'),
(107, 'Infinity Gadgets', 'Dubai', 'UAE'),
(108, 'MegaTech', 'Rome', 'Italy'),
(109, 'Digital Solutions', 'Madrid', 'Spain'),
(110, 'Cloud Electronics', 'Amsterdam', 'Netherlands'),
(111, 'TokyoTech', 'Tokyo', 'Japan'),
(112, 'Seoul Innovations', 'Seoul', 'South Korea'),
(113, 'Mexico Gadgets', 'Mexico City', 'Mexico'),
(114, 'Brazil Tech', 'São Paulo', 'Brazil'),
(115, 'India Smart Devices', 'Mumbai', 'India'),
(116, 'Singapore Electronics', 'Singapore', 'Singapore'),
(117, 'Cairo Tech', 'Cairo', 'Egypt'),
(118, 'SA Electronics', 'Johannesburg', 'South Africa'),
(119, 'Moscow Devices', 'Moscow', 'Russia'),
(120, 'Global Electronics', 'New York', 'USA');

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    supplier_id INT,
    price DECIMAL(10,2),
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
);

INSERT INTO products (product_id, product_name, supplier_id, price) VALUES
(201, 'Laptop', 101, 1200.00),
(202, 'Smartphone', 102, 800.00),
(203, 'Tablet', 103, 500.00),
(204, 'Smartwatch', 104, 300.00),
(205, 'Headphones', 105, 150.00),
(206, 'Gaming Console', 106, 600.00),
(207, 'Camera', 107, 900.00),
(208, 'Printer', 108, 200.00),
(209, 'Monitor', 109, 250.00),
(210, 'Keyboard', 110, 100.00),
(211, 'Mouse', 111, 50.00),
(212, 'Router', 112, 120.00),
(213, 'External Hard Drive', 113, 150.00),
(214, 'Wireless Speaker', 114, 180.00),
(215, 'Fitness Tracker', 115, 220.00),
(216, 'VR Headset', 116, 500.00),
(217, 'Drone', 117, 1000.00),
(218, 'Smart TV', 118, 1100.00),
(219, 'Projector', 119, 700.00),
(220, 'Graphics Card', 120, 800.00);


CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    order_date DATE,
    quantity INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity) VALUES
(301, 1, 201, '2024-03-01', 1),
(302, 2, 202, '2024-03-05', 2),
(303, 3, 203, '2024-03-10', 1),
(304, 4, 204, '2024-03-15', 1),
(305, 5, 205, '2024-03-20', 3),
(306, 6, 206, '2024-03-25', 1),
(307, 7, 207, '2024-03-30', 2),
(308, 8, 208, '2024-04-01', 1),
(309, 9, 209, '2024-04-05', 1),
(310, 10, 210, '2024-04-10', 4),
(311, 11, 211, '2024-04-15', 5),
(312, 12, 212, '2024-04-20', 1),
(313, 13, 213, '2024-04-25', 2),
(314, 14, 214, '2024-04-30', 1),
(315, 15, 215, '2024-05-05', 3),
(316, 16, 216, '2024-05-10', 1),
(317, 17, 217, '2024-05-15', 1),
(318, 18, 218, '2024-05-20', 2),
(319, 19, 219, '2024-05-25', 1),
(320, 20, 220, '2024-05-30', 1);
