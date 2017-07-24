-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-07-2017 a las 16:17:04
-- Versión del servidor: 10.1.8-MariaDB
-- Versión de PHP: 5.5.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `igniter`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acl`
--

CREATE TABLE `acl` (
  `ai` int(10) UNSIGNED NOT NULL,
  `action_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acl_actions`
--

CREATE TABLE `acl_actions` (
  `action_id` int(10) UNSIGNED NOT NULL,
  `action_code` varchar(100) NOT NULL COMMENT 'No periods allowed!',
  `action_desc` varchar(100) NOT NULL COMMENT 'Human readable description',
  `category_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acl_categories`
--

CREATE TABLE `acl_categories` (
  `category_id` int(10) UNSIGNED NOT NULL,
  `category_code` varchar(100) NOT NULL COMMENT 'No periods allowed!',
  `category_desc` varchar(100) NOT NULL COMMENT 'Human readable description'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_sessions`
--

CREATE TABLE `auth_sessions` (
  `id` varchar(128) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `login_time` datetime DEFAULT NULL,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ip_address` varchar(45) NOT NULL,
  `user_agent` varchar(60) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `auth_sessions`
--

INSERT INTO `auth_sessions` (`id`, `user_id`, `login_time`, `modified_at`, `ip_address`, `user_agent`) VALUES
('edl8dcum1oid2vhdgdqo3gsprhdgg7ki', 2147484848, '2017-07-24 16:15:01', '2017-07-24 14:15:02', '::1', 'Chrome 59.0.3071.115 on Windows 8.1'),
('pb4hch0kl3ine1g2ord1t051erur0gg0', 2147484848, '2017-07-13 14:57:22', '2017-07-13 13:03:02', '::1', 'Chrome 59.0.3071.115 on Windows 8.1'),
('qlslt5fdil1bmv7rkvvf2608j6p463sc', 2147484848, '2017-07-12 20:20:44', '2017-07-12 18:49:49', '::1', 'Chrome 59.0.3071.115 on Windows 8.1'),
('9io07u8oqke6pru7sg8jk2sjdpv70cs8', 2147484848, '2017-07-12 15:25:01', '2017-07-12 13:55:17', '::1', 'Chrome 59.0.3071.115 on Windows 8.1'),
('f129mfk9eqmica0pv6vim87073bb9uua', 2147484848, '2017-06-15 14:08:04', '2017-06-15 18:36:26', '::1', 'Chrome 58.0.3029.110 on Windows 8.1'),
('k5hnfmqhf33p5tqbg55ci13cb7bo6ltp', 2147484848, '2017-06-14 15:08:52', '2017-06-14 20:05:17', '::1', 'Chrome 58.0.3029.110 on Windows 8.1'),
('o2q4h6viirc9m5cn42r2o7bbthaliddq', 2147484848, '2017-06-13 17:23:19', '2017-06-13 20:04:22', '::1', 'Chrome 58.0.3029.110 on Windows 8.1'),
('inm6j6j2t4oar7tpuvokel7t359hjlao', 2147484848, '2017-06-12 15:49:15', '2017-06-12 18:12:16', '::1', 'Chrome 58.0.3029.110 on Windows 8.1'),
('faegl263b7soh1iqdjmteccsdia2j47j', 2147484848, '2017-06-12 13:09:27', '2017-06-12 11:39:43', '::1', 'Chrome 58.0.3029.110 on Windows 8.1'),
('ilfmpk5iqrlpbftk9l69806tqmh2a08s', 2147484848, '2017-06-09 14:56:28', '2017-06-09 20:01:28', '::1', 'Chrome 58.0.3029.110 on Windows 8.1'),
('ep4otdb060j80rhv9uctejtdqqi7sj5s', 2147484848, '2017-06-06 22:31:10', '2017-06-06 21:24:50', '::1', 'Chrome 58.0.3029.110 on Windows 8.1'),
('jvfm46osgl3k6mjidfik29vcsm4c7f7u', 2147484848, '2017-06-06 21:02:23', '2017-06-06 19:07:33', '::1', 'Chrome 58.0.3029.110 on Windows 8.1'),
('6qvijnqqmdvht0tqiahav3sasdtd2slu', 2147484848, '2017-06-06 19:07:27', '2017-06-06 18:06:23', '::1', 'Chrome 58.0.3029.110 on Windows 8.1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cap_customers`
--

CREATE TABLE `cap_customers` (
  `PASSPORT_NO` varchar(50) COLLATE utf8_bin NOT NULL,
  `DEVICEID` varchar(200) COLLATE utf8_bin NOT NULL,
  `STORE_NO` int(11) NOT NULL,
  `CUST_NO` int(11) NOT NULL,
  `CUST_CHECK_DIG` int(11) NOT NULL,
  `EMAIL` varchar(200) COLLATE utf8_bin NOT NULL,
  `PHONE` varchar(50) COLLATE utf8_bin NOT NULL,
  `STATUS_NO` int(11) NOT NULL DEFAULT '0',
  `CUST_NAME` varchar(200) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `CUST_TYPE_DESCR` varchar(200) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `CUST_GRP_NO` int(11) NOT NULL DEFAULT '0',
  `TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `MAC_ADDRESS` varchar(12) COLLATE utf8_bin DEFAULT NULL,
  `HAS_WIFI` bit(1) DEFAULT b'1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `cap_customers`
--

INSERT INTO `cap_customers` (`PASSPORT_NO`, `DEVICEID`, `STORE_NO`, `CUST_NO`, `CUST_CHECK_DIG`, `EMAIL`, `PHONE`, `STATUS_NO`, `CUST_NAME`, `CUST_TYPE_DESCR`, `CUST_GRP_NO`, `TS`, `MAC_ADDRESS`, `HAS_WIFI`) VALUES
('1031732227', 'a5016c02d1c74041', 10, 317322, 27, 'lemil77@gmailcom', '5491133580908', 1, 'v.r.h. s.r.l.', 'panaderias', 0, '2016-09-11 07:33:24', NULL, b'1'),
('1007015510', 'a5016c02d1c74041', 10, 70155, 10, 'lemil77@gmailcom', '5491133580908', 0, 'caradonna hernan jorge', 'autoservicios/supermercados', 0, '2016-09-11 07:44:07', NULL, b'1'),
('1007015510', 'c16d7b8147f6238444s', 10, 70155, 10, 'q@qcom', '5491161387847', 0, 'caradonna hernan jorge', 'autoservicios/supermercados', 1, '2016-09-12 22:55:33', NULL, b'1'),
('0151632613', '4fb2e8f40632ab65', 1, 516326, 13, 'guadalupebordon@gmailcom', '541149140029', 1, 'alonso nicolas federico', 'almacen', 5, '2016-09-21 23:00:50', NULL, b'1'),
('0100889329', 'a5016c02d1c74041', 1, 8893, 29, 'a@zcom', '541133580908', 1, 'cambril sa', 'tiendas especializadas (n/a)', 3, '2016-09-13 00:21:46', NULL, b'1'),
('0103998970', 'c16d7b8147f62383', 1, 39989, 70, 'makro-test@makro.com.ar', '541123066405', 0, 'distribuidora blanca luna sa', 'autoservicios/supermercados', 1, '2016-09-13 16:48:14', NULL, b'1'),
('0936646017', 'aee1d9a6ab683a3a', 9, 366460, 17, 'wlopez@live.com.ar', '541137870420', 1, 'lopez walter alfredo', 'empleado makro', 5, '2016-11-08 21:30:03', NULL, b'1'),
('0147067214', 'c16d7b8147f62383', 1, 470672, 14, 'g@gcom', '541123066405', 1, 'etchepare javier gerardo', 'consumidor individual', 1, '2016-09-13 16:54:52', NULL, b'1'),
('0100446724', '851755b1f7b7c9a4', 1, 4467, 24, 'credit@a.com', '5491121562041', 1, 'monte verde sa', 'industrias', 2, '2016-09-13 19:27:05', NULL, b'1'),
('0151866414', '9207195a3ae05876', 1, 518664, 14, 'makro-test@makro.com.ar', '1161387847', 0, 'palma ivan', 'empleado makro', 5, '2016-09-13 20:57:12', NULL, b'1'),
('0190181751', '6d44ae3fa45afaa5', 1, 901819, 50, 'ebenassi@makro.com.ar', '541121562061', 1, 'benassi enrique angel', 'empleado makro', 1, '2016-09-13 21:07:18', NULL, b'1'),
('0147067214', '32a1d6d202c32802', 1, 470672, 14, 'jetchepare@makro.com.ar', '5411111111111', 1, 'etchepare javier gerardo', 'consumidor individual', 1, '2016-09-13 21:33:25', NULL, b'1'),
('0151866612', 'c16d7b8147f62383', 1, 518666, 12, 'g@g.com', '541123066405', 1, 'cenoz gonzalo', 'empleado makro', 1, '2016-09-13 21:34:22', '50680A070128', b'1'),
('0931885932', '1132f5f806030553', 9, 318859, 32, 'albertofranco1981@hotmail.com', '541132663948', 1, 'franco alberto', 'empleado makro', 5, '2016-11-07 20:40:43', NULL, b'1'),
('0149127116', '8ecfb9afcb6dd8a1', 1, 491271, 16, 'felixmatarazzo@hotmailcom', '541158771584', 1, 'matarazzo felix', 'empleado makro', 5, '2016-09-30 05:34:53', NULL, b'1'),
('0145075211', 'c16d7b8147f62383', 1, 450752, 11, 'g@g.com', '541123066405', 1, 'milmanda perez leandro', 'empleado makro', 1, '2016-09-13 21:46:13', NULL, b'1'),
('01051866612', 'c16d7b8147f62383', 1, 518666, 12, 'g@gcom', '541123066405', 0, 'cenoz gonzalo', 'empleado makro', 5, '2016-09-14 15:27:38', NULL, b'1'),
('1411018714', '5657f5841b9a1c15', 14, 110187, 14, 'mbernabei@makro.com.ar', '542914252066', 1, ' bernabei maria rita', 'empleado makro', 5, '2016-11-04 23:10:17', NULL, b'1'),
('0145075211', '3551a70bf4e9cb6', 1, 450752, 11, 'g@g.com', '5491133580908', 1, 'milmanda perez leandro', 'empleado makro', 5, '2016-09-14 19:45:57', NULL, b'1'),
('0151866612', '3551a70bf4e9cb6', 1, 518666, 12, 'g@g.com', '541123066405', 0, 'cenoz gonzalo', 'empleado makro', 5, '2016-09-14 20:56:36', NULL, b'1'),
('0149958712', '851755b1f7b7c9a4', 1, 499587, 12, 'jperez@acom', '5491121562041', 1, 'juan perez', 'consumidor individual', 5, '2016-09-20 23:24:38', NULL, b'1'),
('0148027110', 'cfab6e51470c00c', 1, 480271, 10, 'mbertolosso@makro.com.ar', '541121562276', 1, 'bertolosso marco', 'empleado makro', 5, '2016-09-14 21:44:56', NULL, b'1'),
('0141556235', 'd18410c9b1107dc2', 1, 415562, 35, 'facu_rod_ruiz@hotmail.com', '541159586606', 1, 'rodriguez ruiz facundo', 'empleado makro', 5, '2016-09-14 21:46:18', NULL, b'1'),
('0151116816', '3551a70bf4e9cb6', 1, 511168, 16, 'lfrodriguez@makrocomar', '541121562004', 1, 'figueroa rodriguez luis alejandro', 'empleado makro', 5, '2016-09-14 21:53:16', NULL, b'1'),
('0149349019', '851755b1f7b7c9a4', 1, 493490, 19, 'gonzavargas@hotmailcom', '541121562041', 1, 'vargas gonzalo', 'empleado makro', 5, '2016-09-14 21:55:36', NULL, b'1'),
('0135435823', 'cbe35925bf22c2b9', 7, 354358, 23, 'cdacosta@makro.com.ar', '541121562025', 1, 'da costa cecilia isabel', 'empleado makro', 1, '2016-09-14 21:57:55', NULL, b'1'),
('0144620610', '98441f5b34c48649', 1, 446206, 10, 'mpedrosa@makro.com', '1121562064', 1, 'pedrosa agustina', 'empleado makro', 5, '2016-09-14 21:59:28', NULL, b'1'),
('0146015115', '56c24d77f1515b97', 1, 460151, 15, 'smuzzio@gmail.com', '541121562054', 1, 'muzzio sebastian daniel', 'empleado makro', 5, '2016-09-14 22:08:38', 'AC5F3EA52214', b'1'),
('0148224115', '3f485f16a4d8033e', 1, 482241, 15, 'mariano.birnbach@gmail.com', '5491121562072', 1, 'birnbach mariano', 'empleado makro', 5, '2016-09-16 15:44:42', NULL, b'1'),
('0150625810', 'c16d7b8147f62383', 1, 506258, 10, 'g@gcom', '541123066405', 1, 'zatorre gustavo sergio', 'consumidor individual', 5, '2016-09-19 15:33:48', NULL, b'1'),
('1210663539', 'c72414e02737e80f', 12, 106635, 39, 'estancialadelfina@gmail.com', '5492235120764', 1, 'complejo redondito sa', 'restaurantes', 2, '2016-11-04 23:04:33', NULL, b'1'),
('0151149818', 'e3cfcedfb87e703d', 1, 511498, 18, 'sbvarela@gmailcom', '541144974261', 1, 'varela silvia beatriz', 'empleado makro', 5, '2016-09-20 17:55:53', NULL, b'1'),
('0149036414', '6a7c0764c6381ea9', 1, 490364, 14, 'ddemichelis@makro.com.ar', '541121562021', 1, 'demichelis diego osvaldo', 'empleado makro', 5, '2016-09-20 23:33:32', NULL, b'1'),
('1715162715', '1236dd1cda957acd', 17, 151627, 15, 'walterdiaz92@outlookcom', '542996054408', 1, 'diaz nicolas walter f.', 'consumidor individual', 5, '2016-09-21 02:07:34', NULL, b'1'),
('1606235519', '3fb30d9f8c49f707', 16, 62355, 19, 'msolimo@makro.com.ar', '543816337036', 1, 'solimo martin', 'empleado makro', 5, '2016-09-22 16:54:47', NULL, b'1'),
('1606520927', 'eddbda319143abf2', 16, 65209, 27, 'dsarmien_0207@hotmail.com', '543816068470', 0, 'sarmiento diego andres', 'empleado makro', 5, '2016-09-22 17:26:58', NULL, b'1'),
('1603616030', 'cb156b78347ffeb6', 16, 36160, 30, 'gracielabolognini@hotmailcom', '543816228820', 1, 'vallejo luciano', 'servicios de catering', 2, '2016-09-22 18:04:53', NULL, b'1'),
('0102754711', '4d0e58497f34d355', 1, 27547, 11, 'betoroa22@hotmail.com', '541169495574', 1, 'roa pati/o heriberto', 'bares/discotecas', 2, '2016-09-23 16:30:11', NULL, b'1'),
('1606158025', '21b739d17c620226', 16, 61580, 25, 'joseel22@makrocomar', '541121562012', 1, 'bravo jose luis', 'empleado makro', 5, '2016-09-23 20:03:47', NULL, b'1'),
('0145075211', '3f485f16a4d8033e', 1, 450752, 11, 'a@ccom', '5491121562072', 1, 'milmanda perez leandro', 'empleado makro', 5, '2016-09-23 23:38:55', NULL, b'1'),
('0143498915', 'e8a28caf1bf1dc6d', 1, 434989, 15, 'emane@makro.com.ar', '5491121562068', 1, '', 'empleado makro', 5, '2016-09-24 00:02:13', NULL, b'1'),
('1147894213', 'a2a81d96c147a246', 11, 478942, 13, 'semizd@gmail.com', '542615993854', 1, 'semiz david rodrigo', 'empleado makro', 5, '2016-09-30 20:05:34', NULL, b'1'),
('1500940629', '5b1f34fc1e675bd6', 15, 9406, 29, 'dana.rl@live.com.ar', '541164302547', 1, 'perkovich marcos fabrizio', 'empleado makro', 5, '2016-11-01 05:19:43', NULL, b'1'),
('0143706317', 'df4dba3ab96d8710', 1, 437063, 17, 'lucassuarez883@hotmail.com', '541161376148', 1, 'suarez soletti lucas', 'empleado makro', 5, '2016-09-24 01:31:26', NULL, b'1'),
('0150625810', 'e8154b69b0ddc767', 1, 506258, 10, 'zatorreg@gmailcom', '5491151138029', 1, 'zatorre gustavo sergio', 'consumidor individual', 5, '2016-09-24 02:22:15', NULL, b'1'),
('0142615111', '2a581ac524d2f127', 1, 426151, 11, 'filner@makrocomar', '541121562223', 1, 'ilner federico', 'empleado makro', 5, '2016-09-24 02:37:07', NULL, b'1'),
('0150858519', 'b7e5900c7c4dd102', 1, 508585, 19, 'maximilianoroberto@hotmail.com', '541133783967', 1, 'roberto maximiliano ezequiel', 'empleado makro', 5, '2016-09-24 04:01:18', NULL, b'1'),
('0145418014', '31e4dd1c8be27c93', 2, 454180, 14, 'cristianolmos19@hotmail.com', '541121562229', 1, 'escudero olmos cristian maria ernesto', 'empleado makro', 5, '2016-09-24 17:29:07', NULL, b'1'),
('2004643511', 'f047011f3860ee4a', 20, 46435, 11, 'celesteacostam@gmailcom', '543794277192', 1, 'alegre matias gabriel', 'tiendas especializadas (n/a)', 3, '2016-09-24 22:07:59', NULL, b'1'),
('0122951002', '9a07dde8f95f2beb', 3, 229510, 2, 'dramos@makrocomar', '541159140692', 1, 'ramos fabio juan diego', 'empleado makro', 5, '2016-09-25 05:13:42', NULL, b'1'),
('0213643016', '3f3a0263ede1fd48', 2, 136430, 16, 'aldanamantovanni@hotmailcom', '541166656627', 1, 'mantovanni aldana claudia', 'consumidor individual', 5, '2016-09-25 21:58:02', NULL, b'1'),
('0147746911', '6deab15e53c11000', 1, 477469, 11, 'ignaciobazzini@gmail.com', '541121562202', 1, 'bazzini ignacio', 'empleado makro', 5, '2016-09-26 00:53:59', NULL, b'1'),
('2008648215', 'da12d412b83fb6b7', 20, 86482, 15, 'manahuli@livecomar', '5493794859383', 1, 'berdala mario', 'consumidor individual', 5, '2016-09-26 01:54:34', NULL, b'1'),
('0128721832', 'c0c2016443413be7', 1, 287218, 32, 'jconde@makrocomar', '541121562069', 1, 'conde juan manuel', 'empleado makro', 5, '2016-09-26 02:04:19', NULL, b'1'),
('0140498024', 'e19fd632c0350c47', 1, 404980, 24, 'carolinadblanco@yahoocomar', '541158945795', 1, 'blanco carolina daniela', 'empleado makro', 5, '2016-09-26 15:11:42', NULL, b'1'),
('0136153759', 'f5d4a037c74b7516', 1, 361537, 59, 'fbalietti@makro.com.ar', '5491121562033', 1, 'balietti flavia a', 'empleado makro', 5, '2016-09-26 16:02:49', NULL, b'1'),
('0144380110', '1bc9e7342c00c708', 1, 443801, 10, 'cintiabianchi@livecomar', '541156976187', 1, 'bianchi cintia mariana', 'empleado makro', 5, '2016-09-26 17:55:47', NULL, b'1'),
('1009417215', 'd5bcaf0e941e129b', 10, 94172, 15, 'noakpo@hotmailcom', '541130781834', 1, 'romero edith', 'consumidor individual', 5, '2016-09-27 02:13:28', NULL, b'1'),
('1502184115', '69e96039d960e756', 15, 21841, 15, 'danielfiala@gmailcom', '5491132094587', 1, 'cancela anabella yamila', 'consumidor individual', 5, '2016-09-27 03:31:57', NULL, b'1'),
('0139424344', 'e747d61744ac365e', 1, 394243, 44, 'ferrajoaco@hotmailcom', '541140282031', 1, 'ferrario joaquin', 'empleado makro', 5, '2016-09-27 22:43:33', NULL, b'1'),
('0124382530', '572ca4fb87ceea86', 1, 243825, 30, 'dphilipp@makrocomar', '541121562201', 1, 'philipp daniel', 'empleado makro', 5, '2016-09-27 22:46:36', NULL, b'1'),
('0602973016', '9d4b563a3fae219', 6, 29730, 16, 'milagrosagostinacastillo@gmail.com', '5491122633336', 1, 'castillo milagros agostina', 'consumidor individual', 5, '2016-09-27 23:54:50', NULL, b'1'),
('0135768482', 'a38ef9a6c5abf85a', 1, 357684, 82, 'hdamiani@hotmailcom', '541168895822', 1, 'meyer damiani henry edgardo', 'empleado makro', 5, '2016-09-28 00:13:09', NULL, b'1'),
('0601712113', '6e9c7a050f0c711f', 6, 17121, 13, 'cloto@makro.com.ar', '1521562036', 1, 'loto christian', 'empleado makro', 5, '2016-09-28 02:11:06', NULL, b'1'),
('0603496110', '3f4de02f610abcf0', 6, 34961, 10, 'danielarrualedesma@gmailcom', '5491128892563', 1, 'ledesma arrua daniel', 'consumidor individual', 5, '2016-09-28 14:45:10', NULL, b'1'),
('0151866612', '851755b1f7b7c9a4', 1, 518666, 12, 'makro-test@makro.com.ar', '1121562041', 0, 'cenoz gonzalo', 'empleado makro', 5, '2016-09-28 15:11:33', '7C0BC6D57295', b'1'),
('0512936727', '1c7a9f4471f90f63', 5, 129367, 27, 'hipermini@gmail.com', '543416277952', 1, 'rinaldi carlos', 'almacen', 1, '2016-11-08 18:29:42', NULL, b'1'),
('0151978715', '943a46a28864fb2', 1, 519787, 15, 'ghviso@hotmail.com', '541136740374', 1, 'viso gonzalo hernan', 'empleado makro', 5, '2016-09-28 17:05:13', NULL, b'1'),
('0400949613', '9b4bdbcfbf7b9edb', 4, 9496, 13, 'juncosjuan@hotmailcom', '543515330221', 1, 'juncos juan esteban', 'oficinas', 4, '2016-09-28 19:20:18', NULL, b'1'),
('0137382288', '21b739d17c620226', 1, 373822, 88, 'jlbravo@makrocomar', '541121562012', 1, 'bravo jose luis', 'empleado makro', 5, '2016-09-28 20:35:48', NULL, b'1'),
('0151866612', '943a46a28864fb2', 1, 518666, 12, 'a@acom', '541136740374', 1, 'cenoz gonzalo', 'empleado makro', 5, '2016-09-28 21:19:15', NULL, b'1'),
('0135617173', 'f727b946485f46ff', 1, 356171, 73, 'jmzappacosta@makrocomar', '541121562079', 1, 'zappacosta juan manuel', 'empleado makro', 5, '2016-09-29 20:40:11', NULL, b'1'),
('0150625810', '851755b1f7b7c9a4', 1, 506258, 10, 'makro-test@makro.com.ar', '541121562041', 0, 'zatorre gustavo sergio', 'consumidor individual', 5, '2016-09-28 21:30:44', '7C0BC6D57295', b'1'),
('1602709074', '99fed501815d8472', 16, 27090, 74, 'gmoreno@Makro.com', '543814023190', 1, 'moreno gabriel alejandro', 'empleado makro', 5, '2016-10-03 14:54:16', NULL, b'1'),
('0190181751', '74d425ea102b8f26', 1, 901819, 50, 'g@gcom', '541121562192', 1, 'benassi enrique angel', 'empleado makro', 5, '2016-09-28 21:33:13', NULL, b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cap_stores`
--

CREATE TABLE `cap_stores` (
  `STORE_NO` decimal(2,0) NOT NULL,
  `NAME` varchar(128) COLLATE utf8_bin NOT NULL,
  `ADDRESS` varchar(200) COLLATE utf8_bin NOT NULL,
  `PHONE` varchar(200) COLLATE utf8_bin NOT NULL,
  `TELEMAKRO` varchar(200) COLLATE utf8_bin NOT NULL,
  `EMAIL` varchar(200) COLLATE utf8_bin NOT NULL,
  `MANAGER` varchar(200) COLLATE utf8_bin NOT NULL,
  `HOURS` varchar(200) COLLATE utf8_bin NOT NULL,
  `LATITUD` varchar(200) COLLATE utf8_bin NOT NULL,
  `LONGITUD` varchar(200) COLLATE utf8_bin NOT NULL,
  `HAS_GAS` decimal(1,0) NOT NULL DEFAULT '0',
  `HAS_RESTO` decimal(1,0) NOT NULL DEFAULT '0',
  `HAS_SIGA` decimal(1,0) NOT NULL DEFAULT '0',
  `PROVINCE` varchar(200) COLLATE utf8_bin NOT NULL,
  `TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `HAS_WIFI` bit(1) NOT NULL DEFAULT b'1',
  `WIFI_SSID` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `WIFI_PASSWORD` varchar(50) COLLATE utf8_bin DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `cap_stores`
--

INSERT INTO `cap_stores` (`STORE_NO`, `NAME`, `ADDRESS`, `PHONE`, `TELEMAKRO`, `EMAIL`, `MANAGER`, `HOURS`, `LATITUD`, `LONGITUD`, `HAS_GAS`, `HAS_RESTO`, `HAS_SIGA`, `PROVINCE`, `TS`, `HAS_WIFI`, `WIFI_SSID`, `WIFI_PASSWORD`) VALUES
('2', 'Avellaneda', 'Francisco Pienovi 318 (Esq. Fiorito), Avellaneda, GBA - (CP 1870).', '(011) 4208-2006 /8 - 4208-5454 /53 /55 /58', '(011) 4208-5454', '02.telemakro@makro.com.ar', 'Lorena Jimenez', 'De lunes a sábados de 8 a 20 hs. Domingos de 10 a 20hs.', '-34.663773', '-58.388860', '1', '1', '1', 'Gran Buenos Aires', '2017-01-16 16:10:44', b'1', 'MK_Customer', 'MfQ1nY3B'),
('14', 'Bahía Blanca', 'Av. Sarmiento 4114, Bahía Blanca - (CP 8000).', '(0291)486-0022', '(0291)486-2550', '14.telemakro@makro.com.ar', 'Miguel Tremoceiro', 'De lunes a sábados de 8 a 20 hs. Domingos cerrado.', '-38.697585', '-62.243238', '0', '1', '0', 'Buenos Aires', '2017-01-16 16:10:44', b'1', 'MK_Customer', 'MfQ1nY3B'),
('4', 'Córdoba (Av. Colón)', 'Av. Colón 3500, Prov. de Córdoba - (CP 5000).', '(0351)489-3004 /66 /9', '(0351)480-8001', '04.telemakro@makro.com.ar', 'Andrea Perez', 'De lunes a sábados de 8 a 21:30hs. Domingos de 10 a 20hs.', '-31.400554', '-64.226721', '0', '0', '0', 'Córdoba', '2017-01-16 16:10:44', b'1', 'MK_Customer', 'MfQ1nY3B'),
('21', 'Córdoba (Av. Juan B. Justo)', 'Circunvalación y Av. Juan B Justo, Prov. de Córdoba (5019)', '(0351) - 492 9530 / 35 ', '(0351) -492 9530 Opc. 1', '21.telemakro@makro.com.ar', 'Dario Niccolini', 'Lunes a Sábados de 8 a 21:30 hs. Domingos 10 a 20 hs.', '-31.356773', '-64.173195', '0', '1', '0', 'Córdoba', '2017-01-16 16:10:45', b'1', 'MK_Customer', 'MfQ1nY3B'),
('20', 'Corrientes', 'Ruta Provincial N° 5, Km 0.5, Prov. de Corrientes - (CP 3400).', '(0379) 448-4100/3100', '(0379)448-4100', '20.telemakro@makro.com.ar', 'Claudio Planchuelo', 'De lunes a sábados de 8 a 20 hs. Domingos cerrado', '-27.49118', '-58.749182', '0', '0', '0', 'Corrientes', '2017-01-16 16:10:45', b'1', 'MK_Customer', 'MfQ1nY3B'),
('3', 'Haedo', 'Luis P. Güemes 452, Haedo, GBA - (CP 1706).', '(011) 4659-0030 /35', '(011) 4443-2693', '03.telemakro@makro.com.ar', 'Daniel De Tomaso', 'De lunes a sábados de 8 a 20 hs. Domingos de 10 a 20hs.', '-34.639272', '-58.582107', '0', '1', '0', 'Gran Buenos Aires', '2017-01-16 16:10:46', b'1', 'MK_Customer', 'MfQ1nY3B'),
('15', 'Ituzaingó', 'Cerrito 1110 (Colectora Sur Acceso Oeste), Ituzaingó, GBA - (CP 1714).', '(011) 4481-3371', '(011) 4481-1356', '15.telemakro@makro.com.ar', 'Guillermo Schmukler', 'De lunes a sábados de 8 a 20 hs. Domingos de 10 a 20hs.', '-34.630206', '-58.696006', '0', '0', '0', 'Gran Buenos Aires', '2017-01-16 16:10:46', b'1', 'MK_Customer', 'MfQ1nY3B'),
('8', 'Lomas de Zamora', 'Juan D. Perón 250 (ex Camino Negro), Lomas de Zamora, GBA - (CP 1832).', '(011) 4282-6016 /6168 /6319', '(011) 4282-8894', '08.telemakro@makro.com.ar', 'Omar Rimoldi', 'De lunes a sábados de 8 a 20 hs. Domingos de 10 a 20hs.', '-34.763209', '-58.431755', '0', '1', '0', 'Gran Buenos Aires', '2017-01-16 16:10:46', b'1', 'MK_Customer', 'MfQ1nY3B'),
('12', 'Mar del Plata', 'Av. Champagnat y Alvarado, Mar del Plata - (CP 7600).', '(0223) 470-2222 / (0223) 478-9645/69379', '(0223)478-8921', '12.telemakro@makro.com.ar', 'Marcelo Ortalda', 'De lunes a sábados de 8 a 21:30hs. Domingos de 10 a 21:30 hs.', '-37.99076', '-57.591739', '1', '1', '1', 'Buenos Aires', '2017-01-16 16:10:47', b'1', 'MK_Customer', 'MfQ1nY3B'),
('11', 'Mendoza', 'Rodríguez Peña 790, Godoy Cruz, Prov. de Mendoza - (CP 5501).', '(0261)432-2159 /431-6006', '(0261)432-2157', '11.telemakro@makro.com.ar', 'Cristian de la Riega', 'De lunes a sábados de 8 a 21:30 hs. Domingos de 10 a 20hs.', '-32.928859', '-68.825036', '0', '0', '0', 'Mendoza', '2017-01-16 16:10:47', b'1', 'MK_Customer', 'MfQ1nY3B'),
('17', 'Neuquén', 'Dir. Teodoro Planas 4141 esq. El Cholar, Prov. de Neuquén - (CP 8300).', '(0299) 445-0207', '(0299) 445-0207', '17.telemakro@makro.com.ar', 'Germán Dobal', 'De lunes a sábados de 8 a 21:30hs. Domingos de 10 a 20hs.', '-38.958933', '-68.116524', '0', '0', '0', 'Neuquén', '2017-01-16 16:10:48', b'1', 'MK_Customer', 'MfQ1nY3B'),
('1', 'Olivos', 'Esteban Echeverría 2870 (Panamericana entre Ugarte y Pelliza), Munro, GBA - (CP 1605).', '(011) 4849-8100', '(011) 4849-8100', '01.telemakro@makro.com.ar', 'Carlos Corbalán Medina', 'De lunes a sábados de 8 a 20 hs. Domingos de 10 a 20hs.', '-34.520684', '-58.514367', '1', '1', '1', 'Gran Buenos Aires', '2017-01-16 16:10:48', b'1', 'MK_Customer', 'MfQ1nY3B'),
('22', 'Posadas', 'Ruta Nacional 12 Nro 10650, Prov. de Misiones - (CP 3300).', '(0376) 154237111', '(0376)44-09074', '22.telemakro@makro.com.ar', '', 'De lunes a sábados de 8 a 20 hs. Domingos cerrado', '-27.436689', '-55.885484', '0', '0', '0', 'Misiones', '2017-01-16 16:10:48', b'1', 'MK_Customer', 'MfQ1nY3B'),
('6', 'Quilmes', 'Av. Calchaquí 500, Quilmes, GBA - (CP 1878).', '(011) 4250-8000 /8017 /19', '(011) 4250-7867', '06.telemakro@makro.com.ar', 'Cristian Loto', 'De lunes a sábados de 8 a 20 hs. Domingos de 10 a 20hs.', '-34.732302', '-58.297087', '0', '0', '0', 'Gran Buenos Aires', '2017-01-16 16:10:49', b'1', 'MK_Customer', 'MfQ1nY3B'),
('18', 'Río Cuarto', 'Ruta A005, entre Quenón y Leyes Obreras, Prov. de Córdoba - (CP 5800).', '(0358)463-7700 /7900', '(0358)463-7900', '18.telemakro@makro.com.ar', 'Lucas Miranda', 'De lunes a sábados de 8 a 18 hs. Domingos cerrado', '-33.132107', '-64.383362', '0', '0', '0', 'Córdoba', '2017-01-16 16:10:49', b'1', 'MK_Customer', 'MfQ1nY3B'),
('5', 'Rosario', 'Circunvalación y Autopista a Santa Fe, Rosario, Prov. de Santa Fe - (CP 2000).', '(0341)454-4102 /24 /65', '(0341)454-4156', '05.telemakro@makro.com.ar', 'Juan Parra', 'De lunes a sábados de 8 a 20 hs. Domingos Cerrado.', '-32.880085', '-60.710897', '0', '1', '0', 'Santa Fé', '2017-01-16 16:10:50', b'1', 'MK_Customer', 'MfQ1nY3B'),
('19', 'San Juan', 'Ruta Nacional N° 40 y Cano, departamento de Rawson, Prov. de San Juan - (CP 5425).', '(0264)428-6422 /6444', '(0264)428-6422', '19.telemakro@makro.com.ar', 'Roberto Videla', 'De lunes a sábados de 8 a 20 hs. Domingos cerrado', '-31.512136', '-68.517633', '0', '0', '0', 'San Juan', '2017-01-16 16:10:50', b'1', 'MK_Customer', 'MfQ1nY3B'),
('9', 'San Justo', 'Av. Juan M. de Rosas 3280, San Justo, GBA (CP 1754).', '(011) 4482-1900 /1 /8', '(011) 4484-2199', '09.telemakro@makro.com.ar', 'Oscar Parga', 'De lunes a sábados de 8 a 20 hs. Domingos de 10 a 20hs.', '-34.680935', '-58.552142', '0', '1', '0', 'Gran Buenos Aires', '2017-01-16 16:10:50', b'1', 'MK_Customer', 'MfQ1nY3B'),
('10', 'San Martín', 'Av. Gral. Paz y Constituyentes, San Martín, GBA - (CP 1650).', '(011) 4754-1931/33/39', '(011) 4713-4244', '10.telemakro@makro.com.ar', 'Rodolfo Benitez', 'De lunes a sábados de 8 a 20 hs. Domingos de 10 a 20hs.', '-34.57867', '-58.515079', '1', '1', '1', 'Gran Buenos Aires', '2017-01-16 16:10:51', b'1', 'MK_Customer', 'MfQ1nY3B'),
('13', 'Santa Fe', 'Ruta Nacional N° 168 y Ruta Provincial N° 1, La Guardia - Prov. de Santa Fe - (CP 3001).', '(0342)498-2181 /90 /1500', '(0342)498-2430', '13.telemakro@makro.com.ar', 'Luciano Cimarelli', 'De lunes a sábados de 8 a 20 hs. Domingos Cerrado.', '-31.639791', '-60.627049', '0', '0', '0', 'Santa Fé', '2017-01-16 16:10:51', b'1', 'MK_Customer', 'MfQ1nY3B'),
('16', 'Tucumán', 'Av. Poviña 1200, San Miguel de Tucumán, Prov. de Tucumán - (CP 4000).', '(0381)439-2600', '(0381)439-3893', '16.telemakro@makro.com.ar', 'Martín Solimo', 'De lunes a sábados de 8 a 20 hs. Domingos cerrado.', '-26.832764', '-65.267375', '0', '0', '0', 'Tucumán', '2017-01-16 16:10:51', b'1', 'MK_Customer', 'MfQ1nY3B');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cap_subscribers`
--

CREATE TABLE `cap_subscribers` (
  `DEVICE_ID` varchar(50) COLLATE utf8_bin NOT NULL,
  `TOKEN_ID` varchar(500) COLLATE utf8_bin NOT NULL,
  `ACTIVE` tinyint(4) NOT NULL DEFAULT '1',
  `TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `cap_subscribers`
--

INSERT INTO `cap_subscribers` (`DEVICE_ID`, `TOKEN_ID`, `ACTIVE`, `TS`) VALUES
('851755b1f7b7c9a4', 'dXWf54G7oz0:APA91bEdFDuorL9uAc9m3JfC8TSlljTW3V25CM1lQZjboGi_4bOoKOUBg-eZFV-zV3HI4TX9Ch-NGI7dV_LC1frDqF3ZzmcTD6HebED3CuoATEPHqboucD3PXF8pyEwjir729N3_rR1W', 1, '2016-10-06 18:33:53'),
('47f2f1b8af3ceb2f', '', 1, '2016-10-12 18:21:38'),
('868614153fa19b3f', 'dyjfXrOGwaA:APA91bEGU_6FbfvBe5SnrTLfN6Q87F7WLZSsEvHyPGvX1jfAGCbF_wRSK5nsePzkW-wC8Z43BAFPUUNrQiDOj5xSd9tAnAH6xnjlfNjZoThwWC-j7UQ5G_od9-h4znpayvcG4E82CV2A', 1, '2016-10-07 22:48:22'),
('afdd62fffa2afc21', 'fAmouOQjOYk:APA91bEvxYXh9YMNNBkP5xy6cVSXe-v9ZATW88QoubUA3Xz8iXeAQp7HrFw0NZkPSaMRNLHryJCnkc6WuzQ2GcNeytjKm5grpERaNab8pZm82cWpsifHJ0-ES4cAXOu99aoVZDnc0_z0', 1, '2016-10-07 22:35:18'),
('a5016c02d1c74041', 'ddw1B-wE8IY:APA91bFWsE_AXyBLxTuCIAe7DlNbRQxLqUuclWohEcJP9wQKeJVsk6sUYr90mNhrut5cpbecc0S9wphO2OjfHMISMPCEHknVb-tliHHjfaCcqHgVi4Vx4KbahGQs3h-pqKWDrr9Mclzm', 1, '2016-10-07 22:35:30'),
('3551a70bf4e9cb6', 'f7fbbicRD6k:APA91bFoymA1qxjVy7IuqYwoh1la_28pEAmht669_-NKDl9UjPQfYJT5I8ze6JHfQTnET3kRr74HH6nzc_jr_jrwQxqJ_fy-CeEHmEZSl1X_Nf_2hXiUaDD6TXT6g2YvK0mWvD1jVbWe', 1, '2016-10-07 22:36:19'),
('9207195a3ae05876', 'cg9wIYzLTQY:APA91bGTgUVVDH8_aWUjs-1rl4d3WXMeVCz78Lv1VniPCHYB_oy9Tv_NHqUJpAXczg19nWJVaKlUAFTlHIVgD-farjiPEHP_wCj2x1hVASQDc7s5ofqEG4nMAO3NpwzOYeZMdnRstKWR', 1, '2016-10-07 22:36:39'),
('a644b8ea180937da', 'eVGULSs_pho:APA91bGOoazmc55WrLTXttewXQ8LyufCTUIfs5s4HhqzqqpyQXDUvNVJM00o8E4ZX8O4EisMSnUAYOZ7Jg8Az_9ui92HwyGTbrptEbbm53324AgRr27EdMlfSNHZ9yFlmMuSKLOnQ4K2', 1, '2016-11-03 21:40:14'),
('74d425ea102b8f26', 'd_XNHAx8Wog:APA91bGcL57boBDtR0y7UVqhAYXeKPsUI4Lj_r7dN9ZIWxd9hnLGzZzB6k0V-CtOW1piiwI4oXU6q5lhiMsA_xlDB5l42Ap2A8P3pJwdPjG4rAOpxpePFFM8Bh5yX4hoopUUWrdGrksK', 1, '2016-10-07 22:36:50'),
('6ea03f35e5e663d0', 'fhTztmSk4Y8:APA91bEacvaCrXyjYl6D69bXXaCLEeNeKpIGAznCw80RJXEk7jSi40uGBDdOqGxQ3cneDwYBHRj9rEKdecPiD16vmVyHU64a6emtJiQNiApuc1J8tVBtAuQyUZwT1r--WJDFGVmH-Xc6', 1, '2016-10-07 22:48:22'),
('5915b53da917fb67', 'c4iSlRjtrAU:APA91bEZZU6SMSo_BtlSm_W6r518yOT0NglM9aKgrJyHI8l29A6fbfmytc9j7PAfdmi4OXGVAsPTMvT1ElDPuTLwKpkf3g2X59YBCTFofYnTZ5h5bEuHxVz5_-RcV5kqWbtI_GXcoAWP', 1, '2016-10-07 22:48:25'),
('7d8de3d27560d8e8', 'f6f1WTGkbyM:APA91bF5R3rb6-EBZ_08pEYVlSSzc-_CO8Fsdc3ez3V1sy4l1u1ebmh2k182KkAsJ__UH_Ww2z1IN38yRKAzXiRa92pZARiXLrtsNdz7NwfHSQq7aoq_QSRCqqR7r3WIZtn9N77j8WIM', 1, '2016-10-07 22:48:30'),
('2c62644f6745f18b', 'c5lJg2ZbQiE:APA91bEbzGuSZ1NGDYq5I2yvWoi3kx90ZrDZ8g6C_odTx1bo2IpzoNwD30lcbMx2QLY46jvkOnlqw1adGxNy5UxpTXyfLZBH-TdxKLUGn6ble_0aOJB8rB6ircXE3cs1mEx_dIrCJESs', 1, '2016-10-07 22:48:31'),
('9bd7057da8c1aa18', 'emhDgvFzIJ4:APA91bGVI7VN0RcJuw21UZcMdYrB00O5gWxVu623OomxODRxpuGIsBvPt9CwbwjZl1Exy8YL2sR8zr4NDy48CROxSxDXoW_b4poXTTO7R1Co0PMRdlXkuTPSxG6HFzulQuDRfdU_aD62', 1, '2016-10-07 22:48:40'),
('2afeef0fe703421b', 'duoTkymSKdg:APA91bHAv837h5IVZeIfqabAUyOZGAjwOn1HuGWyyXTM61juVkr5jOH9RxthG7uDZbJj1ZGIoTXDdvXl5UE6rp6ZOnHfdwO1jQshgkCw46IQIBR4YJsSBaIQFe78RBBbAAUnz4isspG7', 1, '2016-10-07 22:48:40'),
('5682d392c6616d74', 'eyu7q0RI-to:APA91bEB7lC4cgHwWaqlsoAVup9etCdddb32rQECvUFFFohvkurnjo05QXXTaGIS5da8foynLGPAMD64lNmY9SBTzUFx2xQy0Nd0k-TKgnJbrfMKZB91-i2HJYfTAbobM7mLwQ68WoG2', 1, '2016-10-07 22:48:49'),
('51b6f86a4972b471', 'd-GzSMgvsak:APA91bFHAFOmORRU5Yyuhsvd9qCuvlEZW6uKd9gfp9D1WUSkXqZNMQu19i41wvTxCUwIfGx9L_U9j_VFWDSytVDYJQFx4-8wy46GOMkkL3kRdqQXuo4updmMw5RfSQcqn8WgVHzDL-mO', 1, '2016-10-07 22:48:51'),
('c5a33603f7eef180', 'cNSy2w-iYlM:APA91bFXJypy8sPihBSi9qUlXGYKPnnmoocJtOrUyjIX2DcuGQyhQ3tuEVBTiaBT-f1LweWPyE3ATDsgFl13-JZ2FTU_ZB43M5mCSP5ui7CHpNVa855780byVhXvvONICEsOLo8sZOny', 1, '2016-10-07 22:49:02'),
('7d10aa2b006e4bce', 'dIVSwIK0HD4:APA91bFImq0_fq-mcaj1UJThjQBgCoT5CrT82zTBvXgJ-B9vdEvnRSideoFL3wuF6BX0CqCne-qqc7jKhI2YVOor-yofvD9sNIlO2ssbBUW6nR5eDbgKcZzj54PDUdQufMpZcpRylrIL', 1, '2016-10-07 22:49:07'),
('9165a9ad3b54c350', 'cj-BVteel3Q:APA91bEBhLrYOuY61MucDcw-6AqOlnsY7CeFlSPnFEMG8fboDt4SZKg77je5F-s56MxHcD_oafaOvxBgEGRKWNSOIE5C_AaMAqzvtx4tleXBR-SZ9vyRW6p2rb90xHDn0L-VfmKxTYvy', 1, '2016-10-07 23:32:37'),
('18154dfa23170e66', 'eisJzkLXa0g:APA91bFBI_594xllxjNqoGxi1tgrC6ANKaGZpEQxNI_FRfCTxR-6Frj4dSi1cRT0kAanSCvd_5kpVoxMIK1hgim98GFOdr0K_-nZn2njaQCp4FLrhmjMRr7Nel1aRfiLFkgHVWd0Ccre', 1, '2016-10-07 23:35:23'),
('82581c9fdcd6f16f', 'fKQaidnBFfA:APA91bH7UIZHK2aq648zPZfgaEgVvjA3TlOOc-UQoPMetH2lSBHhu-kw1mBLvcjMGynz3w8Rj2Hc8_uCA_en9vA5mYLRHubVDosX28RoC0k7AEy3_3d8O_T67OKx7xDghH1gZJzjAWKN', 1, '2016-10-08 00:16:18'),
('51934d3772ceace8', 'fFI7LTmRAic:APA91bGr0xyWdwqy5EnQyiU83YyKT8Rdb5Tb0X2Bk5-8uZNAzaFNIy_s-wAQpQgkldAybzxADzr1WdCsstfZQ4YYuItt0YcsQ8_YnLc0IjTFvkd1YJQ2i6ZHyie3vslh3fd0DbthwLNE', 1, '2016-10-08 00:38:57'),
('6223b1b598d87043', 'fcwetIgkk3Q:APA91bHdu1GEhul1cug1mzGzT1sfMyASjnhcC-aFec590HNHeDxZRgO35iyi8ceO1fPd_sWB1pbhbasesOuzSNEkCyVXnQ5CSLdw8ABdQ6SBw8B877tDEriPlSTdl9BJ-vS_uPL5erAr', 1, '2016-10-08 00:42:29'),
('774ea7003e41f1ae', 'fZKFSAAtsDY:APA91bGHckaT9a7oJH6BmJn4dynOOttApqUQllsK1JAD4Zd3TLWVKQb4OvZUGPeUo3tuD9uAITTx0UrQ6AgbIn9INdV5DucNLVO-AMrPUOS83Gvmwov-WnDEPCsN__aswNgCB9qqPPYf', 1, '2016-10-08 00:42:48'),
('7df4e7940ed8f6a9', 'eB0rqtE9YJc:APA91bFApsdo2ozcgWwFRHih6d3AcOTDFPPzBWGGQHZBxM-Y0sjKkELqMOYvzvvvwwR5VsRdBqATIQ1OGlF-rOcBN9KzFVShu2UoCEnJNOHqGnXGXiDt27wPOUzLbW-QZNt9h00BkH3c', 1, '2016-10-08 01:10:10'),
('50b0bcc9e1157de1', 'eB0yQ_j1WqQ:APA91bFn0KjZGWtjcKk8HT8xwZvLkuXgll4vuq8iE2Ku2mKMb6lYYPjUYDTo4ai1lqnF71Vym8m6EouBhXsWW5n15TPpLEwwimIyIMW8Kbw1rPeJIeM4Oraf6_QLPtr6xJKWoFN51QgP', 1, '2016-10-08 01:17:15'),
('6e68f0c00bdaa079', 'cp3HR8_vIJo:APA91bFxT9_VMP1yuAIOcbSfwYAmjNWUAG9WEWwiaPQL-AsKd30uau495_mu4NI6ZFLslzcTEpoQMbBnv5uzryuyVcAGI92lsnDMHBZT5hgzHFi0uIfvuzLdw1wsiDgC63gVe4giDe47', 1, '2016-10-08 01:21:54'),
('3fb30d9f8c49f707', 'eS7V7O4qcYk:APA91bFRNhjMtfQx4rIOkuIL_4L92zdMtW5fmU-hhmrSVhwAou5WndYHdDzoE2ySz5VIvth84Rtdx1LQp5lNcjVtb11CUXCi355aOL9CtL7XYy3MIbqiReeWtiJdUTSQHLUL7CKILOGu', 1, '2016-10-08 01:24:31'),
('fd093ad9d534b35f', 'e0qEr6PRVyg:APA91bHZYFtTzUiJsjLB5M9Xxaj5ae4LmF7zBSEenNhSymi6tmOI-4gSIOdylpLtt4aqOQ199eQ0A1EqtXpSKCM0QKEUrV0B5aMpJKhOe5QHCwWwDNdBDArXQk-Jo-sB4EWOtSIQ_w96', 1, '2016-10-08 01:26:06'),
('9fbb3ccf89481b66', 'fB1XRI-mieo:APA91bEAV80KnTZQUcuBt7nf8h2xII1aeHd3StH59A3y3cWMWdKogwDr1Aoa-4KKDwB7B67lo7c7f6wGtMzicK8jeVk9HJEPKPNLLnpU4Ejr6VdTl4ZtNwFz_T0sfaG_bw3s6u2DTq-r', 1, '2016-10-08 01:34:36'),
('8a1f7877589c3b59', 'cJR0g9jlV4M:APA91bG9Rgh9Yc_cBSq2_5UzIpvLlbv0szhyrw5rDy7iGOddu7gzHcSGYqWN4o5V4L2Bf7rUe3mrZjHiS9RmBK35xtNRbz0FbctmbmMsYQ1_R4GkeFG8G2zrVhDgqVgGHHsExeoIRl5B', 1, '2016-10-08 01:56:20'),
('89a47fc20be3f9aa', 'cJQpJ59HMXY:APA91bEZcvLmXh2jV1LBt8wUxw0DIywdPCGYJ8-YCyVGYxdzpO0neXsJqTDHKiB5CXcZ45ZislaC0aG9o7VpVeN8_pmt16MaTpRldaCd-TqEVZ_Z0gAXMX_WYtPWa4z10a3cmAUFg22T', 1, '2016-10-08 02:41:15'),
('8ecfb9afcb6dd8a1', 'fIe2AwDjCvg:APA91bHvclzWHcxC5bv7S5rBxjJw6mj-eVdbxtmkt4Y6DgPzCZ6J4lhJMkan4Tnlu0alllBRFoZ3WfkZYIhe2oOP_Oz_DXzRukqZO_VYVIYByrqjtdoUSsFQtJqwdJvTqbLj0BYBU9jd', 1, '2016-10-08 02:42:30'),
('5b8039a246345101', 'd-fuUuu4ojQ:APA91bFlHo_8bNeqdPJfsYKDBfieOZnVtTAbN-wxu0HS-YYQaAvAGeRzAhx3ywzUg_4gf4TDFynWTlTl6Vm2dvlkAE3H69NHbWcWH14bpdWJkjylMGPPuHKmQnrpmMUJhnsDb9JeaLr2', 1, '2016-10-08 03:04:00'),
('d217ff3086f4507', 'f8L-6thsIV4:APA91bGkkaZuoaIbxlQPiyqyNA27VMXngx2HWrWqF2WIgfYU9NVT-hbO93I6wwqEqnOjSqx5kI8X-ADfs40pSc9XFlGp0Bp9TnFyj_t8SqTlUbMrGxhPGiQYaZnvnB1TTS-bqdJcnvQa', 1, '2016-10-08 03:06:47'),
('690a2422fd5da1d9', 'dlTFUA1IaX0:APA91bE-4Mm1S-PvSQ2RMie3QjIfCFrSAwnVMQezhV81FTpnqXDJJ8w4awAUWQumICujYPfsd2KcsR5tEe0PH5Escsi-bn-fzs0sXvuHX6bXI9ZGwf8O1zYROJ2qwmwO_1uM6WtSjP-i', 1, '2016-10-08 03:09:47'),
('3e60848edb22c5cc', 'eQ72mZZzWvg:APA91bFoiQyrj3i7vCff5RdMBd7LKsLWM-xBFTRpTFxz6AsYufW2LugZ-uSBCiYlOvcG1xA4QO3o9IURFs6fO7vLpDiyv40r5cSitKdZ4VDV9sIvHSbyI355TnFR94RLLsiOQ_NOTwC6', 1, '2016-10-08 03:13:51'),
('d5bcaf0e941e129b', 'eYsL4XS9bhQ:APA91bFb_p1mFer0I9W1ItCrV9NRjUcyzbCOBkg_4mUW5p9IDTclNn8iz8PZz-H6wCAf43ONCO1oYJmxOhBPfLU7-LaTD07vJBJR-gNEXsMD99C5ofZyqE8M4GnIqzDEL09c7inJWtjK', 1, '2016-10-08 03:26:40'),
('be029c88e515dd93', 'd-OD3U__I4U:APA91bGUkLZeYLR_R5hWtwNm4ni0sHzNqFuVdQwZVpHU4JHgZ7Mj90Cz8sWU7iQ-I87_VkENiUKDZkoK7kv3yXxJOGxVbFhZmn2BjSPZhdAO1JR9NW3l0eWBn-XGWk1PefRJkLz2TWc3', 1, '2016-10-08 03:26:41'),
('a3b85192348c5f94', 'eXKqEOp5QMU:APA91bHE5kDBmLl70aUKnToxbI6Jir3qrSPLVJErTio9rvk0jmcRcoBk7vHsIBnv7rjDgeSWqEGG9fGa9Wf_p9WJxpATR7ktZgvIVhwL7_ec0axJ2ONVjAUnan19ROvrn6sgmkm0hdYa', 1, '2016-10-08 03:32:12'),
('594b03b10644b589', 'dy5c_RIZ_9g:APA91bH78XuQJKQsHGIZzGg0S23XFuzoLHx891ENh6lj2cFvNkPKHAju3Dak2KwKPc-l3HgFOANRPgkaZ9WJwybhogGmN2kN-FYIsgZybJUougzbeHtNV2Utv60JXNPZYWJo5XVIF3T-', 1, '2016-10-08 03:43:48'),
('1c1e0edee7e8908d', 'elB4Xs5iikU:APA91bEoMN-WKNU7l5bmS7smyNh9ePkhlBSXLalbDn4CKSvJzo-8wTVampBE2yOswmZxEzbjC80wuuqNC0-hPFTsJooqVHH4mjGFJHXKY-V-TzeGTKK_mjD1FD8YH8MWb-6sj2VubYer', 1, '2016-10-08 03:46:08'),
('16870e12712be9c0', 'fxxlm3ZKUvg:APA91bE0m6c0KrIHbYCD6iJAU5XPKkwUY3rFITCPASdieZaZhcSpe89bJiW3kP02si6ZgU_hzWHX3ITDBV4cHJa15aqHtLyyRLN5S1T8YoupPBok5OCqWwzuKKgDO_f9455wHVvGmcBg', 1, '2016-10-08 04:07:44'),
('b8a41302897103de', 'dAG8Uy9L490:APA91bGEH1i8nLW5FGnjbyqo8rNEPrpeWvKTPCBnEc5Ep3giW05rYagz7JH-YMdOBDvpA-xK7VTzuHZFyC_zVIO7CnBZqlvww0rbKB-vv7p9VrrWWxRUq-YtNldsEBfwEV3uQQ53Mlug', 1, '2016-10-08 04:46:16'),
('677203174971a198', 'cAUj3j_cSEY:APA91bGIz78_ZioNA8zuZ8lGGXXyN4bzLQi0bTYAk2k9-ujNpjFT4FuXC-OeTYtiOLvmSgeMdn9IydPdSuU982t4jXMj0VnIV7UYQ_3GH2uedyM-3SYF_U5jnKSJNFmxJTPmtzVmt1Yr', 1, '2016-10-08 05:12:02'),
('3f3a0263ede1fd48', 'dYSVtaEsecg:APA91bEHvuLfIWR8DFwZcW-OpOVCMDCq7EhqArScBRrk-mRxTIwdCIuk24b9VXd2BUQb1R9ldQZvgpiprfMoOw48TE63XcxjZnp_GeQxFzhAqmMRN3-zGFJVP22ouqnzVvY5OyISRURO', 1, '2016-10-08 05:49:13'),
('69e96039d960e756', 'd7gBkExA3zM:APA91bGSG59XwnpSBqg0cwxLrAlcOGDL67qE1qbCcnxY4bbQURAF2FGbPFy7wYUPH8ZD91RfwNSIvExXqfN5bv_GsKSMQAuyhUrtUbkOX5iUIZj4o9cyP3kpyklfev8XWVplGIo8IKiQ', 1, '2016-10-08 06:04:44'),
('f621665da638d2cf', 'f2Roqm4btHI:APA91bEpOfCNJomVK5p7B9DyYXXXnsLUkorn28xaPeW3bbHXId0LUu8SdYIWXO_U-JKrgrXe3GkKOkRlCoBrmU8dFu0VTrsVEh88HBZR-Xl9mTvI4F0EzEkzgp5wCxV_N0U2Iq1I5L7P', 1, '2016-10-08 06:11:10'),
('93cdf4e102210368', 'dS2O5KceK3g:APA91bH0G8lY5t-WqDA0uvHIgPGMHDtu6GEP-_0msMP9Wg8L5wfAXxm0uwmd0xmMwSjTAcsUOuN61V-iyhUvQkKgUMuIXwkKs0VLrEQ5_K0E_6uGuuErVEjCk5HEi6nSGUfk45TRZ7eZ', 1, '2016-10-08 06:15:46'),
('13ef57db1803fb1a', 'dO24YbYXTX8:APA91bHRfDIWJj6250rBBPS4Xa3qVQaMSZFTMyd-Q_wey-MzLUbMe_EUaixob3RU3mX5iSlzft9mHRc_mCusj2WO6_8U88a3JEBPWsIBMHa_1lDsa2-qfji2NYfJaFX6tshdBGzPUmad', 1, '2016-10-08 06:44:00'),
('28a17c1471f931e6', 'd7fITmVX0wE:APA91bHaWIveUKB5CZoT0UpBhF4OLgrNKHjXYnnD9eNrWd751cErtAz_ctl0AMDjtguPVzKTEi1CFTQGUS_9PSGKxjaCt2UVzfFBjy0r7U1Q612wisxMmGjbUB27C-PcHQ4loA9dz0bB', 1, '2016-10-08 08:14:44'),
('903e0ec2b80ae6dd', 'dYWsEezfLtk:APA91bHees4kVEWPCqS36se-8T6T6w4IX2xjZUKern4Keo9LizMINUkDEr7YC5n-uVP2CU2h-29kzBapPrBQhr9GDgmG230EItoBAOcgwMUs37vFQVgDc6lqEvptFsvJ0FemkYQvQVzX', 1, '2016-10-08 08:24:03'),
('a870c8246223763e', 'fLsenr8AhoQ:APA91bHtGeGXFYYIgSJiezt7spg6vWIQQh_Jo6TL7fSsvA9X9X50LxLq_QGRzl8SxwTEd4FZZORH7fSD-pEQZTmNMXrQirmcoHo3DiZHgRQS3-W4Uq2-UBEiDL2dtA5mhTUMWhCjp3NC', 1, '2016-10-08 08:58:36'),
('7e46e89c244c7168', 'eQyJtW_PQnA:APA91bGkreWO5PYvg6g3P7_SUtDaE7LQwPIfGnBv1IBuRLwlBu_KXE-DriZfVHqopHGKcMDONHoxepqomndny5Pxd9eng-gQq_YhqnVHiC9Z9zb0VsqKIKhrLLnqS2lt95LD_OHoUFAa', 1, '2016-10-08 09:02:58'),
('7666491cd3585315', 'eV2PKsmjmck:APA91bFrD6dIyf1T5KUkdiB0Pg-ml0b21Mwv0aC9jnGIS2EXPJWtozGoIMmsWPLvrCi6YkPehkOfFFGp-7OBxjKrOb-nPkwRiMPYWwaOWe_OBR3rFHO-SRGqTZ75OcX1s8w9UhAhlyot', 1, '2016-10-08 09:15:57'),
('bfa530b4a6322c17', 'fkahWBgsnBk:APA91bHCRFmOhoZHsw9pg5gOs55urDCNVuzqGJDUi4D-J6re-hlO2WvRD8mFwQDNSWv-BUxlY7kjlcezI5IujAYyl2Byt0uMGMIafqJDf5UwaAtU1leKysP13WHtzPho_L-7os9S_u7S', 1, '2016-10-08 09:51:36'),
('a669503cb66be02a', 'dOiUKWAdiBw:APA91bGfw2sj7zr1ILRBtizQaNsuwV9ZzkMMJOj5fx56HpcMa_TFfjfIWlljsv_MoU_Dtw2NCndVQIOmARskOhkvNV0nw3moKsecvfkTZlOIexRnY_G5ukWW6WLPDUCHrG9jktv4Qzi2', 1, '2016-10-08 10:22:48'),
('3b04909efd920c62', 'cXWqJSNC61Q:APA91bFycLfzgI6eUvsC_uZE9LIGczELKLq7y8I_WD4Jifcqn0fgyq6otBBrQK7QnHBv1lGhoBAsYfT3jNkeaFtQbEDT531rARQthr_adWA2YUL3k0gBRiDVnJn-znnMlQgMyU8DeHxS', 1, '2016-10-08 11:01:12'),
('2df475a7c647bdf3', 'cLYDS53v5Rg:APA91bELaAZ4UwXG7_GX7gUDAMsAgMZQx5Xa31JDLMgL1lf5Cq1hqPTSo91bxHH3llOjEDakd1Gx0ss1fZyny0Y-O4Qhl5ayu6msXVjGxjYoDU9AunflhMWD3DopI3UaVk92NWoFuqdG', 1, '2016-10-08 11:43:13'),
('aa61d7353a0444fe', 'fPksceMxufg:APA91bG-JAvjDdnGgYbNtBaYofsUB9vRZI08oeFNTXXpKe_m-YRMhqxTAv1bxlSbzYUXki8aV5aq9JGNVuALaAIrMMCce6FOcDoQUMqYhdpyNQwS79RHqzKawK-6TReTOB6JBl3tvki-', 1, '2016-10-08 11:54:59'),
('a38ef9a6c5abf85a', 'efCXYBthUAg:APA91bEy7I6RaTSSqCW9pM7xBXyUdroUkhNU_ZgsrnqQHkFctzF4us7_Nm6ZjpKdWNW1pQbsORvXchbBDM6rJlCcfcq4nubEaUoO3-5hW-OF6u6AP0DhZrRwCInEzoSmBouOy4QnhX3w', 1, '2016-10-08 12:23:00'),
('b6beb1f9569f55e7', 'frBSY2ZMTug:APA91bGnmIOrkoLmDt9GZTe_SlDEyCyf9q75ydc__R3PIBUTza2Td2MbvEmS58jztbB2rnN41cuhWy8GfTcRiZtBepp5jeumykcrOQMhBj3jZMS6oNFtjAqY8jmbsx6ukh_YCf39C2ac', 1, '2016-10-08 12:27:00'),
('622706d745c3933a', 'cJK9lWZzMLw:APA91bGubq74TO0aOYNG2iwX4JdwrlFag6x4XEFfpuaF8R0JWdYg6lsolavufbcHTjxpMiZgTNX2_pnxuEN8HXfB6bChuhqJz6f0haKIi2rhxFRAR8ZZPrjzon15URY18gX0cD7-t_dy', 1, '2016-10-08 12:29:22'),
('bf74bb5d78df1c0d', 'cOCVmaj7tTM:APA91bGRXT9SbA1wOSckFrae0jWKS54pKBaDqs3fUuGl1TD6DfI7l8PdDGlQ3y7hpQpkvjqIhExOMT4ugP2jnKZhdOsYZx01OjSmeDS1Qwrqx--fGsC2B69oVJcgqrfjD35BxjR64mTl', 1, '2016-10-08 12:43:14'),
('c1a7b5eb5f1bdde1', 'fUT7doQVQIQ:APA91bF8QkjUZSzxj4Ps4HU8jBqQnYb9WeW7tsVO7WTQdjNIf0S7sGewPaTYdxaMT8i7bAl3lFbRG5ONUl2uNrn2M-T3f6FcPHNJG1Ur4j0fw4It80d5Ko3wxObwAxVQqeeKNuqipzAf', 1, '2016-10-08 13:06:59'),
('641e105997f9d526', 'dWMg5x0jQUQ:APA91bGzscRjmjo2ju1jN3_bi7s6NyIEsXSSjVzDMV0CoyADRw3VsQ8_Yw0JU4HhVvPtcwuiMLmMMGYIpQeOP8CL7hxfVRYRgmix2sUopxVybWQOyWkJ1MB_SJ_1LFmvJcXpHWIBa6dQ', 1, '2016-10-08 13:51:56'),
('90075696963eee36', 'eZSLmd0hGcw:APA91bFZwnx0lISO-MrkpwbrALrZf-TEIvZdX7mLiuAXGBgl8dAmXuvNAHbDPo7lQiElNBoH8x4iS3OHCWSvpsgQyLVjBxu7ZRgEt2-GamK2-uQ2vpIzcdLDAiuqLxtamsHuT4fj_u14', 1, '2016-10-08 13:56:45'),
('eddbda319143abf2', 'da6sp17GJls:APA91bHTlHwrw7hcE32_oa8A3s92QteUGzwlW_sOJ10akCXTiKmz0nAGVFcVJMJEVC109IFtvZcbVOeDgPAdCxEBmOHV3EI9A44syZ6tUmzJh3G1wB9-eYsAmta1EDO6cxbIckATqhO-', 1, '2016-10-08 14:37:46'),
('1f3597f6d1b12f25', 'di7rBafeuAg:APA91bFJvruavd_xVIN203brH4Mv9yqYzetpsBeetfHDREoHppkYhhzgXGqzAs8gW4gVvh0uJP4HTPPbujEXVvnhqmd_s6d4SOEz0l3A_AFC0zvDJOtJ5G6RcH8qcmDLklmOiKuaVrGQ', 1, '2016-10-08 14:47:44'),
('69fc97424704051d', 'ehUIzs-hb3Q:APA91bHqyR5hoJsRZR8AIRB1f80f2TqFgblReEOih0d4jBi62o38DLhNmHOInLyqdS6kLtPxBFQHcUElcYOEL8Go-YptxXnOwCDp6rxCYJQ_Kp7pFmMv3MJ6i818yymz6B9akFXmJykm', 1, '2016-10-08 14:52:56'),
('a5d52c8a2abecb8e', 'fxWlbZlD9Ao:APA91bHao7U202yx5XI1ZD3-aExno1vZakYlDfdJZFt7ZoS4bic_8b0CWWRgKXALz6wQUZNXDVv1LOh9MubF3gldNDpiXf4A6KkvBiPHwmbSEDoqqj3Fn0Qy_OPfVgyUrxJkNZBEuTbi', 1, '2016-10-08 14:54:45'),
('7a8c7439722e962b', 'dmAyjRTy_3Q:APA91bFt-wEJxswcCRblAp9vsLe6gtZ8zb64eaECE-mZLRv2aEwby8c6PqHAsOzDnfcoIEXbgPEcEkIoNzIo2Xce0IJmRJt9sgt7RDCBHTf-lIdpB4r2iwsbKCpt55JqLhwg7anX0KzF', 1, '2016-10-08 15:02:52'),
('f047011f3860ee4a', 'd0QpVnRxZ_Y:APA91bFl-84gIgfYlMstuMo6xG4QL3orb_VyUWDJp24rNc5FClZmPzEa8UblyLl1gUbvbyscAflUC4GYb0QZp0tkCjrDY2hOOC5xWekG9HKJs_G7C9fw768H6QRK0lK3Lfkm6XXGuVR_', 1, '2016-10-08 15:22:17'),
('455e02556a7bab9c', 'cuhE14IMwgs:APA91bEqgLwqkBnaKg_ZsdUyVTy7DluSQPmi18BH-TpA0Aw2V3Qu1H6ccW40Qi_NccYy2R5yHyQW-m_SfRlUK8paxUoL9oE6Ax54NBa4qf6h93asl8hznDn1oHl2l9TbQfdfZCKxEhpp', 1, '2016-10-08 15:32:17'),
('64346045a1796393', 'eeXpuBHxFts:APA91bF9S1Lu-Gpd-jKSGoPku2miGb0q2xD8BZP8Mn8MyPJvRwWBrp6JkNgiEXw0SgksmYtQOsLHRT7sTGl8p1dlg2DvuT8A6rPrrO7oMs3SnndZ3TQAgVb2zljfgnN8TD1hA6gjI8cB', 1, '2016-10-08 15:32:57'),
('5b94e803fe0104dc', 'eSAy-qNnThM:APA91bEC2fBRFs6-JKbRk_RBM8Nj9waeqOHfY7RFzfORTpxLF8zXjcSJVqB0LQO7VU4RSVgZ_PDuujhII-y7DFrshQA2hjWr1EC56Sygxnx0Y491plyMyCnB9UDTQut1wvg9KTisn-Ml', 1, '2016-10-08 15:33:46'),
('e80b7b5faeefc662', 'cou_b7Od2kA:APA91bFvR09bxu6iOFoBeM4ugBQ-4-6x6ye9cN6QiFNIY95_n7yIKF5_CHxFNXAbmIIkd4meEv6H-ABvbZpavZwFYt3ryvWgwS-dv36wq7eAgsTaz4KN_-10TNFzXHyVBg_T3IP-lUtl', 1, '2016-10-08 15:35:27'),
('378a94d1c79d4718', 'dB3mkyJws88:APA91bFKRS7SicgIMnh9AZ1oSWfLuAUV2I9WKP5oD8sxWU7gBt1ZUNVbWhMQV_4-AJkNgybPOe0W9PBReEbu9xARNJHjlVoKu34W_xwB2jvh9UR3-71RplCQrZxOOzxsdEJX9_J51sbF', 1, '2016-10-08 15:46:06'),
('f727b946485f46ff', 'fBwjtFOyVbI:APA91bGxoe0cKi3UCBOPjdxMVa5JsgkirOJCTiA-CCea1YbS4js1DcZf9_xQmXWeN06M2Z0Ah-r5Ld5cOJUWhRoQeP5kVK5UXQynnl_-yy4cIpgQ55cQKZ5QjlR6iup_fIdnK-vPssZL', 1, '2016-10-08 15:46:22'),
('758e01d5458c92c9', 'fKYFjYQAhK0:APA91bE-o5YQ5JpoO9vQlNkPpR2epHTruqOdJEw5bo1z9TaQDDgJ_DTBnb0Dsk_n2alFZw1qi7kb2EX0Up0_jZqqVMRegiU6EnSz3tk5x0sPDe5UbI-Go0zzQDmHXi_6bZ-iWHtfhjhh', 1, '2016-10-08 15:52:05'),
('31ea8f1658da8be', 'eL9jyK1FGf8:APA91bFpSC2iIzfuogy2n5yzKFn9pyXHjSzpjDcgtMKqb5LRT0EEhRCvUiZa7IEudwoZhlPShcMXVQXajCT3qBv_sgjXuTaMBd-L5b0VTqc2ylf005SSk8j7kLSsOOUCCeKKRqJRPai6', 1, '2016-10-08 15:57:16'),
('f91d84d53da2e895', 'ew0huI_sJvk:APA91bG4n0yxqah6lWMIxeT6Szmss6vFZ9bTSK1L36hyfHMqf97bLln2BFi1tjBuOEYz6Sibn4Y9hDzRIRUdOQ8nAMluUUZMtA2L7OAP0HXYM1VHuoPjc2nNbBYfT-3L2F27Xl7ZWDoQ', 1, '2016-10-08 16:07:51'),
('ea20036931f5f1c', 'cnXhLjdOOrM:APA91bG-hS4pcgt7LGi5WWZiCSmdsfE03VjUgT9KKbTyL_3Kt3hwC04EqVnaxJHyjiqjqeg2t_6z-R-A2O2p5ru__v17wnEedV9phatgOY1M81jQRMjC6KRwcra7JzjLKK8qfx7tozmV', 1, '2016-10-08 16:12:38'),
('c2922093d57ab72c', 'dnozT9cFLr4:APA91bG9vAj3q9eCHF4pCS19n6EtTJ5IroPPcmQZqGa_jWx1BixvRFapmAUNywf7SuO92QdYG2zW9fbOOwNm85oP0jya-FN8hL4NyeTIPWPaSyPZfdhty4pze6aaZEWHU7Hfmsbf4OCm', 1, '2016-10-08 16:17:51'),
('6a78223728ae9c6e', 'frUfslL2rwE:APA91bFN3seGaHPHax0OsN0JgweF0eunYwy_xPym0MlcfKEwrF500cQL_1b0ZDeCLNU9x0mWC1XV1wNhl-Et2sKhM4ymZYmYrK6zU1mOXR-sEYvLyV_4b3a09_ge9sRjb4Loq8STSPa_', 1, '2016-10-08 16:22:28'),
('d26ada8274f63052', 'ff0UxsC5ZUM:APA91bFqZY7YsVn-FQnnNZ59IzOVGN0mQCMrSZrAoZfWJfzAerYtP9wuadJE6xS_Pnzvbmq2s0Z3X-N3ym8P5hzZwkHWn7P2PVPv2wupRG-BZVbO08biaHI5a9tO2cE3iqUrTzMEimxE', 1, '2016-10-08 16:23:56'),
('5d32aad0b7d2c4e', 'efV__OyXNJ0:APA91bFXNZzEcywT7CjP4oZEdsXcY5ijO8IrC2FbaO4OTYNp8Rt9R2cJh99LncPyIbNGYvGV26uupOSfLTZArAJbsgloCTQiJa7OYVhH4c_wfxa194gIHtRXxXRByzRWW0Sn6hl9uKHR', 1, '2016-10-08 16:30:46'),
('60489f0143459fe5', 'c8dh9U5qxXs:APA91bFTloLOBoI5rWMshxAKoB0CBCwRz7mP9M4vioP1iAdG3hwr4-vdtxx63VMmTWb5SoqrcgLCqdRxjIoquWmF9l5DOslncXYkcGdGoeOA8yhQ1pOdC5E8FXpAP86vn3G1vrsJIkRp', 1, '2016-10-08 16:34:25'),
('93f537ee7940fe73', 'do5zwmDPOOc:APA91bGqDA0Ea83A7SiiL4CkI5LOV3RhNcaQZhHmfQgIIQR4fxQoC5QaSdcm5hi1o7H_g7iEWtCX_VqbWHMyPSJiCUev99aa_n3fTtbOv_8tPY0V6ePUYlOkGqYH0x7-EPL3AjUXAzKU', 1, '2016-10-12 20:22:52'),
('6b17af6092896d62', 'fjZC5JQFPN8:APA91bF26O4zczbvdqch8ODHID5jghwkV34QAQP-OTujEAp7iRL2g1UK6ug4cv91J2jgW_Dd3DRxVILch562jXt0dzocnVSeuzWwRAssuchvClVF3K2yAFNMm_dS58N04ZKi2P7XFJkq', 1, '2016-10-08 16:34:26'),
('e06ccecfc4f9c8b3', 'ci6BqFpgZbY:APA91bFR4GeYbIBbtcpOtcoktD9zc-1_lVtvvBDn3xAJVmxA0weP48klLqy8drebGm5GaGZrqLNrxGQDb0twlkJvDCUs80EERY1hMwzaD8vgdauooP3wAO3v8VaawVpalqZqfzP4dpPO', 1, '2016-10-08 16:36:29'),
('2af242234e9471b8', 'fUgewiJLBjA:APA91bHHNKEAMWypFN9o0hvdTdiWB_w1VFrtGZzYBKbgRcpW_ckxg39oiIWKKFcFM_qtTNVydSsNqmg1SUDzIkj-3Tj_dSGGWPcEbzBzolyfLaxnGQRmN23TYU_6soyhdj_seP6_BNXn', 1, '2016-10-08 16:48:11'),
('423b44eca118d9d9', 'cyJVtnbLWQY:APA91bFq40QcymjloD25mT6NCC4smLimWnGstnQPs95g3byvEU3bENuI8b_xtnxuB0pUhfr_d0Vyj2G0QT6L8fGHaS8n8i8DAamQQIM_SLS8C6vGxWEsEy17jo14Mm2UWcw-8DbG3mr9', 1, '2016-10-08 17:01:59'),
('d271d2fe9e40ffea', 'f6iUF_0BusQ:APA91bFhkvNiNxRtYijJc58lIK1gv8EbMfqcQLc6CLdveDaPnyfJ3C5kJmN__cNo8aLkRlWyZyjJQwKHxpd14BDEcV1gvY5KwahyCVYnqC0tYevLLOS-sGgpF1L8bWEdgij952YKa1ot', 1, '2016-10-08 17:05:57'),
('720ab491ec5f2b62', 'dGiSvQ5rLSE:APA91bF3X8HojCR_oLNsCkbS6rFX06mxAlZIxFuKtCFEEAiLbimBurQa96EdcL27cJrkN7ctZbSgXUNERVgP2R3sR0pzxRj9T_Y59VDpQCbSxox9KgCovAf09_reuDTyo2CsBKhCIKs0', 1, '2016-10-08 17:08:14'),
('2f70acf3a21b868f', 'ctrDK61kjOI:APA91bECSC1AFiIEMQS8z5-Gi_B0tqDAPu5o23hx4-GOOLs5TMgFQjC7dgROp0XMleVBrwT4eRFJfNpA2JcYOCylHfqG-QX7oY8gNsXuLJqUtyR6CIdDq8QN3zoIELXPMCXyINosy86J', 1, '2016-10-08 17:37:53'),
('df4dba3ab96d8710', 'dBFG6QSCbeM:APA91bEeoN_iGEDEFb1bqYYTOWtgMq2bvvQTB4hD-J-YvKmCxjwAErIbkPP8FIy2Swl-lG1j-XJvyO_u6ICNIBK5smipZ83cOvhMlPWkjl_NTaHp4NTQ4ypdkUaXrUKHwkbtiv4gjs0U', 1, '2016-10-08 17:49:22'),
('4acea6a97549613', 'f0_ACL-GDjE:APA91bHnp0JyZD2-6dnT_572hLUiH-vv4TswHkYi6zP8S48-JhIYwPpCLpw0ztkUil7NcKwJLJmTSl_1i4N0EgHF0ABbU-8qXsM8eh1j1RF52j-OJPJ2TPXnQKonIuybCzWOhD8rBIgS', 1, '2016-10-08 18:05:15'),
('8bad32f6e0bebe09', 'f54zyHNHLI4:APA91bFGwxrMwD_wvtAtN6iU3BTTRGCy30nfcmXU5ErO4BDtDUQmRj3Bi9epuTNxXiIIALHLSn7UGX9AO04dVlPq1_bSUsShfFsOq8Od5odnw0XqfEFqdCYLNeglCl0KKXFBLfsklaqy', 1, '2016-10-08 18:07:50'),
('b17a93f703a2c9', 'cKbNtVLg0x8:APA91bEJMmKHwO3bfQwIKaNCY8cBKJPiSIyctVf9haLrU7NUvA5jQrUx2s9bjZMh6v5goFm9KALqdUSxah_vfaQi1QJLQfpvS9JkkaWU1b41os5oTljfQqYTUDNUVb_24OQn71-wye7j', 1, '2016-10-08 18:13:49'),
('c0c2016443413be7', 'eKrlwbo7Sms:APA91bGIUzE84l8A6OGIccAzkNVB25EXu3N8czMBBsUosimxrlhsw-pm58Az9oPthj3Qb4OxgV1zj-bYkK3I6Hde46U_21Dxe4wK7jfgq2OLncnKrWZsUCMYXjybesU8WrHL6q_X9hWk', 1, '2016-10-08 18:36:02'),
('76d49f17d3fb69b9', 'fD55lyLQvzs:APA91bE2_bpwz-UoNtftJ9TsGHB76t3yQALwrgZ3HUUSxFOKHxu400HMDtwo8v9Xoo3JDPUFzF8yCchSt2-9sjhnI6_mDeomiRm6fPlIG3p3_JOZwJWOfj8A5JwNggL_2thH0zgvYP6d', 1, '2016-10-08 18:40:23'),
('f6b56b355a11ac6a', '', 1, '2016-10-08 18:54:20'),
('fad0d97b0e40025d', 'ek3hIPiW5SI:APA91bHMrPaQSYLZXJ1Lt1geEWF0ik4ikdxr6L_EU8yJo0hoTURPiXdFA0MbsCS1IJB1CxnrzwmWwNU1pC5vOI-cKmeXkWuNOz6aGsHQubC8kTg2oJQeJlFIUvlF1AmZfS1xK0X-TFxt', 1, '2016-10-08 19:12:30'),
('5fe26b908268d7b1', 'c5mBjOZ7YOk:APA91bE72LpPfj7NzOmx5UBsK-YgGSWIYaLvGJFDqdC77Qd4tJWd7jhpEJifLPH9K2sE4iZLX-aDuez6m653Tklpzrf9qVjz-Ygz1v264USg1vfme-VI70xBkYhGFwWkyCNDBxRfaAd0', 1, '2016-10-08 19:40:30'),
('3eef932927c459be', 'eZ0cLvrCtkM:APA91bGBmrAOykl_s_nQvoYhA4OBxZXpS8o4Z7-ucx4Sr_yyqR23TUKCyU87yUaSQMRMQliw89dJoKB-G6u1R1j6d59FBsvQPyBbAbMa_D1ALuNxT0nP6q1Z7PllwuHYFwKSg00P9FMe', 1, '2016-10-08 19:56:20'),
('dcd4647750784621', 'fSZSs3rJ_B0:APA91bGV9YfLga0CvHRrdWDzV1T5As_XiBy2z_a5QioU1xapthLJ4mvhckOV884YIJU74ltF6H8h-3PQ0c9lBYHHUue8PUy4JBSGdQIMVB4An9FgRRJVLtdMBzGxEN8kaL0k5-vFamxl', 1, '2016-10-08 19:58:53'),
('ff4eaf9f88aa1bed', 'c2WjOhxgq4A:APA91bE5CGp0XqqhFlOaNxZDQNQmY5w_6MklSfvPK-CFkMUTIWcwxPkgQObTLdFW0qI9duNljLmhMnquswDLjr9v5f2z5vv_0-__CLfewjhUmncqX39hLbym7NltdYQxuhNMsZ7JJ-YX', 1, '2016-10-08 20:05:37'),
('355118aaa405a337', 'f61aiahDgDU:APA91bHbSMEzTBqvQrxQwrofUJWGS8W0uaJP0FtFt9V0aJ9G49uVzGhC-VPJ6VgJ_ZUbl4eP7H_Y_H8AU4Ge2ejHNGab1twgyBbQ23OgywoORmtaobQCZGW8h46cL3i86Ec5W9FPtKVH', 1, '2016-10-08 20:17:34'),
('8087b37365d807ff', 'dpvSaLz03HI:APA91bEeBv4gfTSiROg4Jjq1Cvb3yad9d5hCx3Cx2cWratbZf2XQruZct5-aLht4spqwx3KcrpcFdwEZPSYh_Bj3Pr_3-JvGLRzEQUaCGszzJXGBPg6GjyC1fbJ_aqbe7E3a_fkxCdbv', 1, '2016-10-08 20:35:26'),
('e603715d23b66d4b', 'd3KdofkFF38:APA91bG4ai5yeqlD9wMhcKPiCTl6y7uAN0ZaBNoiIypAvm77RJjUCSW9Grm2uoBhbfuLuzJjhZNECGin1KtGtuTaWi8O7WYWEcIiag-MorpZPixW4b80PYAtlJZ_qcsOV-BeKkzwWiV4', 1, '2016-10-08 20:36:13'),
('4019e6c251786bbe', 'd0JxZ8yrEpE:APA91bGKArsertpviISruD_jVYy_GZzdsHPFsxjejtj1wV9qTNj7EcwsKGx9wMNtXo1-lgo0XXvHcpMrX5s6CEja6Xu8jCoEIg4RUjz3CRn4Y6xXQEjcxiwkYpSogHyNJAd1Fl8m1HIf', 1, '2016-10-08 20:38:34'),
('1b86c11299bcfe1d', 'd9NFJFJZ3Ek:APA91bH9JKjeSzZRzJn6PTwmgMm7MfOWXV7PYF9kwkWTeqoQKNYlEJZYPTC4jss9AxfMhqT8gYJSpH_r8Hdj7vEtHssXaPkSgHYTuW6yond0o8m6iIiFo-iWLtVuy8WBFy84C_wOTIop', 1, '2016-10-08 20:50:01'),
('42c3bfa50398d56e', 'fSDZRc-Xf0w:APA91bGkgwJ8JmEIghSpRqOHWPOSqhx0bHGXomy7BA6CgODzlBrGC69mMn-zfnOXVnHzla8LK0yxQerJmHVkXuPGxrnF3BXZVnq_33NS5xnvgfzFk4YDy0UFixLVXJMwPcYelhjRP2HJ', 1, '2016-10-08 21:10:51'),
('a64e3f3be6a1e491', 'ccvXv2iKMZ0:APA91bF13377yfvoabieu3XyHc45nM0syKk3jVWLVcYLnbIWTYwNwmK6ZCzyWR3_rdWymGsO0FWhlSv8bTqrfxyfkMSb8AVCdlnNayH1hSBvlG6H4A5gST5Ny8gWgDbL94J5oPhMH-XO', 1, '2016-10-08 21:53:21'),
('56c24d77f1515b97', 'cVr1VD0DIXM:APA91bGsxX4W0oEBkQaEya31MzS_O4UgfIjH00eDU5keKcmE6hgtGZA51BXJecxj4jnTVIxrjWDfXUZiIZr8nKChSNpD34pkTdJS-8Gj2zCkh4995zHpJErSZtFGKqQAix6mI4XYudoB', 1, '2016-10-08 21:59:48'),
('62b7353bb16846aa', 'dFtIR44bfYk:APA91bEhOxejwRuVZJti7IMhVBUh63ShND23wxRNJn9cnZsbKVWH-HcsoZFhSFt1z9otllzvFvovktCaPIaHy95Bzk7PnZG4f3eWM0ggQKKPoIgkz09io8Uo8xfkSMuNB6wjqix7NkQJ', 1, '2016-10-08 22:07:25'),
('ac33bdf5173e912c', 'cCHYwxbAFxI:APA91bEtqsFgMc7FPVDQ7sC2Genf16ptha6WreHrx4uLmUFgADNxXIogkypqFxX1an7v7DzBgdngd63A3giiNcQZCdTzH7E0j4JXOfbOV67h_YTk6xg-kQ_-64Yn-AhcJlrKMW--qSFM', 1, '2016-10-08 22:17:22'),
('abca275c5bb03fcd', 'ewJg54iNJ_o:APA91bEUNVTQCULZ4oXFc8sc5Q-I2zn_h54F-ZaeizfA1971DRRPauhCes1hIAxw0Qu6z4nGpRWLvze5PdUjOcRSsDwJARtohK4YH8oe_dNr_6pOujsXuV-8usNiwl-Nt79GqP4StwdT', 1, '2016-10-08 22:42:26'),
('2d8d53bc5539ce2b', 'dMXy0wjwxhA:APA91bERiLOvjAh3fjQpX2w6C6JJXIi2OVEXNQm7uoY7ezG1ScDOi3mDXK-hCxPIE-kmjRwPnhhj23705aepti4nOyggjcIoBa_qRzPkN0LHurwyhLfJnTdRWzGVH0NRxjMKTT93EwZw', 1, '2016-10-08 23:00:39'),
('283bdd940f4a8f5c', 'dxksXy4aVpU:APA91bEXGZcgRPHCSVjIYHyfAPXNjn9M-V9aq4gAvhzNgEhZ3ukb5L1o21I_LqtQ3oataxelDJ5Nadc-un1IvaqXdxbdbsmmtaINXOR6n3T-FNBZM6i2n3SHTM3CuQe69JFj1_1xE1rp', 1, '2016-10-08 23:10:26'),
('e8154b69b0ddc767', 'f9VuqytZUTA:APA91bGtFfn-Q6sylj1UKycnuLFwsIB-t1-OsUz_TbQnKX2kbL5lIUW-nddw0UEHhw0XFH1NoCDn-AmWO2H_fQX97r3k8xmYBtfmzlzMn76oaQMIqJsr1y0aAcKQapfYG0hNiDPLctiS', 1, '2016-10-08 23:35:36'),
('eb1e7175a2f95b79', 'cH42MtqGbaY:APA91bH_XADWvnYkSL0YEg_TBgV-YxAB95xUOpZnjQeA_AqrkfaaFRUOq-ysrASpfeplLDDLU2l1uVwl8Olgfuf4PEvaNpOsBj52Yva5TYC-7YqCt5U0lzrtkpfaFl8ncOvAm4_WW-6k', 1, '2016-10-09 00:16:51'),
('64d16548668d65fa', 'c-cyD4CuEaQ:APA91bEPVJR0RiMe4rL0XATi8h8NaHIB2MxtulSZpRHc-mpMa75iIK1Drq1rjf46o-9pNu3O_wqZJuExKy1fRfGNXPGSD8AzNz163J37RNw_Yb-1jomfwFkLcwmR_cF2Jf9S7M6aKLfb', 1, '2016-10-09 00:30:22'),
('d07af49d48039f3b', 'dg1bLI3ANDw:APA91bHSWlm59vnrfjou4BDwIKz3qWo7MMOASgSg_b4T5HTE8ek2l21TraeYtnIaDeBYTjhjAX9tEeUK6bGV7VwUJBkFMS8J0ZivPKk8aqZvfC0WZUasOeMkSNi1VvGnU1aiLuI8F9zf', 1, '2016-10-09 00:40:18'),
('d119ec2093902615', 'dPMXj_6UkSw:APA91bHkvqOVtc1h5RS0Q3u1Aps2JCYtTnN4ogCDwvL-rYvhJJkpfoY3DC6xGzfdfYVlXo5tEk7aAwJMn9elU2zYkiLknxP_CtvaZa53vRRaKZZQPJ9kyE0BhSH4CkRT7zCl9MEo144e', 1, '2016-10-09 00:42:02'),
('1aa03b75b29d188', 'd4lj7GZHvzo:APA91bHiAOcv_3TKtsmUNs8-lxR24-1MgKmapZM-oJ9oFWHKSfw5KLQn_AISELRZGjSO-toIEJEVGwknV3Gc-NjgcwX9y03lAlEAynQmceN4nHn8x_wOTRnqLD5Nhn9y8mfqmJFdjrVO', 1, '2016-10-09 01:11:48'),
('db838aa82989f419', 'fobMRDfCZtY:APA91bElNyHbhm1BjPoufIKJaNJbt1v8ymBL-uE48mzzaQFAND8W6iIdmVW08bXZy7Ai9wxP-rkJKk3KKu5hkOxLsciZ0_2_gKi9jiQ8fpLpegmr33LCgaNOAs9iHxK5Ik_9g0sl0KNA', 1, '2016-10-09 01:24:53'),
('92c37672fcf707f6', 'drwPLeskizk:APA91bGE62HmqZxoVc8lNp_d7q7L5GWcbnxGXa8HamxKj90Phf7NAtZZpa63-n5SzZ1XYJcCgyMd73QGslWlhumUvOK264FlAvvw1b757xmFT5KSdl1XFBDCbI5q6DjafaBpFsRsK0bQ', 1, '2016-10-09 01:37:04'),
('f287858d4809f6b', 'cVa7593ITvc:APA91bFX9DDzMtADBjGpvsRtWA5Xy4aexkU2oXNQcvVcYnD0tvao8cw2YdZJmHGXIMuJuyqjR4cGbP22Bsb5z4NKDy-OSY8jvXDSXlvS3PxWn86V3VTee8bk7bEH07p_9bHpGNUj7ZXo', 1, '2016-10-09 01:42:47'),
('e16a38d24f27186c', 'fFqa1SLB5n0:APA91bFKF-If7rgS4_664WCi1dHmprdcPgAKe0x14__1O2xoY8y7u6hkGCgCkuQP8sTm8y4DVZPbPI15wTiklx6AQj_yZP6IwSKfj8Liux88bA29XjmRxHvgWTfoAvALgw6MNsSBjn0z', 1, '2016-10-09 01:45:01'),
('6cf89da596fca471', 'cK_3COfF_v8:APA91bEO51MG3bK4PBo0JvxfhQohQbTz_Yhr-63nM9ZYJ-iDT1OE1wsbGhC3ZHwVoa6UC4DzK8mkpd3GYfYGD5NYRRWKx1lQWBCp0uo4qqYwynd16i47jYagxUR2CHepDwC39FktD3RH', 1, '2016-10-09 02:04:37'),
('da12d412b83fb6b7', 'dqcaZNIwhJU:APA91bG86M-WQj_-ePZH3qJJY3FyiH9PHk_CjEiaur8JNfsp6u55N1s-DEU1amqHJrfFXlrGmDbuOTuGZB-YczFb0TQ61_SU4qiuojzVlv3XblT2v_ZqVT6XWwIrtUuleGdSgQe-mIiu', 1, '2016-10-09 02:17:05'),
('40f6a98402cf73cb', 'eBH39OORuqo:APA91bGaM0fU6w_RffAM8KIOTOAHvFeULX6I1rDzgvOBeTo-77iooFzcNhlWKm_5TGsqOXTWaUbZDXQxl72OpOGLmHmmC5lKF1jXsuIS6uIVlUxr0n1kYfwfSt3r9C_oaxgF-dd7Q6gL', 1, '2016-10-09 02:31:53'),
('348534ae3c43a1ff', '', 1, '2016-10-09 02:45:08'),
('4c5e100e92ebe391', 'fNrUyNeHDz4:APA91bHi2N5nKA20jar5WiNkZykA36JXwkFJq6HP1FpIoSboFCcZ_LYZ6Oj77VYswbpbvwwFBkmnjUNYgEb8_jbMN5fZWJGPiZd0A65GIre5-E61u78RoXuCFYLC3dPLlKmwUSNsT9aY', 1, '2016-10-09 03:06:37'),
('fd46acd889811857', 'flkmBHATL-4:APA91bHSLzsbOgLgOF2lILsp9HiyvLmuGAE3aIaRW-baV22qRfuyGZslsLEmdPEcnNn_WuO6jUjgjC7bV60itYZYx48yznuGpiq_qSXjg_pnQF8AwGg7-CLRS-xMoAyvCvlih2RF5bvG', 1, '2016-10-09 03:35:41'),
('8ac92dd9d44b277c', 'fuNzxilLz0k:APA91bFppxjPwHByKODDeO0mKwIrT0EeIFYvgCOUFXxIEhlzRJknroGrpR3agPjD_1O0C45aOsod5x4GfJUj4BLT1cI0wtWgkqwM0GZME9ykFpYjh0CUFWnZiU8MSEmnAOaH8T2skaEQ', 1, '2016-10-09 03:47:01'),
('cf140856aa99d3d1', 'dvTHyU0dnro:APA91bEono5u66LAh6-dKX7R73HgjzXcMFuvwg1E9TIl8DVKa7nkSToxBIYm7eFDXZm1NphqDW3U3hAU23gCklLl8zFI00zd3HjmJ29NFprEs7GYtDqSqSb6StLt3pzTqns_jGPm6KtI', 1, '2016-10-09 03:53:45'),
('8d94b4bcaaa03c05', 'cocuECZ9nSA:APA91bHF1aeH5A9bTv3Bu7FvLqI9xxLEa6fqf7TQaXAHQTbKEq3bq5gwrGTe7P5-IrFZ59_eEiU9QA47WoP30NTgm1OCEsJM93GCBTSKY-lLMJNS8JTqf3-U15fOSYknN4RxSCZu9XL8', 1, '2016-10-09 03:59:06'),
('7e552774a6c07cee', 'cnra_PxOk_Y:APA91bGxW9oJ3eLCj3fxOTTKMNwdh2KhLk2fKsAwhuv5CQo0SgCndAPL9JbUhe0bcssIj-GdnYF_72QEhh8zRzgE5hVIIgBBa6Zkc1D7tdypcuv03BWzchrzv9wYLRf29BYJhvg_jWYZ', 1, '2016-10-09 04:10:27'),
('81e4da19bae07343', 'efEdemjbso8:APA91bFYmKXSuwfzkI4ogkxR44Mu7JVGj0H2bxtiswTAS22JF7dK0GRe4iIdIja9chidvuDUaK81frlj_4R6Fh0xLA6ePWlwDko_8jzYMjNsvm5RJag-qs5Jug9uEdBBkv-_5pphYuRX', 1, '2016-10-09 05:22:59'),
('b2f7b69c77fa98e6', 'dIsxRJzyKFU:APA91bF2hsIEiEPL_1gfdwzEIfc4m-NX0HQUEEIqC1nIlt6myyrosufgVoDst59V8RHMTIdpfhPZw2BhfsnwA0_hfX3e2a-9Yo90eSiE51LlBA7VX3WAD7CjVSmKBqzjMmERKNEgIKCv', 1, '2016-10-09 05:43:56'),
('4e5ee788a5e49f70', 'cW7r9_QpAjE:APA91bHPxRw7KFdKCc3CXcbOXi9q9nTs9TowlNYyFYCM-t4eEydw0KavjthVJkUtQJ3kYqMKtXhA2B3qWRZXPtPbmkDljhG0hZUfiW_Y6dWAWbNjNth_6zqNMRuziIsyKKAp5TLkU5Di', 1, '2016-10-09 05:53:29'),
('a2a81d96c147a246', 'd1pBhmiALw0:APA91bHYpFxiRX72Moza2LfjX3UbBktjCMmKlQDC5y3cVUPqGWbQur7tx6uvuJyQgZzNFquBrsabEDiOgX78sib_w6ELk701xumUdaU3zamHSw7RkaBohgPY_ub7jEAN8xqLOvOelXXS', 1, '2016-10-09 06:27:41'),
('245bab6d27201f43', 'dH-5GKQDYeg:APA91bE1GrQ0_wxSSqL_o_jSvR9XqUaQei7VCT9xgb_7pzLfzG_kViGiS-wtoJD5F87ct4iHhBtZ1-WWxKzX2XcvQACh5TV3bsUZwmz549BsUMxMSa_mCdEmJFPB8n5140WHB09DXMWV', 1, '2016-10-09 06:41:06'),
('ead30dfae3ba55c3', 'fPXuZgqa-GE:APA91bGrcqRIz7jk_RVgoVMXqX5tYwJT2_K_UEeFkv8d69xcaIZ3FgS-Zokd2Y7q3cGdTMhu-ryX16wL6kWiVq8okBUwmW1n42kVNxWLIDVst6FTyvrOil1wrv55ZE6md2fy-YA9fIB4', 1, '2016-10-09 07:29:43'),
('8cb39c79f544121f', 'd15shq0yTyU:APA91bHZGsFJBTKu7YtfKXfq3Dy1pKMRMwiKcZUmY5G5Zm1eBuii9Vn7yee26Xr_RC3NUhumORzyAZzLCZc_CFXkci27zmnRJywueADEp5mpkna2K6tLjoaEy0lrxLxAuYn8WBpfcfBs', 1, '2016-10-09 08:45:15'),
('359a6b83fb0950ef', 'c_iw0grFugY:APA91bGWCWLAA9GN3eCqNbh1ndMDFCX4zOjtYTmtI_L5Zk4E0pGXTfqEhU6p8BjIg8viSzt3xMXnF3OuI8sgZBm5Ugrn2l7-edTqxFMQvLFNf-DitNbPFLklEdTM_FYf-dPq5QL9-ykS', 1, '2016-10-09 09:35:20'),
('ad720c5309a83aaf', 'cszAJKze6ig:APA91bHQUOVeL4k81C9bW6DQvooZD8HH73ufuoVM4uIQPhygKwvC3jUZzce-tp3lK2-v0QIfhUzYV0jeQwGn1mYaJtesk7Sh6gn6Xa2EyEGKInVv_f_lRZKAnOLi_1jyeRWRY_8ElBGI', 1, '2016-10-09 11:05:40'),
('d1e6ad62db70c7c3', 'fRjVerwG5DA:APA91bEFhZ8fScu894etmkxpHE6TPMEJZOqSmmckLOQLEUAbWde3k8kenM9wDvz9g5vC7oNROvI00Ej0UbBfoPQBndgoT2j6G976ZldDuWnIOjgT5ZjqiLT8rG6U1cYrnjWlC0cXucng', 1, '2016-10-09 11:24:52'),
('d1e40d9fb77b7e87', 'dgXtEcyfHaw:APA91bHZKcDSJgbQiQxKN6LIthCOO_zaJCK4p8O8SOy_dVkRJNjcbxwG-sBGJ4C98qYOhPiR7DDOSiOnJeDxFbcDmWwGCb-Anbu6ExPwdef4XN9eAvdLmKjGBBtIn0CXs60kCuCCsQ4X', 1, '2016-10-09 13:02:41'),
('d4a3c890c2762c87', 'fpemqFgsWb0:APA91bE936G-EHxxfI7j3iKWwgZeWnJ2XFnckkEbdExDyBNEr1zEKlsMndQuuD2jcagSRXwdgQZso92Z-8ZoDIHkAP2zC0_PapDPYy0TQuBGnAP8bzMK0JG1HDJNX6FmLtHraXUXDpy9', 1, '2016-10-09 13:58:14'),
('25e8b134365d1aef', 'c4n0BZA5SFg:APA91bFN9L2ugmKqwPq3mfXXbwQtnZ08V5pcfPV2zsxRX-nw2ygPzwxaot54Mf7g0dLe1HxQLohd7Hd7dJGAgaHW0pXl63n_7x6YcqTCAAeicMjZkZYa6dUCoH7eKKkUHeNEQYhl9fme', 1, '2016-10-09 14:17:10'),
('3ac1787b9db29067', 'dptvzjQGUg0:APA91bH1jTz0Ibhn2DtOpADb3WSGQyxsZoxQGOLrO4A_PjFi2dRTrNXOqJ1jFZlWzw8ASmpTd0oo5q_GDrbTk-CWmEXGAFM2IlcJFG-lBIJLChvBUIpDzbWwQwBzko5O_ljddqyUCraa', 1, '2016-10-09 14:24:20'),
('3f485f16a4d8033e', 'c-MLqdSeSMo:APA91bHoQ1Zqv-S9jL1BDr6IByxg50jfgHTYDz8ZpJqgzsV_M1-RMoWNHwcKCgE44zKO_SwdBYUH1slTsdYr69b4-QvzQt_eGCOh5YQ-Ury4s4p_btq0ENKCQXni91NBE68zGcr8m-hz', 1, '2016-10-09 14:31:52'),
('699cb04d9100559', 'fQCP_v1SZ00:APA91bEzz84yJTJptCOtbLeA_cB7_9BBxS9ydobrS-3npjS_eiBSEUPijXQkZ-gyqFya0a13YYnPFA3VunrSOJoNOP2fvWT4G4BnCklDLWJQ2z3C0R1Ub2O5Cd9PHaDdfVxfqFCn5mC3', 1, '2016-10-09 14:43:38'),
('1f0ca88b0a32ffa6', 'cK7MVwxnFMg:APA91bGVKweIbpkDpvbLczPlAYTg9cMNOaOoDdQ1yp1sNcFc-mS-nwSyAjLo41ReV-2a_qI_qJwsUQW8pq7Njn8MC3ceoUZRRjxOt6ldJXlXTC5OeWPYkSzL8KSbSfn_W8P72BS2ztJG', 1, '2016-10-09 15:10:49'),
('f5daad8eacc27a67', 'fqhSG3J5daI:APA91bGPHYpyB94ftYSS-w0OJlvZVtwlP9EjFRCvTJ63fIilZEdMMjl3hWs0yvgPROe1e0pZVlu4F6Rwm8GN1CIrFBMOrS3NacCUpv-9OawcSVXHKXYn4JMRuAE8ll4v5Ss9-JPnysUy', 1, '2016-10-09 15:40:36'),
('b3c1f63da824e46a', 'dwC3b5VXSgI:APA91bGFuULUI05-Yu7VvmAt9CRj86KK5-q7nLTpYTqpQYUxIP_AChYR8tS6lDpLQvoiYNNg9Qvy8hxwfmiCvQBRjao2BDAdN943qFE-XlMR20SLB6CC-zigoMrSMdQnXouuVgGvwqkJ', 1, '2016-10-09 16:04:40'),
('b79c2aceae9c8493', 'dr_6LFaw8SA:APA91bFO0LiaIrxvD611j0wvU-dmA59Oim39N2Z6POkw4TC-UdPdSQOysYQCYlEVDhwbRkDFwZG-3ebMA3W5wF4eFQyd7qqdfSmQ_6U2gxFKxE_RRIEtf_Iv98OB506-IsRam66K4T48', 1, '2016-10-09 16:11:02'),
('7e0e0c364123e4ef', 'cr90jkOEF50:APA91bEhGqfinYhI_Q5Tv97IX974w-RK-otBLH3QtaW3bBYC2A76taWKlUJHkzhXvUTJzNuNosSEMdb8Yu9fXw1z1DrJUQO3zHFNjwOoQJzYaMO7sYKnupSah0hf_TeKgSMrKqs46qgx', 1, '2016-10-09 16:27:48'),
('7bd330879ec0a98f', 'ebDAxCyhCXE:APA91bH6JGTxziyTMkf9pOQ1gaOYLd6Q7QL10Bov-GQuekqJXDvP-lE347tjtxpx1sZ6zLkzv62S8VmZEiG2Oe9WZoAoYSq3SlS-GxUBRr1hFiCC106Mgvb_0SPYCZIE8AYIqMsWG9Bt', 1, '2016-10-09 16:35:25'),
('1374a3204ec4c206', 'dGjf8YXo6M8:APA91bHNOxOr5RR1wMIgv-N0VHw4zdcRMY-xUTfPGgCoadKyjNqQDWIgIFN-9FebJ88pcd8W3Yp6951rbVYpkQb727tmDyBvuduuQYm1HnrcIOJxyR3zalgPflo_561O-LdJDeilOrCO', 1, '2016-10-09 16:42:10'),
('e4c9bcba0eab0c3c', 'c3nJ8nFN_d4:APA91bEkTP-AfPFq6jJiW4-Ew6VhpGoQ9JMwVS3-JjUv_jqvgwKQwm70DhVqPOb-pNegm_zgqwDaRonEn7rpwCeme0IzHVh45pKDXfJ6fBfbQHpw-F9Ioqrkpa7c7a3XO7WtyZtFjjhn', 1, '2016-10-09 16:45:59'),
('481a9290f07b599f', '', 1, '2016-10-09 16:53:38'),
('cb156b78347ffeb6', 'd-4cd1ZXwRw:APA91bF4rgtpM8cJLx10edx7wuXiIbTp8xbtTDuj5x9avhaWw-cZmSD67U81mE_U7RCIHmhX9-y2IjqKXFt8oQQpoxoyzT-Z_VGwozVBs-F90PXMXLqlP51NCzZFO9_k1Vm4z_zyCilR', 1, '2016-10-09 17:07:20'),
('37597b1f9af0daa', 'f0-HE4VH49Y:APA91bGOX4XoJtulBrwV61X01jT7iO82Lhwuiodu-t_24Efj5nLK5mVq2JTuGsXbzVn8Bh6xlJWVQDZkDZfcNbC3J5CBx4KtGfVpTBWH-FTxnHo99AMf_arFYKXIP0msVPg3if6Jpuc-', 1, '2016-10-09 17:18:55'),
('8aa0d8ac73263c27', 'dgrbNx7Q_iw:APA91bFmHPxAMAvgowtVJ0piW1K0cMFGcXM-L9vJAfmwzsbIlBh63dLO8XvtUaYx_pePZPn869VkCczVGq03S-mMwGcqy9q5jvOSC1MFC14dCJ8v86NXpAUTWo2GdUWHmcZ6KlK3ZmJj', 1, '2016-10-09 17:58:26'),
('961135e87e700f7b', 'dc0khvdS-CM:APA91bHvBAOLZ1XOabb1wChXcuwSJm31EbCcmqNFIsmCiE8SvAWbnbGnTE8Js8Kb_zs1QLpbx4pUzatPIGjIiemG1V0q5S2jqw3Hf9VXz-yEIsbmfHq2VrsZTHq6jqRRe0niR6koU5xW', 1, '2016-10-09 19:08:05'),
('98e210fe59c496e9', 'cUWpJSThKgI:APA91bFg02PUo1_2VV0Plqgu_GQ-iMvu7jYLRX4YTU4GBNvjnM9_gU6ndtZMRnryDp7eVKlcmWu6evfxg5djujlvUgD06jIYkE0rLmH9PGr4ZrzWv4VSC_jAn5bTk134hzQZtF9sWZoO', 1, '2016-10-09 19:11:16'),
('df6a6997346a24', 'f0C8hMibbL0:APA91bGmZ2Spi8_brBiErZZQaRXO4gu8Vv6Y7rpktj6fWT0F8jMuhhICSh9__dXSqfFGm-uO_R_CD_pRz2O8d_lo2qSpxLMPXIf4wQceMLg0-e8LCTuo-ltNaQKKPW-B-5PhSUEkAf8S', 1, '2016-10-09 19:16:49'),
('5262c60dd6bdb825', 'cGVGjs5u8dU:APA91bEDQX_uSMoca3Oe8J2hiV7G-GJzdyqsmGEKSlHeMvtfOa04U12cGKpQmk8oA7zkEe-mD-Kj3KD93o5w1_dUFfDN_g53Lw0o0VcY3x9_Np2R3YD7aFwwUSgm4TQGmy31UV2oFa8g', 1, '2016-10-09 19:41:50'),
('1bc9e7342c00c708', 'eYHpl_NiNQk:APA91bEJ0KAuZ3JeANqUDEM1TuaY-2xBj-pM6fbp0Rt9AUnhEsrTmLKNCCHG2hTr2mOg2p-dxOqftyywhalTK5zxMzWA02AFvzqZYMM06bDc4sShPzQJn9sV6oG11XzVxhElKsYasmxp', 1, '2016-10-09 20:13:34'),
('df23d026a97e1a0e', 'el9Yua5Cgy8:APA91bFYZmHjpIBEz9VWlT8P3Y1rSc29M3wyecNPeMTTa5yM5vZ9YSChjzHIlzL_OleljIozGLMA2mU6veLIzCg4m-shzVMigP9RyC8xH3iHj4Wu2Hki2T0kyX172qDsy3Mr2S9Ww4Sc', 1, '2016-10-09 20:53:50'),
('8d95a2d11f016a47', 'dWCU-mG_s_c:APA91bFT1w4YFDk_wlyiTEy8Y2RbCcDJIhpxR1nSLNRcRHwWHTKA78IA72ze6ieVOMHuG2wfBIdWVqs1txUTf-9lo_FYrWnR77ztqpL_w2G4g81P_ULaZ8oz7CcI57ivKwAdwA1G5n_n', 1, '2016-10-09 21:00:21'),
('e7918d10d25893f4', 'e1A6xI-wpu8:APA91bEyrMKVLUCHQOg6oQdn28oFJZ70LP7tj-nMt3BdaRNdwyExA3-qukmvLZZTsZ3CNCmrTDytF8O-TSC1TQtO3NRuILHH7BKIE8gmU0gx1uRP2tY6pnayzsALvDk5wVbiGOUdeGuq', 1, '2016-10-09 21:13:50'),
('b4b2fae1f492c681', 'dm0WWt-ewrM:APA91bHE4MyQWwmfsu318fePckFc_JJrRZbBzNWFLECxVyXDx102pjs_dypKzPXI7s5arEpaZASTlq_c2hgDgxZaLlW4tOB1uuNWfd8CXZFKSV7QkO0Fl5-U52wyjk814cTtn18SAuOz', 1, '2016-10-09 21:15:54'),
('a5a1de49f60bdb1e', 'fkgJwCF4k2c:APA91bFmMgKsyKR0Rcbm4CMPLafwHPgP6KQqTe2NwFNiV0qJyFZBDNl7ueO77vNE0huWgiuVTikMO-tS8ZapFRHqpQOOZbPtfW8UYjn1Or4Aap6DJeITITw_BVZBkEAH5t6j8y0lgOFf', 1, '2016-10-09 21:40:14'),
('f7ff31a89c213f04', 'dq4TzTNFL_Q:APA91bFdDBsprx9l8caXLsUNc_PrrzsRbAPPEIZOa6IbPaNgqD0AidLCpavPTjyv_VJ6Tah5XrFVuoIZ2GuBwg3waW1ee7sY5ZxNwvysOTf0IRXYVsxffjdAqZDBtdspguyBDbVT_gUf', 1, '2016-10-09 22:18:06'),
('c7806c59bc7b1a8b', 'd27hcRqIPWk:APA91bERMzMkrCyn11l1LR8Bmx0NET6m4x5XnufeJB9qs8_TyqhtpY7vmKWLJoHWv3PQCKloqHsFKI79Q_Ci3abKcizmIW_8E53tB7RpC7aWhQpmwMwdNiaklJPAXy98_XOYzJUqVRD0', 1, '2016-10-09 22:33:08'),
('fc6bd3249e778f37', 'cF204hQ4YGM:APA91bH0A8djK5TLvqovI0RUF1-WDw7OSfXy0hc3P753sdTibw3vBRHCbrfQAmvIrGZ5Z6EbOPJG2UmX2MvWV7nojVdEWWAz8LrJTfTF6ENqou1bVBNgnTWAdiT_c30G2_ZqrDePfWsO', 1, '2016-10-09 22:41:29'),
('1fc43927583776ba', 'f6OlQ_Q4lZA:APA91bH6J2LQAhxDVm0E7H5KHoM-4R7YxMXCtpyf8N41uq75_Z92roaQ18GgnejkWbF3YF2eVwfQWe0sY4OyBFRV92OlXcrzKny79C2xosj7Gc5qqlQhce66n0hTwSbl-4cWutS8fVwX', 1, '2016-10-09 23:20:55'),
('eeaf74f0948213ad', 'f66BZ3pJ3Lg:APA91bF35mtTEZ3YIGQUOf2BMYYiE1wtfKlO0S2JSf3CK32Cx4XAcch7EeF1jxTdg_ow2UmE95gCIk0n6gDhM3jOlCms9-WDY35BGcjBjLvR8MhD_cLuJ0wmdx434tjcjLom5BLVJBJV', 1, '2016-10-09 23:24:22'),
('6c2a0583e088e5aa', 'fcr-jUs6_8k:APA91bFfVUgoZh0T7cBa0-9ACXeez3LOq-hc3AGhzL7AMSRWDcLBU5dkJv1CgQVBNlmJZQRPkXORBtWc-YPQ-RwZ4c_4Hi00L7AcmdT1UG4vCTqkDYpa5pzIAIRFxfNzbRvmzASyrAly', 1, '2016-10-09 23:26:58'),
('6d234762d33e3905', 'e_QTH_QGn10:APA91bF7qV2r-cw67u8DE_RJ2nL2XxQ2ke0c7TAIyT7Z0yDPfrBQUwjUePZYHgSysGDUnCRRdjgwEFZbJnvTZvhj5ctKgquNLoV9wm9nLUb5G1uODP7G0qQGxJMjLtQD6eyyDyG7zKOT', 1, '2016-10-10 00:54:36'),
('170d220162509656', 'fNHOYQT8sgo:APA91bEnesOMbw5iy8dLYwtXYl4V1d54ZVA_FtEIagYZENPbxk_Fuk6E9Q4QTIT8XEBE1tj_7a3ARH-hVfTWw7ivIJpdM1MChND_1HOE-nQip6erzmPQXlZYCZGJgoqssNtxetr0Xs0X', 1, '2016-10-10 01:14:14'),
('2459714a51d1390a', 'enYVZiiU6BA:APA91bEPnCxgA0HabTzQ8gOAwBvmZXv-8jRtS-LJCgf6jpH9DXqAa1prbGl5RYFt-YOGhwAtzwAS1-_t5YWrohEUoSPuQ8ta2m1YUZoVG8EVGNmEsHM96rXNw6TuiQx0St1oVK5W84nx', 1, '2016-10-10 01:14:21'),
('f87499c270d87636', 'fDCEMqUwvXM:APA91bGeasgO-2_1rHN8cREHgrjRuYTCfoRkq6s7yOU41ZP1yxusnq8BhuNbj079_H9EGY1bjE58r4TlfaVNjmhhpN8OuMGOh_YeG8e64k_u0bCiSecFtV8AToQsuOejSbJZpxQqlgkf', 1, '2016-10-10 01:35:40'),
('88c01e3cc2c41e7d', 'emo6wyy2Kfs:APA91bFFC3HkT-69USuK-ue1F13VcNwg53KTGCF1IGo-ICwqLufxGR90PaZ6j0RpERIjnq64X9bnQPFc-ozSAMg1_6uXhpjnVbNapyKtJsQRGotQFwzUwqytl9C0KMW3E1q82KDKOV9b', 1, '2016-10-10 01:36:56'),
('8a7c56d63adac40c', 'dfUCvhJxeeE:APA91bH1HjAIJpHdUoPBnRX8RhuDGczgyeOdrhTzQvOpoRXa3euUnG8lSrrVRAHO0zh0a1ikrg_5t1o8tj4I2hIJVRnPKqqgvSzbtnl9aUBprcpyiQJ06z1LZvREEyX6BSPNxw-cZK0-', 1, '2016-10-10 01:44:14'),
('6e9c7a050f0c711f', 'eUPZcXV2CoQ:APA91bGSmF6Yo1c0rrXMYdvv_adOJb7hAgguCoayzeuKxTTwb86mDICMF4wVLWubY737BcX62lvPBjWJTLEKkq6laTlEmPjNXGRBp2oIQLgMHAXsFIW0oinkmbeXQcRB82dFkWpAK6pF', 1, '2016-10-10 01:51:52'),
('648af103211d300d', 'cwhuQf239fc:APA91bETaJWK1rpF8HMHJra1ts1VbTtu0vKlEiG-kt7UA8BapEw8j0qdHIx9m6KlVibek2pd4wRWMDTs6lxk3AusVxXsalqbxBJ2ny5ZLKnV8CLetTPTPLRlwEMrkiW2jX5hIA_9FdAT', 1, '2016-10-10 02:24:06'),
('75a414f73657fd05', 'eqNjtIUwfog:APA91bECk8Bp9-4_JUBqfuLickl61yOAqWnX5R6jFZp4QKtK0n29kojXcZBU6m3MXOp6GVQkjf5C1ymGKMCwdRC60kBcUY8QE2FO4nllfk_Xva4ngg5pqeNncSU9SbtjMfDb9ZR_pniR', 1, '2016-10-10 03:38:04'),
('78af99ed987af484', 'f7_yoQmBaiw:APA91bEy_BgLa-HeTYtGwF46_saaVrxoKUmmJeLedO0TILtxm1bKa_2voYgBbjalToUGN9P1TcOgCYvYsYHuAszrpt7Txm4o79OBPiTrYcX1PEzw85PdaTl7UPrs2Gw7jE3lMEpMIE0y', 1, '2016-10-10 05:43:09'),
('5778c89ddf57de18', 'dJn0tum23ug:APA91bGvM5dO91C4hZ2IOp1rMMvdZ_DFrBQpHOwnNGHr7tYyWuGQIGHJKWN8tcZTztxbA719JsO_XY01KOU8-zfNLbUEFBoIJBMRD-IexFQ6Ss4wGFbCbLB8YRe8v-1B_-4moiII4iKo', 1, '2016-10-10 05:46:18'),
('ebd593649b4fbe46', 'fYB4SUeb1TU:APA91bGZUl6Fr6XEwUhhvO_XbV7YOiy_5D0Hu9Y_dXpWth7iUP9E6phXYhDBxYD1y_FJuAMouLnwdF5AePySFGBZbVXbh1S_r7bfrKRH4wzF2g3e5YZF9ZRXjPun1W6eecxevNfHombi', 1, '2016-10-10 06:03:31'),
('e21474eaf61f65ea', 'fIfECQO-MD8:APA91bEoys1WySCzibltBLxYpKJdQB54ulpB6GLnO0tP_d0dzAlutxFIQNFezNAX-UIDJMGp4wz8PTobuBGEKJ9gTv1T7FS_n0P5m1r4h66CIM3PmNgoZ9KSrSGoTZh6JR_eEvsRe4FV', 1, '2016-10-10 06:46:40'),
('71557d85d4212ed8', 'eQALB3ArnXQ:APA91bGPVCOgeLOsTtq1nChaBzTqO3yli1ccX8v-_vl1kVPebzUxFJeoDqLULVuDWAlYtCpTXtb5l4dzsRSSN-qjbO3qhsRVqKBHIbgiUdoQZGEWdZgmN_SDmI84RbfVUCyamqSlNcH3', 1, '2016-10-10 09:53:17'),
('4fb2e8f40632ab65', 'fXfSfD9Vomc:APA91bEAK2oGzvM9FtR4cGn1LTlaY76l_EUsRprzQSmhIccmFsBe4zXf5kjRaJJ4m0-urWNnLhm70VKH3H3L7iFMEsHOpT_jJLQXmPPjxKmRtNlf7TxX_e-F0KgKbjcaHLzQNPAgg-io', 1, '2016-10-10 11:00:29'),
('e50a669279177149', 'f718_0m_MF0:APA91bFNjp2GnSGFCT8efrD3T7QAWjC2DWdefdJBrGN1wvS7pUI9gXZ7ZbT5_PXpBVpmituquh9iQXMonzC44PhwAxL90aWaWR6E0FHiiuVNpZ1l2BQw7WwgQrIsDKwjzShf273RWgyN', 1, '2016-10-10 14:13:23'),
('7613eb5b371ea2b3', 'e6zKj2fWMX0:APA91bHTAlzOO0c7gqQeNlnFTs4wNXCJZQogbhPtxuLqd2mDPFdnp9X5kavlm12YIDAaNI_dfNBc3s846O3sfUPlt9nyz-_2FBaubiGB7EDTDtT46Ho56GtikSbgLC-5vV8JA91FX78y', 1, '2016-10-10 14:19:59'),
('a1a9b224d15264a0', 'dIFguUWVK1w:APA91bExw5tgUrD4rcTP0EYAfs9YXe_w7u13raDvqhQ7pYylVYHSmG47nuNgPA1fqi7yDN_4HiIpqRi28J28OwvXWSSeXjyNt4OuezIWSP6Em0AZymPsZn8NzuX54Xu1mCYZPPUXUwLM', 1, '2016-10-10 14:31:42'),
('72d90686b64b5001', 'f-BbGvyt-ig:APA91bFeChvbHHMZyBYa2vPJLzBuGbV_L0kL5e5qhbiz8RPfMdjwsgyuht8n1IVGQzgGHdYrwk7xcTAEHRt5fZ1Sr037SDqE3hBh5rVqdShH2GaHtHTo75b7XVfd7jYMxwsVPe0S70xg', 1, '2016-10-10 15:13:18'),
('16fcd7e659fbc19c', 'dRwnPJxDJe8:APA91bEDiY-pR9gv0Itwr8mz76yxIMcoR9KXVX9YE1yMDrI6qQ67EmCBgImfPEmDcs1-bqI3o2tNJ7Z6bec6hqNmkiXIyftK7CD6Y_o5Y2GGd4P0V0ngq9Y_ar14WzpEabuq3HTXej8H', 1, '2016-10-10 15:26:48'),
('687bae3fd8635d8c', 'fMyxxsKvz-k:APA91bG4Vm3XcePIslLHbo8DKdk8bPQxEru9gvnN6h7B0JCmV6aJcvaWnhfBclatHpcTuLJ570gsjdaQbR2TIPjzYpzj3U3jfP84TPS3_E3qiuzDL7b1AblocWNv4CCK8uE3xmOi8Guq', 1, '2016-10-10 15:34:35'),
('995f4ae8111b15dc', 'd_dwr1U_jac:APA91bHJG0svbFkKV45sCOAPgZew9K89HqDq4XPv1oFpjvOX0a1CAnkLjs7LTYm-n7Wb71msexMdX_dFY-B5a_OqSSIVEkiIIWG2TeZhuJ8U35xw70e3ZSJBJzcO1SbQpiJXSyT9-p1l', 1, '2016-10-10 15:45:13'),
('b45f97930b740277', 'djtkk_eNO_U:APA91bGSIP1wDeXA_ziZ6bMxHgLD_NsyUowy1xyuHCiLR_RxOiFkrOAkGvDH3lLREh3teMn5dvHvYRHTNqAtaILYiCz1Oh7a5ggx5AvLuMMyVma4YdB0yYBWgEwV0zvCcA_y922pHxIN', 1, '2016-10-10 16:14:30'),
('206badb05ec8e511', 'f51qauU21Lk:APA91bGBkktDXe_L3VFcpiW3lsHOLK1Y10NekZcJfhx7cJEOPCxWGobsjUQoYYrOSyfXm4qZuWIMCpRkS40Sq-y02OWUZLTug5QaOspxdHUqoS-tl8E2oSABdrC2gYsy9WAr9UltWWY6', 1, '2016-10-10 17:13:09'),
('3a4ddbf211fc95cf', 'cDhvvuObm-4:APA91bH9fwg55VL8n9xW_7S7vHD-62tHtdQtcK3YW3YR6BMmtBGY1RY2Y66xCTtzUpnNyme-UGVr4xsHqmkqITxM3MNVMvdUP8fYIUi7nhpH_3DogU5ToobeWEcxwDNb0plEIIDJlao4', 1, '2016-10-10 17:13:12'),
('c29edc1d7cae59ef', 'dEM2trAvDdQ:APA91bFp70KGgwO8gKot1ULWIXsKbJcrLghFxlKoozjvj3IQsxplCkmUNuhpDV672CEtUpp25Nouw31lK2FMF4vCGhoFRVKgVgKQpW9WRD1edFh8Em8caORabOJdYo9iiSZ7XDgXjMaR', 1, '2016-10-10 17:13:38'),
('6cc895ffc3ad5477', 'fTsOqrrJ0zM:APA91bFy67OKFixIUo-IwMCwFuTP7FMLH9MCIQIlbasV44fC2axXyTVGHnvl5-rflSTHc1CCQrORHd8WO2otBiRXRqHpXwMwvnH3HOuNPqsrmMzq4-1Fgb3QHSWIrG3XqZ0ET7kn1bMf', 1, '2016-10-10 17:23:44'),
('34470949eae51217', 'ewaAaath6ng:APA91bHNDQ3fnZJHCx5IHJ3H3o68-cDHaQNheZdJiAnGymUPKnAsZfXGBFg3oemoAYcUA4MV2G2NP3ZhxKfZ9NuR7slCPaGhJaVrCWQSKKOMbjMy45s9Z060_Zd3sN2QJfh3G9GXng3l', 1, '2016-10-10 17:48:05'),
('8eb6d2c1a0015043', 'fJ-3urY2Q24:APA91bEa-eFPnLv_SrYBVDPL_dC3h19XcQ3kLfwwycqzDWOI5s5s-KQaNjZoaC9omkHcpbnvnUxSCPeIJrZGaHJsn6TfgKzvbuuxlXnWRWOiN_lfeJZ8xrrclBi5_vdLSVibVA_b7207', 1, '2016-10-10 18:05:28'),
('a7e953a27862b105', 'dxgQRRmv0Tg:APA91bHEOtWbIkl20VYqjfpRDGi5nOBTPimPk-UknMRRbL1Dlqm69hISLbmsp6h_cr127V9itq6A3i1hDsGfnvRCoJi-skRD01R9-mHnAi4MDwFb6KPWmXxhl67z1PPxU9cPq6Z0a0aB', 1, '2016-10-10 19:03:54'),
('bbcf70d0ebc2b71a', 'eEQVpRs4TTE:APA91bF6PPRH2XYZPd8jaVRReaHInlggcARLRwTvu9mg0Vh7sUEEyRTDaEMs4edjR-7bwfmQ7Utrfi7kPH412697cQ3PbqKaPAPpbTpD_RMEpGiMCDDab75o63H1K56lhwUKoGYiVAVP', 1, '2016-10-10 19:39:34'),
('acd0170c48604c82', 'edXo_2-dOcA:APA91bGG_aMuO38JKDKgov3NPbRLkrKpEx95G27E9FdU9xeVTUOjIXeKGk3_i4-RxjXd_ssbzOuITXbS2XOFoNRupcE0S3VBr2mRVl_zkcpL3iPmPiNIWx0ANwqbh4y7cgGITH8Lzslm', 1, '2016-10-10 20:47:30'),
('a9c7bac4a4846172', 'fXRs_UzMmFg:APA91bGymleq2RYhI4wwt7O_KsX8jtJ5LWK6S26zL-OuJyEPIxaxK8TxCP_lEsU4450xOic53hlNQ4qqSTUXQKVoAdBwYFWM-pFE5XKhZECfWMxKHVUB9PrZ4NqEfGKHk0j9Fm3A9L0x', 1, '2016-10-10 22:00:21'),
('485df2efe5d53d9e', 'eRXmRYrJ-4s:APA91bFuHc1nIilYMmweUZTRcfEB4uKTt3PSI2opy4s387tsF8O8-honjxkb9am01HFXv-lYVqD3blIVRtl64yg6U4UZupgTsKBC9mxZGs5OgAyApUMv_Luvch3mn2R36SipgXrlaA2S', 1, '2016-10-10 23:20:33'),
('1eee29a2316fa8ed', 'cQyp8CWal_U:APA91bF0zYs8aePzZfat37Z-0XAknoVdlyP--2ngxm8Yv4WRL2adZliK_gkcZWB-xUPim4hxEiQVKHFbFTytBeQBRsIN73ZD6fY3qEObcbIi1_yWQ_46l6UP2yhT-kjkYVG8rMLqwH4w', 1, '2016-10-11 01:31:43'),
('24c8847f4e1d04f6', 'fKMc9WUCT4U:APA91bF5tQyETUM0C2jQlOLUJVE44JXjhLen_v4iZ06-P7vDy0cqwYVuJSC9d7v_ApW7h23GG0AL3qVFtbFKwn5IpQVZzDEAX4ih2XEdh2BYuYWALjZ2_MIY9qK2rL8UYoDVCfY2xDKB', 1, '2016-10-11 02:05:12'),
('e3dba98b606553ea', 'fZHKHBUlJmI:APA91bH795X8lNP3MJxG3qgLRLZeLGxVTfez5MUohMwcF4ebdgZcFn-TzywnP2r46qgJyoWJUFjgOPSMXOobUyXoewcuK24K8myAgPQNOJCObYZbv9NTsyaSbBv7lMC0Mhg-_tfMbl59', 1, '2016-10-11 02:43:01'),
('8befda6ab8a01a5d', 'fI5FclEhThE:APA91bFvs0e-IxP977qd7QnvNZG_xQ6SNi-CWA3Ho9D3GW1SA_e3tBBUmJlquiuK-bha-ma8zguaGpAk_ahg-sFhBuWT42P7SFVhzf4Ek7ZpcfhkCxrr-FoowhVyt8wppR2wyENl_WCW', 1, '2016-10-11 02:51:23'),
('6de7f9369acc6701', 'ecK083auhek:APA91bGKmUnMs55PHHDqwINmgkjJqvKHfuWnmCi29A9V35ubcR0y4wI4uWwGJSTyiKZVqt0SaHrb8ojIP0lWy6HoCHfnZpDFtsta5HMqgw9lWgwcm-uhrlwBGIuaL0EFlMPxLroq-E8D', 1, '2016-10-11 03:03:04'),
('3cd482c167296665', 'd9toKNM3_B4:APA91bG2lbfXQDH9hk3SXN0vpMwxkk_IvyV7fHPISMARutGUQJO2gp3PmVJMDW-xYMX82qlz0tRSvibPaLIP3WjF5c_0k77HVyfBO2Errdg2t6TwRlArsDrTdVUJBbejHx_hKZ0PEaYA', 1, '2016-10-11 03:22:17'),
('cd3a4026610f4d74', 'c9KzMBpXVSo:APA91bF_OrQiAX7TOWCJUbxh5PUkqKnALXHYLZ2Ok8ll-QiOEJc2rzvdautHgU2NR6iZQCEIaCqynWnwvSpFYj54f-OCe81NCPn4zp1FJeP9pAXi8dSPWzo57gxyAUORdFAvwoRwk11f', 1, '2016-10-11 03:29:34'),
('980840232dfc5cdc', 'eJ27GyCxjtE:APA91bH_LVwGJkUBy9MjDiHZtRy3SJOa5n16L2pp3p6xVpVS6uf6AMOhGIO_cNd8Ap45kRaR9iqXBAnafL3QybOhcPteN-bnbAgVKIZh418e9tHmxT37A-OcDMGOFW02i0cSl9N40zVz', 1, '2016-10-11 03:45:28'),
('250a53520c9a4785', 'eT01gUDzGls:APA91bFYY-5ip9uxt6ejB2jO8WLv-Z3Ks8ofb4c8ZAmdC3WvYrRVgpEhZIc9fEzSEzT1gxuvG6-Nlo8roTGMjK1L6-maWHXr-viRfmvU8QTeayrltUxhqDNldmuAHNtf3hTnSuZUWXUY', 1, '2016-10-11 03:57:50'),
('e19fd632c0350c47', 'eQe5iD7fgyI:APA91bHRB83Wmw_3jOtDNavIL2D-vR2lM7yS3RkxKtSrY9SMO8uGk-XTcBKUSYrvEZh7QOHOrzcwObww9u9OFZJOApSiFNM3HIKihU5eOV6GWpPTuG0SSAYeEJ0wWiolo7gxNCgaBfD9', 1, '2016-10-11 04:12:30'),
('b9b04b0151016739', 'faclcDoPGww:APA91bGIap8UyxcFVEJWmAXJQpsrG8Ftd8kQSPAI7Ew1yE708bAyFG0VBfPdxYo0FlZxU7r2UJEQCdUDjP-K-_Yffomuen-UqOqsRLyW96C9XDWZbEhOCTt-vgqdHCVW8D-9ILcs9Wz-', 1, '2016-10-11 04:13:40'),
('95c452d365eff2ef', 'fbi0WizBIrY:APA91bFtJwoVlylBWD55Z2hviPmTfWRydeW6D-EpN7YMNQjW6k4_hXY45ei9LKZSPx8--gdxw5wo-uCPRrqUZ54RRxlzeXOZT2slTNvjgBRV46qIDcXY0UIW5AbncPhkarI58RoerCpV', 1, '2016-10-11 05:13:03'),
('fce3bde89fd66e09', 'f19UpVyJ7nk:APA91bFEPme_qbWjX9p2wotNgeOfgLY1qwZzAzVYozS9Hs13_0hPiKqmig-LaB9BtMBBVEMxB4kI0eXW87E5dumUOV278cClbyKWoBfPn2M-RaGdYB1ErI05ue7c0_5w4B3Rb2NiTZyS', 1, '2016-10-11 05:18:49'),
('6e842109b0020c88', 'f9dFYRi6ppQ:APA91bH2HyxJhcqFRIj2DMNYsKkfiy2hxh9n4b49YgPcrrcis3S2I1yRV3RSZMkK6DSOE0IJD3JnaW-5pOwatIkIoEH0eUGIzWhVNZKO4GoG6bPH73EvDmaNleV7EG8eNEPdf88vCf7x', 1, '2016-10-11 05:31:19'),
('35730b59257cae68', 'cPlMXVEZu3g:APA91bGGcbxxiRA7WLPi4MFTV1FXfVirjtCWGFvsZf3-Wtmsy-dBrlXpXX5B5L8QI7tOcvLz5QEHS1sxVf5Y5Z6gX9k79N3BMpfFvwUIICIxNknXfse3Iv900M8BPc1h-GFzVx6z0E-D', 1, '2016-10-11 05:38:14'),
('1f1ae10c00d45c8', 'flKCjXW2P3Q:APA91bF7Kg3DOuGgXBc5sidGo1VvoElJ084W9ov4ML7X761lI_JbFVJsKnG2W9IRQzRpsnytgk902JlrD0ZaUEBuDkwnK_UM91fYJlVP2uXsc7kDqVlVhUbqzGiKiDw9PWGzog6m6U0y', 1, '2016-10-11 12:36:31'),
('60bfd667380c59ff', 'cCRxBZUW63w:APA91bGNZ9l-czNoZOrYMjS-AIo6TAq19OYxgoZeQNktmLarvSMu2oUa6yHk1NLXGLep0zouuIISB07cN4OopPauOh8y3Az4HxANHnPXJFUi-ccbVggHUofkBABN6Y02tuDcjfspFvDj', 1, '2016-10-11 13:26:28'),
('ee4a67f4cc60a5e7', 'dbvT77Kehac:APA91bHUxyCaiqqBYUap_gEYhQmApkbq_9okvec9Oz9WMhj-ttMYFEdjeStc6Ec0Na2Z8eKZOyQypgW6bF5PppFDyWdRT4ll6oiEN9RwpVjlgs0yrVONsH8HMUIPlom8vnZJ2qBou7YL', 1, '2016-10-11 14:12:09'),
('a3be732de49c2aa3', 'dKG2T-Lw_vo:APA91bG7dIZ7-ZeQWYSDvfklyxKimZ8Su9ojA6s-2cWmHpcCh0u83B9ECxTIuJeBvEGWdZrR-sWAhIBUHxE38lK_gQOO5N-reGE9XW-6H5oDN3Y-n5zyL9dJ_3o-m_Xgo3GNk4F3ttDS', 1, '2016-10-11 14:55:18'),
('19dc32c746c8cd08', 'd3wzmSTXoIU:APA91bHO0rAYrNW5_1hFv6bRSL70msAlLKtomTZFCihjEJIZnt268j5IVkEsL7ZiqMcBXvC5hp3cj92J_rMUu3k32q-_CONYGSPW0RKilR2-1Q-Xfmo8OhqBue6yb2fUjtuTvq5tAEOT', 1, '2016-10-11 14:58:08'),
('8582a07af9743618', 'fPBwMTJcy9w:APA91bEQvIMNNCYOAbqpySggjP5I_0dCZJpnAujNHgk8OnyjyVdFfqepN5zw1EEOm32ycezH_bYQGHl6ZScIaBLilgc5R0dceqwQS2E6v2xHCtNo-hoUaT8-sQwi3EMaTxmhY-OIvmss', 1, '2016-10-11 15:13:30'),
('4c4d9fc9afa0e723', 'eGnMjjtvhr8:APA91bFPxADE5-qIQW-3JCVTlLKmYH7IxnrXT6GL69jRK8DirDxlHtT36T6Bi7o9YJcYT26KEkzWDJWSHW_k3RWsx07fYa-fwAMg-3pS4f3ZaoRP8e_KW-rz4UzSu_7kqtLkXQfGeDjJ', 1, '2016-10-11 15:45:50'),
('20c1f0da3b12472c', 'czS7LD8OsXU:APA91bHQStEVnJiLvHNU9ui7kx5xId3bOhHcBMflpSw1nchW2bk8MXIsRnwmkaZezCzpqFMsfcOcIArusibk3lPBeahEywnt5XR4y67K0LQLQFho419GqjdeGFBfzRx3OjoFW3HvtPiZ', 1, '2016-10-11 16:03:18'),
('e9cdd4afaec18843', 'efKiRiIso5k:APA91bEE3eMSi_RwClHlPf-4if9QjkZb2-GQFDrPf1MBn3m_VO4-dKqhJ3rRAUcbboS2UASv6zdTOqnLSAlfq0m70Jf77Oex7Me9YaY_hFDuz7xQxjnmKaiTiykSJVO7V6oz4uoGoxQ1', 1, '2016-10-11 16:03:20'),
('37b4e62391ecb3f6', 'eqJOtGiU9gc:APA91bEZA5G_mxIrSRM_55rVRx6VZ0PWVgUb0xegVlENqoaa7qUV6kZBMnKV6CNzd3U-Wy_Dq19vhgzRTXKYHZJ0z-Cab8K8qRhl2ye9tIiFbWFwSGesdKT8xsjqdcPIxSDFGQw-vpy_', 1, '2016-10-11 16:05:19'),
('ed8553393a0d818c', 'eWnRXhNZ81E:APA91bGqtFokhKdO8GC1JFfb2JSSdt9BX0yacxDeqkkbIn_U5sDCt1lqSMlYtPY_-4rYt1Q0I8yjbcB2FeQiJNfWkn8nu6nXp_Kfp233oATz88x6XhJH78dReIQ-1U_cybmQtCf97kbJ', 1, '2016-10-11 17:05:17'),
('96ae8ef6683fcf40', 'esY6edYtyZE:APA91bHAO5006nNILa2N9pwgITPak0ybuXZbNBdNzjyMIueQnhhBItrrueOMyT6AokX64tfNHWj2tMglEgVUICn9NsIrjLm1afg_pZslSuUv5lSOTy2mbsqz0rNihZTha_eFxPwecw47', 1, '2016-10-11 18:02:28'),
('32707837f3fd2742', 'ePwUE0IYAYc:APA91bGGRgL37LFT-luf_UkOxzTeczDXPLkRKRkTMP7iULqiRtdifR3cSvJUYZGne-b0IMoaDxf5aATtZabqsukkNXpdExbWipHnCscKiSXrI-A18LOlBpHTKYxky7_o-NVvMAe6UD-d', 1, '2016-10-11 18:16:43'),
('e5fbd476e4027455', 'eMM0mLCb6PM:APA91bHf2cdRzMX-PfbIoUHaMmOV6haAYcHXkNC86idmiKs3NGYlPzLam0sE1nri0CATTDNBUJyinj7u5SNf9wQXQoulql4XU4i19QjZmOE2Gk_By2GOplwxKz2v47IMUcWbR_3u6P6W', 1, '2016-10-11 18:32:40'),
('162bd54951f9b12f', 'dA9j2VNcbd8:APA91bFolecSYLSje-wcedeD7j5usl4_5USPG5lZr5JAn68hQOyg61FLfN3mi194QCh_iGVni_0q5-gXZmunIhoQDLzVgenUp1eUVbnQ281JyAEKOwuH9JONIsj1ogihIe1vHj3SXPby', 1, '2016-10-11 18:40:29');
INSERT INTO `cap_subscribers` (`DEVICE_ID`, `TOKEN_ID`, `ACTIVE`, `TS`) VALUES
('e298e4f01568d2ea', 'dl7NgfzwWMQ:APA91bGMZypvwfgBJ8TIKY00fwrQvHvlJXippFvm4Jr61wv1KTHLI3tEgIr6FIrdNptcWUS7XOCAYVSBcyoQXUTj0USDyBgqNQxOSjKq3xc-3MULtyABQfyFmQfg5IyqAqT7RksWZElR', 1, '2016-10-11 18:40:39'),
('840b2ecddd70ce1b', 'dMwwdOoUPHY:APA91bExZzSDmI5R1Ly0EcZ_lEDaf1NGOTz2yNSZ9R3H9zX5YWrbttVGSWCLcIlGeEA2NzJXsBSirjttLAa-El7kHh16KZrv1OWfrl7CYN77nSc5ZwmCjTRq4WrQ8w0pMJPeUhDpZ90g', 1, '2016-10-11 18:42:01'),
('49816299dd45dadd', 'dXnPj79k3gM:APA91bF8pSPFmkPod_oxYcMrJsl6c6xbBk9I0IwuX70eLFVGK8hS_hjXRTpFgBORKTK1aaf73VQPq8OolN45RagMkVpPg2pEeTJU0brY8UFyQFtCpXitWfrvmCdo8afVsFS9fzXy_e06', 1, '2016-10-11 19:30:41'),
('7de84daa2a780729', 'cQ8KydfGncU:APA91bEiSFMl0vZYJXxbG4ChKjZwk0AKM8bRyfR0Qk5wipdlkPdHqNqBSDy-8rii73x2GmTx2ZdRNypBTek5XAu3tJvrKkPAQtXMeEwJ92wx7fki-ziEhmffQFxormgnkcnl5lLHf-Ny', 1, '2016-10-11 19:31:47'),
('1e2572dcceb5231c', 'cCObnfrVbLs:APA91bE4XDCvCYJGbuFYUpfIs8ympjw8EW9m15IKesYP2tp0vt11afHeBawAUG7LsJOlaHhdZg9ganPonSOB3fleA9owGZcsIPPb0GMhBNTM7dHdiDaaZN4q0NTlZZDNzymJakXmcwPv', 1, '2016-10-11 19:41:02'),
('8c98a78ab1c0debc', 'ehuygYRdu-w:APA91bHo9qtyjodiEmTU8SyEkj9KfIXaTQ0tSJDdhKG394IYO8eFd4nLsaVHHC1SBJSGAyQiXHihbwvjAhlJfeGPC1f4V-OvDyqIIqpKGJt82b600N2KfvrYjT87ukgU0yfwXz6vbpvV', 1, '2016-10-11 19:51:58'),
('1855d9d67fc450e5', 'ej7XBnSuB_E:APA91bGCypnpyoDAYiPkWvTqtFrt2giOXxO1axA2EsxuuPypG6czcD2DBiAnQpUDoneM1Zb4WDkIsL0PDZyWcBTPqJlWQ5AFzrBQcDnjsNybVyt7riqD1vfRgrqN4Cz-NY6ZUGUeN1Kl', 1, '2016-10-11 20:14:53'),
('230e0e8a8c8c313b', 'czVHCJu4sWk:APA91bEf4U5kqyTKipiNpBbr27Gd6M1qyUXbQJqnU1ex_eM0Fb__DEA80QjC0doTQsQgcxFRI13wl01rI7Wgfv56xNh-H0fVfkEbRdMcU-r5jpe9kEH4mmFCgLrKVkzZzuT8fwQ9_1rc', 1, '2016-10-11 20:27:52'),
('948dd5d079cc44fa', 'd_AC4M0Y3Y4:APA91bE1c2MUsKFjSBrbwYyk7A0ANs6-Ay6k6w-z5kbVmFtXkBgHtqwINWLzu9UtFGGIiK0bRZJ93nVrZ9CDQvdW8lHxlS0oyjmRt0WoR5blrtcFD6TTCXMiUEdISxifBq0SKV92QeON', 1, '2016-10-11 20:37:06'),
('c2a7f0a3cc8da4da', 'cAxSxUo_1rY:APA91bHvyz-4T2oqmn2Egm_9y6XQ8LRElzf-gKiWmV6M6Ay9qtpNN36u9FPu35CRhvqD6RCnpElYxpZkUshDWr5rwl70jHQ4yFKmuJ2hNq3IzJDyTuL0ZlLmQjJKz95FkzU4l6xrmzjs', 1, '2016-10-11 20:50:07'),
('cda4b65f664b7f22', 'cK76CyKj0d8:APA91bH-gUVPThIeowXJTARzW1KKWTDQ_wEBXLPIHYJYVutQPYIm-pYBv6yCLko_9EmH1kVYFEr8UqfxYQTtV-wuq2ZiD6k_xoTwAuGeatkJk7Zf8UsWi7lqK3KQIlOf-_Rhj4iDCe9g', 1, '2016-10-11 20:57:16'),
('4d915d8b0e6b0ca6', 'dcn1G1WFfb0:APA91bGWQyeLcJXsWzeMGiQHM48TbX6kOZJN5hYWVEz1wAJe7Ofj1Ct-lnCwKSWKHqANd77rLPtISEb9aTZDoU8a-UUZNZrnYsmK-euI7LRqgUn0MSCN5uOlia5xQZhKUs4aIEbvv04t', 1, '2016-10-11 21:06:40'),
('9423409f19f0e60d', 'fpw-C0oOcp8:APA91bGOQ85ocxDJr2ePypOR3mJZhEdylWvv7GglJ18LBW47rUbw2BbOsgH7xODdtl_ZF9dDrNC6wYStgZCiM9Sc3Tom-DKksQx6rVkSBf4Q4R-DK5JodrBoMQIiGl-IL0DNZNeAgHK4', 1, '2016-10-11 21:07:02'),
('2069c7f6511b3bb7', 'fOQsnRU9aA0:APA91bFB7KIFocoriYOhORCmVcCHKg-H0uiEb1yxYQL0Am-jM5NIFpRcVTZTZ-JIiYoSTFy6mFxAsfc7xg9C9_VJoBE4Guh2Mnrxsvj3_iUtP0ge7JhJ2jgow3zqaMP04ArVVXQAGKzN', 1, '2016-10-11 21:34:55'),
('31e4dd1c8be27c93', 'fW4btCjQa7s:APA91bHdfKj_Gaiuk0ONmXY8LRe3hGv2EECWXeegUC9wQvZHV7lPk93AHcoUzVwcnnbFUdMhO4XyQdv6hBRRTnP82jd_m6AJcvk3X7kPF0FbKGzSTvyueJ-3zsWBvDyy2tTEsNLOmH6s', 1, '2016-10-11 22:01:48'),
('802caacfd646c8af', 'cHE3tC56Wk4:APA91bFSyT92zaz53pepFPuBZD9TTkjKoecneOhJserYJEwy6Urb90r9SYGMqfxX0NVfdegT8Ef9sbGUJtLgjiLJvZ99gr4KOZtpwx-MCYYuLFqgjNggee5du5OAUBRvX_gjNnmkCnG6', 1, '2016-10-11 22:10:02'),
('d73f6a91fbd88eea', 'eaBZn5ij_s0:APA91bH0fUUL00HOQIH_nVttLay9400f3CQCgWBU067etmgJjWN9_FqZ1T273R0dl-eOcjXP6Zkwmj5SJPQD5gY7xEnsG_TZB2oCn_oRMr44i27Ljs9B3P1w1qHPM51jOcm3BE3NYULk', 1, '2016-10-11 22:12:40'),
('9a89fe6c9f5f25e', 'cIVqSo3IEpg:APA91bH25n6WR8WH70SXvOFS2huNXZpvROeRXpomwMm0COrxfzEe99ZYXUIJdbrDko5p5il6HRu2IU5_cOFkNmUEhs_Z0ZDKqO0aguTtjYDLQr4vduKYQXThh0JSYg3PI8JE2P-o01Uu', 1, '2016-10-11 22:17:20'),
('1ddae7525fb8d2ac', 'c4HWzNQJgUI:APA91bHMRMZMmXw65Mz_RHT7GCVqVGeT1d1mohTezAzrjTHIlR2__D2_ieNDFECxbgsmf-X0A38-K3UVUwnWdOx0y2M4J9S-KbGSI7ULv-IVWSAv6NOY0x10Apv0ZrzImNujeS2Wu5ky', 1, '2016-10-11 22:29:39'),
('6bb50ba4f3d67b07', 'eMZatMc9W5M:APA91bGgArkx9qrctBB80yiX-E2D3sb9sDzE5gjgT1rpAg_kRBMJsnDgk3JwE87tugxt_NSIz923asMhkyeFIFRX6kIuVUuzbKC4dO9102bTa3WzcwygobEikRGF-NaIJYVrpmWT87gZ', 1, '2016-10-11 23:50:49'),
('88b9966f2329e523', 'eAqKzPCVHFo:APA91bF89_SV-j9fzLgJpZ8SI0Y7C1RIgrOLHU7p1lUVkPM6g1fCe02bmqbWn2yntgG3hwMtOk9HYuqfoSWhtlnYtThmzsr2yNv-JzAVQQ3djh9oHiaemXkiqCbxsk6JwEAIKCmhT-oU', 1, '2016-10-11 23:53:31'),
('5481e836c7036cae', 'eOD1-D2Hn_E:APA91bFZV_sSSSWQjBkep-XxJecH5TO_hgWPzlzfdCvAOs7__og9RYLO-PCWN1iylpxKKnns6jDN6BF-QGJsNo1ylhX51E5MSnd9qYDTd0KT23gf_Y50HyrBNZy_Zhra5DS4pcByW2S-', 1, '2016-10-12 00:15:46'),
('9b9439a351681baf', 'erpPUsJuOsI:APA91bFqOJRIOyKJr2D00hz9hlII2JHak6mSk7oErVkwWNNg2-x5zYO_hgvhw94cdF56V_6kuVgFDIV5vQ9lWwDeAr8xliLc8LYjXsMdNGI-11Gg8isb82DLcDa53BbZljj7SfPN0diO', 1, '2016-10-12 00:42:56'),
('a2bf1e7569edd74d', 'eADHNWf_UX4:APA91bGqPiEaxo5YAcKoT3iVkTqdN1UuN0Rh0u4mcHPvXM020pq-J3eFagfuCNkyyWoGDgsSSvQIyJ7jNbrv6qOhNsqAGj4sxEj6QgvhOpnnqtHuah7QPGl_EHAhY2J1jCNnkt29PXnx', 1, '2016-10-12 01:39:33'),
('9a07dde8f95f2beb', 'd0X3kqq2enY:APA91bFmhUWwmZYKp_sFnHsQcrioFi1fe_sRVMCMDB68I_dxrThKvCyaeDQv1q7UkwXjXqw-SnuAjsujUjZVUvjbq_u8162zuupr1DJm6lS56RrDxe7yX8EalbeE_jFXcwOltov1B5qY', 1, '2016-10-12 01:39:52'),
('c0cfbadf2181c6a6', 'cdjgoyRgPyY:APA91bERCuohr6Pt60bq3TQc0g6l2U2GRk0bFU1iD82D4j2FEMjAMEyvVGwTYxvIlv8hHzon0RT7NlrotRMuqKJC6gidQw8Jn9PqjscO_UfCRp-63vk_gb2JZODlPpoZ2Fnu1pB2-k_T', 1, '2016-10-12 02:27:03'),
('268f0f786125c285', 'fJXqwImKEa4:APA91bH-0lRU4xQC-0zIuW8G_4MsaBnWIyPq9f6Ef1IiIb-KD7kO1ffF2y3D8zFJlIbSL4gJo7_WpaX2Prg5JDO1gb5Vpf2-4bXuAnFgQE61ylNWIe003Nd7iTDEodtNErj7IASo_OJU', 1, '2016-10-12 03:50:15'),
('e449cf08cc5a96a8', 'dQ5QlEmPfD0:APA91bHb-ubZj_-k3IMWG9dyZDGFhWDNk_OAS0LXD1nUtLA39XOnNWSMuPUzuCIirsAgOSig4DjntF5ZTqSnQMixESQQemOBjxABlZZ9zv_hATnsm3z-PiuB6RqXG9sIFit7CFhJeD7u', 1, '2016-10-12 05:37:59'),
('efa8fdf144887f80', 'ckcCldab_CY:APA91bHNQPa3bC5AmQrvHgp_PE3wKCx2iK1holK8febNHekjl4FrS28kelvvdG8rN4BbIsJb5C7APooG4rQiWvONqWLJmCjN1ty_qcZIdkWsqwHhYaOjpJ-Z2r51jOCX5KFLNNVfOHLT', 1, '2016-10-12 05:39:58'),
('def178f8a9ac97f7', 'dvlLn3G13dc:APA91bH5mTYjk22igw3Slyelfb9dxN7PXEVpre_GlBElxaNzJ5jV5n7MqoRBMTYSY1c2NjV5iAYeZK9SWWYZQe_7SYcLq0RAKjq7OZVOkZQLUU2hjBj5sfHhjglsI0P9XbaIwtjakkUa', 1, '2016-10-12 06:31:06'),
('d6eaf23879a6ed9b', 'c7yAoFYxR1U:APA91bE4h7mc37daWNcTgSk_qR8neIadIfVbbMqXGoF9-8Mpjg8gcAsiafWuvPzdOo4c4ogJnhvCmrGVRdUK8YTcrjF38fYD8XxGPJNvXaQbZaEZufX_zYhqBAPiSsQHL2HxVr4s96pK', 1, '2016-10-12 07:16:02'),
('ab73a0118e92e8ee', 'cF7PhvDt-Tk:APA91bGHhKMLwl14MTmcW30-qNgf8IKgE9c_ZzSnuldmcPZTrm2ovwDcTxfFtXqbt5F2dvvuCyHu6VjYuEEl6xrWCZwg7akStETALei6fSkSOsBPeTeYcBTQ2KpnstVeP6k92AC33MMa', 1, '2016-10-12 09:26:15'),
('5d06d4d9ba626787', 'fcAVvNEFvfQ:APA91bH2ouc174IxedVGBcIa2C2GYEojBlwJw4Se9TPFlRQQYertYWjQYQPgsJuGsWktvmMe41CHJ_4-I-19urG_jc80Wq1hboKROOIsTnedXllmcq0ExEivpIG6KbXxlt0-zh1Jy3JR', 1, '2016-10-12 10:23:45'),
('cbe35925bf22c2b9', 'ez8nu4XaDu0:APA91bGwITQPa4g8fHxJu7UQnG9KzgoEaRBcWmdBVfbj9Mi7SQJS8kmNgJYbk2zFp8EUL16qigEmv2zCx5CIgXAvHiMJUvK-VbNowbXY2wWWV2F0DXUw1mBLwKrTHHWmOQpYXOjgZel5', 1, '2016-10-12 12:54:24'),
('4853478c24521e75', 'cyh2_hMC5d8:APA91bFcg7WspUm_qYUr5VMPAMI5aq4CNGYXjOXZe_LjxJ4knsVYxxcY1me2aYa46WVS1e3GIDSJJEq6Bn4vbXBxjMz2hMgVAOtS1iaN7YrE1VwQSJk7o9SisT3Bp00s27g_tGESvLNg', 1, '2016-10-12 13:47:16'),
('aa237ec04f67c9f9', 'fesuW3e7CDY:APA91bE-Bi9lo_lP88MLb39cjlqmYfy6pYQPnhgL3Er9qgdrJYbprm4S-UA-h-a1psKbiA6zd4cbknlLhlF7dohOLPJUbcWPJdFdHFP0N8gY72H7wPET5k7lRg0XKbrNnmdxXA-00pU1', 1, '2016-10-12 13:53:02'),
('5e4535d7eb79a401', 'fhQgNYRE_A8:APA91bHcWTqhpce-KXP03GDilS0Yatun0tcDaeaPVgrFcjgAheJIAsirP1vfvQovc_e1Kam1RVUwoK5eWQc4SxRqOSitXvZz7iEXGKTJWaRih2AQ3tDP2jYSC8Lh7fTrCrDMY7sqEk_c', 1, '2016-10-12 14:12:09'),
('53b40868f8c9ea3', 'ciE2L81KHBo:APA91bHMz3YMGu9YE9Vy2fS4kDn8mLSm-piSHGhYZLk36jMZ9riUJBzNtO9w8tjS2SzBsbFouW19ZN57hxoS0deXdhtefqmmlfl9GZ7HEw9ae-4kmIWw57zGORn-GlkYeMFYD_ozAGbO', 1, '2016-10-12 14:23:12'),
('9fdef0415208b802', 'et0Gvy6gN9I:APA91bEYwU8hFEP5cu0spmzDEByWmHAfkzHTCMjFO3dsiB0ZkWwh7Gu1JIjT_HoIeteg4UjRn5YAypVAhKaxiQSZazCz-gLjEr7GWn0EFt9s1lEtGRYexl8RMIMhC2TT8HaRlMMo1Ail', 1, '2016-10-12 14:24:16'),
('bb7d48989278a84', 'dVwqZ-wo6K0:APA91bEcjhu_KjZwyfLV79lb4iKYgs-LgsIrDyHLMm8WLITTFNXJcj8IS8J3OCj-6vq47XD474XRdsv6WGwFDnCuQWsZNF7lvyLlZ61Asa-zygk-Hu5FDKNubitjyatLSCOiZl-eBGDN', 1, '2016-10-12 16:34:48'),
('6ec47151d5a44e39', 'dDU9HrpXGGA:APA91bGew3RqeYz3auyAgl32lhwNFzZA8jSRJQGvaSC7c9zSnzL73p6ICMAd3lJbLp4ib5SsTSurMn0IuiVjsb9AiL36BGkbN78pXFf0xnuKZT3MpUOFNMmMq7nDjMxFit0dKINjRSF9', 1, '2016-10-20 17:06:59'),
('c9e3b185076b13a2', 'dEKSnja_SBA:APA91bH6WDiiL0BqOvnAcTN4TdcjaEfVJdIPx8gLYRo5CF4TFhsOachrj2hoK_R5RsHVFOptPPoWckva1-lzJNpMKf-6fBAOZw_ZSzUovOajGP5ZTRhzhnklwT_1NBmURtZ0VUt-0Sgy', 1, '2016-10-12 18:55:21'),
('2d769aabd9713995', 'dCjATUPl5hk:APA91bEjoexi3mkrAnlqfTJK0yiGGod_cjZVCteGC2GRhLn9GsLNAelI5IY16f8yXimMw-VNMZPTM_qNam_2P6HCRHoquGI6kiWyureCjPAGAdJbXODeZIPASafLdSuSq2TuTG4GATP_', 1, '2016-10-12 19:12:43'),
('9b32a7e6c8b39daa', 'dV0xw4Wp8Nc:APA91bG8oWTEMWDABh1mztrfdaPIiGPyAdVNAJLwon4guogQMjOed1D59r9f5lo5Z-lv5cVgwrSaYDIcDwEZtOHsweSB4zF9iWeOJOnWtmtcd4TP09lS6iB2Akeem4pva4Zo5PAkezl4', 1, '2016-10-12 19:19:44'),
('8cbb1a88cbd55639', 'e3B_nakg-mI:APA91bESDUpd_KHjpp0yRBf6jRFpv7CxEfIqr371v00sjjQz32R8JfGxub-gTMdke-9CFKkRweSDNVfa3zQSfnjpsoIsUTmUjlG7Yf7GPhSWE30YFu9VOWYrNmnTPwwE1DhuGWsMdf4B', 1, '2016-10-12 19:34:05'),
('f5d4a037c74b7516', 'ci8tZPzZMZc:APA91bEEx5wxogk9uauposNv0iQlodg2bs3pIcveBqnqYZtr8PXkiP0HJ4NGzAPgmb5SYaajqDPQAJL6ekLvsmQ9bMyWNeqrixd4ADpotAZ5ZNcS-5kCz6xx7NdG_tFiREXk5m0QHzG9', 1, '2016-10-12 19:35:23'),
('2ed7dc2a2de13ebb', 'cHMoFLkaR3I:APA91bGdF4Vr3uElwSbtLBsqIiYqqiYg1kp9VAhbt5UIs2undKcxr_E8HRt-wgPfrATU-slfIzydSvs7ZrP1Sx_qn5V8veVGjJjn1HXaKPpOqiPh3ZJf5NawIPJIhk_j4jRxP8WIVVNb', 1, '2016-10-12 19:44:14'),
('3fc0309eae9aadf0', 'fOseXSqx3jc:APA91bFJWatPhWBKCaDlB44mqllAgLOWJCs3GxzRzakaBrwpDKbuhCrN_uxbonsWRQQXabZkoNhyCw336OASCdMCjKG0v9I9a5d4BV0Bjsr9bHULUVb72kkkVwpS89_h6GF39rH5z61o', 1, '2016-10-12 20:28:15'),
('d4e257691303b774', 'fddgkz8A3AI:APA91bFk-02v9cQMcZuhE7f5Q-u7Orup9QucW5SjEzpD-W4ZD34sn_bUXAGFYYn56rxbOc8Ta4Bbo2ugiPiU9iIm9yPgjfG_2aI1-5Wxpxq25DXdvijvGOh49NSH5EeDcb-PaFDVfRaR', 1, '2016-10-12 21:10:28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id` int(11) NOT NULL,
  `nombre` varchar(140) NOT NULL,
  `activa` int(1) NOT NULL,
  `actual` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id`, `nombre`, `activa`, `actual`) VALUES
(1, 'Primer tipo', 1, 48),
(4, 'Teste refactor', 1, 50),
(7, 'Test', 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ci_sessions`
--

CREATE TABLE `ci_sessions` (
  `id` varchar(128) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ci_sessions`
--

INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('edl8dcum1oid2vhdgdqo3gsprhdgg7ki', '::1', 1500905768, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530303930353730313b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30372d32342031363a31353a3031223b7d223b),
('v4b1l80segsolvpg819tvdo8th1acj16', '::1', 1500905693, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530303930353637363b),
('pb4hch0kl3ine1g2ord1t051erur0gg0', '::1', 1499951243, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439393935303938323b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30372d31332031343a35373a3232223b7d223b),
('vrkifr6jf6iv6v5pdd4r05fa8tt4264j', '::1', 1499950613, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439393935303631303b),
('jn9tt9iiv5s9u1b0iba0vgp0fc8c00dv', '::1', 1499950921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439393935303634323b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30372d31332031343a35373a3232223b7d223b),
('qlslt5fdil1bmv7rkvvf2608j6p463sc', '::1', 1499885484, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439393838353338393b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30372d31322032303a32303a3434223b7d223b),
('aprklmia5pp94dgkfht4e1ir4epbset8', '::1', 1499885076, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439393838353037313b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30372d31322032303a32303a3434223b7d223b),
('p7ksh4tibn93dkdqa61anmcmkcknillj', '::1', 1499884530, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439393838343532373b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30372d31322032303a32303a3434223b7d223b),
('mm1km2rcfqtb7ia376s5adm7i9qd831m', '::1', 1499884222, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439393838333937393b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30372d31322032303a32303a3434223b7d223b),
('fse9tkk3ppqn0t45ql84kh9ia6gpnb0g', '::1', 1499883630, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439393838333632393b),
('foqpn2oa7ms9lhga7g6dm2pnjq45dh9f', '::1', 1499883940, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439393838333634343b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30372d31322032303a32303a3434223b7d223b),
('9io07u8oqke6pru7sg8jk2sjdpv70cs8', '::1', 1499867724, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439393836373731373b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30372d31322031353a32353a3031223b7d223b),
('n2pk9vpt9hs6hlec2o4crstg4glfa3pg', '::1', 1499867415, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439393836373236353b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30372d31322031353a32353a3031223b7d223b),
('alonvovnis56b6hhfj9ue73dqrek5gbc', '::1', 1499867250, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439393836363935343b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30372d31322031353a32353a3031223b7d223b),
('ad0o4dhl90tsnravgv22j1fcrgnh3e23', '::1', 1499866784, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439393836363633343b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30372d31322031353a32353a3031223b7d223b),
('orcomdqje51ckh9h56uq8g48qeg0j8ju', '::1', 1499866154, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439393836353930313b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30372d31322031353a32353a3031223b7d223b),
('q07ol82s6c509l94ngl7pnctu8ittpe7', '::1', 1499865885, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439393836353838333b),
('f129mfk9eqmica0pv6vim87073bb9uua', '::1', 1497551998, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373535313738363b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31352031343a30383a3034223b7d223b),
('v6psgjtditthu35nfl5uethqo6qcmtve', '::1', 1497551683, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373535303231393b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31352031343a30383a3034223b7d223b),
('6kcgcj2p6879mdiu76uepck397v0vre1', '::1', 1497550201, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373534393534383b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31352031343a30383a3034223b7d223b),
('3t3esfcv5q7rqv49itvv5vm4cpn52n0l', '::1', 1497549428, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373534393138363b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31352031343a30383a3034223b7d223b),
('v1hg4fcoeljdkhglp176aio79odgmm9q', '::1', 1497549170, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373534383336313b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31352031343a30383a3034223b7d223b),
('34g3u5c2jbl4oatgkgchn7g3nnkkd1jn', '::1', 1497548322, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373534383032363b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31352031343a30383a3034223b7d223b),
('o3e4ejn011ro0ecn0eklviogud39h9le', '::1', 1497548017, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373534373730363b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31352031343a30383a3034223b7d223b),
('p7ps2bt3pibhf07uclgoas98m2m0a9ke', '::1', 1497547438, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373534373136383b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31352031343a30383a3034223b7d223b),
('19kg3vbfenjule805b8qu5h0f8j1k137', '::1', 1497546694, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373534363534343b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31352031343a30383a3034223b7d223b),
('q8nqpfe16q830aecbmcvnqjeu67iatbc', '::1', 1497542733, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373534323530323b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31352031343a30383a3034223b7d223b),
('04bvpvhpfoilj46cehe06iji22m7s6n8', '::1', 1497542017, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373534313939383b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31352031343a30383a3034223b7d223b),
('snlpufkb02bklhsqojd0h4pdipj8cqf1', '::1', 1497541694, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373534313439323b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31352031343a30383a3034223b7d223b),
('lgpkddtqlns20agb1v90qltkcf3ihjdj', '::1', 1497540413, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373534303138393b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31352031343a30383a3034223b7d223b),
('j0kd7og4k0h439mf3hk7su5urslidaql', '::1', 1497540150, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373533393838343b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31352031343a30383a3034223b7d223b),
('779jl09jg2h6av0fkl15vnirsnijss2k', '::1', 1497539810, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373533393532373b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31352031343a30383a3034223b7d223b),
('nsfqdml7ltsppu44g943d6avv7io9hc8', '::1', 1497538848, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373533383834363b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31352031343a30383a3034223b7d223b),
('lrl6q43hg4tnikvlscc332mj5qqoabnq', '::1', 1497538815, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373533383533383b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31352031343a30383a3034223b7d223b),
('vfudu2p8s4bodmpf60p0as82iknl25tb', '::1', 1497538491, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373533383231373b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31352031343a30383a3034223b7d223b),
('bp538r57cp80upmsl569mkevf1eg6s5l', '::1', 1497537812, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373533373536333b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31352031343a30383a3034223b7d223b),
('ij092fqjutnt4e9vo935fpgo063k3t9e', '::1', 1497537008, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373533363736383b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31352031343a30383a3034223b7d223b),
('9pt9ube9j1soeumbfpi3ul01ihsngo1m', '::1', 1497536659, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373533363434323b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31352031343a30383a3034223b7d223b),
('dct88a46a2uakq5l16rbndmtn5upmimq', '::1', 1497536389, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373533363039353b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31352031343a30383a3034223b7d223b),
('6dju0fsr6p0oqqv62jjcrur8ia4qe2h2', '::1', 1497535809, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373533353731353b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31352031343a30383a3034223b7d223b),
('jco727861l6ld5mnqo9afokj4jbj9md5', '::1', 1497535381, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373533353338303b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31352031343a30383a3034223b7d223b),
('cf2nmbv8674d1bo2okn8re15s38snm2u', '::1', 1497535247, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373533343939343b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31352031343a30383a3034223b7d223b),
('iog073pu3dv5g40g1slrvhr2vhdo6149', '::1', 1497534953, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373533343637363b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31352031343a30383a3034223b7d223b),
('b3mj0kk9qtmbqur21frp959ioacbt193', '::1', 1497534661, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373533343336313b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31352031343a30383a3034223b7d223b),
('bh998ta3iha1ru68f6l5gmm8o40jvmgb', '::1', 1497534305, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373533343031333b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31352031343a30383a3034223b7d223b),
('djsi6ef38819png2gcogkj3ouhmhds0a', '::1', 1497533867, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373533333638313b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31352031343a30383a3034223b7d223b),
('0lpdoed7hf76duj5grrcjsgvmj49okq6', '::1', 1497533666, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373533333336393b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31352031343a30383a3034223b7d223b),
('efsc2ub4uj55q767341iurhb5skdtpa0', '::1', 1497531126, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373533313033363b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31352031343a30383a3034223b7d223b),
('hd1ud38bchi9ksfvq7knpfs4bvasuind', '::1', 1497531022, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373533303732363b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31352031343a30383a3034223b7d223b),
('qdeivqq8n2pr2kugcfcglel679h9ocs6', '::1', 1497530479, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373533303335393b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31352031343a30383a3034223b7d223b),
('s6ca2pnrl7v58fn0g5b9ak6sn0j2b51m', '::1', 1497530321, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373533303034383b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31352031343a30383a3034223b7d223b),
('oqs3uk5vpcjf7tqscmt4jj59qos4bf7b', '::1', 1497528473, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373532383437323b),
('2gl7cmh7sk2kgvttmnohd940gc4sr68j', '::1', 1497528488, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373532383438343b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31352031343a30383a3034223b7d223b),
('k5hnfmqhf33p5tqbg55ci13cb7bo6ltp', '::1', 1497470954, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373437303731373b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31342031353a30383a3532223b7d223b),
('ttpv8ojrakede1gc5tv1hd49jvhvsk93', '::1', 1497470650, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373437303338363b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31342031353a30383a3532223b7d223b),
('o670aoetidue067h5vmbiravki6lnt6f', '::1', 1497468850, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373436383830363b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31342031353a30383a3532223b7d223b),
('qi5v26og2vhko8evcj5ung6v0n4tvjod', '::1', 1497468591, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373436383530313b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31342031353a30383a3532223b7d223b),
('vsmgaah6uv84g76fkqkom3k1f31ma8mc', '::1', 1497467791, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373436373532353b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31342031353a30383a3532223b7d223b),
('7fnb0a62rmcuhmh6dihb526fju115hrr', '::1', 1497464910, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373436343838303b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31342031353a30383a3532223b7d223b),
('h6eiucmju4il1dhegs6156r8792m2532', '::1', 1497464813, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373436343536303b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31342031353a30383a3532223b7d223b),
('ghkolvkdons7prvqks5t7bmdoo2urj87', '::1', 1497464329, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373436343139333b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31342031353a30383a3532223b7d223b),
('bdvagjkr31n353bl4nkmrmnc9vbue96d', '::1', 1497464188, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373436333634323b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31342031353a30383a3532223b7d223b),
('2mjehsfpgohuhvqtrsfc96t570j6kv5b', '::1', 1497463503, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373436333235313b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31342031353a30383a3532223b7d223b),
('27r15etvi62lrq9i1hrnrrb673npvusg', '::1', 1497463221, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373436323934343b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31342031353a30383a3532223b7d223b),
('ia4i7leuamcg7n8cehubo7l1o877cj04', '::1', 1497462669, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373436323535353b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31342031353a30383a3532223b7d223b),
('jdbeepf1t9nn4ge1knda7vc0b3fmns3u', '::1', 1497462327, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373436323033393b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31342031353a30383a3532223b7d223b),
('51rf2bnpng96b0f1qhenq8vsnviqbsfv', '::1', 1497461865, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373436313730333b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31342031353a30383a3532223b7d223b),
('gs2le5psvtq6arfuvbmhgtgskmgp6hpo', '::1', 1497461048, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373436303934313b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31342031353a30383a3532223b7d223b),
('2v6kjdhe0n1kusfjcutcf987uautkdst', '::1', 1497460777, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373436303539353b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31342031353a30383a3532223b7d223b),
('kd8v12c5fphjlhssnarb0jr7fupe3lvk', '::1', 1497455491, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373435353438333b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31342031353a30383a3532223b7d223b),
('am8q0gei0u5eq618te27uhkpvmrh10t4', '::1', 1497455471, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373435323732323b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31342031353a30383a3532223b7d223b),
('8d8ul02e1dabjufsejcff3qpujei9sun', '::1', 1497452652, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373435303731323b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31342031353a30383a3532223b7d223b),
('dsp0fl5dkemts9o1297q5g9ka3e6mvom', '::1', 1497450150, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373434393932383b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31342031353a30383a3532223b7d223b),
('54tui5mhudoij3pb5joe3nb79kapke1i', '::1', 1497449428, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373434393134333b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31342031353a30383a3532223b7d223b),
('tcuehucbkd069gea1g6o6vio5binn4b8', '::1', 1497445721, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373434353732303b),
('2g3nc4dnn6nniolnbjfdb105oo9dubbf', '::1', 1497447243, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373434353733323b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31342031353a30383a3532223b7d223b),
('o2q4h6viirc9m5cn42r2o7bbthaliddq', '::1', 1497385436, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373338343236323b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31332031373a32333a3139223b7d223b),
('aortsnetbjq1eoganl9dlkpea7a97s88', '::1', 1497383605, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373338333630353b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31332031373a32333a3139223b7d223b),
('4tj0d87dl5q4lb7fjsc5fsegjekcchon', '::1', 1497382676, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373338323532333b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31332031373a32333a3139223b7d223b),
('lnollfs4mfrp2eqbcmmld26ngtujbiqv', '::1', 1497382507, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373338323231343b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31332031373a32333a3139223b7d223b),
('tnam9iv840u48in1i6tlt0eqvpq9ik6e', '::1', 1497381988, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373338313831303b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31332031373a32333a3139223b7d223b),
('h1dlal20628i1rbqr0c5qvbke6kt3ip0', '::1', 1497381406, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373338313430363b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31332031373a32333a3139223b7d223b),
('nsfhtqk3jbmg9n0k6smhd54q47ievv3j', '::1', 1497381150, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373338313032343b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31332031373a32333a3139223b7d223b),
('gnc9l61t5lq577qku6u1e0na7hoe4m5q', '::1', 1497380708, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373338303433323b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31332031373a32333a3139223b7d223b),
('c08u96p4qff83296as3ni76s50n24kjj', '::1', 1497379662, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373337393636323b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31332031373a32333a3139223b7d223b),
('gl2mcchvhlhcvre3vtmfa0udd8r5kb90', '::1', 1497377822, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373337373730393b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31332031373a32333a3139223b7d223b),
('2iek6r8pcg979ftue5pjafl568uoctoe', '::1', 1497377149, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373337373134393b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31332031373a32333a3139223b7d223b),
('vuiqcbsmhuc158vnlihg84kli2uatat5', '::1', 1497376040, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373337353933353b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31332031373a32333a3139223b7d223b),
('me6lhb2erbv1i7hdesqe38u3u998nf93', '::1', 1497375804, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373337353631363b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31332031373a32333a3139223b7d223b),
('192toutvbqi2gp3rvj0h5l7ko0cfcfjb', '::1', 1497375407, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373337353232323b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31332031373a32333a3139223b7d223b),
('cta9r5vqb8ohbr1stignuch158mu3tfb', '::1', 1497375032, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373337343734343b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31332031373a32333a3139223b7d223b),
('du9759ls0o7jnqis3pqqclelm1876hgp', '::1', 1497368352, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373336383039333b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31332031373a32333a3139223b7d223b),
('h4unfva54tq57tdfk83gf5hbu9ou7gpi', '::1', 1497368050, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373336373736363b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31332031373a32333a3139223b7d223b),
('c9rr0fh3stu9552ple6ojs111lesthdb', '::1', 1497366927, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373336363932333b),
('hgjkqdqhajrvnl5bifual6cf13l56kga', '::1', 1497367610, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373336373339393b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31332031373a32333a3139223b7d223b),
('inm6j6j2t4oar7tpuvokel7t359hjlao', '::1', 1497291146, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373239313133363b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31322031353a34393a3135223b7d223b),
('un315c7qbs79iu250imftr07931rr3mh', '::1', 1497289799, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373238393739393b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31322031353a34393a3135223b7d223b),
('8ot5lf0tdg2gs3csok47gn7dk4q1t1f5', '::1', 1497288235, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373238383030343b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31322031353a34393a3135223b7d223b),
('8ebpe9pn88t2jda0tfm0o62tpmeuiuv3', '::1', 1497287956, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373238373635393b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31322031353a34393a3135223b7d223b),
('khifcv660068l13626bl57dvfvr2hika', '::1', 1497287623, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373238373335323b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31322031353a34393a3135223b7d223b),
('vjbo1pa62kokqkedtvacsckh7djagrtd', '::1', 1497287227, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373238373031373b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31322031353a34393a3135223b7d223b),
('hnmmoafaiq8vrc1c8gas308f0pem17kv', '::1', 1497286563, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373238363536333b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31322031353a34393a3135223b7d223b),
('jipj5jd21l07pqfpiap343vkrgd1piqs', '::1', 1497286143, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373238353936323b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31322031353a34393a3135223b7d223b),
('nae52119io603n8aiee5p4aqj33bh51q', '::1', 1497285838, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373238353533393b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31322031353a34393a3135223b7d223b),
('0r9qcfga2c11ukkgkrjqhi2vst9btjma', '::1', 1497278875, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373237383738303b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31322031353a34393a3135223b7d223b),
('ekb7j182urgoiklmup6tgm57au7ojgdl', '::1', 1497277983, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373237373931333b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31322031353a34393a3135223b7d223b),
('mdb9p900hdj76r3tgdqkt3acljmkuer4', '::1', 1497277874, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373237373538323b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31322031353a34393a3135223b7d223b),
('qrtlu6f76f1iquectis10oafrige59cq', '::1', 1497276750, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373237363534323b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31322031353a34393a3135223b7d223b),
('io6dtborlk57ekucc12rqea0fjs21rlp', '::1', 1497276540, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373237363233363b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31322031353a34393a3135223b7d223b),
('o5hg3aoivou90k3g6uaj8o5mndtkirn1', '::1', 1497275767, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373237353636333b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31322031353a34393a3135223b7d223b),
('2od7fmm3m7m29ntgg4n3ftfed4gi55ne', '::1', 1497275349, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373237353334393b),
('1eqv4cfdah5lf7gosbv1mt0tkvpr9qq1', '::1', 1497275574, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373237353335353b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31322031353a34393a3135223b7d223b),
('faegl263b7soh1iqdjmteccsdia2j47j', '::1', 1497267769, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373236373538333b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31322031333a30393a3237223b7d223b),
('62s78alhkero4nb285qv29iakk4h57eu', '::1', 1497267524, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373236373235373b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31322031333a30393a3237223b7d223b),
('o14k2uc0l25gd0f16empp9q9qb4ps4eq', '::1', 1497266976, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373236363930383b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31322031333a30393a3237223b7d223b),
('tu59aheqt9tsvklk9pkcjl46rmljj7nb', '::1', 1497266191, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373236363135333b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31322031333a30393a3237223b7d223b),
('ufuplc75jvs4gelgeaoj0br0kkvf2h1v', '::1', 1497265742, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373236353733353b),
('moqovrk6lp54o3mc2maf7dq7tivahuds', '::1', 1497266141, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373236353736373b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d31322031333a30393a3237223b7d223b),
('ilfmpk5iqrlpbftk9l69806tqmh2a08s', '::1', 1497038500, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373033383438383b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d30392031343a35363a3238223b7d223b),
('7i6s6hj2bqpkrfhmp1c7a51lvv92rfpl', '::1', 1497038444, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373033383137393b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d30392031343a35363a3238223b7d223b),
('3vq6ehc1el869nqbi547uaf47ja6hjdo', '::1', 1497038149, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373033373836353b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d30392031343a35363a3238223b7d223b),
('uq3osju25rscppqv5di39hropfdv84i5', '::1', 1497037101, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373033373130313b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d30392031343a35363a3238223b7d223b),
('6j00f2g69p7ibafkhbgpl6k6a5ps17a5', '::1', 1497036041, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373033353831333b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d30392031343a35363a3238223b7d223b),
('ev1b12h0hk13f97qfsqq8n9jobd2n71i', '::1', 1497035460, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373033353236383b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d30392031343a35363a3238223b7d223b),
('1v2s01sn0v1hbl0ok13v3b7iqgs5guvk', '::1', 1497035222, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373033343933343b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d30392031343a35363a3238223b7d223b),
('l8mikql0dst214ta8vgmag100h173vpc', '::1', 1497034705, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373033343433343b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d30392031343a35363a3238223b7d223b),
('6pf35ehuh43ict2e3c66lg813dsu4j50', '::1', 1497034120, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373033343130353b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d30392031343a35363a3238223b7d223b),
('m9rmuufdj50gnkj3baophpuo541dnfqn', '::1', 1497033816, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373033333635333b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d30392031343a35363a3238223b7d223b),
('95bm5ript9bfofc839ctqs8lqeucu3vv', '::1', 1497033445, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373033333230393b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d30392031343a35363a3238223b7d223b),
('vkbt57npljj2ja2fk85kketeo20nvnrh', '::1', 1497032680, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373033323636313b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d30392031343a35363a3238223b7d223b),
('sfnjklv4qfn1vsq8ta1dnhcuk9kreinl', '::1', 1497032521, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373033323334343b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d30392031343a35363a3238223b7d223b),
('fcduh1drgqdqn71r82i4oo2dqonpn4r9', '::1', 1497032339, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373033323034303b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d30392031343a35363a3238223b7d223b),
('c4mm3vkpnmuk2q1cesrqmncb97ohb8sa', '::1', 1497031945, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373033313635343b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d30392031343a35363a3238223b7d223b),
('sr767e05fu4l7us8nkidjns09604456d', '::1', 1497031357, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373033313239393b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d30392031343a35363a3238223b7d223b),
('hs20dro6knu2cgc2sbgiikk6u5vf7bhk', '::1', 1497031008, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373033303836383b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d30392031343a35363a3238223b7d223b),
('ji43qpmo4ll25nlk7qfon3nv3qsj4hvg', '::1', 1497030533, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373033303239313b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d30392031343a35363a3238223b7d223b),
('ctsjbmvf2f2fur79coofeot4n4thig62', '::1', 1497026598, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373032363334303b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d30392031343a35363a3238223b7d223b),
('n5k41vm9j8s2f7k8pgeg7njckaivkc58', '::1', 1497026036, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373032353937363b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d30392031343a35363a3238223b7d223b),
('t0jimem6n7e2ep7qgt29217fgk0r47tk', '::1', 1497025268, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373032353236383b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d30392031343a35363a3238223b7d223b),
('98ndjv3dkvbjanihe1pqvdnjdhvfchqa', '::1', 1497025126, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373032343834383b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d30392031343a35363a3238223b7d223b),
('6jd6rhnuok6r9chgtdmeql8umsdhouq4', '::1', 1497023647, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373032333531363b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d30392031343a35363a3238223b7d223b),
('kpjc835q8bcr2ps4almstcmjv12kq1l0', '::1', 1497023361, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373032333036343b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d30392031343a35363a3238223b7d223b),
('rosfrdfu53n5ga4c68ke15n9mlla5pk7', '::1', 1497022527, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373032323434383b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d30392031343a35363a3238223b7d223b),
('mgllqp2rppqdvem47b14hd4j320j8ct5', '::1', 1497022377, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373032323134333b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d30392031343a35363a3238223b7d223b),
('q3n5a4h6jnh9bb1sq45anpcktontjk0j', '::1', 1497021116, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373032313031363b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d30392031343a35363a3238223b7d223b),
('o51ai6hth7vvlt2ilf5odh802j225vfc', '::1', 1497020706, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373032303632353b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d30392031343a35363a3238223b7d223b),
('ri8fcr8luocfsroqu6ao1e3pvf6h6c8k', '::1', 1497020018, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373032303031383b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d30392031343a35363a3238223b7d223b),
('vk4sicctv23q45f0l8al9rga1qlvjb3d', '::1', 1497019945, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373031393634393b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d30392031343a35363a3238223b7d223b),
('ik90k302nq87qfso2ksej4ri4q0gjgpm', '::1', 1497019607, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373031393334303b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d30392031343a35363a3238223b7d223b),
('ejh41dqgti7a57p226t904a0dqj79fip', '::1', 1497019174, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373031383934323b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d30392031343a35363a3238223b7d223b),
('0j98td6bh03lotnm3c5hmj4d871m8c2a', '::1', 1497018826, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373031383634313b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d30392031343a35363a3238223b7d223b);
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('imnu70ldmac9q8p2nvf3a97a91i8kgvu', '::1', 1497018476, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373031383138323b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d30392031343a35363a3238223b7d223b),
('f4cea0t4dtbiffpgq4mi8dgl84851imu', '::1', 1497017666, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373031373636363b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d30392031343a35363a3238223b7d223b),
('kn5nhab3gpe24988qkicc7ccd5qrkgu9', '::1', 1497017551, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373031373237383b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d30392031343a35363a3238223b7d223b),
('cfj8upu4h97e0kev55d13j4apq5m1b2t', '::1', 1497012983, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373031323934343b),
('sj28u1d23fibh860rsihvegmf8vi8ubt', '::1', 1497012997, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439373031323938383b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d30392031343a35363a3238223b7d223b),
('ep4otdb060j80rhv9uctejtdqqi7sj5s', '::1', 1496784448, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439363738343239303b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d30362032323a33313a3130223b7d223b),
('lrqca6iooopslbh9r3bdjtk37jtpmv7f', '::1', 1496783647, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439363738333630393b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d30362032323a33313a3130223b7d223b),
('k3f85eheeiajh3c8tujkqiugq7388jad', '::1', 1496783044, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439363738333034343b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d30362032323a33313a3130223b7d223b),
('6objrhlcd18r25audfeq40kkqjhf2s69', '::1', 1496782675, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439363738323631393b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d30362032323a33313a3130223b7d223b),
('s39k2itaaenrp460skqvtu949lchtoa1', '::1', 1496782518, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439363738323237363b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d30362032323a33313a3130223b7d223b),
('00fogf3jkblmsc290usajuej3qjburio', '::1', 1496781989, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439363738313833303b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d30362032323a33313a3130223b7d223b),
('6pcotg83156isb1qrfnt288va9cbm1c2', '::1', 1496781827, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439363738313532383b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d30362032323a33313a3130223b7d223b),
('eru6tsd6fbk3r9otbhmuoiahhb9tstkq', '::1', 1496781059, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439363738313035393b),
('4ohpck1f9qrud5q3m8pnrab2jcq8b1ic', '::1', 1496781129, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439363738313037303b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d30362032323a33313a3130223b7d223b),
('jvfm46osgl3k6mjidfik29vcsm4c7f7u', '::1', 1496776053, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439363737363035333b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d30362032313a30323a3233223b7d223b),
('vaquf2v5n751djtpd1308dmlrqai7cqc', '::1', 1496775837, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439363737353734333b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d30362032313a30323a3233223b7d223b),
('sfal3ce7b6hvhdc075902j7m6hdpf1jl', '::1', 1496775737, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439363737353635323b),
('ieclr1t4fjv4dln6d20iha845cemfpjd', '::1', 1496774886, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439363737343634363b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d30362032303a31323a3133223b7d223b),
('t3okqnak2u5n4h5ptg95ljg2cn63b391', '::1', 1496774625, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439363737343333373b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d30362032303a31323a3133223b7d223b),
('jfp1k5fqtdd7ik9lqbqvbga7v5qqqkrp', '::1', 1496773915, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439363737333731303b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d30362032303a31323a3133223b7d223b),
('am7ksppum19hrq1tnt76n86fl15ho524', '::1', 1496773640, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439363737333338323b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d30362032303a31323a3133223b7d223b),
('69kq5qd88c5dtpq20n4dfr5fp3uu5v8n', '::1', 1496773312, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439363737333036343b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d30362032303a31323a3133223b7d223b),
('9ga9o9or9t5pr3s8uf4593kc3q0c6vlg', '::1', 1496772727, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439363737323732323b),
('cubdgn601pra63ll2k4gsd9mlfuqtgc4', '::1', 1496772987, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439363737323733333b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d30362032303a31323a3133223b7d223b),
('6qvijnqqmdvht0tqiahav3sasdtd2slu', '::1', 1496772583, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439363737323338333b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d30362031393a30373a3237223b7d223b),
('o6an19e1mmfj2d80l8jogd159bld4oa6', '::1', 1496772367, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439363737323037383b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d30362031393a30373a3237223b7d223b),
('0j215o8sb1svo0of0p3a6vtfb3eboacl', '::1', 1496772019, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439363737313737313b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d30362031393a30373a3237223b7d223b),
('qnv49pgk4n0adqoig003jq67m578dbnp', '::1', 1496771751, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439363737313435393b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d30362031393a30373a3237223b7d223b),
('78vfcb0s21eaj9l7a8sdhsl0glb34716', '::1', 1496770334, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439363737303139343b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d30362031393a30373a3237223b7d223b),
('ddlm2ers98q66jk9f56vl5jmbqr7ida6', '::1', 1496768842, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439363736383834313b),
('eo5c5rohsa5f81cnm6k5bdrgam2q5qhu', '::1', 1496769139, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439363736383834373b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d30362031393a30373a3237223b7d223b),
('a6hk7qfjeja6c8i0lj4cjqcrc66fcet5', '::1', 1496769432, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439363736393136303b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d30362031393a30373a3237223b7d223b),
('arbcebtgn9u4tvt1mogsq6tec02m6ke4', '::1', 1496769858, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439363736393438333b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d30362031393a30373a3237223b7d223b),
('o9655ik0bddv7p5bdte388lksio43pc5', '::1', 1496770094, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439363736393836303b617574685f6964656e746966696572737c733a38333a22613a323a7b733a373a22757365725f6964223b733a31303a2232313437343834383438223b733a31303a226c6f67696e5f74696d65223b733a31393a22323031372d30362d30362031393a30373a3237223b7d223b);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `nombre` varchar(300) NOT NULL,
  `hash` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `nombre`, `hash`) VALUES
(1, '901819', 'APA91bEZTPK-TcnmyOWu4ZIJCVHVL39xqx16lMtcAsFo5RwDtJrYYuiWvP_BJByF5d9Dik0Kd_4gEtxV3JHDU3XKaQjwhqS-OR1Kfo1oOdKIIdCaRtEnKT2agih6s59zU9KM1gfYo7sj');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `denied_access`
--

CREATE TABLE `denied_access` (
  `ai` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `time` datetime NOT NULL,
  `reason_code` tinyint(1) UNSIGNED DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo`
--

CREATE TABLE `grupo` (
  `id` int(11) NOT NULL,
  `nombre` varchar(300) NOT NULL,
  `keyname` varchar(300) NOT NULL,
  `hash` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `grupo`
--

INSERT INTO `grupo` (`id`, `nombre`, `keyname`, `hash`) VALUES
(1, 'Grupo prueba 1', 'grupo-prueba-1', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagen`
--

CREATE TABLE `imagen` (
  `id` int(11) NOT NULL,
  `marquesina` int(11) NOT NULL,
  `formato` varchar(5) NOT NULL,
  `orden` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `imagen`
--

INSERT INTO `imagen` (`id`, `marquesina`, `formato`, `orden`) VALUES
(1, 13, '.png', 9),
(2, 13, '.png', 2),
(3, 13, '.png', 3),
(4, 13, '.png', 5),
(5, 13, '.png', 7),
(6, 13, '.png', 6),
(7, 13, '.png', 4),
(8, 13, '.png', 8),
(9, 13, '.jpg', 10),
(10, 13, '.jpg', 1),
(14, 15, '.jpg', 4),
(15, 15, '.jpg', 5),
(16, 15, '.jpg', 6),
(17, 15, '.jpg', 3),
(37, 18, '.png', 2),
(38, 18, '.png', 1),
(39, 18, '.png', 3),
(49, 29, '.png', 1),
(50, 29, '.png', 2),
(51, 29, '.png', 3),
(58, 30, '.png', 2),
(59, 30, '.png', 1),
(61, 31, '.png', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ips_on_hold`
--

CREATE TABLE `ips_on_hold` (
  `ai` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `time` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login_errors`
--

CREATE TABLE `login_errors` (
  `ai` int(10) UNSIGNED NOT NULL,
  `username_or_email` varchar(255) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `time` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `login_errors`
--

INSERT INTO `login_errors` (`ai`, `username_or_email`, `ip_address`, `time`) VALUES
(9, 'Fran', '::1', '2017-07-24 16:14:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marquesina`
--

CREATE TABLE `marquesina` (
  `id` int(11) NOT NULL,
  `nombre` varchar(140) NOT NULL,
  `inicio` datetime NOT NULL,
  `categoria` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  `json` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `marquesina`
--

INSERT INTO `marquesina` (`id`, `nombre`, `inicio`, `categoria`, `estado`, `json`) VALUES
(25, 'Test orden2', '2017-05-18 15:16:00', 1, 1, ''),
(29, 'Test form', '2017-05-17 10:50:00', 1, 0, '["http:\\/\\/localhost\\/igniter\\/uploads\\/29\\/49.png","http:\\/\\/localhost\\/igniter\\/uploads\\/29\\/50.png","http:\\/\\/localhost\\/igniter\\/uploads\\/29\\/51.png"]'),
(30, 'Marquesina de prueba', '2017-05-18 15:31:00', 1, 0, '["http:\\/\\/localhost\\/igniter\\/uploads\\/30\\/59.png","http:\\/\\/localhost\\/igniter\\/uploads\\/30\\/58.png"]'),
(31, 'asdasdas', '2017-05-18 15:15:00', 1, 0, '["http:\\/\\/localhost\\/igniter\\/uploads\\/31\\/61.png"]'),
(32, '', '2017-05-23 15:50:00', 4, 0, ''),
(33, 'Test duplicado', '2017-06-01 16:10:00', 1, 0, ''),
(35, 'Test', '2017-06-01 11:19:00', 1, 0, ''),
(36, 'Test', '2017-06-01 11:21:00', 1, 0, ''),
(48, 'Duplicado', '2017-06-01 16:35:00', 1, 0, ''),
(49, 'Test', '2017-06-01 11:40:00', 1, 0, ''),
(50, 'tesst2', '2017-06-01 11:40:00', 4, 0, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `miscelaneo`
--

CREATE TABLE `miscelaneo` (
  `id` int(11) NOT NULL,
  `tag` varchar(100) NOT NULL,
  `data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `miscelaneo`
--

INSERT INTO `miscelaneo` (`id`, `tag`, `data`) VALUES
(1, 'JSON', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `slug` varchar(128) NOT NULL,
  `text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `news`
--

INSERT INTO `news` (`id`, `title`, `slug`, `text`) VALUES
(1, 'Nota de prueba 1', 'nota-de-prueba-1', 'Contenido de mi nota random de prueba'),
(2, 'Nota de prueba 2', 'nota-de-prueba-2', 'Contenido de mi nota random de prueba dos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificacion`
--

CREATE TABLE `notificacion` (
  `id` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `grupo` int(1) NOT NULL,
  `destinatario` varchar(100) NOT NULL,
  `titulo` varchar(140) NOT NULL,
  `texto` varchar(300) NOT NULL,
  `params` text NOT NULL,
  `link` varchar(300) NOT NULL,
  `response` text,
  `envio` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `notificacion`
--

INSERT INTO `notificacion` (`id`, `fecha`, `grupo`, `destinatario`, `titulo`, `texto`, `params`, `link`, `response`, `envio`) VALUES
(6, '2017-05-31 17:25:00', 1, '2', 'Prueba notificaciones', 'text', '', '', '{"message_id":6210438188303724816}', '2017-05-30 11:58:00'),
(7, '2017-06-03 18:30:00', 1, '2', 'Prueba pendiente', 'pendiente de envio a futuro', '', '', '{"message_id":8850367258247082435}', '2017-06-06 15:06:41'),
(8, '2017-05-31 14:55:00', 1, '3', 'Prueba de filtro', 'texto random', '', '', '{"message_id":4870883784147736787}', '2017-05-30 17:10:08'),
(9, '2017-05-17 19:35:00', 2, '1', 'Hola pepito', 'hola', '', '', '{"multicast_id":7430130284246572110,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1496175604587848%e609af1cf9fd7ecd"}]}', '2017-05-30 17:20:02'),
(11, '2017-06-01 14:08:00', 2, '4467', 'Makro', '', '', '', 'Field "to" must be a JSON string: {"ACTIVE":"1","TOKEN_ID":"fD3A-st1AsI:APA91bHewbz7lrfpRZaorZx4SD9G0M_M3_ij4YWV_0Gj14Z1Wu_sU8kR0qj3jw6WsjY7hZU2Us55JYNfLZuRUT3Bpagu2d0ENXiIEp_N5ELuEz6WjTr9HShKkVWZt0-9wdi6sq_xTTTI","DEVICE_ID":"851755b1f7b7c9a4","TS":"2016-10-06 15:33:53"}\n', '2017-06-01 14:08:59'),
(12, '2017-06-01 14:12:00', 2, '4467', 'Makro', '', '', '', '{"multicast_id":5719240633439691838,"success":0,"failure":1,"canonical_ids":0,"results":[{"error":"NotRegistered"}]}', '2017-06-01 14:12:32'),
(13, '2017-06-01 14:14:00', 2, '4467', 'Makro', '', '', '', '{"multicast_id":6518311536980018165,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1496337294346963%e609af1cf9fd7ecd"}]}', '2017-06-01 14:14:51'),
(14, '2017-06-01 14:48:00', 1, '2', 'Makro Grupo', '', '', '', '{"message_id":4674829441441175205}', '2017-06-01 14:48:27'),
(15, '2017-06-01 14:51:00', 1, '2', 'Makro test 2', '', '', '', '{"message_id":6807458801582053588}', '2017-06-01 14:52:06'),
(16, '2017-06-01 14:53:00', 1, '2', 'Makro grupo 2', '', '', '', '{"message_id":8137709199784108321}', '2017-06-01 14:53:59'),
(17, '2017-06-01 14:54:00', 1, '2', 'Makro grupo vacio', '', '', '', '{"message_id":7751853885235519146}', '2017-06-01 14:54:41'),
(18, '2017-06-01 14:59:00', 1, '2', 'Makro grupo vacio 2', '', '', '', '{"message_id":5809700477860245552}', '2017-06-01 14:59:46'),
(19, '2017-06-01 15:00:00', 1, '2', 'Makro grupo vacio 3', '', '', '', '{"message_id":7616644337156685083}', '2017-06-01 15:00:47'),
(20, '2017-06-01 15:02:00', 1, '2', 'Vacio 3', '', '', '', '{"message_id":5671389255649910386}', '2017-06-01 15:03:03'),
(21, '2017-06-01 15:04:00', 1, '2', 'Vacio 4', '', '', '', '{"message_id":8237410289024099738}', '2017-06-01 15:05:00'),
(22, '2017-06-01 15:27:00', 1, '2', 'No vacio', '', '', '', '{"message_id":6515982100051608253}', '2017-06-01 15:28:04'),
(23, '2017-06-01 15:28:00', 1, '2', 'Vacio?', '', '', '', '{"message_id":6834925903929857154}', '2017-06-01 15:28:31'),
(24, '2017-06-01 15:36:00', 1, '2', 'Vacio 5', '', '', '', '{"message_id":5635127468145013060}', '2017-06-01 15:36:30'),
(25, '2017-06-01 15:36:00', 1, '2', 'No vacio', '', '', '', '{"message_id":8479482280759197886}', '2017-06-01 15:37:07'),
(26, '2017-06-01 15:37:00', 1, '2', 'Lleno', '', '', '', '{"message_id":5744355992751168557}', '2017-06-01 15:37:49'),
(27, '2017-06-01 15:37:00', 1, '2', 'Vacio', '', '', '', '{"message_id":6190569696697739881}', '2017-06-01 15:38:06'),
(28, '2017-06-05 15:12:00', 1, '2', 'Prueba rels', '', '', '', '{"message_id":6633233452142776742}', '2017-06-05 15:16:12'),
(29, '2017-06-05 15:25:00', 2, '4467', 'Teste cleinte indi', '', '', '', '{"multicast_id":5554162968405714100,"success":1,"failure":0,"canonical_ids":0,"results":[{"message_id":"0:1496687129845776%e609af1cf9fd7ecd"}]}', '2017-06-05 15:25:25'),
(30, '2017-06-06 14:09:00', 2, '901817', 'Test cliente', '', '', '', '{"failure": 1,"details":"Error de envío. Destinatarios inexistentes. Vuelva a crear el envío nuevamente"}', '2017-06-06 15:12:07'),
(31, '2017-06-06 14:14:00', 2, '901818', 'Test', '', '', '', '{"failure": 1,"details":"Error de envío. Destinatarios inexistentes. Vuelva a crear el envío nuevamente"}', '2017-06-06 15:12:07'),
(32, '2017-06-06 14:15:00', 2, '901819', 'Test', '', '', '', '{"success":2,"failure":0}', '2017-06-06 14:15:58'),
(33, '2017-06-06 14:16:00', 2, '901819', 'Test 2 a ver', '', '', '', '{"success":2,"failure":0}', '2017-06-06 14:16:19'),
(34, '2017-06-06 14:16:00', 2, '901819', 'Test error', '', '', '', '{"success":1,"failure":0}', '2017-06-06 14:17:01'),
(35, '2017-06-06 14:18:00', 2, '901819', 'Test', '', '', '', '{"success":2,"failure":0}', '2017-06-06 14:18:14'),
(36, '2017-06-06 14:19:00', 1, '2', 'Test grupo ', '', '', '', '{"message_id":9026926683099272476}', '2017-06-06 14:20:04'),
(37, '2017-06-06 14:24:00', 1, '2', 'Grupo test ', '', '', '', '{"message_id":8852611090872973013}', '2017-06-06 14:24:56'),
(38, '2017-06-06 14:25:00', 1, '2', 'Test grupo?', '', '', '', '{"message_id":5180316257716226947}', '2017-06-06 14:25:34'),
(39, '2017-06-06 14:25:00', 1, '2', 'Test grupo 3', '', '', '', '{"message_id":8001775725886452348}', '2017-06-06 14:26:00'),
(40, '2017-06-06 14:26:00', 2, '901819', 'Test cliente 3', '', '', '', '{"success":2,"failure":0}', '2017-06-06 14:26:28'),
(41, '2017-06-06 14:32:00', 1, '2', 'Test grupo 40', '', '', '', '{"message_id":7652717229354681324}', '2017-06-06 14:32:14'),
(42, '2017-06-06 14:55:00', 1, '2', 'Test envio', '', '', '', '{"message_id":8172132929792992185}', '2017-06-06 14:56:46'),
(43, '2017-06-06 14:57:00', 1, '2', 'Test', '', '', '', '{"message_id":8416735631186374390}', '2017-06-06 14:57:51'),
(44, '2017-06-06 14:58:00', 2, '901819', 'Test debug', '', '', '', '{"success":2,"failure":0}', '2017-06-06 14:58:24'),
(45, '2017-06-06 15:26:00', 1, '2', 'Test', '', '', '', '{"message_id":9131875238331078450}', '2017-06-06 15:26:59'),
(46, '2017-06-06 15:28:00', 1, '2', 'No recibe', '', '', '', '{"message_id":6220716649739173308}', '2017-06-06 15:28:47'),
(47, '2017-06-06 15:29:00', 1, '2', 'Si recibe', '', '', '', '{"message_id":6063986937672971246}', '2017-06-06 15:29:35'),
(48, '2017-06-05 20:25:00', 1, '2', 'Envio programado 1', '', '', '', '{"message_id":8357402010068609015}', '2017-06-06 15:31:53'),
(49, '2017-06-05 17:30:00', 2, '901819', 'Notificacion cliente programada', '', '', '', '{"success":2,"failure":0}', '2017-06-06 15:31:15'),
(50, '2017-06-05 15:30:00', 2, '901819', 'Notificacion programada cliente posta', '', '', '', '{"success":2,"failure":0}', '2017-06-06 15:31:55'),
(51, '2017-06-05 20:55:00', 1, '2', 'Test', '', '', '', '{"message_id":7826760958379201891}', '2017-06-06 15:40:10'),
(52, '2017-06-05 17:50:00', 2, '901819', 'Envio 2', '', '', '', '{"success":2,"failure":0}', '2017-06-06 15:40:12'),
(53, '2017-06-06 18:25:00', 1, '8', '13113', '', '', '', '{"message_id":6238156915328238713}', '2017-06-06 18:25:57'),
(54, '2017-06-06 18:26:00', 2, '4467', 'Test', '', '', '', '{"multicast_id":8082930434108032995,"success":0,"failure":1,"canonical_ids":0,"results":[{"error":"NotRegistered"}]}', '2017-06-06 18:26:34'),
(55, '2017-06-09 13:14:00', 1, '1', 'Mensaje de prueba', 'texto', '', '', '{"message_id":6330021543900009741}', '2017-06-09 13:14:59'),
(56, '2017-06-16 10:55:00', 1, '1', 'asdasdas', '', '', '', NULL, NULL),
(57, '2017-06-16 15:55:00', 1, '1', '', '', '', '', NULL, NULL),
(58, '2017-06-10 15:10:00', 1, '1', '', '', '', '', NULL, NULL),
(59, '2017-06-10 15:05:00', 1, '1', '', '', '', '', NULL, NULL),
(60, '2017-06-10 15:05:00', 1, '1', '', '', '', '', NULL, NULL),
(61, '2017-06-10 15:30:00', 1, '1', '', '', '', 'asdasdas', NULL, NULL),
(62, '2017-06-10 15:35:00', 1, '1', '', '', '', 'asdasdas', NULL, NULL),
(63, '2017-06-30 15:55:00', 1, '1', '', '', '', 'http://localhost/igniter/grupo/view/1', NULL, NULL),
(64, '2017-06-24 15:15:00', 1, '1', '', '', '', 'www.localhost/igniter/grupo/view/1', NULL, NULL),
(65, '2017-06-30 15:15:00', 1, '1', '', '', '', 'http://localhost/igniter/grupo/view/1', NULL, NULL),
(66, '2017-06-10 15:35:00', 1, '1', '', '', '', 'http://moco.com', NULL, NULL),
(67, '2017-06-30 15:55:00', 1, '1', '', '', '', 'http://', NULL, NULL),
(68, '2017-06-30 14:50:00', 1, '1', '', '', '', 'http://poyo', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `relgrupo`
--

CREATE TABLE `relgrupo` (
  `id` int(11) NOT NULL,
  `grupo` int(11) NOT NULL,
  `cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `relgrupo`
--

INSERT INTO `relgrupo` (`id`, `grupo`, `cliente`) VALUES
(1, 1, 9406),
(4, 1, 518666);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rel_notificacion`
--

CREATE TABLE `rel_notificacion` (
  `id` int(11) NOT NULL,
  `cliente` int(11) NOT NULL,
  `device` varchar(200) NOT NULL,
  `notificacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `rel_notificacion`
--

INSERT INTO `rel_notificacion` (`id`, `cliente`, `device`, `notificacion`) VALUES
(1, 901817, '6d44ae3fa45afaa5', 28),
(2, 518666, 'c16d7b8147f62383', 28),
(3, 4467, '851755b1f7b7c9a4', 29),
(4, 901819, '6d44ae3fa45afaa5', 32),
(5, 901819, '6d44ae3fa45afaa5', 33),
(6, 901819, '6d44ae3fa45afaa5', 34),
(7, 901819, '6d44ae3fa45afaa5', 35),
(8, 518666, 'c16d7b8147f62383', 36),
(9, 14853, 'a5016c02d1c74041', 36),
(10, 901819, '6d44ae3fa45afaa5', 36),
(11, 518666, 'c16d7b8147f62383', 37),
(12, 14853, 'a5016c02d1c74041', 37),
(13, 901819, '6d44ae3fa45afaa5', 37),
(14, 518666, 'c16d7b8147f62383', 38),
(15, 14853, 'a5016c02d1c74041', 38),
(16, 901819, '6d44ae3fa45afaa5', 38),
(17, 518666, 'c16d7b8147f62383', 39),
(18, 14853, 'a5016c02d1c74041', 39),
(19, 901819, '6d44ae3fa45afaa5', 39),
(20, 901819, '6d44ae3fa45afaa5', 40),
(21, 518666, 'c16d7b8147f62383', 41),
(22, 14853, 'a5016c02d1c74041', 41),
(23, 901819, '6d44ae3fa45afaa5', 41),
(24, 518666, 'c16d7b8147f62383', 42),
(25, 14853, 'a5016c02d1c74041', 42),
(26, 901819, '6d44ae3fa45afaa5', 42),
(27, 518666, 'c16d7b8147f62383', 42),
(28, 14853, 'a5016c02d1c74041', 42),
(29, 901819, '6d44ae3fa45afaa5', 42),
(30, 518666, 'c16d7b8147f62383', 43),
(31, 14853, 'a5016c02d1c74041', 43),
(32, 901819, '6d44ae3fa45afaa5', 43),
(33, 901819, '6d44ae3fa45afaa5', 44),
(34, 518666, 'c16d7b8147f62383', 7),
(35, 14853, 'a5016c02d1c74041', 7),
(36, 901819, '6d44ae3fa45afaa5', 7),
(37, 518666, 'c16d7b8147f62383', 45),
(38, 14853, 'a5016c02d1c74041', 45),
(39, 518666, 'c16d7b8147f62383', 46),
(40, 14853, 'a5016c02d1c74041', 46),
(41, 518666, 'c16d7b8147f62383', 47),
(42, 14853, 'a5016c02d1c74041', 47),
(43, 901819, '6d44ae3fa45afaa5', 47),
(44, 901819, '6d44ae3fa45afaa5', 49),
(45, 518666, 'c16d7b8147f62383', 48),
(46, 14853, 'a5016c02d1c74041', 48),
(47, 901819, '6d44ae3fa45afaa5', 48),
(48, 901819, '6d44ae3fa45afaa5', 50),
(49, 518666, 'c16d7b8147f62383', 51),
(50, 14853, 'a5016c02d1c74041', 51),
(51, 901819, '6d44ae3fa45afaa5', 51),
(52, 901819, '6d44ae3fa45afaa5', 52),
(53, 8893, 'a5016c02d1c74041', 53),
(54, 27547, '4d0e58497f34d355', 53),
(55, 518666, 'c16d7b8147f62383', 53),
(56, 4467, '851755b1f7b7c9a4', 54),
(57, 9406, '5b1f34fc1e675bd6', 55),
(58, 9496, '9b4bdbcfbf7b9edb', 55);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `username_or_email_on_hold`
--

CREATE TABLE `username_or_email_on_hold` (
  `ai` int(10) UNSIGNED NOT NULL,
  `username_or_email` varchar(255) NOT NULL,
  `time` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `username` varchar(12) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `auth_level` tinyint(3) UNSIGNED NOT NULL,
  `banned` enum('0','1') NOT NULL DEFAULT '0',
  `passwd` varchar(60) NOT NULL,
  `passwd_recovery_code` varchar(60) DEFAULT NULL,
  `passwd_recovery_date` datetime DEFAULT NULL,
  `passwd_modified_at` datetime DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `auth_level`, `banned`, `passwd`, `passwd_recovery_code`, `passwd_recovery_date`, `passwd_modified_at`, `last_login`, `created_at`, `modified_at`) VALUES
(141244870, 'naza', 'isco_s@hotmail.com', 9, '0', '$2y$10$98ed73c4fd2753743b10buatubAH4QjX5Z86uoTYLStD5Tx65uff.', NULL, NULL, NULL, '2017-05-18 17:25:25', '2017-05-18 17:24:59', '2017-07-12 13:45:04'),
(2147484848, 'fran', 'fran@ni54.com', 9, '0', '$2y$11$3nwB78hfRgGD/zTAief1cOBJpxCxBIU9ceWgVbk3ri5E.Bb/NDVoW', NULL, NULL, '2017-07-12 10:28:44', '2017-07-24 16:15:01', '2017-05-16 17:51:22', '2017-07-24 14:15:01');

--
-- Disparadores `users`
--
DELIMITER $$
CREATE TRIGGER `ca_passwd_trigger` BEFORE UPDATE ON `users` FOR EACH ROW BEGIN
    IF ((NEW.passwd <=> OLD.passwd) = 0) THEN
        SET NEW.passwd_modified_at = NOW();
    END IF;
END
$$
DELIMITER ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `acl`
--
ALTER TABLE `acl`
  ADD PRIMARY KEY (`ai`),
  ADD KEY `action_id` (`action_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `acl_actions`
--
ALTER TABLE `acl_actions`
  ADD PRIMARY KEY (`action_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indices de la tabla `acl_categories`
--
ALTER TABLE `acl_categories`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `category_code` (`category_code`),
  ADD UNIQUE KEY `category_desc` (`category_desc`);

--
-- Indices de la tabla `auth_sessions`
--
ALTER TABLE `auth_sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cap_customers`
--
ALTER TABLE `cap_customers`
  ADD PRIMARY KEY (`PASSPORT_NO`,`DEVICEID`);

--
-- Indices de la tabla `cap_stores`
--
ALTER TABLE `cap_stores`
  ADD PRIMARY KEY (`STORE_NO`);

--
-- Indices de la tabla `cap_subscribers`
--
ALTER TABLE `cap_subscribers`
  ADD PRIMARY KEY (`DEVICE_ID`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ci_sessions`
--
ALTER TABLE `ci_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `denied_access`
--
ALTER TABLE `denied_access`
  ADD PRIMARY KEY (`ai`);

--
-- Indices de la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `imagen`
--
ALTER TABLE `imagen`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ips_on_hold`
--
ALTER TABLE `ips_on_hold`
  ADD PRIMARY KEY (`ai`);

--
-- Indices de la tabla `login_errors`
--
ALTER TABLE `login_errors`
  ADD PRIMARY KEY (`ai`);

--
-- Indices de la tabla `marquesina`
--
ALTER TABLE `marquesina`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `miscelaneo`
--
ALTER TABLE `miscelaneo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `slug` (`slug`);

--
-- Indices de la tabla `notificacion`
--
ALTER TABLE `notificacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `relgrupo`
--
ALTER TABLE `relgrupo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `rel_notificacion`
--
ALTER TABLE `rel_notificacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `username_or_email_on_hold`
--
ALTER TABLE `username_or_email_on_hold`
  ADD PRIMARY KEY (`ai`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `acl`
--
ALTER TABLE `acl`
  MODIFY `ai` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `acl_actions`
--
ALTER TABLE `acl_actions`
  MODIFY `action_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `acl_categories`
--
ALTER TABLE `acl_categories`
  MODIFY `category_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `denied_access`
--
ALTER TABLE `denied_access`
  MODIFY `ai` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `grupo`
--
ALTER TABLE `grupo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `imagen`
--
ALTER TABLE `imagen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;
--
-- AUTO_INCREMENT de la tabla `ips_on_hold`
--
ALTER TABLE `ips_on_hold`
  MODIFY `ai` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `login_errors`
--
ALTER TABLE `login_errors`
  MODIFY `ai` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `marquesina`
--
ALTER TABLE `marquesina`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT de la tabla `miscelaneo`
--
ALTER TABLE `miscelaneo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `notificacion`
--
ALTER TABLE `notificacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;
--
-- AUTO_INCREMENT de la tabla `relgrupo`
--
ALTER TABLE `relgrupo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `rel_notificacion`
--
ALTER TABLE `rel_notificacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;
--
-- AUTO_INCREMENT de la tabla `username_or_email_on_hold`
--
ALTER TABLE `username_or_email_on_hold`
  MODIFY `ai` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `acl`
--
ALTER TABLE `acl`
  ADD CONSTRAINT `acl_ibfk_1` FOREIGN KEY (`action_id`) REFERENCES `acl_actions` (`action_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `acl_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `acl_actions`
--
ALTER TABLE `acl_actions`
  ADD CONSTRAINT `acl_actions_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `acl_categories` (`category_id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
