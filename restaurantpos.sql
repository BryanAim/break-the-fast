-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 15, 2021 at 12:30 PM
-- Server version: 8.0.19
-- PHP Version: 7.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `restaurantpos`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int NOT NULL,
  `Category` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `Vat` int NOT NULL,
  `Tax` int NOT NULL,
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `Category`, `Vat`, `Tax`) VALUES
(26, 'hotDrinks', 2, 5),
(27, 'colddrinks', 2, 5),
(28, 'snacks', 2, 7),
(29, 'lightmeals', 0, 2),
(30, 'maindishes', 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int NOT NULL,
  `name` text NOT NULL,
  `idNumber` bigint NOT NULL,
  `address` text NOT NULL,
  `email` text NOT NULL,
  `mobile` text NOT NULL,
  `dob` date DEFAULT NULL,
  `discount` int NOT NULL,
  `purchases` int DEFAULT NULL,
  `lastPurchase` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `registerDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `idNumber`, `address`, `email`, `mobile`, `dob`, `discount`, `purchases`, `lastPurchase`, `registerDate`) VALUES
(1, 'Mark Gilmore', 333, '16 W', 'm@gmail.com', '1234567890', '2020-01-01', 10, 0, '0000-00-00 00:00:00', '2020-03-10 02:55:32'),
(18, 'Mark Gil', 111, 'QW', 'QW@gmail.com', '0867585858', '2002-02-02', 1, 0, '0000-00-00 00:00:00', '2020-05-11 21:38:59'),
(19, 'Jake', 101, 'dsa', 'dsa@gmail.com', '0851528274', '1995-08-12', 1, 6, '2020-05-21 21:00:00', '2020-05-22 14:26:28'),
(20, 'John Baptist', 543242, 'kenya', 'jtb@email.com', '0728822142', '1997-08-02', 4, 2, '2021-07-15 08:19:48', '2021-07-15 07:54:15'),
(21, 'Ashton Dennis', 656778789, 'kenya', 'jtb@email.com', '0728822142', '1997-08-02', 5, NULL, '2021-07-14 21:00:00', '2021-07-15 07:55:44'),
(22, 'Customer4', 645565677, 'naks', 'ashsxt@mail.com', '94567458648', '2020-01-01', 3, NULL, '2021-07-15 08:21:46', '2021-07-15 08:21:46'),
(23, 'customer 21', 32345456, 'Nrb', 'cust4sa@email.com', '75492342', '1997-08-02', 3, 3, '2021-07-15 08:22:03', '2021-07-15 10:17:11'),
(24, 'Customer 1', 1, 'Nrk', 'cust1@email.com', '434556677', '2020-01-01', 3, 2, '2021-07-15 08:18:26', '2021-07-15 10:17:51');

-- --------------------------------------------------------

--
-- Table structure for table `open_tables`
--

CREATE TABLE `open_tables` (
  `id` int NOT NULL,
  `code` int NOT NULL,
  `idSeller` int NOT NULL,
  `tableNo` int NOT NULL,
  `products` text CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL,
  `netPrice` float NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `open_tables`
--

INSERT INTO `open_tables` (`id`, `code`, `idSeller`, `tableNo`, `products`, `netPrice`, `date`) VALUES
(18, 1, 12, 666, '[{\"id\":\"36\",\"product\":\"7up\",\"quantity\":\"2\",\"stock\":\"17\",\"price\":\"2\",\"totalPrice\":\"4\"}]', 4, '2020-05-09 13:29:24'),
(21, 7, 41, 3, '[{\"id\":\"129\",\"product\":\"PILAU WITH BEEF\",\"category\":\"30\",\"quantity\":\"1\",\"stock\":\"22\",\"price\":\"180\",\"totalPrice\":\"180\"},{\"id\":\"109\",\"product\":\"Samosa Special\",\"category\":\"29\",\"quantity\":\"1\",\"stock\":\"23\",\"price\":\"50\",\"totalPrice\":\"50\"}]', 230, '2021-07-15 10:20:46');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int NOT NULL,
  `idCategory` int NOT NULL,
  `code` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `product` text NOT NULL,
  `stock` int NOT NULL,
  `buyingPrice` float NOT NULL,
  `sellingPrice` float NOT NULL,
  `sales` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `idCategory`, `code`, `product`, `stock`, `buyingPrice`, `sellingPrice`, `sales`) VALUES
(1, 26, 'HD1', 'Porridge', 10, 0, 40, 3),
(81, 26, 'HD2', 'Lemon Tea', 8, 0, 30, 4),
(83, 26, 'HD3', 'Tea', 17, 0, 30, 2),
(84, 26, 'HD4', 'Black Tea', 4, 0, 30, 2),
(85, 26, 'HD5', 'White chocolate', 7, 0, 30, 7),
(86, 26, 'HD6', 'Black Chocolate', 14, 10, 30, 4),
(87, 26, 'HD7', 'Black Cofee', 2, 10, 40, 3),
(88, 26, 'HD8', 'White Cofee', 18, 50, 40, 1),
(89, 26, 'HD9', 'Cappucino', 0, 50, 100, 7),
(90, 26, 'HD10', 'Glass of milk', 19, 40, 60, 7),
(91, 26, 'HD11', 'Concotion', 0, 15, 100, 7),
(92, 27, 'CD1', 'Soda 300ml', 100, 20, 40, 19),
(93, 27, 'CD2', 'Soda 500ml', 159, 30, 60, 31),
(94, 27, 'CD3', 'Mineral Water 500ml', 132, 30, 50, 67),
(95, 27, 'CD4', 'Mineral Water 1L', 15, 50, 70, 11),
(96, 27, 'CD5', 'Afya juice', 12, 50, 80, 8),
(97, 27, 'CD6', 'Yoghurt', 22, 50, 70, 4),
(98, 28, 'SN1', 'Ndazi', 100, 5, 10, 16),
(99, 28, 'SN2', 'Chapati', 200, 10, 20, 71),
(100, 28, 'SN3', 'Shortcake', 19, 5, 10, 4),
(101, 28, 'SN4', 'Samosa', 24, 30, 40, 8),
(102, 28, 'SN5', 'Fried Eggs', 9, 10, 50, 5),
(103, 28, 'SN6', 'Chicken Sausages', 20, 10, 40, 1),
(104, 28, 'SN7', 'Smokies', 13, 4, 30, 4),
(105, 28, 'SN8', 'Pancake', 23, 20, 80, 8),
(106, 29, 'LM1', 'Rice Plain', 100, 40, 60, 16),
(107, 29, 'LM2', 'Chips', 200, 40, 60, 91),
(108, 29, 'LM3', 'Chips Masala', 120, 50, 120, 14),
(109, 29, 'LM4', 'Samosa Special', 23, 30, 50, 9),
(110, 29, 'LM5', 'Sausage Special', 10, 40, 70, 4),
(111, 29, 'LM6', 'Ugali plain', 20, 20, 50, 1),
(112, 29, 'LM7', 'Pilau Special', 13, 4, 100, 14),
(113, 29, 'LM8', 'Mukimo with Beef', 23, 100, 120, 8),
(114, 30, 'MD1', '1/4 Chicken + chips', 99, 40, 230, 12),
(115, 30, 'MD2', '¼ CHICKEN WET FRY WITH UGALI /RICE/CHAPO .', 200, 700, 220, 9),
(116, 30, 'MD3', '¼ CHICKEN WITH PILAU', 120, 70, 240, 14),
(117, 30, 'MD4', 'BEEF WETFRY WITH UGALI/RICE/CHAPO', 24, 70, 100, 8),
(118, 30, 'MD5', 'BEEF DRY FRY WITH UGALI/RICE/CHAPO', 9, 140, 180, 7),
(119, 30, 'MD6', 'MATUMBO WITH UGALI/RICE/CHAPO', 20, 60, 80, 17),
(120, 30, 'MD7', 'MATUMBO WITH PILAU', 13, 40, 140, 4),
(121, 30, 'MD8', 'MATUMBO DRY FRY WITH UGALI/RICE/CHAPO', 23, 100, 150, 8),
(122, 30, 'MD9', 'DENGU WITH RICE/CHAPATI', 100, 40, 80, 19),
(123, 30, 'MD10', 'UGALI WITH MANAGU', 200, 40, 70, 32),
(124, 30, 'MD11', 'UGALI WITH SUKUMA/CABBAGE', 120, 50, 70, 14),
(125, 30, 'MD12', 'OMENA WITH UGALI', 24, 50, 70, 12),
(126, 30, 'MD13', 'BEANS PLAIN', 10, 40, 30, 4),
(127, 30, 'MD14', 'BEANS WITH UGALI/RICE', 20, 50, 60, 17),
(128, 30, 'MD15', 'PILAU ', 13, 4, 80, 14),
(129, 30, 'MD16', 'PILAU WITH BEEF', 22, 100, 180, 6);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int NOT NULL,
  `code` int NOT NULL,
  `idSeller` int NOT NULL,
  `tableNo` int NOT NULL,
  `idCustomer` int NOT NULL,
  `products` text NOT NULL,
  `netPrice` float NOT NULL,
  `discount` int NOT NULL,
  `totalPrice` float NOT NULL,
  `paymentMethod` text NOT NULL,
  `saledate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `code`, `idSeller`, `tableNo`, `idCustomer`, `products`, `netPrice`, `discount`, `totalPrice`, `paymentMethod`) VALUES
