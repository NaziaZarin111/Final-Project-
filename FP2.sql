---Pharmaceutical Database Management System (pharmadbms)
--- Joya Prova Bose

CREATE DATABASE pharmadbms;

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    phone_number VARCHAR(20),
    address VARCHAR(255),
    date_of_birth DATE,
    gender VARCHAR(10),
	profession VARCHAR(10),
    medical_history TEXT
);

CREATE TABLE Suppliers (
    supplier_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    contact_person VARCHAR(50),
    phone VARCHAR(20),
    email VARCHAR(100),
    address VARCHAR(255),
    license_number VARCHAR(50)
);

CREATE TABLE Medications (
    medication_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
	barcode VARCHAR(50) UNIQUE,
	batch_number VARCHAR(50),
    supplier_id INT,
    unit_price DECIMAL(10, 2),
    expiry_date DATE,
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id)
);


CREATE TABLE Prescriptions (
    prescription_id INT PRIMARY KEY,
    prescription_date DATE NOT NULL,
    customer_id INT NOT NULL ,
    doctor_name VARCHAR(100) NOT NULL,
    doctor_contact VARCHAR(20) NOT NULL,
    notes TEXT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Prescription_Items (
    prescription_item_id INT PRIMARY KEY,
    prescription_id INT,
    medication_id INT,
    dosage VARCHAR(50),
    quantity INT,
    instructions TEXT,
    FOREIGN KEY (prescription_id) REFERENCES Prescriptions(prescription_id),
    FOREIGN KEY (medication_id) REFERENCES Medications(medication_id)
);

CREATE TABLE Sales (
    sale_id INT PRIMARY KEY,
    sale_date DATE NOT NULL,
    customer_id INT,
    total_amount DECIMAL(10, 2),
    payment_method VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
	);

CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(20),
    address VARCHAR(255),
    position VARCHAR(50),
    salary DECIMAL(10, 2),
    hire_date DATE
);	

CREATE TABLE Shift_Schedules (
    shift_id INT PRIMARY KEY,
    employee_id INT,
	shift_name VARCHAR(50),
    start_time TIME,
    end_time TIME,
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);

CREATE TABLE Store_branches (
    store_id INT PRIMARY KEY,
    address VARCHAR(255),
    phone_number VARCHAR(20),
	duration VARCHAR(20),
    employee_id INT,
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);

CREATE TABLE Purchases (
    purchase_id INT PRIMARY KEY,
	supplier_id INT,
    medication_id INT,
    quantity INT,
    cost_price DECIMAL(10, 2),
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id),
    FOREIGN KEY (medication_id) REFERENCES Medications(medication_id)
);

CREATE TABLE Expenses (
    expense_id INT PRIMARY KEY,
    expense_date DATE,
    amount DECIMAL(10, 2),
    description TEXT,
    category VARCHAR(50)
);

INSERT INTO `customers` (`customer_id`, `name`, `email`, `phone_number`, `address`, `date_of_birth`, `gender`, `profession`, `medical_history`) 
VALUES ('1', 'Nisa', 'n@gmail.com', '01736948635', 'kalipara, Barishal', '2004-06-10', 'Female', 'student', 'Headache');

INSERT INTO `suppliers` (`supplier_id`, `name`, `contact_person`, `phone`, `email`, `address`, `license_number`)
 VALUES ('1', 'Eskayef Pharma Ltd.', 'Faruk Hossen', '+880190373382', 'fa@gmail.com', 'gazipur,Bangladesh.', 'LIC73698');
 
INSERT INTO `medications` (`medication_id`, `name`, `description`, `barcode`, `batch_number`, `supplier_id`, `unit_price`, `expiry_date`) 
VALUES ('1', 'Tufnil', 'Relieving the pain of migraine headache', '123456789', 'BATCH001', '1', '10.45', '2026-06-24');

INSERT INTO `prescriptions` (`prescription_id`, `prescription_date`, `customer_id`, `doctor_name`, `doctor_contact`, `notes`)
 VALUES ('1', '2024-04-01', '1', 'Dr.Asaduzzaman Khan', '0182647367354', 'take after meal 1+0+1');
 
 INSERT INTO `prescription_items` (`prescription_item_id`, `prescription_id`, `medication_id`, `dosage`, `quantity`, `instructions`)
 VALUES ('1', '1', '1', '40mg', '30', 'Don't take before meal.');
 
 INSERT INTO `sales` (`sale_id`, `sale_date`, `customer_id`, `total_amount`, `payment_method`)
 VALUES ('1', '2024-06-02', '1', '150', 'Nagad');
 
 INSERT INTO `purchases` (`purchase_id`, `supplier_id`, `medication_id`, `quantity`, `cost_price`) 
 VALUES ('1', '1', '1', '700', '7000');
 
INSERT INTO `employees` (`employee_id`, `name`, `email`, `phone`, `address`, `position`, `salary`, `hire_date`) 
VALUES ('1', 'Afnan', 'as@gmail.com', '0137642878754', 'kalibari road, Barishal', 'Admin and HR', '50000', '2023-04-24'); 

INSERT INTO `shift_schedules` (`shift_id`, `employee_id`, `shift_name`, `start_time`, `end_time`) 
VALUES ('1', '1', 'Day', '11:00:00', '04:00:00');

INSERT INTO `store_branches` (`branch_id`, `address`, `phone_number`, `duration`, `employee_id`) 
VALUES ('1', 'Nathullabad,Barishal', '0163582647', '08am to 12am', '1');

INSERT INTO `expenses` (`expense_id`, `expense_date`, `amount`, `description`, `category`) 
VALUES ('1', '2024-06-04', '2000', 'current bill', 'utilities');

