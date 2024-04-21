-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 21, 2024 at 03:06 PM
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
-- Database: `lb_pdo_goods`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `ID_Category` int(8) NOT NULL,
  `c_name` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`ID_Category`, `c_name`) VALUES
(1, 'Videocard'),
(2, 'CPU'),
(3, 'Display'),
(4, 'Memory'),
(5, 'Storage');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `ID_Items` int(16) NOT NULL,
  `name` varchar(16) NOT NULL,
  `price` int(16) NOT NULL,
  `quantity` int(16) NOT NULL,
  `quality` int(16) NOT NULL,
  `FID_Vendor` int(16) NOT NULL,
  `FID_Category` int(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`ID_Items`, `name`, `price`, `quantity`, `quality`, `FID_Vendor`, `FID_Category`) VALUES
(1, 'Монитор 22\"', 1500, 15, 5, 1, 3),
(2, 'Монитор 17\"', 1200, 20, 4, 3, 3),
(3, 'GeForce 660M', 2000, 12, 4, 4, 1),
(4, 'Radeon R9', 2500, 7, 5, 5, 1),
(5, 'Core i7', 3000, 10, 5, 4, 2),
(6, 'FX-6300', 2700, 15, 4, 5, 2),
(7, 'RAM 8GB', 1500, 11, 5, 2, 4),
(8, 'RAM 4GB', 1000, 15, 4, 3, 4),
(9, 'GeForce RTX 3080', 4000, 8, 5, 4, 1),
(10, 'Radeon RX 6800 X', 4500, 6, 5, 5, 1),
(11, 'Core i9', 5000, 7, 5, 4, 2),
(12, 'Ryzen 9 5900X', 4700, 10, 5, 5, 2),
(13, 'RAM 16GB', 2000, 9, 5, 3, 4),
(14, 'RAM 32GB', 3500, 5, 5, 2, 4),
(15, 'SSD 1TB', 2500, 12, 5, 3, 5),
(16, 'SSD 512GB', 1500, 20, 5, 3, 5),
(17, 'HDD 1TB', 1000, 15, 4, 6, 5),
(18, 'SSD 2TB', 3000, 10, 5, 3, 5),
(19, 'HDD 2TB', 1500, 12, 4, 7, 5);

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE `vendors` (
  `ID_Vendors` int(8) NOT NULL,
  `v_name` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`ID_Vendors`, `v_name`) VALUES
(1, 'LG'),
(2, 'ASUS'),
(3, 'Samsung'),
(4, 'Intel'),
(5, 'AMD'),
(6, 'Western Digital'),
(7, 'Seagate');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`ID_Category`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`ID_Items`),
  ADD KEY `fk_vendor` (`FID_Vendor`),
  ADD KEY `fk_category` (`FID_Category`);

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`ID_Vendors`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `fk_category` FOREIGN KEY (`FID_Category`) REFERENCES `category` (`ID_Category`),
  ADD CONSTRAINT `fk_vendor` FOREIGN KEY (`FID_Vendor`) REFERENCES `vendors` (`ID_Vendors`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