(242, 2, 36, 33, 0, '[{\"id\":\"11\",\"product\":\"BBQ Pork Ribs\",\"category\":\"1\",\"quantity\":\"1\",\"stock\":\"-2\",\"price\":\"8.95\",\"totalPrice\":\"8.95\"},{\"id\":\"36\",\"product\":\"7up\",\"category\":\"2\",\"quantity\":\"1\",\"stock\":\"16\",\"price\":\"2\",\"totalPrice\":\"2\"},{\"id\":\"36\",\"product\":\"7up\",\"category\":\"2\",\"quantity\":\"1\",\"stock\":\"16\",\"price\":\"2\",\"totalPrice\":\"2\"}]', 0, 0, 12.95, 'Cash'),
(243, 3, 36, 11, 101, '[{\"id\":\"36\",\"product\":\"7up\",\"category\":\"2\",\"quantity\":\"1\",\"stock\":\"15\",\"price\":\"2\",\"totalPrice\":\"2\"},{\"id\":\"11\",\"product\":\"BBQ Pork Ribs\",\"category\":\"1\",\"quantity\":\"1\",\"stock\":\"-3\",\"price\":\"8.95\",\"totalPrice\":\"8.95\"},{\"id\":\"11\",\"product\":\"BBQ Pork Ribs\",\"category\":\"1\",\"quantity\":\"1\",\"stock\":\"-3\",\"price\":\"8.95\",\"totalPrice\":\"8.95\"}]', 19.9, 1, 19.7, 'Cash'),
(244, 4, 36, 9, 18, '[{\"id\":\"36\",\"product\":\"7up\",\"category\":\"2\",\"quantity\":\"1\",\"stock\":\"10\",\"price\":\"2\",\"totalPrice\":\"2\"},{\"id\":\"11\",\"product\":\"BBQ Pork Ribs\",\"category\":\"1\",\"quantity\":\"1\",\"stock\":\"-7\",\"price\":\"8.95\",\"totalPrice\":\"8.95\"}]', 10.95, 3, 10.62, 'Cash'),
(245, 5, 41, 1, 1, '[{\"id\":\"114\",\"product\":\"1/4 Chicken + chips\",\"category\":\"30\",\"quantity\":\"1\",\"stock\":\"99\",\"price\":\"230\",\"totalPrice\":\"230\"},{\"id\":\"96\",\"product\":\"Afya juice\",\"category\":\"27\",\"quantity\":\"1\",\"stock\":\"12\",\"price\":\"80\",\"totalPrice\":\"80\"}]', 310, 2, 303.8, 'Cash'),
(246, 6, 41, 3, 543242, '[{\"id\":\"118\",\"product\":\"BEEF DRY FRY WITH UGALI/RICE/CHAPO\",\"category\":\"30\",\"quantity\":\"1\",\"stock\":\"9\",\"price\":\"180\",\"totalPrice\":\"180\"},{\"id\":\"81\",\"product\":\"Lemon Tea\",\"category\":\"26\",\"quantity\":\"1\",\"stock\":\"9\",\"price\":\"30\",\"totalPrice\":\"30\"}]', 210, 3, 203.7, 'Cash'),
(247, 7, 41, 4, 32345456, '[{\"id\":\"102\",\"product\":\"Fried Eggs\",\"category\":\"28\",\"quantity\":\"1\",\"stock\":\"9\",\"price\":\"50\",\"totalPrice\":\"50\"},{\"id\":\"90\",\"product\":\"Glass of milk\",\"category\":\"26\",\"quantity\":\"1\",\"stock\":\"19\",\"price\":\"60\",\"totalPrice\":\"60\"},{\"id\":\"81\",\"product\":\"Lemon Tea\",\"category\":\"26\",\"quantity\":\"1\",\"stock\":\"8\",\"price\":\"30\",\"totalPrice\":\"30\"}]', 140, 0, 140, 'Voucher');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `name` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `user` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `password` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `profile` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `status` int NOT NULL,
  `lastLogin` datetime NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `user`, `password`, `profile`, `status`, `lastLogin`) VALUES
