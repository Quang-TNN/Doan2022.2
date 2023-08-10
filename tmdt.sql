-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 01, 2023 at 10:44 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tmdt`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shop_id` bigint(20) DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` int(11) NOT NULL DEFAULT 1,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `email_verified_at`, `password`, `shop_id`, `remember_token`, `created_at`, `updated_at`, `role`, `status`) VALUES
(1, 'admin', 'admin@gmail.com', '2023-07-23 04:19:07', '$2y$10$QfxVbOxG328e0lo2CjH3A.jd2J4rBMm6tcpOjQpNP3QNnquO6Vcga', NULL, 'ZsE09SMLaC12HSGdlo0e5jhZRWykITPh3SiWsy6MTIUFYhu2wWTlidzfNUJb', '2023-07-23 04:19:08', '2023-07-23 04:19:08', 0, 1),
(2, 'Nguyễn Văn A', 'hanuri@gmail.com', NULL, '$2y$10$O.Vz8kjAaMb0BXjFKgjo8OMsXxmfRlO/TP8o.oQF4ZZ6Ozatv1lFG', NULL, 'Xa3GwG4zMncoi55vb3og8YMJv23GxlXWjfLS2sc2vbRIJfjTcrK1RFB42tZX', '2023-07-25 16:15:14', '2023-07-30 07:17:07', 1, 1),
(3, 'Nhân viên 1', 'nv1@gmail.com', NULL, '$2y$10$pQo.2xtUiDxNIS9gB/uiOezDnW8Xlb4fUl6t78J7QjibD.2MWR186', 1, NULL, '2023-07-30 12:09:27', '2023-07-30 12:09:27', 2, 1),
(4, 'Nhân viên 2', 'nv2@gmail.com', NULL, '$2y$10$8ZsQEpi1pkHhQF4HxU3XuupdOSrVpocqVtExq2CXiCkB1F7x72lLq', 1, NULL, '2023-07-30 12:09:49', '2023-07-30 12:09:49', 2, 1),
(5, 'Nhân viên 3', 'nv3@gmail.com', NULL, '$2y$10$rQCcrzVeRaAmKTHVddWEP.xkFalmwEsaHL0Z0erda9GfnO0PAL0BK', 1, NULL, '2023-07-30 12:10:31', '2023-07-30 12:10:31', 2, 1),
(6, 'Nguyễn Văn B', 'cellphone@gmail.com', NULL, '$2y$10$VfaTUsB3lPKAWrP6nvPEdO4DHBDSwIwBXh5LQM22KJBypLrLgf1Eq', NULL, 'xdGac3wquW1urDW2nqNgJp2tHZ86dLMCYInUgrikgHUvnTQwtPIrxglNJlTN', '2023-07-31 10:26:15', '2023-07-31 10:26:15', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shop_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `image`, `name`, `shop_id`, `created_at`, `updated_at`, `status`) VALUES
(1, '/storage/images/brands/myeongdong.png', 'Myeong dong', 1, '2023-07-28 09:15:00', '2023-07-30 08:08:57', 1),
(2, '/storage/images/brands/mokchang.png', 'Mokchang', 1, '2023-07-30 07:34:58', '2023-07-30 07:34:58', 1),
(3, '/storage/images/brands/kimbap.jfif', 'Kim bap Korean Food', 1, '2023-07-30 08:14:48', '2023-07-30 08:14:48', 1),
(4, '/storage/images/brands/Nike-Swoosh-trademark.png', 'Nike', 1, '2023-07-30 11:42:29', '2023-07-30 11:42:29', 1),
(5, '/storage/images/brands/pond.png', 'Pond', 1, '2023-07-30 11:43:00', '2023-07-30 11:43:00', 1),
(6, '/storage/images/brands/apple.png', 'Apple', 1, '2023-07-30 12:19:28', '2023-07-30 12:19:28', 1),
(7, '/storage/images/brands/360_197_1.webp', 'Samsung', 1, '2023-07-30 12:22:42', '2023-07-30 12:22:42', 1),
(8, '/storage/images/brands/gucci-logo-su-hinh-thanh-va-phat-trien.jpg', 'Gucci', 1, '2023-07-30 12:23:54', '2023-07-30 12:23:54', 1),
(9, '/storage/images/brands/levis.png', 'Levis', 1, '2023-07-30 12:25:53', '2023-07-30 12:25:53', 1),
(10, '/storage/images/brands/louis-vuitton-logo.jpg', 'Louis Vuitton', 1, '2023-07-30 12:27:03', '2023-07-30 12:27:03', 1),
(11, '/storage/images/brands/360_197_1.webp', 'Samsung', 2, '2023-07-31 10:27:12', '2023-08-01 04:23:24', 1),
(12, '/storage/images/brands/poco.png', 'Poco', 2, '2023-08-01 04:27:18', '2023-08-01 04:27:18', 1),
(13, '/storage/images/brands/gucci-logo-su-hinh-thanh-va-phat-trien.jpg', 'Gucci', 2, '2023-08-01 04:33:38', '2023-08-01 04:33:38', 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_path` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `image_path`, `created_at`, `updated_at`, `status`) VALUES
(1, 'Quần áo', '/storage/images/categories/7.jpg', '2023-07-28 08:57:31', '2023-07-30 08:24:19', 1),
(2, 'Đồ ăn', '/storage/images/categories/doanhanquoc.jpg', '2023-07-30 08:26:06', '2023-07-30 09:21:59', 1),
(3, 'Đồ điện tử', '/storage/images/categories/thietbidientu.jpg', '2023-07-30 08:27:54', '2023-07-30 08:27:54', 1),
(4, 'Túi xách', '/storage/images/categories/dam-4.jpg', '2023-07-30 08:30:21', '2023-07-30 08:30:21', 1),
(5, 'Giày dép', '/storage/images/categories/giay-6.jpg', '2023-07-30 11:40:28', '2023-07-30 11:40:28', 1),
(6, 'Kem dưỡng da', '/storage/images/categories/kem-4.png', '2023-07-30 11:41:50', '2023-07-30 11:41:50', 1);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2021_11_18_171524_create_admins_table', 1),
(6, '2021_11_18_172425_create_shops_table', 1),
(7, '2021_11_18_172426_create_categories_table', 1),
(8, '2021_11_18_172427_create_brands_table', 1),
(9, '2021_11_18_172646_create_products_table', 1),
(10, '2021_11_19_063905_create_vouchers_table', 1),
(11, '2021_11_22_175504_add_qty_buy_column_to_products_table', 1),
(12, '2021_11_22_183633_create_comments_table', 1),
(13, '2021_11_24_162215_create_replies_table', 1),
(14, '2021_11_24_162504_create_orders_table', 1),
(15, '2021_11_24_163413_create_orders_detail_table', 1),
(16, '2021_12_01_071939_create_wishlist_table', 1),
(17, '2021_12_22_015701_add_view_column_to_products_table', 1),
(18, '2022_02_28_175237_create_suppliers_table', 1),
(19, '2022_02_28_175610_add_supplier_id_column_to_products_table', 1),
(20, '2022_03_01_174624_add_role_column_to_admins_table', 1),
(21, '2022_03_02_081914_create_setting_table', 1),
(22, '2022_03_12_131055_add_status_column_to_categories_table', 1),
(23, '2022_03_12_131719_add_status_column_to_products_table', 1),
(24, '2022_03_12_131735_add_status_column_to_brands_table', 1),
(25, '2022_05_04_064934_add_status_column_to_admins_table', 1),
(26, '2022_05_04_101851_add_title_column_to_setting_table', 1),
(27, '2022_05_23_023726_add_status_column_to_shops_table', 1),
(28, '2022_05_25_112602_add_shop_id_column_to_orders_table', 1),
(29, '2023_07_25_221447_drop_logo_column_to_setting_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `voucher_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total` int(11) NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shop_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `voucher_code`, `total`, `address`, `status`, `created_at`, `updated_at`, `shop_id`) VALUES
('ch_3NaAziA1q67YUalk0qLtKjbV', 1, NULL, 35000, 'Hà Nội', 3, '2023-08-01 05:19:43', '2023-08-01 08:44:28', 1),
('ch_3NaAzjA1q67YUalk1sQp9Vqs', 1, NULL, 1500000, 'Hà Nội', 3, '2023-08-01 05:19:44', '2023-08-01 08:06:42', 2);

-- --------------------------------------------------------

--
-- Table structure for table `orders_detail`
--

CREATE TABLE `orders_detail` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders_detail`
--

INSERT INTO `orders_detail` (`id`, `order_id`, `product_id`, `qty`, `created_at`, `updated_at`) VALUES
(1, 'ch_3NaAziA1q67YUalk0qLtKjbV', 1, 1, '2023-08-01 05:19:43', '2023-08-01 05:19:43'),
(2, 'ch_3NaAzjA1q67YUalk1sQp9Vqs', 8, 1, '2023-08-01 05:19:44', '2023-08-01 05:19:44');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` bigint(20) UNSIGNED NOT NULL,
  `image_path` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int(11) NOT NULL DEFAULT 0,
  `shop_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `qty_buy` int(11) NOT NULL DEFAULT 0,
  `view` int(11) NOT NULL DEFAULT 0,
  `supplier_id` bigint(20) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `category_id`, `brand_id`, `image_path`, `description`, `qty`, `shop_id`, `created_at`, `updated_at`, `qty_buy`, `view`, `supplier_id`, `status`) VALUES
(1, 'Bún ốc Liễu Châu Lý Tử Thất', 35000, 2, 2, '/storage/images/products/bundau.jpg', NULL, 99, 1, '2023-07-30 11:56:56', '2023-08-01 05:19:43', 1, 0, 1, 1),
(2, 'Bánh mì gói bơ sữa', 20000, 2, 1, '/storage/images/products/banhmigoi.jpg', NULL, 200, 1, '2023-07-30 12:01:55', '2023-07-30 12:01:55', 0, 0, 4, 1),
(3, 'CÁNH GÀ GIỮA TẨM VỊ ĂN LIỀN KELEJI 可乐基', 15000, 2, 2, '/storage/images/products/ga.jpg', NULL, 150, 1, '2023-07-30 12:06:46', '2023-07-30 12:06:46', 0, 0, 1, 1),
(4, 'Giày Nike Air Jordan', 1500000, 5, 4, '/storage/images/products/giay-6.jpg', NULL, 100, 1, '2023-07-30 12:15:55', '2023-07-30 12:15:55', 0, 0, 2, 1),
(5, 'iPhone 12 Promax', 25000000, 3, 6, '/storage/images/products/p7.webp', NULL, 100, 1, '2023-07-30 12:30:24', '2023-07-30 12:30:24', 0, 0, 6, 1),
(6, 'Sữa rửa mặt Pond', 25000, 6, 5, '/storage/images/products/kem-4.png', NULL, 100, 1, '2023-07-30 12:38:43', '2023-07-30 12:38:43', 0, 0, 3, 1),
(7, 'Áo sơ mi tay dài', 250000, 1, 8, '/storage/images/products/dam-13.jpg', NULL, 100, 1, '2023-07-30 12:40:59', '2023-07-30 12:40:59', 0, 0, 8, 1),
(8, 'Samsung Galaxy Note 7', 1500000, 3, 11, '/storage/images/products/p15.webp', NULL, 199, 2, '2023-08-01 04:25:29', '2023-08-01 05:19:44', 1, 0, 11, 1),
(9, 'Poco X3 Pro 128GB', 200000, 3, 11, '/storage/images/products/p1.webp', NULL, 100, 2, '2023-08-01 04:28:42', '2023-08-01 04:28:42', 0, 0, 11, 1),
(10, 'Túi xách da cá sấu', 500000, 4, 13, '/storage/images/products/dam-5.jpg', NULL, 100, 2, '2023-08-01 04:34:59', '2023-08-01 04:34:59', 0, 0, 13, 1);

-- --------------------------------------------------------

--
-- Table structure for table `replies`
--

CREATE TABLE `replies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`id`, `email`, `tel`, `address`, `created_at`, `updated_at`, `title`) VALUES
(1, 'zquang.shop@gmail.com', '+08 68.806.674', 'Hà Nội', '2023-07-23 04:19:08', '2023-07-25 15:38:20', 'Zquang.shop');

