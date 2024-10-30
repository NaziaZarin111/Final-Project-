-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 06, 2024 at 09:36 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pharmadbms`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `profession` varchar(10) DEFAULT NULL,
  `medical_history` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `name`, `email`, `phone_number`, `address`, `date_of_birth`, `gender`, `profession`, `medical_history`) VALUES
(1, 'Nisa', 'n@gmail.com', '01736948635', 'kalipara, Barishal', '2004-06-10', 'Female', 'student', 'Headache'),
(2, 'Rajib', 'ra@gmail.com', '016398125846', 'hilsha, khulna', '1992-08-15', 'Male', 'Fisherman', 'hypertension'),
(3, 'Marufa akter emu', 'ma2gmail.com', '01746534765743', 'kalibari Road, Barishal', '2002-04-08', 'Female', 'housewife', 'Hypothyroid');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `employee_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `hire_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`employee_id`, `name`, `email`, `phone`, `address`, `position`, `salary`, `hire_date`) VALUES
(1, 'Afnan', 'as@gmail.com', '0137642878754', 'kalibari road, Barishal', 'Admin and HR', 50000.00, '2023-04-24'),
(2, 'Kamrul', 'kk@gmail.com', '01376428333', 'Nathullabad, Barishal', 'salesman', 10000.00, '2024-05-19'),
(3, 'Opi', 'od@gmail.com', '0147634765247', 'Jhalokathi', 'Cleaner', 3000.00, '2024-04-08');

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `expense_id` int(11) NOT NULL,
  `expense_date` date DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`expense_id`, `expense_date`, `amount`, `description`, `category`) VALUES
(1, '2024-06-04', 2000.00, 'current bill', 'utilities'),
(2, '2024-06-03', 5000.00, 'New drug purchase', 'Purchases'),
(3, '2024-06-03', 20000.00, 'rent of kalibari branch store', 'Rent');

-- --------------------------------------------------------

--
-- Table structure for table `medications`
--

CREATE TABLE `medications` (
  `medication_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `barcode` varchar(50) DEFAULT NULL,
  `batch_number` varchar(50) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `unit_price` decimal(10,2) DEFAULT NULL,
  `expiry_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medications`
--

INSERT INTO `medications` (`medication_id`, `name`, `description`, `barcode`, `batch_number`, `supplier_id`, `unit_price`, `expiry_date`) VALUES
(1, 'Tufnil', 'Relieving the pain of migraine headache', '123456789', 'BATCH001', 1, 10.45, '2026-06-24'),
(2, 'Osartil', 'treatment of high bp', '366564', 'BATCH869', 2, 8.66, '2024-06-16'),
(3, 'Pantonix', 'Relief from stomach HCL', '54763975', 'BATCH65674', 3, 15.67, '2029-06-23'),
(4, 'Thyrox', 'Treatment for thyroid', '75634747', 'BATCH78957', 3, 5.00, '2029-06-30');

-- --------------------------------------------------------

--
-- Table structure for table `prescriptions`
--

CREATE TABLE `prescriptions` (
  `prescription_id` int(11) NOT NULL,
  `prescription_date` date NOT NULL,
  `customer_id` int(11) NOT NULL,
  `doctor_name` varchar(100) NOT NULL,
  `doctor_contact` varchar(20) NOT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `prescriptions`
--

INSERT INTO `prescriptions` (`prescription_id`, `prescription_date`, `customer_id`, `doctor_name`, `doctor_contact`, `notes`) VALUES
(1, '2024-04-01', 1, 'Dr.Asaduzzaman Khan', '0182647367354', 'take after meal 1+0+1'),
(2, '2024-05-14', 2, 'Dr. Monir Islam', '0174755745614', 'Take after meal 1+1+1'),
(3, '2024-05-30', 3, 'dr. Azizul haque', '01747557499', 'Take after meal 1+0+1');

-- --------------------------------------------------------

--
-- Table structure for table `prescription_items`
--

CREATE TABLE `prescription_items` (
  `prescription_item_id` int(11) NOT NULL,
  `prescription_id` int(11) DEFAULT NULL,
  `medication_id` int(11) DEFAULT NULL,
  `dosage` varchar(50) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `instructions` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `prescription_items`
--

INSERT INTO `prescription_items` (`prescription_item_id`, `prescription_id`, `medication_id`, `dosage`, `quantity`, `instructions`) VALUES
(1, 1, 1, '40mg', 30, 'Don\'t take before meal.'),
(2, 2, 2, '500mg', 29, 'Can be dangeraous if it is taken before meal. '),
(3, 3, 4, '20mg', 80, 'Take with food orally');

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `purchase_id` int(11) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `medication_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `cost_price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`purchase_id`, `supplier_id`, `medication_id`, `quantity`, `cost_price`) VALUES
(1, 1, 1, 700, 7000.00),
(2, 2, 2, 599, 40000.00),
(3, 3, 4, 2900, 8909.00);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `sale_id` int(11) NOT NULL,
  `sale_date` date NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`sale_id`, `sale_date`, `customer_id`, `total_amount`, `payment_method`) VALUES
