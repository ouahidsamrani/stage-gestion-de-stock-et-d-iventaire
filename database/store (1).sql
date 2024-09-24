-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 23, 2024 at 12:29 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `store`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(11) NOT NULL,
  `brand_name` varchar(255) NOT NULL,
  `brand_active` int(11) NOT NULL DEFAULT 0,
  `brand_status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_name`, `brand_active`, `brand_status`) VALUES
(11, '21/2024', 1, 1),
(12, '100/2024', 2, 2),
(13, '07/2024', 1, 1),
(14, '100/2024', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `categories_id` int(11) NOT NULL,
  `categories_name` varchar(255) NOT NULL,
  `categories_active` int(11) NOT NULL DEFAULT 0,
  `categories_status` int(11) NOT NULL DEFAULT 0,
  `brand_id` int(20) NOT NULL,
  `categories_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categories_id`, `categories_name`, `categories_active`, `categories_status`, `brand_id`, `categories_date`) VALUES
(11, 'tv', 2, 1, 0, '0000-00-00'),
(12, 'smart phone', 1, 1, 13, '2024-07-18'),
(13, 'table', 2, 1, 14, '2024-07-20'),
(14, 'oo', 1, 1, 11, '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `client_name` varchar(255) NOT NULL,
  `client_contact` varchar(255) NOT NULL,
  `sub_total` varchar(255) NOT NULL,
  `vat` varchar(255) NOT NULL,
  `total_amount` varchar(255) NOT NULL,
  `discount` varchar(255) NOT NULL,
  `grand_total` varchar(255) NOT NULL,
  `paid` varchar(255) NOT NULL,
  `due` varchar(255) NOT NULL,
  `payment_type` int(11) NOT NULL,
  `payment_status` int(11) NOT NULL,
  `payment_place` int(11) NOT NULL,
  `gstn` varchar(255) NOT NULL,
  `order_status` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `order_date`, `client_name`, `client_contact`, `sub_total`, `vat`, `total_amount`, `discount`, `grand_total`, `paid`, `due`, `payment_type`, `payment_status`, `payment_place`, `gstn`, `order_status`, `user_id`, `product_id`) VALUES
