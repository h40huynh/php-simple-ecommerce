-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th1 06, 2020 lúc 12:14 PM
-- Phiên bản máy phục vụ: 10.4.6-MariaDB
-- Phiên bản PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `web_ban_dt`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(11) NOT NULL,
  `cat_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_name`) VALUES
(1, 'Iphone'),
(2, 'Samsung'),
(3, 'Huawei'),
(4, 'Xiaomi'),
(5, 'Oppo'),
(6, 'Nokia'),
(7, 'Vsmart');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `dataset`
--

CREATE TABLE `dataset` (
  `link_id` int(11) NOT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `link_name` varchar(255) DEFAULT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `dataset`
--

INSERT INTO `dataset` (`link_id`, `product_name`, `link_name`, `price`) VALUES
(1, 'Samsung Galaxy M10 (16GB/2GB)', 'https://tiki.vn/dien-thoai-samsung-galaxy-m10-16gb-2gb-hang-chinh-hang-p10581161.html', 3369000),
(2, 'Samsung Galaxy M10 (16GB/2GB)', 'https://vienthongtrunghau.com/product/dien-thoai-samsung-galaxy-m10-16gb-2gb-hang-chinh-hang/', 2790000),
(3, 'Samsung Galaxy Note 10 Plus (256GB/12GB)', 'https://tiki.vn/dien-thoai-samsung-galaxy-note-10-plus-256gb-12gb-hang-chinh-hang-p22358908.html', 25889000),
(45, 'Samsung Galaxy A50 (64GB/4GB)', 'https://tiki.vn/dien-thoai-samsung-galaxy-a50-64gb-4gb-hang-chinh-hang-p11508168.html', 4590000),
(46, 'Nokia 800 Tough (2019)', 'https://tiki.vn/dien-thoai-nokia-800-tough-2019-hang-chinh-hang-p35059800.html', 1790000),
(74, 'Huawei P20 Pro ', 'https://fptshop.com.vn/dien-thoai/huawei-p20-pro', 22990000),
(75, 'Huawei P20 Pro ', 'https://viettelstore.vn/dien-thoai/huawei-p20-pro-pid126241.html', 15990000),
(81, 'Vsmart Joy 2+ (2GB/32GB)', 'https://www.thegioididong.com/dtdd/vsmart-joy-2-plus-2gb', 2983000),
(82, 'Vsmart Joy 2+ (2GB/32GB)', 'https://bachlongmobile.com/vsmart-joy-2-2gb32gb.html', 2590000),
(83, 'Nokia 3.1 Plus (32GB/3GB)', 'https://tiki.vn/dien-thoai-nokia-3-1-plus-32gb-3gb-hang-chinh-hang-p6090183.html', 3528000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `inventory_in`
--

CREATE TABLE `inventory_in` (
  `inventory_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `import_date` datetime DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `inventory_in`
--

INSERT INTO `inventory_in` (`inventory_id`, `product_id`, `import_date`, `quantity`) VALUES
(1, 1, '2019-01-01 00:00:00', 30),
(2, 2, '2019-01-01 00:00:00', 30),
(3, 3, '2019-01-01 00:00:00', 30),
(4, 4, '2019-01-01 00:00:00', 30),
(5, 5, '2019-01-01 00:00:00', 30),
(6, 6, '2019-01-01 00:00:00', 30),
(7, 7, '2019-01-01 00:00:00', 30),
(8, 8, '2019-01-01 00:00:00', 30),
(9, 9, '2019-01-01 00:00:00', 30),
(10, 10, '2019-01-01 00:00:00', 30),
(11, 11, '2019-01-01 00:00:00', 30),
(12, 12, '2019-01-01 00:00:00', 30),
(13, 13, '2019-01-01 00:00:00', 30),
(14, 14, '2019-01-01 00:00:00', 30),
(15, 15, '2019-01-01 00:00:00', 30),
(16, 16, '2019-01-01 00:00:00', 30),
(17, 17, '2019-01-01 00:00:00', 30),
(18, 18, '2019-01-01 00:00:00', 30),
(19, 19, '2019-01-01 00:00:00', 30),
(20, 20, '2019-01-01 00:00:00', 30),
(21, 21, '2019-01-01 00:00:00', 30),
(22, 22, '2019-01-01 00:00:00', 30),
(23, 23, '2019-01-01 00:00:00', 30),
(24, 24, '2019-01-01 00:00:00', 30),
(25, 25, '2019-01-01 00:00:00', 30),
(26, 26, '2019-01-01 00:00:00', 30),
(27, 27, '2019-01-01 00:00:00', 30),
(28, 28, '2019-01-01 00:00:00', 30),
(29, 29, '2019-01-01 00:00:00', 30),
(30, 30, '2019-01-01 00:00:00', 30),
(31, 31, '2019-01-01 00:00:00', 30),
(32, 32, '2019-01-01 00:00:00', 30),
(33, 33, '2019-01-01 00:00:00', 30),
(34, 34, '2019-01-01 00:00:00', 30),
(35, 35, '2019-01-01 00:00:00', 30),
(36, 36, '2019-01-01 00:00:00', 30),
(37, 37, '2019-01-01 00:00:00', 30),
(38, 38, '2019-01-01 00:00:00', 30),
(39, 39, '2019-01-01 00:00:00', 30),
(40, 40, '2019-01-01 00:00:00', 30),
(41, 41, '2019-01-01 00:00:00', 30),
(42, 42, '2019-01-01 00:00:00', 30),
(43, 43, '2019-01-01 00:00:00', 30),
(44, 44, '2019-01-01 00:00:00', 30),
(45, 45, '2019-01-01 00:00:00', 30),
(46, 46, '2019-01-01 00:00:00', 30),
(47, 47, '2019-01-01 00:00:00', 30),
(48, 48, '2019-01-01 00:00:00', 30);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `inventory_management`
--

CREATE TABLE `inventory_management` (
  `im_id` int(11) NOT NULL,
  `inventory_id` int(11) DEFAULT NULL,
  `in_stock` int(11) DEFAULT NULL,
  `sold_amount` int(11) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `update_type` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `inventory_management`
--

INSERT INTO `inventory_management` (`im_id`, `inventory_id`, `in_stock`, `sold_amount`, `update_date`, `update_type`) VALUES
(10, 1, 30, 0, '2019-01-01 00:00:00', 'IN'),
(11, 2, 30, 0, '2019-01-01 00:00:00', 'IN'),
(12, 3, 30, 0, '2019-01-01 00:00:00', 'IN'),
(13, 4, 30, 0, '2019-01-01 00:00:00', 'IN'),
(14, 5, 30, 0, '2019-01-01 00:00:00', 'IN'),
(15, 6, 30, 0, '2019-01-01 00:00:00', 'IN'),
(16, 7, 30, 0, '2019-01-01 00:00:00', 'IN'),
(17, 8, 30, 0, '2019-01-01 00:00:00', 'IN'),
(18, 9, 30, 0, '2019-01-01 00:00:00', 'IN'),
(19, 10, 30, 0, '2019-01-01 00:00:00', 'IN'),
(20, 11, 30, 0, '2019-01-01 00:00:00', 'IN'),
(21, 12, 30, 0, '2019-01-01 00:00:00', 'IN'),
(22, 13, 30, 0, '2019-01-01 00:00:00', 'IN'),
(23, 14, 30, 0, '2019-01-01 00:00:00', 'IN'),
(24, 15, 30, 0, '2019-01-01 00:00:00', 'IN'),
(25, 16, 30, 0, '2019-01-01 00:00:00', 'IN'),
(26, 17, 30, 0, '2019-01-01 00:00:00', 'IN'),
(27, 18, 30, 0, '2019-01-01 00:00:00', 'IN'),
(28, 19, 30, 0, '2019-01-01 00:00:00', 'IN'),
(29, 20, 30, 0, '2019-01-01 00:00:00', 'IN'),
(30, 21, 30, 0, '2019-01-01 00:00:00', 'IN'),
(31, 22, 30, 0, '2019-01-01 00:00:00', 'IN'),
(32, 23, 30, 0, '2019-01-01 00:00:00', 'IN'),
(33, 24, 30, 0, '2019-01-01 00:00:00', 'IN'),
(34, 25, 30, 0, '2019-01-01 00:00:00', 'IN'),
(35, 26, 30, 0, '2019-01-01 00:00:00', 'IN'),
(36, 27, 30, 0, '2019-01-01 00:00:00', 'IN'),
(37, 28, 30, 0, '2019-01-01 00:00:00', 'IN'),
(38, 29, 30, 0, '2019-01-01 00:00:00', 'IN'),
(39, 30, 30, 0, '2019-01-01 00:00:00', 'IN'),
(40, 31, 30, 0, '2019-01-01 00:00:00', 'IN'),
(41, 32, 30, 0, '2019-01-01 00:00:00', 'IN'),
(42, 33, 30, 0, '2019-01-01 00:00:00', 'IN'),
(43, 34, 30, 0, '2019-01-01 00:00:00', 'IN'),
(44, 35, 30, 0, '2019-01-01 00:00:00', 'IN'),
(45, 36, 30, 0, '2019-01-01 00:00:00', 'IN'),
(46, 37, 30, 0, '2019-01-01 00:00:00', 'IN'),
(47, 38, 30, 0, '2019-01-01 00:00:00', 'IN'),
(48, 39, 30, 0, '2019-01-01 00:00:00', 'IN'),
(49, 40, 30, 0, '2019-01-01 00:00:00', 'IN'),
(50, 41, 30, 0, '2019-01-01 00:00:00', 'IN'),
(51, 42, 30, 0, '2019-01-01 00:00:00', 'IN'),
(52, 43, 30, 0, '2019-01-01 00:00:00', 'IN'),
(53, 44, 30, 0, '2019-01-01 00:00:00', 'IN'),
(54, 45, 30, 0, '2019-01-01 00:00:00', 'IN'),
(55, 46, 30, 0, '2019-01-01 00:00:00', 'IN'),
(56, 47, 30, 0, '2019-01-01 00:00:00', 'IN'),
(57, 48, 30, 0, '2019-01-01 00:00:00', 'IN'),
(58, 1, 28, 2, '2019-10-14 00:00:00', 'OUT'),
(59, 3, 28, 2, '2019-02-20 00:00:00', 'OUT'),
(61, 5, 28, 2, '2019-03-28 00:00:00', 'OUT'),
(62, 6, 29, 1, '2019-12-04 00:00:00', 'OUT'),
(63, 9, 29, 1, '2019-03-27 00:00:00', 'OUT'),
(64, 10, 28, 2, '2019-05-20 00:00:00', 'OUT'),
(65, 12, 27, 3, '2019-06-12 00:00:00', 'OUT'),
(66, 14, 27, 3, '2019-03-21 00:00:00', 'OUT'),
(67, 15, 27, 3, '2019-08-26 00:00:00', 'OUT'),
(68, 16, 28, 2, '2019-03-05 00:00:00', 'OUT'),
(69, 18, 29, 1, '2019-10-05 00:00:00', 'OUT'),
(70, 19, 29, 1, '2019-02-20 00:00:00', 'OUT'),
(71, 22, 28, 2, '2019-08-24 00:00:00', 'OUT'),
(72, 25, 29, 1, '2019-12-08 00:00:00', 'OUT'),
(73, 26, 28, 2, '2019-04-04 00:00:00', 'OUT'),
(74, 27, 27, 3, '2019-12-21 00:00:00', 'OUT'),
(75, 31, 27, 3, '2019-07-28 00:00:00', 'OUT'),
(76, 32, 27, 3, '2019-09-16 00:00:00', 'OUT'),
(77, 34, 27, 3, '2019-02-10 00:00:00', 'OUT'),
(78, 35, 28, 2, '2019-07-15 00:00:00', 'OUT'),
(79, 38, 29, 1, '2019-12-24 00:00:00', 'OUT'),
(80, 40, 28, 2, '2019-01-03 00:00:00', 'OUT'),
(81, 44, 28, 2, '2019-01-04 00:00:00', 'OUT'),
(82, 45, 29, 1, '2019-02-27 00:00:00', 'OUT'),
(83, 48, 28, 2, '2019-06-08 00:00:00', 'OUT'),
(110, 45, 19, 11, '2019-02-27 00:00:00', 'OUT'),
(111, 29, 27, 3, '2019-06-08 00:00:00', 'OUT'),
(112, 33, 28, 2, '2019-01-04 00:00:00', 'OUT'),
(113, 2, 28, 2, '2019-10-14 00:00:00', 'OUT');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `inventory_out`
--

CREATE TABLE `inventory_out` (
  `io_id` int(11) NOT NULL,
  `inventory_id` int(11) DEFAULT NULL,
  `export_date` datetime DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `inventory_out`
--

INSERT INTO `inventory_out` (`io_id`, `inventory_id`, `export_date`, `quantity`) VALUES
(8, 1, '2019-10-14 00:00:00', 2),
(9, 3, '2019-02-20 00:00:00', 2),
(11, 5, '2019-03-28 00:00:00', 2),
(12, 6, '2019-12-04 00:00:00', 1),
(13, 9, '2019-03-27 00:00:00', 1),
(14, 10, '2019-05-20 00:00:00', 2),
(15, 12, '2019-06-12 00:00:00', 3),
(16, 14, '2019-03-21 00:00:00', 3),
(17, 15, '2019-08-26 00:00:00', 3),
(18, 16, '2019-03-05 00:00:00', 2),
(19, 18, '2019-10-05 00:00:00', 1),
(20, 19, '2019-02-20 00:00:00', 1),
(21, 22, '2019-08-24 00:00:00', 2),
(22, 25, '2019-12-08 00:00:00', 1),
(23, 26, '2019-04-04 00:00:00', 2),
(24, 27, '2019-12-21 00:00:00', 3),
(25, 31, '2019-07-28 00:00:00', 3),
(26, 32, '2019-09-16 00:00:00', 3),
(27, 34, '2019-02-10 00:00:00', 3),
(28, 35, '2019-07-15 00:00:00', 2),
(30, 40, '2019-01-03 00:00:00', 2),
(31, 44, '2019-01-04 00:00:00', 2),
(32, 45, '2019-02-27 00:00:00', 1),
(33, 48, '2019-06-08 00:00:00', 2),
(60, 45, '2019-02-27 00:00:00', 10),
(61, 29, '2019-06-08 00:00:00', 3),
(62, 33, '2019-01-04 00:00:00', 2),
(63, 2, '2019-10-14 00:00:00', 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `inventory_performance`
--

CREATE TABLE `inventory_performance` (
  `ip_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `from_date` datetime DEFAULT NULL,
  `to_date` datetime DEFAULT NULL,
  `performance` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `inventory_performance`
--

INSERT INTO `inventory_performance` (`ip_id`, `product_id`, `from_date`, `to_date`, `performance`) VALUES
(1, 1, '2019-01-01 00:00:00', '2020-01-01 00:00:00', 0.0346298),
(2, 2, '2019-01-01 00:00:00', '2020-01-01 00:00:00', 0.0346298),
(3, 3, '2019-01-01 00:00:00', '2020-01-01 00:00:00', 0.0350684),
(4, 4, '2019-01-01 00:00:00', '2020-01-01 00:00:00', 0),
(5, 5, '2019-01-01 00:00:00', '2020-01-01 00:00:00', 0.0350015),
(6, 6, '2019-01-01 00:00:00', '2020-01-01 00:00:00', 0.0333837),
(7, 7, '2019-01-01 00:00:00', '2020-01-01 00:00:00', 0),
(8, 8, '2019-01-01 00:00:00', '2020-01-01 00:00:00', 0),
(9, 9, '2019-01-01 00:00:00', '2020-01-01 00:00:00', 0.0338372),
(10, 10, '2019-01-01 00:00:00', '2020-01-01 00:00:00', 0.0349031),
(11, 11, '2019-01-01 00:00:00', '2020-01-01 00:00:00', 0),
(12, 12, '2019-01-01 00:00:00', '2020-01-01 00:00:00', 0.0361048),
(13, 13, '2019-01-01 00:00:00', '2020-01-01 00:00:00', 0),
(14, 14, '2019-01-01 00:00:00', '2020-01-01 00:00:00', 0.0362643),
(15, 15, '2019-01-01 00:00:00', '2020-01-01 00:00:00', 0.0359606),
(16, 16, '2019-01-01 00:00:00', '2020-01-01 00:00:00', 0.0350442),
(17, 17, '2019-01-01 00:00:00', '2020-01-01 00:00:00', 0),
(18, 18, '2019-01-01 00:00:00', '2020-01-01 00:00:00', 0.0334918),
(19, 19, '2019-01-01 00:00:00', '2020-01-01 00:00:00', 0.0339001),
(20, 20, '2019-01-01 00:00:00', '2020-01-01 00:00:00', 0),
(21, 21, '2019-01-01 00:00:00', '2020-01-01 00:00:00', 0),
(22, 22, '2019-01-01 00:00:00', '2020-01-01 00:00:00', 0.0347246),
(23, 23, '2019-01-01 00:00:00', '2020-01-01 00:00:00', 0),
(24, 24, '2019-01-01 00:00:00', '2020-01-01 00:00:00', 0),
(25, 25, '2019-01-01 00:00:00', '2020-01-01 00:00:00', 0.0333765),
(26, 26, '2019-01-01 00:00:00', '2020-01-01 00:00:00', 0.0349886),
(27, 27, '2019-01-01 00:00:00', '2020-01-01 00:00:00', 0.0357355),
(28, 28, '2019-01-01 00:00:00', '2020-01-01 00:00:00', 0),
(29, 29, '2019-01-01 00:00:00', '2020-01-01 00:00:00', 0.0361125),
(30, 30, '2019-01-01 00:00:00', '2020-01-01 00:00:00', 0),
(31, 31, '2019-01-01 00:00:00', '2020-01-01 00:00:00', 0.0360164),
(32, 32, '2019-01-01 00:00:00', '2020-01-01 00:00:00', 0.0359202),
(33, 33, '2019-01-01 00:00:00', '2020-01-01 00:00:00', 0.0351557),
(34, 34, '2019-01-01 00:00:00', '2020-01-01 00:00:00', 0.0363393),
(35, 35, '2019-01-01 00:00:00', '2020-01-01 00:00:00', 0.034799),
(36, 36, '2019-01-01 00:00:00', '2020-01-01 00:00:00', 0),
(37, 37, '2019-01-01 00:00:00', '2020-01-01 00:00:00', 0),
(38, 38, '2019-01-01 00:00:00', '2020-01-01 00:00:00', 0),
(39, 39, '2019-01-01 00:00:00', '2020-01-01 00:00:00', 0),
(40, 40, '2019-01-01 00:00:00', '2020-01-01 00:00:00', 0.0351576),
(41, 41, '2019-01-01 00:00:00', '2020-01-01 00:00:00', 0),
(42, 42, '2019-01-01 00:00:00', '2020-01-01 00:00:00', 0),
(43, 43, '2019-01-01 00:00:00', '2020-01-01 00:00:00', 0),
(44, 44, '2019-01-01 00:00:00', '2020-01-01 00:00:00', 0.0351557),
(45, 45, '2019-01-01 00:00:00', '2020-01-01 00:00:00', 0.0967186),
(46, 46, '2019-01-01 00:00:00', '2020-01-01 00:00:00', 0),
(47, 47, '2019-01-01 00:00:00', '2020-01-01 00:00:00', 0),
(48, 48, '2019-01-01 00:00:00', '2020-01-01 00:00:00', 0.0348678);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `cat_id` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `old_price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `cat_id`, `price`, `url`, `old_price`) VALUES
(1, 'Iphone 11 Pro Max Green 256GB', 1, 37990000, 'iphone-11-pro-max-midnight-green-256gb.webp', 40000000),
(2, 'Iphone 11 Pro Silver 512GB', 1, 39490000, 'iphone-11-pro-silver-512gb.webp', NULL),
(3, 'Iphone 11 Green 128GB', 1, 23990000, 'iphone11-green-128gb.webp', NULL),
(4, 'Iphone XS Max 64GB', 1, 25640500, 'iphone-xs-max-64gb.jpg', 26500000),
(5, 'Iphone 8 Plus Silver 64GB', 1, 16000000, 'iphone-8-plus-silver-64gb.webp', NULL),
(6, 'Iphone 7 Plus 128GB', 1, 14500000, 'iphone-7-plus-128gb.jpg', NULL),
(7, 'Iphone 6S Plus 32GB', 1, 9200000, 'iphone-6s-plus-32gb.jpg', NULL),
(8, 'Huawei P30 Lite White', 3, 6960000, 'huawei-p30-lite-white.webp', NULL),
(9, 'OPPO Reno 10x Zoom Edition', 5, 20990000, 'oppo-reno-10x-zoom-edition-black-400x460.png', NULL),
(10, 'OPPO Reno2', 5, 14990000, 'oppo-reno2-black-mtp1-400x460.png', NULL),
(11, 'OPPO Reno', 5, 12990000, 'oppo-reno-pink-400x460.png', NULL),
(12, 'OPPO Reno2 F', 5, 8990000, 'oppo-reno2-f-green-mtp-400x460-1-400x460.png', NULL),
(13, 'OPPO F11 Pro 128GB', 5, 8490000, 'oppo-f11-pro-128gb-1-400x460.png', NULL),
(14, 'OPPO F11', 5, 7290000, 'oppo-f11-mtp-400x460.png', NULL),
(15, 'OPPO A9 (2020)', 5, 6990000, 'oppo-a9-white-1-400x460.png', NULL),
(16, 'Huawei P30 Pro', 3, 22990000, 'huawei-p30-pro.webp', NULL),
(17, 'Huawei Mate 20 Pro', 3, 15990000, 'huawei-mate20-pro.jpg', NULL),
(18, 'Huawei Y9 2019', 3, 4990000, 'huawei-y9-2019.jpg', NULL),
(19, 'Huawei Y7 Pro 2019', 3, 3490000, 'huawei-y7-pro.webp', NULL),
(20, 'Huawei nova 3i', 3, 5990000, 'nova3i-xanh.jpg', NULL),
(21, 'Huawei P20 Pro ', 3, 15190500, 'p20-pro.jpg', 16000000),
(22, 'Vsmart Live (6GB/64GB)', 7, 3790000, 'vsmart-live-6gb-white-400x460.png', NULL),
(23, 'Vsmart Live (4GB/64GB)', 7, 3490000, 'vsmart-live-blue-docquyen-400x460.png', NULL),
(24, 'Vsmart Joy 2+ (2GB/32GB)', 7, 2460500, 'vsmart-joy-2-plus-2gb-blue-400x460.png', 2600000),
(25, 'Vsmart Star', 7, 1990000, 'vsmart-star-coral-400x460.png', NULL),
(26, 'Vsmart Bee 3', 7, 1390000, 'vsmart-bee-3-white-doc-quyen-400x460.png', NULL),
(27, 'Vsmart Bee', 7, 1090000, 'vsmart-bee-blue-400x460.png', NULL),
(28, 'Samsung Galaxy M10 (16GB/2GB)', 2, 2650500, 'SamsungGalaxyM10_16GB_2GB.jpg', 2700000),
(29, 'Samsung Galaxy A50 (64GB/4GB)', 2, 6990000, 'SamsungGalaxyA50_64GB_4GB.png', NULL),
(30, 'Samsung Galaxy Note 10 Plus (256GB/12GB)', 2, 24594600, 'SamsungGalaxyNote10Plus_256GB_12GB.jpg', 25000000),
(31, 'Samsung Galaxy S10 Plus (128GB/8GB)', 2, 22990000, 'SamsungGalaxyS10Plus_128GB_8GB.jpeg', NULL),
(32, 'Samsung Galaxy A20s (3GB/32GB)', 2, 4500000, 'SamsungGalaxyA20s_3GB_32GB.jpg', NULL),
(33, 'Samsung Galaxy A70 (128GB/6GB)', 2, 9290000, 'SamsungGalaxyA70_128GB_6GB.jpg', NULL),
(34, 'Samsung Galaxy Note 4', 2, 17990000, 'SamsungGalax Note4.png', NULL),
(35, 'Nokia 2.2 (16GB/2GB)', 6, 2999000, 'Nokia2.2_16GB_2GB.png', NULL),
(36, 'Nokia 3.1 Plus (32GB/3GB)', 6, 3351600, 'Nokia3.1Plus_32GB_3GB.jpg', 3990000),
(37, 'Nokia 800 Tough (2019)', 6, 1700500, 'Nokia800Tough(2019).jpg', 1750000),
(38, 'Nokia 230 Dual SIM', 6, 1390000, 'Nokia230DualSIM.jpeg', NULL),
(39, 'Nokia 8 Sirocco (TA-1005) 6GB/128GB', 6, 20859000, 'Nokia8Sirocco(TA-1005)6GB_128GB.jpg', NULL),
(40, 'Nokia 8110 4G (TA-1059)', 6, 5797000, 'Nokia81104G(TA-1059).jpg', NULL),
(41, 'Nokia (NOKIA) 3310 (TA-1030)', 6, 1407000, 'Nokia(NOKIA)3310(TA-1030).jpeg', NULL),
(42, 'Xiaomi Redmi 8 64GB/3GB', 4, 3590000, 'XiaomiRedmi864GB_3GB.png', NULL),
(43, 'Xiaomi Mi 9 (128GB/6GB)', 4, 14990000, 'XiaomiMi9_128GB_6GB.jpg', NULL),
(44, 'Xiaomi Redmi Note 8 Pro (6GB/128GB)', 4, 9990000, 'XiaomiRedmiNote8Pro_6GB_128GB.jpg', NULL),
(45, 'Xiaomi Mi A3 (4GB/64GB)', 4, 5990000, 'XiaomiMiA3_4GB_64GB.jpg', NULL),
(46, 'Xiaomi Mi Note 10 (6GB/128GB)', 4, 12990000, 'XiaomiMiNote10_6GB_128GB.jpg', NULL),
(47, 'Xiaomi Redmi Note 7 (4GB/64GB)', 4, 4490000, 'xiaomi-redmi-note-7-400x460.png', NULL),
(48, 'Xiaomi Mi 9T', 4, 7990000, 'xiaomi-mi-9t-red-400x460.png', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_analysis`
--

CREATE TABLE `product_analysis` (
  `table_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `visited_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `product_analysis`
--

INSERT INTO `product_analysis` (`table_id`, `product_id`, `visited_date`) VALUES
(19, 1, '2019-12-22 04:08:46'),
(20, 1, '2019-12-22 04:12:28'),
(21, 2, '2019-12-22 04:12:47'),
(22, 2, '2019-12-22 04:13:17'),
(23, 1, '2019-12-22 04:13:23'),
(24, 1, '2019-12-22 04:19:16'),
(25, 1, '2019-12-22 04:19:46'),
(26, 1, '2019-12-22 04:20:07'),
(27, 2, '2019-12-22 04:20:15'),
(28, 1, '2019-12-22 04:20:22'),
(29, 30, '2019-12-22 06:41:40'),
(30, 11, '2019-12-22 06:41:48'),
(31, 11, '2019-12-22 06:41:52'),
(32, 9, '2019-12-22 06:41:55'),
(33, 29, '2019-12-22 07:14:35'),
(34, 29, '2019-12-22 07:14:36'),
(35, 29, '2019-12-22 07:14:37'),
(36, 29, '2019-12-22 07:14:37'),
(37, 29, '2019-12-22 07:14:38'),
(38, 29, '2019-12-22 07:14:38'),
(39, 30, '2019-12-22 07:14:48'),
(40, 30, '2019-12-22 07:14:49'),
(41, 30, '2019-12-22 07:14:50'),
(42, 30, '2019-12-22 07:14:50'),
(43, 30, '2019-12-22 07:14:51'),
(44, 30, '2019-12-22 07:14:51'),
(45, 30, '2019-12-22 07:14:52'),
(46, 30, '2019-12-22 07:14:52'),
(47, 30, '2019-12-22 07:14:53'),
(48, 30, '2019-12-22 07:14:53'),
(49, 30, '2019-12-22 07:14:54'),
(50, 30, '2019-12-22 07:14:54'),
(51, 30, '2019-12-22 07:14:55'),
(52, 29, '2019-12-22 07:15:09'),
(53, 29, '2019-12-22 07:15:11'),
(54, 29, '2019-12-22 07:15:11'),
(55, 29, '2019-12-22 07:15:12'),
(56, 29, '2019-12-22 07:15:12'),
(57, 29, '2019-12-22 07:15:15'),
(58, 29, '2019-12-22 07:15:16'),
(59, 29, '2019-12-22 07:15:16'),
(60, 29, '2019-12-22 07:15:17'),
(61, 29, '2019-12-22 07:15:18'),
(62, 30, '2019-12-22 07:15:22'),
(63, 30, '2019-12-22 07:15:24'),
(64, 30, '2019-12-22 07:15:25'),
(65, 30, '2019-12-22 07:15:37'),
(66, 30, '2019-12-22 07:15:41'),
(67, 28, '2019-12-22 07:15:54'),
(68, 28, '2019-12-22 07:15:56'),
(69, 28, '2019-12-22 07:15:57'),
(70, 28, '2019-12-22 07:15:57'),
(71, 28, '2019-12-22 07:15:58'),
(72, 28, '2019-12-22 07:15:58'),
(73, 28, '2019-12-22 07:15:59'),
(74, 28, '2019-12-22 07:16:00'),
(75, 28, '2019-12-22 07:16:00'),
(76, 28, '2019-12-22 07:16:00'),
(77, 28, '2019-12-22 07:16:01'),
(78, 28, '2019-12-22 07:16:01'),
(79, 28, '2019-12-22 07:16:02'),
(80, 28, '2019-12-22 07:16:02'),
(81, 28, '2019-12-22 07:16:04'),
(82, 28, '2019-12-22 07:16:04'),
(83, 28, '2019-12-22 07:16:04'),
(84, 28, '2019-12-22 07:16:05'),
(85, 28, '2019-12-22 07:16:05'),
(86, 37, '2019-12-22 07:16:09'),
(87, 37, '2019-12-22 07:16:11'),
(88, 37, '2019-12-22 07:16:14'),
(89, 37, '2019-12-22 07:16:15'),
(90, 37, '2019-12-22 07:16:15'),
(91, 37, '2019-12-22 07:16:16'),
(92, 37, '2019-12-22 07:16:16'),
(93, 37, '2019-12-22 07:16:17'),
(94, 37, '2019-12-22 07:16:26'),
(95, 37, '2019-12-22 07:16:26'),
(96, 37, '2019-12-22 07:16:27'),
(97, 37, '2019-12-22 07:16:27'),
(98, 37, '2019-12-22 07:16:28'),
(99, 4, '2019-12-22 16:33:07'),
(100, 4, '2019-12-22 16:33:10'),
(101, 4, '2019-12-22 16:33:11'),
(102, 4, '2019-12-22 16:33:11'),
(103, 4, '2019-12-22 16:33:12'),
(104, 4, '2019-12-22 16:33:12'),
(105, 4, '2019-12-22 16:33:12'),
(106, 4, '2019-12-22 16:33:12'),
(107, 4, '2019-12-22 16:33:12'),
(108, 4, '2019-12-22 16:33:12'),
(109, 4, '2019-12-22 16:33:13'),
(110, 4, '2019-12-22 16:33:13'),
(111, 4, '2019-12-22 16:33:13'),
(112, 4, '2019-12-22 16:33:13'),
(113, 4, '2019-12-22 16:33:13'),
(114, 4, '2019-12-22 16:33:14'),
(115, 4, '2019-12-22 16:33:14'),
(116, 4, '2019-12-22 16:33:14'),
(117, 4, '2019-12-22 16:33:14'),
(118, 4, '2019-12-22 16:33:14'),
(119, 4, '2019-12-22 16:33:15'),
(120, 4, '2019-12-22 16:33:15'),
(121, 4, '2019-12-22 16:33:15'),
(122, 4, '2019-12-22 16:33:15'),
(123, 4, '2019-12-22 16:33:15'),
(124, 21, '2019-12-22 16:34:40'),
(125, 21, '2019-12-22 16:34:41'),
(126, 21, '2019-12-22 16:34:41'),
(127, 21, '2019-12-22 16:34:42'),
(128, 21, '2019-12-22 16:34:42'),
(129, 21, '2019-12-22 16:34:42'),
(130, 21, '2019-12-22 16:34:43'),
(131, 21, '2019-12-22 16:34:43'),
(132, 21, '2019-12-22 16:34:43'),
(133, 21, '2019-12-22 16:34:43'),
(134, 21, '2019-12-22 16:34:43'),
(135, 21, '2019-12-22 16:34:44'),
(136, 21, '2019-12-22 16:34:44'),
(137, 21, '2019-12-22 16:34:45'),
(138, 21, '2019-12-22 16:34:45'),
(139, 21, '2019-12-22 16:34:45'),
(140, 21, '2019-12-22 16:34:45'),
(141, 21, '2019-12-22 16:34:45'),
(142, 21, '2019-12-22 16:34:46'),
(143, 21, '2019-12-22 16:34:46'),
(144, 21, '2019-12-22 16:34:46'),
(145, 21, '2019-12-22 16:35:05'),
(146, 21, '2019-12-22 16:35:06'),
(147, 21, '2019-12-22 16:35:06'),
(148, 21, '2019-12-22 16:35:06'),
(149, 21, '2019-12-22 16:35:06'),
(150, 21, '2019-12-22 16:35:06'),
(151, 21, '2019-12-22 16:35:07'),
(152, 21, '2019-12-22 16:35:07'),
(153, 21, '2019-12-22 16:35:08'),
(154, 21, '2019-12-22 16:35:09'),
(155, 36, '2019-12-22 17:37:49'),
(156, 36, '2019-12-22 17:37:54'),
(157, 36, '2019-12-22 17:37:54'),
(158, 36, '2019-12-22 17:37:54'),
(159, 36, '2019-12-22 17:37:55'),
(160, 36, '2019-12-22 17:37:55'),
(161, 36, '2019-12-22 17:37:55'),
(162, 36, '2019-12-22 17:37:55'),
(163, 36, '2019-12-22 17:37:55'),
(164, 36, '2019-12-22 17:37:55'),
(165, 36, '2019-12-22 17:37:56'),
(166, 36, '2019-12-22 17:37:56'),
(167, 36, '2019-12-22 17:37:56'),
(168, 36, '2019-12-22 17:37:56'),
(169, 36, '2019-12-22 17:37:56'),
(170, 36, '2019-12-22 17:37:57'),
(171, 36, '2019-12-22 17:37:57'),
(172, 36, '2019-12-22 17:37:57'),
(173, 36, '2019-12-22 17:37:57'),
(174, 36, '2019-12-22 17:37:57'),
(175, 36, '2019-12-22 17:37:58'),
(176, 36, '2019-12-22 17:37:58'),
(177, 24, '2019-12-22 17:38:23'),
(178, 24, '2019-12-22 17:38:25'),
(179, 24, '2019-12-22 17:38:25'),
(180, 24, '2019-12-22 17:38:25'),
(181, 24, '2019-12-22 17:38:25'),
(182, 24, '2019-12-22 17:38:25'),
(183, 24, '2019-12-22 17:38:26'),
(184, 24, '2019-12-22 17:38:26'),
(185, 24, '2019-12-22 17:38:26'),
(186, 24, '2019-12-22 17:38:26'),
(187, 24, '2019-12-22 17:38:27'),
(188, 24, '2019-12-22 17:38:27'),
(189, 24, '2019-12-22 17:38:27'),
(190, 24, '2019-12-22 17:38:27'),
(191, 24, '2019-12-22 17:38:27'),
(192, 24, '2019-12-22 17:38:28'),
(193, 24, '2019-12-22 17:38:28'),
(194, 24, '2019-12-22 17:38:28'),
(195, 24, '2019-12-22 17:38:28'),
(196, 24, '2019-12-22 17:38:28'),
(197, 24, '2019-12-22 17:38:29'),
(198, 24, '2019-12-22 17:38:29'),
(199, 24, '2019-12-22 17:38:29'),
(200, 24, '2019-12-22 17:38:29'),
(201, 24, '2019-12-22 17:38:29'),
(202, 24, '2019-12-22 17:38:30'),
(203, 24, '2019-12-22 17:38:30'),
(204, 24, '2019-12-22 17:38:30'),
(205, 24, '2019-12-22 17:38:30'),
(206, 24, '2019-12-22 17:38:30'),
(207, 24, '2019-12-22 17:38:31'),
(208, 24, '2019-12-22 17:38:31'),
(209, 24, '2019-12-22 17:38:31'),
(210, 24, '2019-12-22 17:38:31'),
(211, 24, '2019-12-22 17:38:31'),
(212, 24, '2019-12-22 17:38:32'),
(213, 24, '2019-12-22 17:38:32'),
(214, 24, '2019-12-22 17:38:32'),
(215, 24, '2019-12-22 17:38:33'),
(216, 24, '2019-12-22 17:38:33'),
(217, 24, '2019-12-22 17:38:33'),
(218, 24, '2019-12-22 17:38:33'),
(219, 24, '2019-12-22 17:38:33'),
(220, 24, '2019-12-22 17:38:34'),
(221, 24, '2019-12-22 17:38:34'),
(222, 24, '2019-12-22 17:38:34'),
(223, 24, '2019-12-22 17:38:34'),
(224, 24, '2019-12-22 17:38:34'),
(225, 1, '2019-12-22 17:53:31'),
(226, 1, '2019-12-22 17:55:09'),
(227, 1, '2019-12-22 17:55:51'),
(229, 30, '2019-12-22 17:56:54'),
(230, 28, '2019-12-22 17:57:02'),
(231, 38, '2019-12-23 01:59:36'),
(232, 38, '2019-12-23 02:01:04'),
(233, 38, '2019-12-23 02:01:09'),
(234, 30, '2019-12-24 03:28:43'),
(235, 28, '2019-12-24 04:46:29'),
(236, 36, '2019-12-24 04:46:40'),
(237, 30, '2019-12-24 04:49:32'),
(238, 38, '2019-12-24 04:59:46'),
(239, 30, '2019-12-25 07:25:42'),
(240, 8, '2019-12-25 07:53:05'),
(241, 8, '2019-12-25 07:54:59'),
(242, 8, '2019-12-25 07:55:01'),
(243, 8, '2019-12-25 07:56:13');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `rules`
--

CREATE TABLE `rules` (
  `rule_id` int(11) NOT NULL,
  `class_or_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `matching_ratio` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `rules`
--

INSERT INTO `rules` (`rule_id`, `class_or_id`, `name`, `matching_ratio`) VALUES
(5, 'class', 'area_price', NULL),
(6, 'class', 'fs_dtprice', NULL),
(7, 'class or id', 'price', NULL),
(8, 'class', 'mc-lpri', NULL),
(9, 'class or id', 'Price', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `rules_and_dataset`
--

CREATE TABLE `rules_and_dataset` (
  `table_id` int(11) NOT NULL,
  `rule_id` int(11) DEFAULT NULL,
  `link_id` int(11) DEFAULT NULL,
  `is_visited` int(11) DEFAULT NULL,
  `is_identified_price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Chỉ mục cho bảng `dataset`
--
ALTER TABLE `dataset`
  ADD PRIMARY KEY (`link_id`);

--
-- Chỉ mục cho bảng `inventory_in`
--
ALTER TABLE `inventory_in`
  ADD PRIMARY KEY (`inventory_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `inventory_management`
--
ALTER TABLE `inventory_management`
  ADD PRIMARY KEY (`im_id`),
  ADD KEY `inventory_id` (`inventory_id`);

--
-- Chỉ mục cho bảng `inventory_out`
--
ALTER TABLE `inventory_out`
  ADD PRIMARY KEY (`io_id`),
  ADD KEY `inventory_id` (`inventory_id`);

--
-- Chỉ mục cho bảng `inventory_performance`
--
ALTER TABLE `inventory_performance`
  ADD PRIMARY KEY (`ip_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Chỉ mục cho bảng `product_analysis`
--
ALTER TABLE `product_analysis`
  ADD PRIMARY KEY (`table_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `rules`
--
ALTER TABLE `rules`
  ADD PRIMARY KEY (`rule_id`);

--
-- Chỉ mục cho bảng `rules_and_dataset`
--
ALTER TABLE `rules_and_dataset`
  ADD PRIMARY KEY (`table_id`),
  ADD KEY `rule_id` (`rule_id`),
  ADD KEY `link_id` (`link_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `dataset`
--
ALTER TABLE `dataset`
  MODIFY `link_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT cho bảng `inventory_in`
--
ALTER TABLE `inventory_in`
  MODIFY `inventory_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT cho bảng `inventory_management`
--
ALTER TABLE `inventory_management`
  MODIFY `im_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT cho bảng `inventory_out`
--
ALTER TABLE `inventory_out`
  MODIFY `io_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT cho bảng `inventory_performance`
--
ALTER TABLE `inventory_performance`
  MODIFY `ip_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT cho bảng `product_analysis`
--
ALTER TABLE `product_analysis`
  MODIFY `table_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=244;

--
-- AUTO_INCREMENT cho bảng `rules`
--
ALTER TABLE `rules`
  MODIFY `rule_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `rules_and_dataset`
--
ALTER TABLE `rules_and_dataset`
  MODIFY `table_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `inventory_in`
--
ALTER TABLE `inventory_in`
  ADD CONSTRAINT `inventory_in_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `inventory_management`
--
ALTER TABLE `inventory_management`
  ADD CONSTRAINT `inventory_management_ibfk_1` FOREIGN KEY (`inventory_id`) REFERENCES `inventory_in` (`inventory_id`);

--
-- Các ràng buộc cho bảng `inventory_out`
--
ALTER TABLE `inventory_out`
  ADD CONSTRAINT `inventory_out_ibfk_1` FOREIGN KEY (`inventory_id`) REFERENCES `inventory_in` (`inventory_id`);

--
-- Các ràng buộc cho bảng `inventory_performance`
--
ALTER TABLE `inventory_performance`
  ADD CONSTRAINT `inventory_performance_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`cat_id`);

--
-- Các ràng buộc cho bảng `product_analysis`
--
ALTER TABLE `product_analysis`
  ADD CONSTRAINT `product_analysis_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `rules_and_dataset`
--
ALTER TABLE `rules_and_dataset`
  ADD CONSTRAINT `rules_and_dataset_ibfk_1` FOREIGN KEY (`rule_id`) REFERENCES `rules` (`rule_id`),
  ADD CONSTRAINT `rules_and_dataset_ibfk_2` FOREIGN KEY (`link_id`) REFERENCES `dataset` (`link_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