-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

CREATE TABLE `shops` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shops`
--

INSERT INTO `shops` (`id`, `image`, `phone`, `address`, `name`, `description`, `admin_id`, `created_at`, `updated_at`, `status`) VALUES
(1, '/storage/images/shops/hanuri.png', '0123456789', 'Hà Nội', 'Hanuri', NULL, 2, '2023-07-25 16:15:14', '2023-07-30 07:17:07', 1),
(2, '/storage/images/shops/CellphoneS-Logo-PNG-1.png', '0123456789', 'TPHCM', 'Cellphone', NULL, 6, '2023-07-31 10:26:15', '2023-07-31 10:26:15', 1);

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shop_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `email`, `phone`, `shop_id`, `created_at`, `updated_at`) VALUES
(1, 'Mokchang', 'mokchang@gmail.com', '0123456789', 1, '2023-07-28 10:26:17', '2023-07-30 09:53:45'),
(2, 'Nike', 'nike@gmail.com', '0123456789', 1, '2023-07-30 08:31:10', '2023-07-30 08:31:10'),
(3, 'Pond', 'pond@gmail.com', '0123456789', 1, '2023-07-30 11:43:22', '2023-07-30 11:43:22'),
(4, 'Myeong dong', 'myeongdong@gmail.com', '0123456789', 1, '2023-07-30 11:44:25', '2023-07-30 11:44:25'),
(5, 'Kim bap Korean Food', 'kbkf@gmail.com', '0123456789', 1, '2023-07-30 12:17:06', '2023-07-30 12:17:06'),
(6, 'Apple', 'apple@gmail.com', '0123456789', 1, '2023-07-30 12:20:40', '2023-07-30 12:20:40'),
(7, 'Samsung', 'samsung@gmail.com', '0123456789', 1, '2023-07-30 12:23:04', '2023-07-30 12:23:04'),
(8, 'Gucci', 'gucci@gmail.com', '0123456789', 1, '2023-07-30 12:24:05', '2023-07-30 12:24:05'),
(9, 'Levis', 'levis@gmail.com', '0123456789', 1, '2023-07-30 12:26:33', '2023-07-30 12:26:33'),
(10, 'Louis Vuitton', 'louisvuitton@gmail.com', '0123456789', 1, '2023-07-30 12:27:24', '2023-07-30 12:27:24'),
(11, 'Samsung', 'samsung@gmail.com', '0123456789', 2, '2023-08-01 04:24:21', '2023-08-01 04:24:21'),
(12, 'Poco', 'poco@gmail.com', '0123456479', 2, '2023-08-01 04:27:55', '2023-08-01 04:27:55'),
(13, 'Gucci', 'gucci@gmail.com', '0123456789', 2, '2023-08-01 04:34:12', '2023-08-01 04:34:12');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sex` int(11) NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `phone`, `sex`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Test', 'test@gmail.com', NULL, '$2y$10$APRM1xQNWki0e4XwsS6lmucGPM.NgSMRLWGAdPpIc1apGlWoXYjaK', '0123456789', 0, 'zqN7fJ61Nk9k44u5oY5J6qVokPapjKluQqmCYrgQisiSbW7yFv01BdvU1Pcq', '2023-07-31 01:53:16', '2023-07-31 01:53:16');

