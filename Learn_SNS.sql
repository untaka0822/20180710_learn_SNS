-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 2018 年 8 月 24 日 10:20
-- サーバのバージョン： 10.1.28-MariaDB
-- PHP Version: 5.6.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Learn_SNS`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `feed_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `feeds`
--

CREATE TABLE `feeds` (
  `id` int(11) NOT NULL,
  `feed` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `img_name` varchar(255) DEFAULT NULL,
  `like_count` int(11) NOT NULL DEFAULT '0',
  `comment_count` int(11) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `feeds`
--

INSERT INTO `feeds` (`id`, `feed`, `user_id`, `img_name`, `like_count`, `comment_count`, `created`, `updated`) VALUES
(1, 'test', 2, NULL, 0, 0, '2018-08-14 13:49:40', '2018-08-14 05:49:40'),
(2, 'test', 2, NULL, 0, 0, '2018-08-14 13:50:07', '2018-08-14 05:50:07'),
(3, 'bbbbb', 2, NULL, 0, 0, '2018-08-14 13:51:43', '2018-08-14 05:51:43'),
(4, 'demoです', 4, NULL, 0, 0, '2018-08-14 13:58:58', '2018-08-14 05:58:58'),
(5, 'demoしました', 4, NULL, 0, 0, '2018-08-14 13:59:05', '2018-08-14 05:59:05'),
(6, 'セブ島留学してるよ', 2, NULL, 0, 0, '2018-08-14 13:59:54', '2018-08-14 05:59:54'),
(7, 'Hello world', 5, NULL, 0, 0, '2018-08-19 14:38:44', '2018-08-20 13:05:40');

-- --------------------------------------------------------

--
-- テーブルの構造 `likes`
--

CREATE TABLE `likes` (
  `user_id` int(11) NOT NULL,
  `feed_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `img_name` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `img_name`, `created`, `updated`) VALUES
(2, 'Eriko', 'ei17ringo@gmail.com', '$2y$10$9jofi7hjB0K0kFQtTJZ0/uD6.nwztzOxXXEz0k1xEl3CaJJsFE8BK', '20180809061537スクリーンショット 2018-08-08 8.41.34.png', '2018-08-09 14:15:40', '2018-08-09 06:15:40'),
(3, 'Erikodammy', 'ei17@gmail.com', '$2y$10$9jofi7hjB0K0kFQtTJZ0/uD6.nwztzOxXXEz0k1xEl3CaJJsFE8BK', '20180809061537スクリーンショット 2018-08-08 8.41.34.png', '2018-08-09 14:15:40', '2018-08-13 05:45:27'),
(4, 'demo', 'demo@gmail.com', '$2y$10$oLVkhlR9hy6h2Ca22EETv.Gkot.c3VzMIt3/tx6mOrDFFaNepbcjS', '20180814050734lgtm3.jpeg', '2018-08-14 13:07:39', '2018-08-14 05:07:39'),
(5, 'はやと', 'untaka0822@gmail.com', '$2y$10$.mJq63HWOALGj6GhY0FdfOLmwMhEHKldYZDsjh1tXVK7L0nFubv7y', '20180817071522anakin.png', '2018-08-17 13:15:25', '2018-08-17 05:15:25'),
(6, 'はやと', 'untaka0822@gmail.com', '$2y$10$Apz51sN735gIws0DMRGUUuPaoMraq0BZ7J/1EOmY8wjMnxNrumpjG', '20180819074239ken.png', '2018-08-19 13:42:41', '2018-08-19 05:42:41');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feeds`
--
ALTER TABLE `feeds`
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
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feeds`
--
ALTER TABLE `feeds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
