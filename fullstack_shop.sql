-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 22, 2025 at 01:12 PM
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
-- Database: `fullstack_shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `code` varchar(40) NOT NULL,
  `order_date` date NOT NULL,
  `customer_name` varchar(120) NOT NULL,
  `status` enum('DRAFT','PAID','CANCELLED') NOT NULL DEFAULT 'DRAFT',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `code`, `order_date`, `customer_name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'ORD-2025-001', '2025-10-15', 'Andi', 'PAID', '2025-10-19 08:47:22', '2025-10-19 08:47:22'),
(2, 'ORD-2025-002', '2025-10-16', 'Budi', 'PAID', '2025-10-19 08:47:22', '2025-10-19 08:47:22'),
(3, 'ORD-2025-003', '2025-10-17', 'Citra', 'DRAFT', '2025-10-19 08:47:22', '2025-10-19 08:47:22'),
(4, 'ORD-2025-004', '2025-10-18', 'Dewi', 'PAID', '2025-10-19 08:47:22', '2025-10-19 08:47:22'),
(5, 'ORD-2025-005', '2025-10-19', 'Eka', 'CANCELLED', '2025-10-19 08:47:22', '2025-10-19 08:47:22');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL DEFAULT 1,
  `price` decimal(12,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `qty`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 2, 15000.00, '2025-10-19 08:47:22', '2025-10-19 08:47:22'),
(2, 1, 7, 1, 22000.00, '2025-10-19 08:47:22', '2025-10-19 08:47:22'),
(3, 2, 1, 3, 18000.00, '2025-10-19 08:47:22', '2025-10-19 08:47:22'),
(4, 2, 2, 2, 12000.00, '2025-10-19 08:47:22', '2025-10-19 08:47:22'),
(5, 3, 4, 1, 35000.00, '2025-10-19 08:47:22', '2025-10-19 08:47:22'),
(6, 3, 6, 1, 22000.00, '2025-10-19 08:47:22', '2025-10-19 08:47:22'),
(7, 4, 7, 5, 22000.00, '2025-10-19 08:47:22', '2025-10-19 08:47:22'),
(8, 4, 3, 3, 15000.00, '2025-10-19 08:47:22', '2025-10-19 08:47:22'),
(9, 4, 8, 1, 24000.00, '2025-10-19 08:47:22', '2025-10-19 08:47:22'),
(10, 5, 9, 2, 17000.00, '2025-10-19 08:47:22', '2025-10-19 08:47:22'),
(11, 5, 10, 1, 26000.00, '2025-10-19 08:47:22', '2025-10-19 08:47:22');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `sku` varchar(30) NOT NULL,
  `name` varchar(120) NOT NULL,
  `price` decimal(12,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `sku`, `name`, `price`, `created_at`, `updated_at`) VALUES
(1, 'PRD-001', 'Apel Fuji', 18000.00, '2025-10-19 08:47:22', '2025-10-19 08:47:22'),
(2, 'PRD-002', 'Pisang Cavendish', 12000.00, '2025-10-19 08:47:22', '2025-10-19 08:47:22'),
(3, 'PRD-003', 'Mangga Harum Manis', 15000.00, '2025-10-19 08:47:22', '2025-10-19 08:47:22'),
(4, 'PRD-004', 'Anggur Merah', 35000.00, '2025-10-19 08:47:22', '2025-10-19 08:47:22'),
(5, 'PRD-005', 'Pepaya California', 11000.00, '2025-10-19 08:47:22', '2025-10-19 08:47:22'),
(6, 'PRD-006', 'Semangka Mini', 22000.00, '2025-10-19 08:47:22', '2025-10-19 08:47:22'),
(7, 'PRD-007', 'Jeruk Medan', 22000.00, '2025-10-19 08:47:22', '2025-10-19 08:47:22'),
(8, 'PRD-008', 'Melon Hijau', 24000.00, '2025-10-19 08:47:22', '2025-10-19 08:47:22'),
(9, 'PRD-009', 'Nanas Madu', 17000.00, '2025-10-19 08:47:22', '2025-10-19 08:47:22'),
(10, 'PRD-010', 'Pir Xianglie', 26000.00, '2025-10-19 08:47:22', '2025-10-19 08:47:22');

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_order_detail`
-- (See below for the actual view)
--
CREATE TABLE `v_order_detail` (
`order_id` int(11)
,`order_code` varchar(40)
,`order_date` date
,`customer_name` varchar(120)
,`status` enum('DRAFT','PAID','CANCELLED')
,`order_item_id` int(11)
,`product_id` int(11)
,`sku` varchar(30)
,`product_name` varchar(120)
,`qty` int(11)
,`price` decimal(12,2)
,`line_total` decimal(22,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_sales_summary`
-- (See below for the actual view)
--
CREATE TABLE `v_sales_summary` (
`product_id` int(11)
,`sku` varchar(30)
,`product_name` varchar(120)
,`total_qty` decimal(32,0)
,`total_amount` decimal(44,2)
);

-- --------------------------------------------------------

--
-- Structure for view `v_order_detail`
--
DROP TABLE IF EXISTS `v_order_detail`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_order_detail`  AS SELECT `o`.`id` AS `order_id`, `o`.`code` AS `order_code`, `o`.`order_date` AS `order_date`, `o`.`customer_name` AS `customer_name`, `o`.`status` AS `status`, `oi`.`id` AS `order_item_id`, `p`.`id` AS `product_id`, `p`.`sku` AS `sku`, `p`.`name` AS `product_name`, `oi`.`qty` AS `qty`, `oi`.`price` AS `price`, `oi`.`qty`* `oi`.`price` AS `line_total` FROM ((`orders` `o` join `order_items` `oi` on(`oi`.`order_id` = `o`.`id`)) join `products` `p` on(`p`.`id` = `oi`.`product_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `v_sales_summary`
--
DROP TABLE IF EXISTS `v_sales_summary`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_sales_summary`  AS SELECT `p`.`id` AS `product_id`, `p`.`sku` AS `sku`, `p`.`name` AS `product_name`, sum(`oi`.`qty`) AS `total_qty`, sum(`oi`.`qty` * `oi`.`price`) AS `total_amount` FROM ((`order_items` `oi` join `orders` `o` on(`o`.`id` = `oi`.`order_id`)) join `products` `p` on(`p`.`id` = `oi`.`product_id`)) WHERE `o`.`status` = 'PAID' GROUP BY `p`.`id`, `p`.`sku`, `p`.`name` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_orders_code` (`code`),
  ADD KEY `idx_orders_date` (`order_date`),
  ADD KEY `idx_orders_status` (`status`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_oi_order` (`order_id`),
  ADD KEY `idx_oi_product` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_products_sku` (`sku`),
  ADD KEY `idx_products_name` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `fk_oi_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_oi_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
