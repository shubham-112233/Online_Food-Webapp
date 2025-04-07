-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 07, 2025 at 10:29 AM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 7.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `food-app`
--

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `item_id` int(11) NOT NULL,
  `restaurant_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  `price` decimal(10,2) NOT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `is_available` tinyint(1) DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`item_id`, `restaurant_id`, `name`, `description`, `price`, `image_path`, `is_available`, `created_at`) VALUES
(11, 1, 'Pepperoni Pizza', 'Delicious pepperoni pizza with cheese and tomato sauce.', '8.99', 'images/pepperoni_pizza.jpg', 1, '2025-03-04 07:36:04'),
(12, 2, 'Grilled Chicken Sandwich', 'Grilled chicken with lettuce, tomato, and mayo.', '6.99', 'images/grilled_chicken_sandwich.jpg', 1, '2025-03-04 07:36:04'),
(15, 1, 'text', 'test', '200.00', '', 1, '2025-03-04 09:01:37');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `notification_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `is_read` tinyint(1) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `restaurant_id` int(11) NOT NULL,
  `status` enum('Pending','Accepted','Preparing','Completed','Cancelled') DEFAULT 'Pending',
  `payment_mode` enum('Cash on Delivery','Online Payment') NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `restaurant_id`, `status`, `payment_mode`, `total_price`, `created_at`) VALUES
(6, 1, 1, 'Pending', 'Cash on Delivery', '20.50', '2025-03-04 08:04:52'),
(7, 2, 2, 'Accepted', 'Online Payment', '35.75', '2025-03-04 08:04:52'),
(8, 3, 1, 'Preparing', 'Cash on Delivery', '15.99', '2025-03-04 08:04:52'),
(9, 4, 3, 'Completed', 'Online Payment', '50.00', '2025-03-04 08:04:52'),
(10, 5, 2, 'Cancelled', 'Cash on Delivery', '10.25', '2025-03-04 08:04:52');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `detail_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `transaction_id` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` enum('Success','Failed','Pending') DEFAULT 'Pending',
  `payment_method` enum('Credit Card','Debit Card','UPI','Net Banking') DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  `price` decimal(10,2) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `name`, `description`, `price`, `image_url`, `is_active`, `created_at`) VALUES
(1, 'Burger', 'Delicious chicken burger', '5.99', 'images/burger.jpg', 1, '2025-03-03 06:50:24'),
(2, 'Pizza', 'Cheesy pepperoni pizza', '9.99', 'burger.jpg', 1, '2025-03-03 06:50:24'),
(3, 'Pasta', 'Creamy Alfredo pasta', '7.99', 'burger.jpg', 1, '2025-03-03 06:50:24'),
(4, 'Sushi', 'Fresh salmon sushi rolls', '12.99', 'images/sushi.jpg', 1, '2025-03-03 07:13:59'),
(5, 'Tacos', 'Spicy beef tacos with salsa', '6.99', 'images/tacos.jpg', 1, '2025-03-03 07:13:59'),
(6, 'Steak', 'Juicy grilled steak with veggies', '15.99', 'images/steak.jpg', 1, '2025-03-03 07:13:59'),
(7, 'Ice Cream', 'Vanilla ice cream with chocolate syrup', '4.99', 'images/icecream.jpg', 1, '2025-03-03 07:13:59'),
(8, 'Salad', 'Healthy green salad with dressing', '5.49', 'images/salad.jpg', 1, '2025-03-03 07:13:59'),
(9, 'Sandwich', 'Club sandwich with cheese & veggies', '7.49', 'images/sandwich.jpg', 1, '2025-03-03 07:13:59'),
(10, 'French Fries', 'Crispy golden fries with ketchup', '3.99', 'images/fries.jpg', 1, '2025-03-03 07:13:59'),
(11, 'Pancakes', 'Fluffy pancakes with maple syrup', '6.99', 'images/pancakes.jpg', 1, '2025-03-03 07:13:59'),
(12, 'Milkshake', 'Chocolate milkshake with whipped cream', '5.49', 'images/milkshake.jpg', 1, '2025-03-03 07:13:59'),
(13, 'Noodles', 'Spicy stir-fried noodles with chicken', '8.99', 'images/noodles.jpg', 1, '2025-03-03 07:13:59');

