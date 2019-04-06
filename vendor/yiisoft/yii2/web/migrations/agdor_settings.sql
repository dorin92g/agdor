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
-- Bază de date: `acoperi7_magazin_settings`
--

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `config`
--

CREATE TABLE `config` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `added` datetime DEFAULT NULL,
  `added_by` int(11) NOT NULL,
  `updated` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Eliminarea datelor din tabel `config`
--

INSERT INTO `config` (`id`, `name`, `value`, `description`, `added`, `added_by`, `updated`, `updated_by`) VALUES
(1, 'PAGE_SIZE', '70', 'The number of records to display on a page', '2016-10-20 00:00:00', 0, NULL, 0),
(2, 'LANGUAGE_CODE', 'en', 'Code used in \"Content-Language\" tag from the layouts', '2016-10-20 00:00:00', 0, NULL, 0),
(3, 'MAX_FILE_SIZE', '10485760', 'Maxim uploaded files size = 10M', '2016-10-20 00:00:00', 0, NULL, 0),
(4, 'PASSWORD_LENGTH', '8', '', '2016-10-20 00:00:00', 0, '2017-01-20 13:09:23', 3),
(5, 'PASSWORD_LEVEL', '2', '', '2016-10-20 00:00:00', 0, '2017-01-20 13:08:57', 3),
(11, 'WORDS_PER_MIN', '100', 'Number of words that a person reads per minute', '2017-01-18 02:45:04', 2, '2017-01-23 15:04:02', 2),
(16, 'asfas', 'fasfasfasf', '', '2017-01-23 15:04:48', 2, '2017-01-23 15:04:48', 2),
(19, 'LATITUDE', '44.4288776', 'Latitudine pentru Piata Unirii', '2017-01-29 18:40:46', 2, '2017-01-29 18:40:46', 2),
(20, 'LONGITUDE', '26.1010749', 'Longitudine pentru Piata Unirii', '2017-01-29 18:41:22', 2, '2017-01-29 18:41:22', 2);

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexuri pentru tabele eliminate
--

--
-- Indexuri pentru tabele `config`
--
ALTER TABLE `config`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT pentru tabele `config`
--
ALTER TABLE `config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pentru tabele `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