-- --------------------------------------------------------

--
-- Table structure for table `vouchers`
--

CREATE TABLE `vouchers` (
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `shop_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vouchers`
--

INSERT INTO `vouchers` (`code`, `price`, `qty`, `shop_id`, `created_at`, `updated_at`) VALUES
('khachhangthanthiet', 5000, 200, 1, '2023-07-30 12:08:34', '2023-07-30 12:08:34'),
('welcome', 10000, 2000, 1, '2023-07-30 12:07:38', '2023-07-30 12:07:38');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brands_shop_id_index` (`shop_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_user_id_index` (`user_id`),
  ADD KEY `comments_product_id_index` (`product_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_index` (`user_id`),
  ADD KEY `orders_voucher_code_index` (`voucher_code`),
  ADD KEY `orders_shop_id_index` (`shop_id`);

--
-- Indexes for table `orders_detail`
--
ALTER TABLE `orders_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_detail_order_id_index` (`order_id`),
  ADD KEY `orders_detail_product_id_index` (`product_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_id_index` (`category_id`),
  ADD KEY `products_brand_id_index` (`brand_id`),
  ADD KEY `products_shop_id_index` (`shop_id`),
  ADD KEY `products_supplier_id_index` (`supplier_id`);

--
-- Indexes for table `replies`
--
ALTER TABLE `replies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `replies_comment_id_index` (`comment_id`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shops_admin_id_index` (`admin_id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `suppliers_shop_id_index` (`shop_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `vouchers`
--
ALTER TABLE `vouchers`
  ADD PRIMARY KEY (`code`),
  ADD KEY `vouchers_shop_id_index` (`shop_id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlist_product_id_index` (`product_id`),
  ADD KEY `wishlist_user_id_index` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `orders_detail`
--
ALTER TABLE `orders_detail`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `replies`
--
ALTER TABLE `replies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shops`
--
ALTER TABLE `shops`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `brands`
--
ALTER TABLE `brands`
  ADD CONSTRAINT `brands_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_voucher_code_foreign` FOREIGN KEY (`voucher_code`) REFERENCES `vouchers` (`code`) ON DELETE CASCADE;

--
-- Constraints for table `orders_detail`
--
ALTER TABLE `orders_detail`
  ADD CONSTRAINT `orders_detail_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_detail_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `replies`
--
ALTER TABLE `replies`
  ADD CONSTRAINT `replies_comment_id_foreign` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shops`
--
ALTER TABLE `shops`
  ADD CONSTRAINT `shops_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD CONSTRAINT `suppliers_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vouchers`
--
ALTER TABLE `vouchers`
  ADD CONSTRAINT `vouchers_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `wishlist_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlist_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