-- --------------------------------------------------------

--
-- Table structure for table `restaurants`
--

CREATE TABLE `restaurants` (
  `restaurant_id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `location` text NOT NULL,
  `contact` varchar(20) NOT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `latitude` decimal(10,8) NOT NULL DEFAULT '0.00000000',
  `longitude` decimal(11,8) NOT NULL DEFAULT '0.00000000'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `restaurants`
--

INSERT INTO `restaurants` (`restaurant_id`, `owner_id`, `name`, `location`, `contact`, `is_active`, `created_at`, `latitude`, `longitude`) VALUES
(1, 1, 'Pizza Palace', 'New York', '', 1, '2025-03-04 07:34:51', '0.00000000', '0.00000000'),
(2, 2, 'rutna', 'pune', '1010230387', 1, '2025-03-03 09:46:15', '0.00000000', '0.00000000'),
(3, 2, 'abc', 'pune', '9129098765', 1, '2025-03-03 09:49:00', '0.00000000', '0.00000000'),
(4, 1, 'bapuji', 'pune', '87665474', 1, '2025-03-03 11:19:18', '0.00000000', '0.00000000'),
(5, 2, 'test', 'pune', '1234567891', 1, '2025-03-03 11:23:06', '0.00000000', '0.00000000'),
(6, 1, 'test1', 'pune', 'test', 1, '2025-03-03 11:24:41', '0.00000000', '0.00000000'),
(7, 2, 'test', 'p', '912093836', 1, '2025-03-03 11:25:42', '0.00000000', '0.00000000'),
(8, 1, 'rudra', 'pune', '865', 1, '2025-03-03 11:26:28', '0.00000000', '0.00000000'),
(9, 1, 'd', 'p', '7655', 1, '2025-03-03 11:27:28', '0.00000000', '0.00000000'),
(10, 2, 'panajabi', 'puna', '9130987625', 1, '2025-03-03 12:08:15', '18.46134080', '73.89052700');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `review_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `restaurant_id` int(11) NOT NULL,
  `rating` int(11) DEFAULT NULL,
  `review` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('customer','vendor','admin') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `email`, `password`, `role`, `created_at`) VALUES
