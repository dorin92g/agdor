-- phpMyAdmin SQL Dump
-- version 4.0.10.14
-- http://www.phpmyadmin.net
--
-- Gazda: localhost:3306
-- Timp de generare: 04 Apr 2019 la 23:27
-- Versiune server: 5.1.73-cll
-- Versiune PHP: 5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Bază de date: `pocket_db_user`
--

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `action_ttl`
--

CREATE TABLE IF NOT EXISTS `action_ttl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Salvarea datelor din tabel `action_ttl`
--

INSERT INTO `action_ttl` (`id`, `guid`, `created`) VALUES
(1, '6381222A-2CE5-4635-BC84-1957CDAEA735', '2017-09-02 18:20:29'),
(2, 'A2F3A35C-121B-41C9-B42F-410631A8A134', '2017-09-02 18:21:24'),
(3, '46F90171-E5AB-47F6-89D7-163B0ADB9AAE', '2017-09-02 18:22:08'),
(4, '6C58B3C8-4BC6-4ABA-B1D2-EC08CA2CA609', '2017-09-02 18:25:28'),
(5, '8F0BA5AA-6A04-4806-9DDA-A47DCE3720A8', '2017-09-02 18:26:03'),
(7, '7D96B2DE-302C-485A-9086-2DD0C4C3BB03', '2017-09-02 19:06:52'),
(8, 'C3D845F7-0F76-4636-8C86-B7D03D62259A', '2017-09-02 19:09:57'),
(9, '1529A37C-6B95-4188-B5AF-D75BF7CA3940', '2017-09-02 19:49:43'),
(10, 'C2635F9B-29FB-470B-8495-31473B999807', '2017-09-02 20:01:06');

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `feature`
--

CREATE TABLE IF NOT EXISTS `feature` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `trust_level` int(11) NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Salvarea datelor din tabel `feature`
--

INSERT INTO `feature` (`id`, `name`, `trust_level`, `description`) VALUES
(1, 'Manage Users', 0, 'Manage all the users, roles, features and permissions');

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `feature_permission`
--

CREATE TABLE IF NOT EXISTS `feature_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `feature_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `feature_id` (`feature_id`),
  KEY `permission_id` (`permission_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=416 ;

--
-- Salvarea datelor din tabel `feature_permission`
--

INSERT INTO `feature_permission` (`id`, `feature_id`, `permission_id`) VALUES
(382, 1, 1),
(383, 1, 2),
(384, 1, 3),
(385, 1, 4),
(386, 1, 5),
(387, 1, 6),
(388, 1, 13),
(389, 1, 15),
(390, 1, 16),
(391, 1, 17),
(392, 1, 18),
(393, 1, 19),
(394, 1, 37),
(395, 1, 38),
(396, 1, 41),
(397, 1, 42),
(398, 1, 43),
(399, 1, 56),
(400, 1, 57),
(401, 1, 306),
(402, 1, 428),
(403, 1, 543),
(404, 1, 544),
(405, 1, 545),
(406, 1, 546),
(407, 1, 549),
(408, 1, 577),
(409, 1, 578),
(410, 1, 579),
(411, 1, 580),
(412, 1, 581),
(413, 1, 584),
(414, 1, 585),
(415, 1, 586);

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ro_name` varchar(255) NOT NULL,
  `en_name` varchar(255) NOT NULL,
  `it_name` varchar(255) NOT NULL,
  `controller` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `params` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `options` varchar(100) NOT NULL,
  `link_options` varchar(100) NOT NULL,
  `visible` enum('guest_auth','guest','auth') NOT NULL DEFAULT 'guest',
  `variable_label` varchar(100) NOT NULL,
  `side` enum('left','right') NOT NULL DEFAULT 'left',
  `pos` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `pos` (`pos`),
  KEY `side` (`side`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Salvarea datelor din tabel `menu`
--

INSERT INTO `menu` (`id`, `ro_name`, `en_name`, `it_name`, `controller`, `action`, `params`, `parent_id`, `options`, `link_options`, `visible`, `variable_label`, `side`, `pos`) VALUES
(1, 'Utilizatori', 'Users', '', 'user/user', 'admin', '', NULL, '', '', 'auth', '', 'left', 1),
(2, 'Roluri', 'Roles', '', 'user/role', 'admin', '', NULL, '', '', 'auth', '', 'left', 2),
(3, 'Permisiuni', 'Permissions', '', 'user/permission', 'admin', '', NULL, '', '', 'auth', '', 'left', 3),
(4, 'Administrare Utilizatori', 'Manage Users', '', 'user/user', 'admin', '', 1, '', '', 'auth', '', 'left', 1),
(5, 'Adaug<C4><83> Utilizator', 'Add User', '', 'user/user', 'create', '', 1, '', '', 'auth', '', 'left', 2),
(6, 'Administrare Roluri', 'Manage Roles', '', 'user/role', 'admin', '', 2, '', '', 'auth', '', 'left', 1),
(7, 'Adaug<C4><83> Rol', 'Add Role', '', 'user/role', 'create', '', 2, '', '', 'auth', '', 'left', 2),
(8, 'Administrare Permisiuni', 'Manage Permissions', '', 'user/permission', 'admin', '', 3, '', '', 'auth', '', 'left', 1),
(9, 'Adaug<C4><83> Permisiune', 'Add Permission', '', 'user/permission', 'create', '', 3, '', '', 'auth', '', 'left', 2),
(10, 'Detectare Automat<C4><83>', 'Automatic Detection', '', 'user/permission', 'auto', '', 3, '', '', 'auth', '', 'left', 3);

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `permission`
--

CREATE TABLE IF NOT EXISTS `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `controller` varchar(100) NOT NULL,
  `action` varchar(100) NOT NULL,
  `visible` tinyint(4) NOT NULL,
  `custom` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=596 ;