(1, '2024-07-16', 'ouahidaaaaaa', '0666666', '111.00', '19.98', '130.98', '0', '130.98', '21', '109.98', 2, 2, 1, '5400.00', 1, 1, 0),
(2, '2024-07-15', 'fdd', '444444444', '3000.00', '540.00', '3540.00', '5', '3535.00', '4444', '-909.00', 1, 1, 2, '540.00', 1, 1, 0),
(3, '2024-07-17', 'ouahid', '0688529228', '400000.00', '72000.00', '472000.00', '20', '471980.00', '200000', '271980.00', 2, 3, 1, '72000.00', 1, 1, 0),
(4, '2024-07-10', 'rachid', '11111', '30000.00', '5400.00', '35400.00', '10', '35390.00', '10', '35380.00', 1, 1, 1, '5400.00', 2, 1, 0),
(5, '2024-07-17', 'mmm', '0999999', '4000.00', '720.00', '4720.00', '0', '4720.00', '10', '-10', 1, 2, 1, '720.00', 1, 1, 0),
(6, '2024-07-17', 'ksaldfj', '098', '4545.00', '818.10', '5363.10', '0', '5363.10', '10', '5353.10', 1, 1, 1, '818.10', 2, 1, 0),
(7, '2024-07-17', 'sadfkjasd', '00000', '4545.00', '818.10', '5363.10', '0', '5363.10', '12', '5351.10', 2, 2, 2, '818.10', 1, 1, 0),
(8, '2024-07-10', 'asdf', 'adsf', '4545.00', '818.10', '5363.10', '0', '5363.10', '0', '5363.10', 2, 2, 2, '818.10', 1, 1, 0),
(9, '2024-07-19', 'adfa', 'aaa', '400000.00', '72000.00', '472000.00', '32', '471968.00', '22', '471946.00', 1, 1, 1, '72000.00', 1, 1, 0),
(10, '2024-07-18', 'ouahid', '0688529228', '1110.00', '199.80', '1309.80', '0', '1309.80', '20', '1289.80', 3, 1, 2, '199.80', 1, 1, 0),
(11, '2024-07-19', 'asd', 'asd', '4545.00', '818.10', '5363.10', '11', '5352.10', '32', '5320.10', 2, 3, 2, '818.10', 1, 1, 0),
(12, '2024-07-19', 'sd', 'sd', '3000.00', '540.00', '3540.00', '32', '3508.00', '23', '3485.00', 3, 1, 2, '540.00', 1, 1, 0),
(13, '2024-07-12', 'af', 'af', '10000000.00', '1800000.00', '11800000.00', '23', '11799977.00', '23', '11799954.00', 1, 3, 1, '1800000.00', 1, 1, 0),
(14, '2024-07-20', 'oua', 'oua', '4000.00', '720.00', '4720.00', '23', '4697.00', '23', '4674.00', 1, 2, 1, '720.00', 1, 1, 0),
(15, '2024-07-19', 'qqqqqq', 'qqqqqq', '5000.00', '900.00', '5900.00', '32', '5868.00', '23', '5845.00', 1, 1, 1, '900.00', 1, 1, 1),
(16, '2024-07-19', 'gggggggggg', 'ggggggggggg', '5000.00', '900.00', '5900.00', '23', '5877.00', '3', '5874.00', 1, 2, 1, '900.00', 1, 1, 0),
(17, '2024-07-19', 'poiu', 'poiu', '5000.00', '900.00', '5900.00', '12', '5888.00', '12', '5876.00', 1, 1, 1, '900.00', 1, 1, 0),
(18, '2024-07-19', 'asdaaaa', 'sdsss', '4000.00', '720.00', '4720.00', '0', '4720.00', '0', '4720.00', 2, 3, 1, '720.00', 1, 1, 0),
(19, '2024-07-27', 'sd', 'asd', '4000.00', '720.00', '4720.00', '0', '4720.00', '0', '4720.00', 6, 6, 6, '720.00', 1, 1, 0),
(20, '2024-07-27', 'rachid', 'el', '4545.00', '818.10', '5363.10', '0', '5363.10', '0', '5363.10', 6, 6, 6, '818.10', 1, 1, 0),
(21, '2024-07-13', 'dd', 'dd', '4000.00', '720.00', '4720.00', '2', '4718.00', '2', '4716.00', 2, 1, 1, '720.00', 1, 1, 0),
(22, '2024-07-20', 'ss', 'ss', '5000.00', '900.00', '5900.00', '0', '5900.00', '0', '5900.00', 9, 9, 9, '900.00', 1, 1, 0),
(23, '2024-07-20', 'vv', 'vv', '4545.00', '818.10', '5363.10', '0', '5363.10', '0', '5363.10', 9, 9, 9, '818.10', 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `order_item`
--

CREATE TABLE `order_item` (
  `order_item_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL DEFAULT 0,
  `product_id` int(11) NOT NULL DEFAULT 0,
  `quantity` varchar(255) NOT NULL,
  `rate` varchar(255) NOT NULL,
  `total` varchar(255) NOT NULL,
  `order_item_status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `order_item`
--

INSERT INTO `order_item` (`order_item_id`, `order_id`, `product_id`, `quantity`, `rate`, `total`, `order_item_status`) VALUES
(2, 2, 1, '5', '3000', '3000.00', 1),
(3, 3, 3, '100', '4000', '400000.00', 1),
(4, 4, 1, '10', '3000', '30000.00', 2),
(5, 5, 3, '1', '4000', '4000.00', 1),
(6, 6, 2, '1', '4545', '4545.00', 2),
(7, 7, 2, '1', '4545', '4545.00', 1),
(8, 8, 2, '1', '4545', '4545.00', 1),
(9, 9, 3, '100', '4000', '400000.00', 1),
(10, 10, 4, '10', '111', '1110.00', 1),
(11, 11, 2, '1', '4545', '4545.00', 1),
(12, 12, 1, '1', '3000', '3000.00', 1),
(13, 13, 6, '1', '10000000', '10000000.00', 1),
(14, 14, 3, '1', '4000', '4000.00', 1),
(16, 1, 4, '1', '111', '111.00', 1),
(17, 15, 5, '1', '5000', '5000.00', 1),
(18, 16, 5, '1', '5000', '5000.00', 1),
(19, 17, 5, '1', '5000', '5000.00', 1),
(20, 18, 3, '1', '4000', '4000.00', 1),
(21, 19, 3, '1', '4000', '4000.00', 1),
(22, 20, 2, '1', '4545', '4545.00', 1),
(23, 21, 3, '1', '4000', '4000.00', 1),
(24, 22, 5, '1', '5000', '5000.00', 1),
(25, 23, 2, '1', '4545', '4545.00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_image` text NOT NULL,
  `brand_id` int(11) NOT NULL,
  `categories_id` int(11) NOT NULL,
  `quantity` varchar(255) NOT NULL,
  `rate` varchar(255) NOT NULL,
  `active` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `product_image`, `brand_id`, `categories_id`, `quantity`, `rate`, `active`, `status`) VALUES
(1, 'tv', '../assests/images/stock/1209653559669665687cb91.jpg', 1, 1, '-6', '3000', 1, 1),
(2, 'hgh', '../assests/images/stock/798489172669667df2470e.jpg', 1, 1, '5549', '4545', 1, 1),
(3, 'calander', '../assests/images/stock/12845512876696d830a4e9f.jpg', 1, 1, '95', '4000', 1, 1),
(4, 'sds', '../assests/images/stock/895554426696ee2b1fb1a.jpg', 4, 1, '32', '111', 1, 1),
(5, 'montant', '../assests/images/stock/105328097066979c018e14b.jpg', 13, 6, '26', '5000', 1, 1),
(6, 'ad', '../assests/images/stock/18421582826697b8648b83a.jpg', 13, 5, '19999', '10000000', 1, 1),
(7, 'iphone17', '../assests/images/stock/72877054669a414b4b8b5.jpg', 13, 11, '10', '0', 1, 1),
(8, 'LG', '../assests/images/stock/1460736547669a4275d77e7.jpg', 13, 12, '10', '0', 2, 1),
(9, 'qq', '../assests/images/stock/1373152154669a46c695e81.jpg', 13, 12, '10', '0', 1, 1),
(10, 'id', '../assests/images/stock/2130634728669a47aa397ca.jpg', 11, 12, '11', '0', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `email`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', ''),
(11, 'ouahid', 'ouahid', 'ouahidsamrani@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categories_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `order_item`
--
ALTER TABLE `order_item`
  ADD PRIMARY KEY (`order_item_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `categories_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `order_item`
--
ALTER TABLE `order_item`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
