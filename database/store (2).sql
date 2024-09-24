-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 26, 2024 at 12:49 PM
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
(17, '01/2024', 1, 1),
(18, '02/2024', 1, 1),
(19, '03/2024', 2, 1);

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
(27, 'smart phone', 1, 1, 0, '1970-01-01'),
(28, 'tv smpart', 1, 1, 17, '2024-07-17'),
(29, 'smart phone', 1, 1, 0, '2024-07-15'),
(30, 'tableau', 2, 1, 18, '2024-07-23');

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
(26, '2024-07-18', 'as', 'as', '4000.00', '720.00', '4720.00', '0', '4720.00', '0', '4720.00', 1, 1, 1, '720.00', 2, 1, 0),
(27, '2024-07-10', 'lksalkd', 'ls', '3000.00', '540.00', '3540.00', '0', '3540.00', '34', '3506.00', 1, 2, 1, '540.00', 2, 1, 0),
(28, '2024-07-01', 'll', ';;', '4000.00', '720.00', '4720.00', '0', '4720.00', '9', '4711.00', 2, 2, 1, '720.00', 2, 1, 0),
(29, '2024-07-01', 'll', ';;', '4000.00', '720.00', '4720.00', '0', '4720.00', '9', '4711.00', 2, 2, 1, '720.00', 2, 1, 0),
(30, '2024-07-01', 'll', 'll', '4000.00', '720.00', '4720.00', '0', '4720.00', '9', '4711.00', 2, 2, 1, '720.00', 2, 1, 0),
(31, '2024-07-01', 'll', 'll', '4000.00', '720.00', '4720.00', '0', '4720.00', '9', '4711.00', 2, 2, 1, '720.00', 2, 1, 0),
(32, '2024-07-01', 'll', 'll', '4000.00', '720.00', '4720.00', '0', '4720.00', '9', '4711.00', 2, 2, 1, '720.00', 2, 1, 0),
(33, '2024-07-10', '3', '3', '111.00', '19.98', '130.98', '0', '130.98', '0', '130.98', 2, 1, 1, '19.98', 2, 1, 0),
(34, '2024-07-01', '0', '0', '5000.00', '900.00', '5900.00', '0', '5900.00', '0', '5900.00', 1, 1, 1, '900.00', 2, 1, 0),
(35, '2024-07-02', 'q', 'q', '4000.00', '720.00', '4720.00', '0', '4720.00', '0', '4720.00', 9, 9, 9, '720.00', 2, 1, 0),
(36, '2024-07-14', 'l', 'l', '4000.00', '720.00', '4720.00', '0', '4720.00', '0', '4720.00', 9, 9, 9, '720.00', 2, 1, 0),
(37, '2024-07-01', 'ouahid', '06', '5000.00', '900.00', '5900.00', '0', '5900.00', '0', '5900.00', 9, 9, 9, '900.00', 1, 1, 0),
(38, '2024-07-19', 'ahmad el', '00', '0.00', '0.00', '0.00', '0', '0.00', '0', '0.00', 9, 9, 9, '0.00', 1, 1, 0),
(39, '2024-07-17', 'ouahid samrani', '066666666', '0.00', '0.00', '0.00', '0', '0.00', '0', '0.00', 9, 9, 9, '0.00', 1, 1, 0);

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
(16, 1, 4, '1', '111', '111.00', 2),
(17, 15, 5, '1', '5000', '5000.00', 1),
(18, 16, 5, '1', '5000', '5000.00', 1),
(19, 17, 5, '1', '5000', '5000.00', 1),
(20, 18, 3, '1', '4000', '4000.00', 1),
(21, 19, 3, '1', '4000', '4000.00', 1),
(22, 20, 2, '1', '4545', '4545.00', 1),
(23, 21, 3, '1', '4000', '4000.00', 1),
(24, 22, 5, '1', '5000', '5000.00', 1),
(25, 23, 2, '1', '4545', '4545.00', 1),
(26, 24, 3, '1', '4000', '4000.00', 1),
(27, 25, 5, '1', '5000', '5000.00', 1),
(28, 26, 3, '1', '4000', '4000.00', 2),
(29, 27, 1, '1', '3000', '3000.00', 2),
(30, 28, 3, '1', '', '4000.00', 2),
(31, 29, 3, '1', '', '4000.00', 2),
(32, 30, 3, '1', '', '4000.00', 2),
(33, 31, 3, '1', '', '4000.00', 2),
(34, 32, 3, '1', '', '4000.00', 2),
(35, 33, 4, '1', '111', '111.00', 2),
(36, 34, 5, '1', '5000', '5000.00', 2),
(37, 35, 3, '1', '4000', '4000.00', 2),
(38, 36, 3, '1', '4000', '4000.00', 2),
(39, 37, 5, '1', '5000', '5000.00', 1),
(40, 38, 16, '10', '0', '0.00', 1),
(41, 39, 15, '1', '0', '0.00', 1);

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
(15, 'iphone', '../assests/images/stock/default_image.jpg', 18, 27, '9', '0', 1, 1),
(16, 'LG', '../assests/images/stock/default_image.jpg', 18, 28, '12', '0', 2, 1),
(17, 'dell', '../assests/images/stock/default_image.jpg', 18, 28, '20', '0', 1, 1);

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
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `categories_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `order_item`
--
ALTER TABLE `order_item`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