--
-- Salvarea datelor din tabel `permission`
--

INSERT INTO `permission` (`id`, `name`, `description`, `controller`, `action`, `visible`, `custom`) VALUES
(1, 'user/permission_admin', 'user/permission - admin', 'user/permission', 'admin', 1, 0),
(2, 'user/permission_create', 'user/permission - create', 'user/permission', 'create', 1, 0),
(3, 'user/permission_update', 'user/permission - update', 'user/permission', 'update', 1, 0),
(4, 'user/permission_delete', 'user/permission - delete', 'user/permission', 'delete', 1, 0),
(5, 'user/permission_auto', 'user/permission - auto', 'user/permission', 'auto', 1, 0),
(6, 'user/permission_subactions', 'user/permission - subactions', 'user/permission', 'subactions', 1, 0),
(13, 'user/user_admin', 'user/user - admin', 'user/user', 'admin', 1, 0),
(15, 'user/user_update', 'user/user - update', 'user/user', 'update', 1, 0),
(16, 'user/user_changeuserstatus', 'user/user - changeuserstatus', 'user/user', 'changeuserstatus', 1, 0),
(17, 'user/user_create', 'user/user - create', 'user/user', 'create', 1, 0),
(18, 'user/user_delete', 'user/user - delete', 'user/user', 'delete', 1, 0),
(19, 'user/user_resetpassword', 'user/user - resetpassword', 'user/user', 'resetpassword', 1, 0),
(20, 'site_index', 'site - index', 'site', 'index', 1, 0),
(21, 'site_error', 'site - error', 'site', 'error', 1, 0),
(24, 'site_logout', 'site - logout', 'site', 'logout', 1, 0),
(25, 'site_modules', 'site - modules', 'site', 'modules', 1, 0),
(26, 'site_maintenance', 'site - maintenance', 'site', 'maintenance', 1, 0),
(30, 'install_index', 'install - index', 'install', 'index', 1, 0),
(37, 'user/site_index', 'user/site - index', 'user/site', 'index', 1, 0),
(38, 'user/site_error', 'user/site - error', 'user/site', 'error', 1, 0),
(41, 'user/site_logout', 'user/site - logout', 'user/site', 'logout', 1, 0),
(42, 'user/site_modules', 'user/site - modules', 'user/site', 'modules', 1, 0),
(43, 'user/site_maintenance', 'user/site - maintenance', 'user/site', 'maintenance', 1, 0),
(56, 'user/user_changeprofile', 'user/user - changeprofile', 'user/user', 'changeprofile', 1, 0),
(57, 'user/user_changepassword', 'user/user - changepassword', 'user/user', 'changepassword', 1, 0),
(58, 'menu/menu_admin', 'menu/menu - admin', 'menu/menu', 'admin', 1, 0),
(59, 'menu/menu_create', 'menu/menu - create', 'menu/menu', 'create', 1, 0),
(60, 'menu/menu_update', 'menu/menu - update', 'menu/menu', 'update', 1, 0),
(61, 'menu/menu_delete', 'menu/menu - delete', 'menu/menu', 'delete', 1, 0),
(211, 'location/country_admin', 'location/country - admin', 'location/country', 'admin', 1, 0),
(212, 'location/country_create', 'location/country - create', 'location/country', 'create', 1, 0),
(213, 'location/country_update', 'location/country - update', 'location/country', 'update', 1, 0),
(214, 'location/country_delete', 'location/country - delete', 'location/country', 'delete', 1, 0),
(215, 'location/country_changecountrystatus', 'location/country - changecountrystatus', 'location/country', 'changecountrystatus', 1, 0),
(216, 'location/city_admin', 'location/city - admin', 'location/city', 'admin', 1, 0),
(217, 'location/city_create', 'location/city - create', 'location/city', 'create', 1, 0),
(218, 'location/city_update', 'location/city - update', 'location/city', 'update', 1, 0),
(219, 'location/city_delete', 'location/city - delete', 'location/city', 'delete', 1, 0),
(220, 'location/city_changecapitalstatus', 'location/city - changecapitalstatus', 'location/city', 'changecapitalstatus', 1, 0),
(221, 'location/city_changecitystatus', 'location/city - changecitystatus', 'location/city', 'changecitystatus', 1, 0),
(222, 'location/province_admin', 'location/province - admin', 'location/province', 'admin', 1, 0),
(223, 'location/province_create', 'location/province - create', 'location/province', 'create', 1, 0),
(224, 'location/province_update', 'location/province - update', 'location/province', 'update', 1, 0),
(225, 'location/province_delete', 'location/province - delete', 'location/province', 'delete', 1, 0),
(250, 'api_index', 'api - index', 'api', 'index', 1, 0),
(306, 'user/user_changenewsletterstatus', 'user/user - changenewsletterstatus', 'user/user', 'changenewsletterstatus', 1, 0),
(428, 'user/user_editpassword', 'user/user - editpassword', 'user/user', 'editpassword', 1, 0),
(543, 'user/feature_admin', 'user/feature - admin', 'user/feature', 'admin', 1, 0),
(544, 'user/feature_create', 'user/feature - create', 'user/feature', 'create', 1, 0),
(545, 'user/feature_update', 'user/feature - update', 'user/feature', 'update', 1, 0),
(546, 'user/feature_delete', 'user/feature - delete', 'user/feature', 'delete', 1, 0),
(549, 'user/feature_addallpermissions', 'user/feature - addallpermissions', 'user/feature', 'addallpermissions', 1, 0),
(577, 'user/feature_assignpermission', 'user/feature - assignpermission', 'user/feature', 'assignpermission', 1, 0),
(578, 'user/role_admin', 'user/role - admin', 'user/role', 'admin', 1, 0),
(579, 'user/role_create', 'user/role - create', 'user/role', 'create', 1, 0),
(580, 'user/role_update', 'user/role - update', 'user/role', 'update', 1, 0),
(581, 'user/role_delete', 'user/role - delete', 'user/role', 'delete', 1, 0),
(584, 'user/role_addallfeatures', 'user/role - addallfeatures', 'user/role', 'addallfeatures', 1, 0),
(585, 'user/role_assignfeature', 'user/role - assignfeature', 'user/role', 'assignfeature', 1, 0),
(586, 'user/user_assignrole', 'user/user - assignrole', 'user/user', 'assignrole', 1, 0),
(594, 'api_finddevicehash', 'api - finddevicehash', 'api', 'finddevicehash', 1, 0),
(595, 'api_insertevent', 'api - insertevent', 'api', 'insertevent', 1, 0);

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `role`
--

