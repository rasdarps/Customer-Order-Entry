-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 30, 2023 at 01:23 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `adv_dbase_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customerNo` int(11) NOT NULL,
  `customerName` varchar(20) NOT NULL,
  `customerStreet` varchar(50) DEFAULT NULL,
  `customerCity` varchar(20) DEFAULT NULL,
  `customerState` varchar(20) DEFAULT NULL,
  `customerZipCode` varchar(20) DEFAULT NULL,
  `custTelNo` varchar(15) NOT NULL,
  `custFaxNo` varchar(15) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `maritalStatus` enum('single','married','widow','widower','divorced') DEFAULT NULL,
  `creditRating` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customerNo`, `customerName`, `customerStreet`, `customerCity`, `customerState`, `customerZipCode`, `custTelNo`, `custFaxNo`, `DOB`, `maritalStatus`, `creditRating`) VALUES
(1, 'Kofi Manu', '4th Street Pine Aven', 'Ridge', 'Accra', '2334', '0504987876', '0248987509', '1980-12-03', 'married', '4'),
(2, 'Ada Mansa', '5th Street Adum', 'Adum', 'Kumasi', '334', '0504965876', '0348987509', '1990-10-23', 'married', '5'),
(3, 'Ataa Adwoa', '7th Street Takoradi', 'Takoradi', 'Secondi/Takoradi', '98', '0544987876', '0508987509', '1995-05-06', 'single', '3');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employeeNo` int(11) NOT NULL,
  `title` varchar(20) DEFAULT NULL,
  `firstName` varchar(20) NOT NULL,
  `middleName` varchar(20) DEFAULT NULL,
  `lastName` varchar(20) NOT NULL,
  `address` varchar(50) DEFAULT NULL,
  `workTelExt` varchar(15) NOT NULL,
  `homeTelNo` varchar(15) DEFAULT NULL,
  `empEmailAddress` varchar(20) DEFAULT NULL,
  `socialSecurityNumber` varchar(20) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `position` varchar(20) DEFAULT NULL,
  `sex` enum('male','female') NOT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `dateStarted` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employeeNo`, `title`, `firstName`, `middleName`, `lastName`, `address`, `workTelExt`, `homeTelNo`, `empEmailAddress`, `socialSecurityNumber`, `DOB`, `position`, `sex`, `salary`, `dateStarted`) VALUES
(1, 'Mr', 'Seth', 'Kofi', 'Mensah', 'P O Box ks 4508, Adum-Kumasi', '0509878765', '0320987676', 'kofi@test.com', '9098787656', '1970-06-13', 'Sales Officer', 'male', '4000.00', '2020-03-12'),
(2, 'Mrs', 'Mercy', 'Adwoa', 'Mansah', 'P O Box ks 308, Sunyani', '0309878765', '0420987676', 'mercy@test.com', '5558787656', '1979-10-17', 'Sales Officer', 'female', '3500.00', '2021-05-09'),
(3, 'Miss', 'Rhoda', 'Naa', 'Adawaa', 'P O Box ks 508, Ridge- Accra', '0209878765', '0520987676', 'naa@test.com', '7654787656', '1990-06-09', 'Sales Officer', 'female', '4000.00', '2022-12-16');

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `invoiceNo` int(11) NOT NULL,
  `dateRaised` date NOT NULL,
  `datePaid` date DEFAULT NULL,
  `creditCardNo` varchar(20) DEFAULT NULL,
  `holdersName` varchar(50) DEFAULT NULL,
  `expiryDate` date DEFAULT NULL,
  `orderNo` int(11) NOT NULL,
  `pMethodNo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`invoiceNo`, `dateRaised`, `datePaid`, `creditCardNo`, `holdersName`, `expiryDate`, `orderNo`, `pMethodNo`) VALUES