(12, 'ashton', 'admin', '$2a$07$asxx54ahjppf45sd87a5auHl8IS5URe7zo4tvt3Rfvwjo/kuUmJeu', 'chef', 1, '2020-05-22 14:48:17'),
(36, 'Ashton', 'adminn', '$2a$07$asxx54ahjppf45sd87a5auYHL6stc5JEtuEOZ0v4pW5h/w2KeE6rW', 'administrator', 1, '2021-07-15 11:28:22'),
(41, 'Waiter1', 'waiter', '$2a$07$asxx54ahjppf45sd87a5aunzvY2gvppw.boT1LwU6e0hFETRilwIu', 'waiter', 1, '2021-07-15 11:15:44'),
(42, 'Chef1', 'chef', '$2a$07$asxx54ahjppf45sd87a5aur49NFqJqPU5tC/haJom8ZaJRaNwG.oq', 'chef', 1, '2021-07-15 10:58:05'),
(43, 'ashton', 'admin', '$2a$07$asxx54ahjppf45sd87a5auHl8IS5URe7zo4tvt3Rfvwjo/kuUmJeu', 'chef', 1, '2021-06-29 09:53:15');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `open_tables`
--
ALTER TABLE `open_tables`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `open_tables`
--
ALTER TABLE `open_tables`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=248;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
