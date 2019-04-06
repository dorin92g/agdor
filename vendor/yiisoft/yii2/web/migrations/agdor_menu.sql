-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Gazdă: localhost:3306
-- Timp de generare: apr. 04, 2019 la 08:09 PM
-- Versiune server: 10.2.23-MariaDB
-- Versiune PHP: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Bază de date: `acoperi7_magazin_menu`
--

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `frontend_menu`
--

CREATE TABLE `frontend_menu` (
  `id` int(11) NOT NULL,
  `ro_name` varchar(255) NOT NULL,
  `en_name` varchar(255) NOT NULL,
  `it_name` varchar(255) NOT NULL,
  `ro_controller` varchar(255) DEFAULT NULL,
  `en_controller` varchar(255) DEFAULT NULL,
  `it_controller` varchar(255) DEFAULT NULL,
  `ro_action` varchar(255) DEFAULT NULL,
  `en_action` varchar(255) DEFAULT NULL,
  `it_action` varchar(255) DEFAULT NULL,
  `ro_params` varchar(255) DEFAULT NULL,
  `en_params` varchar(255) DEFAULT NULL,
  `it_params` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `options` varchar(100) NOT NULL,
  `link_options` varchar(100) NOT NULL,
  `visible` enum('guest_auth','guest','auth') NOT NULL DEFAULT 'guest',
  `variable_label` varchar(100) NOT NULL,
  `side` enum('left','right') NOT NULL DEFAULT 'left',
  `pos` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `ro_name` varchar(255) NOT NULL,
  `en_name` varchar(255) NOT NULL,
  `it_name` varchar(255) NOT NULL,
  `controller` varchar(100) DEFAULT NULL,
  `action` varchar(100) DEFAULT NULL,
  `params` varchar(100) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `options` varchar(100) NOT NULL,
  `link_options` varchar(100) NOT NULL,
  `visible` enum('guest_auth','guest','auth') NOT NULL DEFAULT 'guest',
  `variable_label` varchar(100) NOT NULL,
  `side` enum('left','right') NOT NULL DEFAULT 'left',
  `pos` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Eliminarea datelor din tabel `menu`
--

INSERT INTO `menu` (`id`, `ro_name`, `en_name`, `it_name`, `controller`, `action`, `params`, `parent_id`, `options`, `link_options`, `visible`, `variable_label`, `side`, `pos`) VALUES
(1, 'Meniu', 'Menu', '', 'menu/menu', 'admin', '', NULL, '', '', 'auth', '', 'left', 1),
(2, 'Administrare meniuri module', 'Mange Modules Menus', '', 'menu/menu', 'admin', '', 1, '', '', 'auth', '', 'left', 1);

--
-- Indexuri pentru tabele eliminate
--

--
-- Indexuri pentru tabele `frontend_menu`
--
ALTER TABLE `frontend_menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `pos` (`pos`),
  ADD KEY `side` (`side`);

--
-- Indexuri pentru tabele `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `pos` (`pos`),
  ADD KEY `side` (`side`);

--
-- AUTO_INCREMENT pentru tabele eliminate
--

--
-- AUTO_INCREMENT pentru tabele `frontend_menu`
--
ALTER TABLE `frontend_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pentru tabele `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