(1, '2024-06-02', 1, 150.00, 'Nagad'),
(2, '2024-06-01', 2, 400.00, 'Bkash'),
(3, '2024-06-04', 3, 620.00, 'Cash');

-- --------------------------------------------------------

--
-- Table structure for table `shift_schedules`
--

CREATE TABLE `shift_schedules` (
  `shift_id` int(11) NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `shift_name` varchar(50) DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shift_schedules`
--

INSERT INTO `shift_schedules` (`shift_id`, `employee_id`, `shift_name`, `start_time`, `end_time`) VALUES
(1, 1, 'Day', '11:00:00', '04:00:00'),
(2, 2, 'night', '06:45:00', '12:45:00'),
(3, 3, 'Morning', '08:00:00', '09:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `store_branches`
--

CREATE TABLE `store_branches` (
  `branch_id` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `duration` varchar(20) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `store_branches`
--

INSERT INTO `store_branches` (`branch_id`, `address`, `phone_number`, `duration`, `employee_id`) VALUES
(1, 'Nathullabad,Barishal', '0163582647', '08am to 12am', 1),
(2, 'Kalibari road, Barishal', '017465342222', '08am to 12am', 3),
(3, 'Rupatoli, Barishal', '0146582346459', '8am to 12am', 2);

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `supplier_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `contact_person` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `license_number` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`supplier_id`, `name`, `contact_person`, `phone`, `email`, `address`, `license_number`) VALUES
(1, 'Eskayef Pharma Ltd.', 'Faruk Hossen', '+880190373382', 'fa@gmail.com', 'gazipur,Bangladesh.', 'LIC73698'),
(2, 'MedDistributors	', 'khairul bashar', '+880189897384', 'ka@gmail.com', 'munshiganj', 'LIC73611'),
(3, 'MedSupplyBD', 'Hadiuzzaman', '+8801687958678', 'ki@gmail.com', 'jhalokathi', 'LIC99976');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`employee_id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`expense_id`);

--
-- Indexes for table `medications`
--
ALTER TABLE `medications`
  ADD PRIMARY KEY (`medication_id`),
  ADD UNIQUE KEY `barcode` (`barcode`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Indexes for table `prescriptions`
--
ALTER TABLE `prescriptions`
  ADD PRIMARY KEY (`prescription_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `prescription_items`
--
ALTER TABLE `prescription_items`
  ADD PRIMARY KEY (`prescription_item_id`),
  ADD KEY `prescription_id` (`prescription_id`),
  ADD KEY `medication_id` (`medication_id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`purchase_id`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `medication_id` (`medication_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`sale_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `shift_schedules`
--
ALTER TABLE `shift_schedules`
  ADD PRIMARY KEY (`shift_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `store_branches`
--
ALTER TABLE `store_branches`
  ADD PRIMARY KEY (`branch_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`supplier_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `medications`
--
ALTER TABLE `medications`
  ADD CONSTRAINT `medications_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`supplier_id`);

--
-- Constraints for table `prescriptions`
--
ALTER TABLE `prescriptions`
  ADD CONSTRAINT `prescriptions_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`);

--
-- Constraints for table `prescription_items`
--
ALTER TABLE `prescription_items`
  ADD CONSTRAINT `prescription_items_ibfk_1` FOREIGN KEY (`prescription_id`) REFERENCES `prescriptions` (`prescription_id`),
  ADD CONSTRAINT `prescription_items_ibfk_2` FOREIGN KEY (`medication_id`) REFERENCES `medications` (`medication_id`);

--
-- Constraints for table `purchases`
--
ALTER TABLE `purchases`
  ADD CONSTRAINT `purchases_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`supplier_id`),
  ADD CONSTRAINT `purchases_ibfk_2` FOREIGN KEY (`medication_id`) REFERENCES `medications` (`medication_id`);

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`);

--
-- Constraints for table `shift_schedules`
--
ALTER TABLE `shift_schedules`
  ADD CONSTRAINT `shift_schedules_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`);

--
-- Constraints for table `store_branches`
--
ALTER TABLE `store_branches`
  ADD CONSTRAINT `store_branches_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