(1, 'admin1', 'admin1@example.com', '$2y$10$C6r0C0vzOMnI2ndSN95Tg.uudHGjcP18N9hMrDY8LgER8DOXk7JiO', 'admin', '2025-03-03 07:48:51'),
(2, 'vendor1', 'vendor1@example.com', '$2y$10$C6r0CVzOMml2ndSN95Tg.uudHGjcP18N9hMrDY8LgErdc/VZo6ddu', 'admin', '2025-03-03 07:48:51'),
(3, 'vendor2', 'vendor2@example.com', '$2y$10$C6r0CVzOMml2ndSN95Tg.uudHGjcP18N9hMrDY8LgErdc/VZo6ddu', 'vendor', '2025-03-03 07:48:51'),
(4, 'user1', 'user1@example.com', '$2y$10$C6r0C0vzOMnI2ndSN95Tg.uudHGjcP18N9hMrDY8LgER8DOXk7JiO', '', '2025-03-03 07:48:51'),
(5, 'user2', 'user2@example.com', '$2y$10$C6r0CVzOMml2ndSN95Tg.uudHGjcP18N9hMrDY8LgErdc/VZo6ddu', '', '2025-03-03 07:48:51'),
(6, 'shubham ', 'abc@gmail.com', '$2y$10$C6r0CvzOMmI2ndSN95Tg.uudHGjcP18N9hMrDY8LgErmViwYYTzmS', 'admin', '2025-03-03 08:29:17'),
(8, 'shubham ', 'abc1@gmail.com', '$2y$10$Y7L65Ki39cH.XJwXfbDoKeRheg8v1no1mto5gItJQmHqgWN0ryuCi', 'admin', '2025-03-03 08:31:03'),
(9, 'Abhi', 'abc2@gmail.com', '$2y$10$hID8QOF6.dgbpdN1F6aQNeY2sFtnsHbwS16xk1kPMHqMY4ALqpymS', 'admin', '2025-03-03 08:37:46'),
(10, 'shree', 'ram@gmail.com', '$2y$10$5VxskVigRXLQXkVZ0WxLtOO5Gw05U1rMdILGb4tkTTesy4Y6FoVEi', 'admin', '2025-03-03 08:41:18'),
(11, 'a', 'a@gmail.com', '$2y$10$Qk1sZV2ZxslLIDNiQjdUDubeiQLx5r0nBDkWVcx4UltCccW9fcKyW', '', '2025-03-03 08:55:58'),
(12, 'b', 'b@gmail.com', '$2y$10$vtg5lpIACREX6s4E8CmHpuTl6WGTalVntIgf1NtJRFzdR5a7Kehrq', 'admin', '2025-03-03 09:05:42'),
(13, 'adm', 'adm@gmail.com', '$2y$10$jcwzQ/bSt9yHjgRyv7n2tu2UNiMEfOIq/ufuOds0GY/Zo2xrVLXlm', 'admin', '2025-03-03 09:23:00'),
(14, 'adm1', 'adm1@gmail.com', 'adm1@1234', 'admin', '2025-03-03 09:47:29'),
(15, 'vdn3', 'vdn3@gmail.com', '$2y$10$WUnOk/v4LSWtaacom8ccZeXv7a9ECQwz8gaBn32cj3PVbaTFnSDoq', 'vendor', '2025-03-04 06:51:55'),
(16, 'vdn4', 'vdn4@gmail.com', '$2y$10$zJCaKv59NwUWlZ53N7jKgOEI16iVgb5X6jNegiRuYLJPxIrlQO7zC', 'vendor', '2025-03-04 07:51:36'),
(17, 'vd5', 'vdn5@gmail.com', '$2y$10$Ye/PTn19d1dpUGaObxBH6uPAPm/zJ0f9dOWOM98uUaTYv2r81CFrm', 'vendor', '2025-03-07 05:05:58'),
(18, 'sakshi', 'sakshi@gmail.com', '$2y$10$9OBLE6PLeEApyhaQCx5.Yu5M3MGsQ7eP28wIDhgmwAxkKKZ4Bq6jq', 'vendor', '2025-03-07 05:07:44'),
(19, 'Aksash', 'Akash@gmail.com', '$2y$10$MrVo3/nTverePi1vdzEZauxBau8kxDsAAW47ZY/5g3tW5bLn/QAqi', 'admin', '2025-03-07 05:28:54'),
(20, 'rajukolhe', 'xxx@gmail.com', '$2y$10$0grDcbMle6uKWk3YURU2ietjq7.C333tWAN30Hr6R2j0OHYm9hClK', 'admin', '2025-03-07 05:30:06'),
(21, 'admin20', 'admin20@gmail.com', '$2y$10$NHftSLWhPsejYUCuKo4ujOj2FVFEYneyiPoYsEpFoExHuJSx0Tnhq', 'admin', '2025-03-18 06:00:15');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_payouts`
--

CREATE TABLE `vendor_payouts` (
  `payout_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` enum('Pending','Paid') DEFAULT 'Pending',
  `payment_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `restaurant_id` (`restaurant_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `restaurant_id` (`restaurant_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`detail_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `restaurants`
--
ALTER TABLE `restaurants`
  ADD PRIMARY KEY (`restaurant_id`),
  ADD KEY `owner_id` (`owner_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `restaurant_id` (`restaurant_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `vendor_payouts`
--
ALTER TABLE `vendor_payouts`
  ADD PRIMARY KEY (`payout_id`),
  ADD KEY `vendor_id` (`vendor_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `detail_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `restaurants`
--
ALTER TABLE `restaurants`
  MODIFY `restaurant_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `vendor_payouts`
--
ALTER TABLE `vendor_payouts`
  MODIFY `payout_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`restaurant_id`) ON DELETE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`restaurant_id`) ON DELETE CASCADE;

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `menu_items` (`item_id`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE;

--
-- Constraints for table `restaurants`
--
ALTER TABLE `restaurants`
  ADD CONSTRAINT `restaurants_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`restaurant_id`) ON DELETE CASCADE;

--
-- Constraints for table `vendor_payouts`
--
ALTER TABLE `vendor_payouts`
  ADD CONSTRAINT `vendor_payouts_ibfk_1` FOREIGN KEY (`vendor_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