CREATE TABLE IF NOT EXISTS `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `trust_level` int(11) NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Salvarea datelor din tabel `role`
--

INSERT INTO `role` (`id`, `name`, `trust_level`, `description`) VALUES
(1, 'Root', 0, 'The Root users'),
(2, 'Administrator', 0, 'Administrative group');

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `role_feature`
--

CREATE TABLE IF NOT EXISTS `role_feature` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `feature_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `roles_id` (`role_id`),
  KEY `feature_id` (`feature_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=62440 ;

--
-- Salvarea datelor din tabel `role_feature`
--

INSERT INTO `role_feature` (`id`, `role_id`, `feature_id`) VALUES
(62438, 1, 1),
(62439, 2, 1);

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `session`
--

CREATE TABLE IF NOT EXISTS `session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sid` varchar(32) NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `refreshed` datetime NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `career` varchar(255) DEFAULT NULL,
  `profile` text,
  `user_title` varchar(255) DEFAULT NULL,
  `form_of_address` varchar(255) DEFAULT NULL,
  `age_range` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `country_cc` varchar(6) DEFAULT NULL,
  `city_id` int(10) unsigned DEFAULT NULL,
  `user_image` varchar(1024) DEFAULT NULL,
  `user_image_thumb` varchar(1024) DEFAULT NULL,
  `lastlogin` datetime DEFAULT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `newsletter` tinyint(1) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0',
  `added` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `added_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `country_cc` (`country_cc`),
  KEY `city_id` (`city_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=57 ;

--
-- Salvarea datelor din tabel `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `salt`, `email`, `firstname`, `lastname`, `phone`, `mobile`, `company_name`, `career`, `profile`, `user_title`, `form_of_address`, `age_range`, `gender`, `country_cc`, `city_id`, `user_image`, `user_image_thumb`, `lastlogin`, `enabled`, `newsletter`, `deleted`, `added`, `updated`, `added_by`, `updated_by`) VALUES
(44, NULL, '6e13737d266b184f55abc0624c1aa6cc', '4av87phs', 'tar@tjavr.eu', 'Tor', 'Rorvik', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'fr', 2158, '', NULL, '2017-08-25 13:42:03', 1, 0, 1, NULL, NULL, NULL, NULL),
(53, NULL, 'a7899e5619cb49d082ad49a80e85c350', 'jd8xk3', 'ascasvas@asdasda.com', 'Marius', 'Postolache', NULL, NULL, 'qwdqw', 'qwfqwqwr', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, '2017-09-02 19:06:52', '2017-09-02 19:06:52', NULL, NULL),
(54, NULL, '85b323787d2e9e9d92dea11e54b04e49', '1jkagm', 'masdas@asdfasfafs.com', 'Marius', 'Postolache', NULL, NULL, 'qfqw', 'qwfqwfqwf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-09-02 20:34:34', 1, 0, 1, '2017-09-02 19:09:57', '2017-09-02 19:34:18', NULL, 2),
(55, NULL, '80f5d35b801a5a92b89d6209097c01ea', 'zyhr64ds', 'ibirisiu@gmail.com', 'Adrian', 'Birisiu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ad', 5389, '59ace5611037f_pp.jpg', 'thumb_59ace5611037f_pp.jpg', '2017-11-06 10:21:53', 1, 0, 0, '2017-09-04 07:32:17', '2017-09-04 07:32:17', 2, 2),
(56, NULL, '8f0de085f10f709cd4d74de06770b325', '7dftc0x6', 'cornel@cronoxy.com', 'Corneliu', 'Enache', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ad', 5389, '', NULL, '2017-11-06 10:25:09', 1, 0, 0, '2017-10-31 10:25:05', '2017-10-31 10:59:44', 2, 56);

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `user_address`
--

CREATE TABLE IF NOT EXISTS `user_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `street` varchar(1024) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `postal_code` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Salvarea datelor din tabel `user_address`
--

INSERT INTO `user_address` (`id`, `user_id`, `street`, `number`, `postal_code`, `phone`) VALUES
(3, 1, 'Str. Stelian Mihale', '3', '032371', '0769293099'),
(10, 33, '2185 Saint Mathieu', 'Apt 1105', 'H3H2M1', '2312312312');

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `user_role`
--

CREATE TABLE IF NOT EXISTS `user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `roles_id` (`role_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=136 ;

--
-- Salvarea datelor din tabel `user_role`
--

INSERT INTO `user_role` (`id`, `user_id`, `role_id`) VALUES
(1, 1, 1),
(22, 11, 8),
(23, 11, 2),
(24, 11, 6),
(25, 11, 5),
(26, 11, 3),
(27, 11, 9),
(28, 11, 4),
(29, 11, 1),
(32, 4, 2),
(42, 13, 4),
(44, 6, 4),
(49, 8, 4),
(50, 5, 2),
(51, 7, 2),
(52, 10, 2),
(53, 16, 2),
(54, 17, 2),
(58, 20, 2),
(59, 22, 2),
(61, 23, 2),
(62, 23, 1),
(69, 14, 2),
(70, 26, 2),
(71, 29, 4),
(73, 27, 2),
(74, 30, 2),
(75, 31, 2),
(76, 32, 2),
(77, 33, 2),
(79, 36, 2),
(80, 36, 5),
(81, 28, 2),
(82, 28, 4),
(83, 38, 2),
(84, 38, 5),
(85, 38, 4),
(86, 38, 1),
(91, 41, 2),
(98, 43, 2),
(106, 37, 9),
(108, 39, 2),
(109, 39, 1),
(110, 42, 10),
(111, 40, 10),
(114, 46, 11),
(115, 47, 12),
(116, 48, 13),
(117, 49, 14),
(118, 50, 15),
(129, 2, 1),
(130, 2, 2),
(133, 55, 1),
(134, 55, 2),
(135, 56, 2);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