(1, '2023-03-30', '2023-03-30', '9087876564', 'Emmanuel Mensah', '2025-09-25', 1, 3),
(2, '2023-03-30', '2023-03-30', '1437876590', 'John Doe', '2024-04-24', 1, 3),
(3, '2023-03-30', '2023-03-30', '4567876587', 'Emmanuel Mensah', '2023-12-25', 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `orderdetail`
--

CREATE TABLE `orderdetail` (
  `orderdetailNo` int(11) NOT NULL,
  `orderNo` int(11) NOT NULL,
  `productNo` int(11) NOT NULL,
  `quantityOrdered` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orderdetail`
--

INSERT INTO `orderdetail` (`orderdetailNo`, `orderNo`, `productNo`, `quantityOrdered`) VALUES
(1, 1, 2, 5),
(2, 2, 3, 5),
(3, 3, 1, 5);

--
-- Triggers `orderdetail`
--
DELIMITER $$
CREATE TRIGGER `QuantityUpdate` AFTER INSERT ON `orderdetail` FOR EACH ROW UPDATE product
SET product.quantityOnHand = Product.quantityOnHand - New.quantityOrdered 
WHERE product.productNo = New.productNo
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `check_quantity_on_order` BEFORE INSERT ON `orderdetail` FOR EACH ROW BEGIN 
    DECLARE quantity_on_hand INT; 
    SELECT quantityOnHand INTO quantity_on_hand 
    FROM product 
    WHERE productNo = NEW.productNo; 

    IF NEW.quantityOrdered > quantity_on_hand THEN 
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Order quantity exceeds the quantity on hand'; 
    END IF; 
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderNo` int(11) NOT NULL,
  `orderDate` date NOT NULL,
  `billingStreet` varchar(50) DEFAULT NULL,
  `billingCity` varchar(20) DEFAULT NULL,
  `billingState` varchar(20) DEFAULT NULL,
  `billingZipCode` varchar(20) DEFAULT NULL,
  `promisedDate` date DEFAULT NULL,
  `status` enum('processing','delivered') DEFAULT NULL,
  `customerNo` int(11) NOT NULL,
  `employeeNo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orderNo`, `orderDate`, `billingStreet`, `billingCity`, `billingState`, `billingZipCode`, `promisedDate`, `status`, `customerNo`, `employeeNo`) VALUES
(1, '2023-03-30', '3rd street, Kotobabi', 'Kotobabi', 'Accra', '3344', '2023-03-25', 'processing', 1, 1),
(2, '2023-03-30', '2nd street', 'Adum', 'Kumasi', '7844', '2023-03-26', 'processing', 2, 2),
(3, '2023-03-30', '7th street', 'Secondi', 'Takoradi', '6544', '2023-03-29', 'processing', 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `paymentmethod`
--

CREATE TABLE `paymentmethod` (
  `pMethodNo` int(11) NOT NULL,
  `paymentMethod` enum('cash','check','credit card') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `paymentmethod`
--

INSERT INTO `paymentmethod` (`pMethodNo`, `paymentMethod`) VALUES
(1, 'cash'),
(2, 'check'),
(3, 'credit card');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `productNo` int(11) NOT NULL,
  `productName` varchar(50) NOT NULL,
  `serialNo` varchar(20) NOT NULL,
  `unitPrice` decimal(10,2) NOT NULL,
  `quantityOnHand` int(11) DEFAULT 0,
  `reorderLevel` int(11) DEFAULT NULL,
  `reorderQuantity` int(11) DEFAULT NULL,
  `reorderLeadTime` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`productNo`, `productName`, `serialNo`, `unitPrice`, `quantityOnHand`, `reorderLevel`, `reorderQuantity`, `reorderLeadTime`) VALUES
(1, 'HP Laptop i5', 'hp1234256', '4000.00', 10, 5, 10, '5 days'),
(2, 'Dell Laptop i3', 'del1234986', '3000.00', 10, 5, 10, '5 days'),
(3, 'Lenovo Laptop i7', 'len1774256', '6000.00', 10, 5, 10, '5 days');

-- --------------------------------------------------------

--
-- Table structure for table `shipment`
--

CREATE TABLE `shipment` (
  `shipmentNo` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `shipmentDate` date NOT NULL,
  `completeStatus` enum('pending','partial','shipped') NOT NULL,
  `orderNo` int(11) NOT NULL,
  `productNo` int(11) NOT NULL,
  `employeeNo` int(11) NOT NULL,
  `sMethodNo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shipment`
--

INSERT INTO `shipment` (`shipmentNo`, `quantity`, `shipmentDate`, `completeStatus`, `orderNo`, `productNo`, `employeeNo`, `sMethodNo`) VALUES
(1, 5, '2023-03-30', 'shipped', 1, 1, 1, 3),
(2, 5, '2023-03-30', 'shipped', 2, 2, 2, 1),
(3, 5, '2023-03-30', 'shipped', 3, 3, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `shipmentmethod`
--

CREATE TABLE `shipmentmethod` (
  `sMethodNo` int(11) NOT NULL,
  `shipmentMethod` enum('air','land','sea') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shipmentmethod`
--

INSERT INTO `shipmentmethod` (`sMethodNo`, `shipmentMethod`) VALUES
(1, 'air'),
(2, 'sea'),
(3, 'land');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customerNo`),
  ADD UNIQUE KEY `custTelNo` (`custTelNo`),
  ADD UNIQUE KEY `custFaxNo` (`custFaxNo`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employeeNo`),
  ADD UNIQUE KEY `workTelExt` (`workTelExt`),
  ADD UNIQUE KEY `homeTelNo` (`homeTelNo`),
  ADD UNIQUE KEY `empEmailAddress` (`empEmailAddress`),
  ADD UNIQUE KEY `socialSecurityNumber` (`socialSecurityNumber`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoiceNo`),
  ADD KEY `orderNo` (`orderNo`),
  ADD KEY `pMethodNo` (`pMethodNo`);

--
-- Indexes for table `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD PRIMARY KEY (`orderdetailNo`),
  ADD KEY `orderNo` (`orderNo`),
  ADD KEY `productNo` (`productNo`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderNo`),
  ADD KEY `customerNo` (`customerNo`),
  ADD KEY `employeeNo` (`employeeNo`);

--
-- Indexes for table `paymentmethod`
--
ALTER TABLE `paymentmethod`
  ADD PRIMARY KEY (`pMethodNo`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`productNo`),
  ADD UNIQUE KEY `productName` (`productName`),
  ADD UNIQUE KEY `serialNo` (`serialNo`);

--
-- Indexes for table `shipment`
--
ALTER TABLE `shipment`
  ADD PRIMARY KEY (`shipmentNo`),
  ADD KEY `orderNo` (`orderNo`),
  ADD KEY `productNo` (`productNo`),
  ADD KEY `employeeNo` (`employeeNo`),
  ADD KEY `sMethodNo` (`sMethodNo`);

--
-- Indexes for table `shipmentmethod`
--
ALTER TABLE `shipmentmethod`
  ADD PRIMARY KEY (`sMethodNo`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customerNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `employeeNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `invoiceNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orderdetail`
--
ALTER TABLE `orderdetail`
  MODIFY `orderdetailNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orderNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `paymentmethod`
--
ALTER TABLE `paymentmethod`
  MODIFY `pMethodNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `productNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `shipment`
--
ALTER TABLE `shipment`
  MODIFY `shipmentNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `shipmentmethod`
--
ALTER TABLE `shipmentmethod`
  MODIFY `sMethodNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`orderNo`) REFERENCES `orders` (`orderNo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `invoice_ibfk_2` FOREIGN KEY (`pMethodNo`) REFERENCES `paymentmethod` (`pMethodNo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD CONSTRAINT `orderdetail_ibfk_1` FOREIGN KEY (`orderNo`) REFERENCES `orders` (`orderNo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orderdetail_ibfk_2` FOREIGN KEY (`productNo`) REFERENCES `product` (`productNo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customerNo`) REFERENCES `customer` (`customerNo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`employeeNo`) REFERENCES `employee` (`employeeNo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shipment`
--
ALTER TABLE `shipment`
  ADD CONSTRAINT `shipment_ibfk_1` FOREIGN KEY (`orderNo`) REFERENCES `orders` (`orderNo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `shipment_ibfk_2` FOREIGN KEY (`productNo`) REFERENCES `product` (`productNo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `shipment_ibfk_3` FOREIGN KEY (`employeeNo`) REFERENCES `employee` (`employeeNo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `shipment_ibfk_4` FOREIGN KEY (`sMethodNo`) REFERENCES `shipmentmethod` (`sMethodNo`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
