-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: mysql:3306
-- Generation Time: Feb 24, 2026 at 02:15 AM
-- Server version: 8.0.44
-- PHP Version: 8.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `food38`
--

-- --------------------------------------------------------

--
-- Table structure for table `addons`
--

CREATE TABLE `addons` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `version` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `author` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `files` json DEFAULT NULL,
  `item_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `license_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '5' COMMENT '5=Active, 10=Inactive',
  `creator_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_id` bigint DEFAULT NULL,
  `editor_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `editor_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `apartment` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitude` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `creator_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_id` bigint DEFAULT NULL,
  `editor_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `editor_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `analytics`
--

CREATE TABLE `analytics` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '5' COMMENT '5=Active, 10=Inactive',
  `creator_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_id` bigint DEFAULT NULL,
  `editor_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `editor_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `analytic_sections`
--

CREATE TABLE `analytic_sections` (
  `id` bigint UNSIGNED NOT NULL,
  `analytic_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `section` tinyint NOT NULL DEFAULT '5',
  `creator_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_id` bigint DEFAULT NULL,
  `editor_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `editor_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `zone` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint UNSIGNED NOT NULL DEFAULT '5' COMMENT '5=Active, 10=Inactive',
  `creator_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_id` bigint DEFAULT NULL,
  `editor_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `editor_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`id`, `name`, `email`, `phone`, `latitude`, `longitude`, `city`, `state`, `zip_code`, `address`, `zone`, `status`, `creator_type`, `creator_id`, `editor_type`, `editor_id`, `created_at`, `updated_at`) VALUES
(1, 'Oxford (main)', 'oxford@iclouds.co.uk', '+536464646464', '23.8042375', '90.3525979', 'Oxford', 'Oxford', 'OX44BT', '17 Freeland Road, Oxford, OX44BT', '\"[{\\\"lat\\\":23.804898425688478,\\\"lng\\\":90.34644025387266},{\\\"lat\\\":23.80898185164042,\\\"lng\\\":90.36085980953672},{\\\"lat\\\":23.7979091872033,\\\"lng\\\":90.36721128048399},{\\\"lat\\\":23.795239041774114,\\\"lng\\\":90.35854238094785},{\\\"lat\\\":23.79186662551694,\\\"lng\\\":90.35257944558866},{\\\"lat\\\":23.80081948198351,\\\"lng\\\":90.34502634500272}]\"', 5, NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-16 05:29:17');

-- --------------------------------------------------------

--
-- Table structure for table `capture_payment_notifications`
--

CREATE TABLE `capture_payment_notifications` (
  `order_id` bigint UNSIGNED NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` decimal(19,6) NOT NULL,
  `discount_type` tinyint NOT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `minimum_order` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `maximum_discount` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `limit_per_user` bigint DEFAULT '0',
  `creator_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_id` bigint DEFAULT NULL,
  `editor_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `editor_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_cryptocurrency` tinyint UNSIGNED NOT NULL,
  `exchange_rate` decimal(13,2) DEFAULT NULL,
  `creator_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_id` bigint UNSIGNED DEFAULT NULL,
  `editor_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `editor_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `symbol`, `code`, `is_cryptocurrency`, `exchange_rate`, `creator_type`, `creator_id`, `editor_type`, `editor_id`, `created_at`, `updated_at`) VALUES
(1, 'Dollars', '$', 'USD', 10, 1.00, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'GBP', '£', 'gbp', 10, 1.00, NULL, NULL, NULL, NULL, '2026-02-16 05:25:31', '2026-02-16 05:25:31');

-- --------------------------------------------------------

--
-- Table structure for table `default_access`
--

CREATE TABLE `default_access` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `default_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `default_access`
--

INSERT INTO `default_access` (`id`, `name`, `user_id`, `default_id`, `created_at`, `updated_at`) VALUES
(1, 'branch_id', 1, 1, '2026-02-15 21:38:30', '2026-02-15 21:38:30'),
(2, 'branch_id', 3, 1, '2026-02-18 03:30:19', '2026-02-18 03:30:19'),
(3, 'branch_id', 2, 1, '2026-02-18 03:35:09', '2026-02-18 03:35:09');

-- --------------------------------------------------------

--
-- Table structure for table `dining_tables`
--

CREATE TABLE `dining_tables` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int DEFAULT NULL,
  `qr_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `status` tinyint UNSIGNED NOT NULL DEFAULT '5' COMMENT '5=Active, 10=Inactive',
  `creator_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_id` bigint DEFAULT NULL,
  `editor_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `editor_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gateway_options`
--

CREATE TABLE `gateway_options` (
  `id` bigint UNSIGNED NOT NULL,
  `model_id` bigint NOT NULL,
  `model_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `option` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `type` tinyint NOT NULL,
  `activities` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `creator_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_id` bigint DEFAULT NULL,
  `editor_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `editor_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gateway_options`
--

INSERT INTO `gateway_options` (`id`, `model_id`, `model_type`, `option`, `value`, `type`, `activities`, `creator_type`, `creator_id`, `editor_type`, `editor_id`, `created_at`, `updated_at`) VALUES
(1, 3, 'App\\Models\\PaymentGateway', 'paypal_app_id', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(2, 3, 'App\\Models\\PaymentGateway', 'paypal_client_id', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(3, 3, 'App\\Models\\PaymentGateway', 'paypal_client_secret', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(4, 3, 'App\\Models\\PaymentGateway', 'paypal_mode', '', 10, '{\"5\":\"sandbox\",\"10\":\"live\"}', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(5, 3, 'App\\Models\\PaymentGateway', 'paypal_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(6, 4, 'App\\Models\\PaymentGateway', 'stripe_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(7, 4, 'App\\Models\\PaymentGateway', 'stripe_secret', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(8, 4, 'App\\Models\\PaymentGateway', 'stripe_mode', '', 10, '{\"5\":\"sandbox\",\"10\":\"live\"}', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(9, 4, 'App\\Models\\PaymentGateway', 'stripe_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(10, 5, 'App\\Models\\PaymentGateway', 'flutterwave_public_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(11, 5, 'App\\Models\\PaymentGateway', 'flutterwave_secret_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(12, 5, 'App\\Models\\PaymentGateway', 'flutterwave_mode', '', 10, '{\"5\":\"sandbox\",\"10\":\"live\"}', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(13, 5, 'App\\Models\\PaymentGateway', 'flutterwave_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(14, 6, 'App\\Models\\PaymentGateway', 'paystack_public_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(15, 6, 'App\\Models\\PaymentGateway', 'paystack_secret_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(16, 6, 'App\\Models\\PaymentGateway', 'paystack_payment_url', 'https://api.paystack.co', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(17, 6, 'App\\Models\\PaymentGateway', 'paystack_mode', '', 10, '{\"5\":\"sandbox\",\"10\":\"live\"}', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(18, 6, 'App\\Models\\PaymentGateway', 'paystack_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(19, 7, 'App\\Models\\PaymentGateway', 'sslcommerz_store_name', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(20, 7, 'App\\Models\\PaymentGateway', 'sslcommerz_store_id', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(21, 7, 'App\\Models\\PaymentGateway', 'sslcommerz_store_password', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(22, 7, 'App\\Models\\PaymentGateway', 'sslcommerz_mode', '', 10, '{\"5\":\"sandbox\",\"10\":\"live\"}', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(23, 7, 'App\\Models\\PaymentGateway', 'sslcommerz_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(24, 8, 'App\\Models\\PaymentGateway', 'mollie_api_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(25, 8, 'App\\Models\\PaymentGateway', 'mollie_mode', '', 10, '{\"5\":\"sandbox\",\"10\":\"live\"}', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(26, 8, 'App\\Models\\PaymentGateway', 'mollie_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(27, 9, 'App\\Models\\PaymentGateway', 'senangpay_merchant_id', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(28, 9, 'App\\Models\\PaymentGateway', 'senangpay_secret_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(29, 9, 'App\\Models\\PaymentGateway', 'senangpay_mode', '', 10, '{\"5\":\"sandbox\",\"10\":\"live\"}', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(30, 9, 'App\\Models\\PaymentGateway', 'senangpay_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(31, 10, 'App\\Models\\PaymentGateway', 'bkash_app_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(32, 10, 'App\\Models\\PaymentGateway', 'bkash_app_secret', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(33, 10, 'App\\Models\\PaymentGateway', 'bkash_username', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(34, 10, 'App\\Models\\PaymentGateway', 'bkash_password', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(35, 10, 'App\\Models\\PaymentGateway', 'bkash_mode', '', 10, '{\"5\":\"sandbox\",\"10\":\"live\"}', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(36, 10, 'App\\Models\\PaymentGateway', 'bkash_status', '', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(37, 11, 'App\\Models\\PaymentGateway', 'paytm_merchant_id', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(38, 11, 'App\\Models\\PaymentGateway', 'paytm_merchant_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(39, 11, 'App\\Models\\PaymentGateway', 'paytm_merchant_website', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(40, 11, 'App\\Models\\PaymentGateway', 'paytm_channel', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(41, 11, 'App\\Models\\PaymentGateway', 'paytm_industry_type', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(42, 11, 'App\\Models\\PaymentGateway', 'paytm_mode', '', 10, '{\"5\":\"sandbox\",\"10\":\"live\"}', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(43, 11, 'App\\Models\\PaymentGateway', 'paytm_status', '', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(44, 12, 'App\\Models\\PaymentGateway', 'razorpay_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(45, 12, 'App\\Models\\PaymentGateway', 'razorpay_secret', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(46, 12, 'App\\Models\\PaymentGateway', 'razorpay_mode', '', 10, '{\"5\":\"sandbox\",\"10\":\"live\"}', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(47, 12, 'App\\Models\\PaymentGateway', 'razorpay_status', '', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(48, 13, 'App\\Models\\PaymentGateway', 'mercadopago_client_id', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(49, 13, 'App\\Models\\PaymentGateway', 'mercadopago_client_secret', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(50, 13, 'App\\Models\\PaymentGateway', 'mercadopago_mode', '', 10, '{\"5\":\"sandbox\",\"10\":\"live\"}', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(51, 13, 'App\\Models\\PaymentGateway', 'mercadopago_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(52, 14, 'App\\Models\\PaymentGateway', 'cashfree_app_id', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(53, 14, 'App\\Models\\PaymentGateway', 'cashfree_secret_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(54, 14, 'App\\Models\\PaymentGateway', 'cashfree_mode', '', 10, '{\"5\":\"sandbox\",\"10\":\"live\"}', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(55, 14, 'App\\Models\\PaymentGateway', 'cashfree_status', '', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(56, 15, 'App\\Models\\PaymentGateway', 'payfast_merchant_id', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(57, 15, 'App\\Models\\PaymentGateway', 'payfast_merchant_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(58, 15, 'App\\Models\\PaymentGateway', 'payfast_passphrase', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(59, 15, 'App\\Models\\PaymentGateway', 'payfast_mode', '', 10, '{\"5\":\"sandbox\",\"10\":\"live\"}', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(60, 15, 'App\\Models\\PaymentGateway', 'payfast_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(61, 16, 'App\\Models\\PaymentGateway', 'skrill_merchant_email', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(62, 16, 'App\\Models\\PaymentGateway', 'skrill_merchant_api_password', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(63, 16, 'App\\Models\\PaymentGateway', 'skrill_mode', '', 10, '{\"5\":\"sandbox\",\"10\":\"live\"}', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(64, 16, 'App\\Models\\PaymentGateway', 'skrill_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(65, 17, 'App\\Models\\PaymentGateway', 'phonepe_client_id', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(66, 17, 'App\\Models\\PaymentGateway', 'phonepe_merchant_user_id', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(67, 17, 'App\\Models\\PaymentGateway', 'phonepe_key_index', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(68, 17, 'App\\Models\\PaymentGateway', 'phonepe_secret_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(69, 17, 'App\\Models\\PaymentGateway', 'phonepe_mode', '', 10, '{\"5\":\"sandbox\",\"10\":\"live\"}', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(70, 17, 'App\\Models\\PaymentGateway', 'phonepe_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(71, 18, 'App\\Models\\PaymentGateway', 'telr_store_id', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(72, 18, 'App\\Models\\PaymentGateway', 'telr_store_auth_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(73, 18, 'App\\Models\\PaymentGateway', 'telr_mode', '', 10, '{\"5\":\"sandbox\",\"10\":\"live\"}', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(74, 18, 'App\\Models\\PaymentGateway', 'telr_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(75, 19, 'App\\Models\\PaymentGateway', 'iyzico_api_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(76, 19, 'App\\Models\\PaymentGateway', 'iyzico_secret_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(77, 19, 'App\\Models\\PaymentGateway', 'iyzico_mode', '', 10, '{\"5\":\"sandbox\",\"10\":\"live\"}', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(78, 19, 'App\\Models\\PaymentGateway', 'iyzico_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(79, 20, 'App\\Models\\PaymentGateway', 'pesapal_consumer_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(80, 20, 'App\\Models\\PaymentGateway', 'pesapal_consumer_secret', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(81, 20, 'App\\Models\\PaymentGateway', 'pesapal_ipn_id', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(82, 20, 'App\\Models\\PaymentGateway', 'pesapal_mode', '', 10, '{\"5\":\"sandbox\",\"10\":\"live\"}', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(83, 20, 'App\\Models\\PaymentGateway', 'pesapal_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(84, 21, 'App\\Models\\PaymentGateway', 'midtrans_server_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(85, 21, 'App\\Models\\PaymentGateway', 'midtrans_client_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(86, 21, 'App\\Models\\PaymentGateway', 'midtrans_mode', '', 10, '{\"5\":\"sandbox\",\"10\":\"live\"}', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(87, 21, 'App\\Models\\PaymentGateway', 'midtrans_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(88, 22, 'App\\Models\\PaymentGateway', 'twocheckout_seller_id', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(89, 22, 'App\\Models\\PaymentGateway', 'twocheckout_secret_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(90, 22, 'App\\Models\\PaymentGateway', 'twocheckout_buy_link_secret_word', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(91, 22, 'App\\Models\\PaymentGateway', 'twocheckout_mode', '', 10, '{\"5\":\"sandbox\",\"10\":\"live\"}', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(92, 22, 'App\\Models\\PaymentGateway', 'twocheckout_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(93, 23, 'App\\Models\\PaymentGateway', 'myfatoorah_api_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(94, 23, 'App\\Models\\PaymentGateway', 'myfatoorah_mode', '', 10, '{\"5\":\"sandbox\",\"10\":\"live\"}', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(95, 23, 'App\\Models\\PaymentGateway', 'myfatoorah_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(96, 24, 'App\\Models\\PaymentGateway', 'easypaisa_store_id', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(97, 24, 'App\\Models\\PaymentGateway', 'easypaisa_hash_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(98, 24, 'App\\Models\\PaymentGateway', 'easypaisa_username', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(99, 24, 'App\\Models\\PaymentGateway', 'easypaisa_password', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(100, 24, 'App\\Models\\PaymentGateway', 'easypaisa_mode', '', 10, '{\"5\":\"sandbox\",\"10\":\"live\"}', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(101, 24, 'App\\Models\\PaymentGateway', 'easypaisa_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(102, 1, 'App\\Models\\SmsGateway', 'twilio_account_sid', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(103, 1, 'App\\Models\\SmsGateway', 'twilio_auth_token', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(104, 1, 'App\\Models\\SmsGateway', 'twilio_from', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(105, 1, 'App\\Models\\SmsGateway', 'twilio_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(106, 2, 'App\\Models\\SmsGateway', 'clickatell_apikey', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(107, 2, 'App\\Models\\SmsGateway', 'clickatell_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(108, 3, 'App\\Models\\SmsGateway', 'nexmo_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(109, 3, 'App\\Models\\SmsGateway', 'nexmo_secret', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(110, 3, 'App\\Models\\SmsGateway', 'nexmo_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(111, 4, 'App\\Models\\SmsGateway', 'msg91_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(112, 4, 'App\\Models\\SmsGateway', 'msg91_sender_id', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(113, 4, 'App\\Models\\SmsGateway', 'msg91_template_id', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(114, 4, 'App\\Models\\SmsGateway', 'msg91_template_variable', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(115, 4, 'App\\Models\\SmsGateway', 'msg91_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(116, 5, 'App\\Models\\SmsGateway', 'twofactor_module', 'PROMO_SMS', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(117, 5, 'App\\Models\\SmsGateway', 'twofactor_from', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(118, 5, 'App\\Models\\SmsGateway', 'twofactor_api_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(119, 5, 'App\\Models\\SmsGateway', 'twofactor_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(120, 6, 'App\\Models\\SmsGateway', 'bulksms_username', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(121, 6, 'App\\Models\\SmsGateway', 'bulksms_password', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(122, 6, 'App\\Models\\SmsGateway', 'bulksms_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(123, 7, 'App\\Models\\SmsGateway', 'bulksmsbd_api_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(124, 7, 'App\\Models\\SmsGateway', 'bulksmsbd_sender_id', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(125, 7, 'App\\Models\\SmsGateway', 'bulksmsbd_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(126, 8, 'App\\Models\\SmsGateway', 'telesign_api_key', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(127, 8, 'App\\Models\\SmsGateway', 'telesign_customer_id', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(128, 8, 'App\\Models\\SmsGateway', 'telesign_sender_id', '', 5, '\"\"', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(129, 8, 'App\\Models\\SmsGateway', 'telesign_status', '10', 10, '{\"5\":\"enable\",\"10\":\"disable\"}', NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` bigint UNSIGNED NOT NULL,
  `item_category_id` bigint UNSIGNED NOT NULL,
  `tax_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `caution` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `price` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `status` tinyint NOT NULL DEFAULT '5' COMMENT '5=Active, 10=Inactive',
  `item_type` tinyint NOT NULL DEFAULT '5',
  `order` bigint NOT NULL DEFAULT '1',
  `is_featured` tinyint NOT NULL DEFAULT '5',
  `creator_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_id` bigint DEFAULT NULL,
  `editor_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `editor_id` bigint DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `item_category_id`, `tax_id`, `name`, `slug`, `caution`, `description`, `price`, `status`, `item_type`, `order`, `is_featured`, `creator_type`, `creator_id`, `editor_type`, `editor_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(49, 11, 1, 'Chai Latte', 'chai-latte', 'LMIV - Allergen - i). Contains milk and products thereof (including lactose).', 'Black tea infused with cinnamon, clove and other warming spices is combined with steamed milk and topped with foam for the perfect balance of sweet and spicy.', 1.000000, 5, 5, 49, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(48, 11, 1, 'Cappuccino', 'cappuccino', 'LMIV - Allergen - i). Contains milk and products thereof (including lactose).', 'Dark, rich espresso lies in wait under a smoothed and stretched layer of thick milk foam.', 1.500000, 5, 5, 48, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(46, 10, 2, 'Onion Rings', 'onion-rings', 'LMIV - Allergen - i). Contains cereals and products thereof containing gluten. ii). Wheat.', 'Serve with mayo and green chili sauce.', 1.000000, 5, 5, 46, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(47, 10, 1, 'Potato Pancakes', 'potato-pancakes', 'LMIV - Allergen - i). Contains cereals and products thereof containing gluten. ii). Wheat.', 'Shallow-fried pancakes of grated potato, flour or matzo meal, and a binder such as egg or applesauce.', 1.500000, 5, 5, 47, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(45, 10, 1, 'Homemade Mashed Potato', 'homemade-mashed-potato', 'LMIV - Allergen - i). Contains cereals and products thereof containing gluten. ii). Wheat.', 'Made with idaho potatoes, butter, and optional garlic.', 1.500000, 5, 5, 45, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(43, 10, 1, 'Baked Potato', 'baked-potato', 'LMIV - Allergen - i). Contains cereals and products thereof containing gluten. ii). Wheat.', 'The outside is brown and crisp, coated in a crust of sea salt.', 1.500000, 5, 5, 43, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(44, 10, 1, 'French Fries', 'french-fries', 'LMIV - Allergen - i). Contains cereals and products thereof containing gluten. ii). Wheat.', 'Serve with mayo and green chili sauce.', 1.000000, 5, 5, 44, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(42, 9, 2, 'Wonton Soup', 'wonton-soup', 'Substances or products causing allergies - i). Contains cereals and products thereof containing gluten. ii). Contains milk and products thereof (including lactose). iii). Contains celery and products thereof. iv). Contains eggs and products thereof.', 'Wonton soup is a simple, light, Chinese classic with pork-filled dumplings in seasoned chicken broth. Whether in soup or fried, wontons always add delicious, hearty flavor to any dish!', 2.500000, 5, 10, 42, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(41, 9, 1, 'Hot & Sour Soup', 'hot-sour-soup', 'Substances or products causing allergies - i). Contains cereals and products thereof containing gluten. ii). Contains milk and products thereof (including lactose). iii). Contains celery and products thereof. iv). Contains eggs and products thereof.', 'Filled with mushrooms, tofu and silky egg ribbons, hot and sour soup is thickened with corn flour/cornstarch so the broth is beautifully glossy.', 2.000000, 5, 5, 41, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(40, 9, 1, 'Egg Drop Soup', 'egg-drop-soup', 'Substances or products causing allergies - i). Contains cereals and products thereof containing gluten. ii). Contains milk and products thereof (including lactose). iii). Contains celery and products thereof. iv). Contains eggs and products thereof.', 'Egg Drop Soup is a warm, thickened broth, with rich flavors of chicken and beautiful egg ribbons throughout.', 2.500000, 5, 10, 40, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(39, 9, 2, 'Chicken Noodles Soup', 'chicken-noodles-soup', 'Substances or products causing allergies - i). Contains cereals and products thereof containing gluten. ii). Contains milk and products thereof (including lactose). iii). Contains celery and products thereof. iv). Contains eggs and products thereof.', 'This chicken noodle soup is like a warm hug from the inside out. Loaded with tender chicken, hearty vegetables, and comforting noodles, it\'s the ultimate comfort food on a chilly day.', 3.000000, 5, 10, 39, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(38, 8, 1, 'Roasted Salmon Salad', 'roasted-salmon-salad', 'LMIV - Allergen - i). Contains fish and products thereof. ii). Contains sulphur dioxide and sulphites. iii). Contains soybeans and products thereof. iv). Contains milk and products thereof (including lactose). v). Contains cereals and products thereof containing gluten. vi). wheat. vii). Contains eggs and products thereof. viii). Contains sesame seeds and products thereof.', 'Flaky baked salmon, crisp celery, red onion, radishes, and fresh herbs, tossed in a creamy lemony dressing.', 1.500000, 5, 10, 38, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(37, 8, 1, 'Poached Pear Salad', 'poached-pear-salad', 'LMIV - Allergen - i). Contains nuts and products thereof. ii). Contains milk and products thereof (including lactose). iii). cashews.', 'Poached pear and goat cheese salad made with mixed greens, poached pears and herbed goat cheese with pear shallot vinaigrette.', 3.000000, 5, 5, 37, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(36, 8, 2, 'Mix Vegetables Salad', 'mix-vegetables-salad', 'LMIV - Allergen - i). Contains nuts and products thereof. ii). Contains milk and products thereof (including lactose). iii). cashews.', 'A bow full of cabbage, tomatoes and carrots tossed with a delicious dressing of yogurt, honey, salt and pepper.', 2.500000, 5, 5, 36, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(35, 8, 1, 'Fresh Tuna Salad', 'fresh-tuna-salad', 'LMIV - Allergen - i). Contains fish and products thereof. ii). Contains sulphur dioxide and sulphites. iii). Contains soybeans and products thereof. iv). Contains milk and products thereof (including lactose). v). Contains cereals and products thereof containing gluten. vi). wheat. vii). Contains eggs and products thereof. viii). Contains sesame seeds and products thereof.', 'Fresh tuna, crisp celery, red onion, radishes, and fresh herbs, tossed in a creamy lemony dressing.', 4.000000, 5, 10, 35, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(34, 8, 1, 'Classic Caesar Salad', 'classic-caesar-salad', 'LMIV - Allergen - i). Contains nuts and products thereof. ii). Contains milk and products thereof (including lactose). iii). cashews.', 'Classic Caesar Salad recipe is a crisp, crunchy, homemade version tossed with a traditional Caesar salad dressing and garlic croutons.', 3.500000, 5, 5, 34, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(33, 7, 2, 'Szechuan Shrimp', 'szechuan-shrimp', 'LMIV - Allergen - i). Contains crustaceans and products thereof. ii). Contains sesame seeds and products thereof.', 'Spicy, tangy Szechuan sauce packs a ton of strong flavors on top of tender baby shrimp.', 4.000000, 5, 10, 33, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(32, 7, 1, 'Shrimp with Broccoli', 'shrimp-with-broccoli', 'LMIV - Allergen - i). Contains crustaceans and products thereof. ii). Contains sesame seeds and products thereof.', 'Crisp green broccoli and sweet onions, with shrimp, glistens with the best-tasting brown sauce.', 3.000000, 5, 10, 32, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(31, 7, 1, 'Salmon with Mix Vegetables', 'salmon-with-mix-vegetables', 'LMIV - Allergen - i). Contains fish and products thereof. ii). Contains sulphur dioxide and sulphites. iii). Contains soybeans and products thereof. iv). Contains milk and products thereof (including lactose). v). Contains cereals and products thereof containing gluten. vi). wheat. vii). Contains eggs and products thereof. viii). Contains sesame seeds and products thereof.', 'Tender slices of salmon with crisp snow peas, carrots, and broccoli, salmon stir fry is a quick and nutritious meal, with a pleasantly spicy ginger sesame sauce.', 3.500000, 5, 10, 31, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(30, 7, 2, 'Kung Pao Squid', 'kung-pao-squid', 'LMIV - Allergen - i). Contains fish and products thereof. ii). Contains sulphur dioxide and sulphites. iii). Contains soybeans and products thereof. iv). Contains milk and products thereof (including lactose). v). Contains cereals and products thereof containing gluten. vi). wheat. vii). Contains eggs and products thereof. viii). Contains sesame seeds and products thereof.', 'Kung Pao squid is studded with crunchy roasted peanuts, spicy chilies, and tongue numbing sichuan peppercorns in a slightly sweet and savory sauce.', 5.500000, 5, 10, 30, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(29, 6, 1, 'Szechuan Beef', 'szechuan-beef', 'Substances or products causing allergies - i). With nitrite curing salt. ii). With nitrate. iii). With nitrite curing salt and nitrate.', 'Beef enveloped in dynamic spicy sauce made from layers of chilis, garlic, ginger and of course Szechuan peppercorns with just a touch of sweetness.', 3.000000, 5, 10, 29, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(28, 6, 1, 'Pepper Steak with Onions', 'pepper-steak-with-onions', 'Substances or products causing allergies - i). With nitrite curing salt. ii). With nitrate. iii). With nitrite curing salt and nitrate.', 'Pepper Steak is tender and juicy slices of Steak mixed with peppers and lots of onion in a silky and flavorful sauce.', 3.000000, 5, 10, 28, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(27, 6, 1, 'Beef with Mix Vegetables', 'beef-with-mix-vegetables', 'Substances or products causing allergies - i). With nitrite curing salt. ii). With nitrate. iii). With nitrite curing salt and nitrate.', 'Tender slices of steak with crisp snow peas, carrots, and broccoli, sesame beef stir fry is a quick and nutritious meal, with a pleasantly spicy ginger sesame sauce.', 3.500000, 5, 10, 27, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(26, 6, 2, 'Beef with Broccoli', 'beef-with-broccoli', 'Substances or products causing allergies - i). With nitrite curing salt. ii). With nitrate. iii). With nitrite curing salt and nitrate.', 'Crisp green broccoli and sweet onions, with beef, glistens with the best-tasting brown sauce.', 4.000000, 5, 10, 26, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(24, 5, 1, 'Sweet & Sour Chicken', 'sweet-sour-chicken', 'LMIV - Allergen - i). Contains cereals and products thereof containing gluten. ii). Contains eggs and products thereof. iii). Wheat.', 'Sweet and sour chicken with crispy chicken, pineapple and bell peppers just like your favorite takeout place without the food coloring.', 3.000000, 5, 10, 24, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(25, 5, 1, 'Yemete Kudasai Chicken', 'yemete-kudasai-chicken', 'LMIV - Allergen - i). Contains cereals and products thereof containing gluten. ii). Contains eggs and products thereof. iii). Wheat.', 'Chicken breasts are simply baked to perfection, topped with fresh mozzarella and juicy, garlicky fresh chopped tomatoes.', 3.000000, 5, 10, 25, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(23, 5, 2, 'Sesame Chicken', 'sesame-chicken', 'LMIV - Allergen - i). Contains cereals and products thereof containing gluten. ii). Contains eggs and products thereof. iii). Wheat.', 'This sesame chicken is crispy chicken pieces tossed in a sweet and savory honey sesame sauce.', 3.500000, 5, 10, 23, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(22, 5, 1, 'Kung Pao Chicken', 'kung-pao-chicken', 'LMIV - Allergen - i). Contains cereals and products thereof containing gluten. ii). Contains eggs and products thereof. iii). Wheat.', 'kung pao chicken is a highly addictive stir-fried chicken with the perfect combination of salty, sweet and spicy flavour!', 4.000000, 5, 10, 22, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, 5, 1, 'Hentai Chicken', 'hentai-chicken', 'LMIV - Allergen - i). Contains cereals and products thereof containing gluten. ii). Contains eggs and products thereof. iii). Wheat.', 'Creamy, tomato and herbed chicken with a sprinkle of fiery heat.', 4.000000, 5, 10, 21, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, 4, 1, 'Steak Sandwich', 'steak-sandwich', 'LMIV - Allergen - i). Contains cereals and products thereof containing gluten. ii). Contains eggs and products thereof. iii). Wheat.', 'A juicy steak sandwich, piled high with tender slices of steak, tomato, lettuce, caramelized onion, garlic aioli and mustard.', 3.500000, 5, 10, 20, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, 4, 1, 'Plain Grilled Chicken', 'plain-grilled-chicken', 'LMIV - Allergen - i). Contains cereals and products thereof containing gluten. ii). Contains eggs and products thereof. iii). Wheat.', 'This grilled chicken sandwich is simple to make with flavorsome marinated chicken, lettuce, tomato, and mayo. Crispy golden pan-fried bread makes it extra special!', 4.000000, 5, 10, 19, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(18, 4, 2, 'Chicken Mushroom', 'chicken-mushroom', 'LMIV - Allergen - i). Contains cereals and products thereof containing gluten. ii). Contains eggs and products thereof. iii). Wheat.', 'Cheese sandwich with a chicken, mushroom and capsicum stuffing, grilled with butter to make it crispy.', 3.500000, 5, 10, 18, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, 4, 1, 'BBQ Chicken', 'bbq-chicken', 'LMIV - Allergen - i). Contains cereals and products thereof containing gluten. ii). Contains eggs and products thereof. iii). Wheat.', 'Sweet and tangy BBQ Chicken Sandwiches made with juicy slow cooker BBQ chicken and crisp coleslaw on toasted brioche buns.', 4.500000, 5, 10, 16, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(17, 4, 1, 'BBQ Pulled Pork', 'bbq-pulled-pork', 'LMIV - Allergen - i). Contains cereals and products thereof containing gluten. ii). Contains eggs and products thereof. iii). Wheat.', 'Sweet and tangy BBQ Pork sandwiches made with juicy slow cooker BBQ pork and crisp coleslaw on toasted brioche buns.', 4.500000, 5, 10, 17, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, 3, 2, 'Vegan Royale', 'vegan-royale', 'LMIV - Allergen - i). Contains nuts and products thereof. ii). Contains milk and products thereof (including lactose). iii). cashews.', 'A crispy vegan patty topped with iceberg lettuce, vegan mayo and crowned with a toasted sesame seed bun.', 3.000000, 5, 5, 15, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 3, 1, 'Vegan Hum-burger with Cheese', 'vegan-hum-burger-with-cheese', 'LMIV - Allergen - i). Contains nuts and products thereof. ii). Contains milk and products thereof (including lactose). iii). cashews.', 'A crispy vegan patty topped vegan cheese, vegan bakon, iceberg lettuce, vegan mayo and crowned with a toasted sesame seed bun.', 2.500000, 5, 5, 14, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, 3, 1, 'Plant Based Whopper', 'plant-based-whopper', 'LMIV - Allergen - i). Contains nuts and products thereof. ii). Contains milk and products thereof (including lactose). iii). cashews.', 'A flame-grilled plant-based burger, topped with tomatoes, fresh cut lettuce, vegan mayo, pickles, a swirl of ketchup, and sliced onions on a soft sesame seed bun.', 3.000000, 5, 5, 13, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 2, 1, 'Whopper', 'whopper', 'LMIV - Allergen - i). Contains cereals and products thereof containing gluten. ii). Contains milk and products thereof (including lactose4. iii). Wheat.', 'A flame-grilled beef patty, topped with tomatoes, fresh cut lettuce, mayo, pickles, a swirl of ketchup, and sliced onions on a soft sesame seed bun.', 2.000000, 5, 10, 11, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 3, 2, 'Plant Based Bacon', 'plant-based-bacon', 'LMIV - Allergen - i). Contains nuts and products thereof. ii). Contains milk and products thereof (including lactose). iii). cashews.', 'A flame-grilled plant-based patty in our classic bun, layered with slices of smooth vegan cheese and strips of vegan bakon, topped with egg-free mayo and ketchup. It\'s big, plant-based flavor.', 3.500000, 5, 5, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 2, 1, 'Peppercorn Anger', 'peppercorn-anger', 'LMIV - Allergen - i). Contains cereals and products thereof containing gluten. ii). Contains milk and products thereof (including lactose4. iii). Wheat.', 'Beef flame-grilled to perfection, topped with sizzling strips of Bacon, sweet caramelised onions, fresh rocket and finished with our secret peppercorn mayo sauce. It could only be our gourmet kings.', 2.500000, 5, 10, 10, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 2, 1, 'Cheeseburger', 'cheeseburger', 'LMIV - Allergen - i). Contains cereals and products thereof containing gluten. ii). Contains milk and products thereof (including lactose4. iii). Wheat.', 'Two layers of melted american cheese on a toasted sesame seed bun.', 3.000000, 5, 10, 9, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 2, 2, 'Bacon Double Cheeseburger', 'bacon-double-cheeseburger', 'LMIV - Allergen - i). Contains cereals and products thereof containing gluten. ii). Contains milk and products thereof (including lactose4. iii). Wheat.', 'Two signature flame-grilled beef patties topped with smoked bacon and two layers of melted American cheese on a toasted sesame seed bun.', 3.500000, 5, 10, 8, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 2, 1, 'American BBQ Single', 'american-bbq-single', 'LMIV - Allergen - i). Contains cereals and products thereof containing gluten. ii). Contains milk and products thereof (including lactose4. iii). Wheat.', 'A flame-grilled whopper patty, topped with American cheese, fresh slices of tomato and crisp lettuce, and finished with a zesty BBQ sauce and golden crispy onions.', 4.000000, 5, 10, 7, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 2, 1, 'American BBQ Double', 'american-bbq-double', 'LMIV - Allergen - i). Contains cereals and products thereof containing gluten. ii). Contains milk and products thereof (including lactose4. iii). Wheat.', 'Two flame-grilled whopper patty, topped with american cheese, fresh slices of tomato and crisp lettuce, and finished with a zesty BBQ sauce and golden crispy onions.', 5.500000, 5, 10, 6, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 1, 2, 'Vegetable Roll', 'vegetable-roll', 'LMIV - Allergen - i). Contains milk and products thereof (including lactose).', 'Pastry sheet filled with a mixture of vegetables and fried to a crispy golden brown.', 1.000000, 5, 5, 5, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 1, 2, 'Vegetable Dumplings', 'vegetable-dumplings', 'LMIV - Allergen - i). Contains milk and products thereof (including lactose).', 'With a side of fried rice or supreme soy noodles, and steamed chinese greens with oyster sauce', 2.500000, 5, 5, 4, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 1, 2, 'Fried Cheese wonton', 'fried-cheese-wonton', 'LMIV - Allergen - i). Contains cereals and products thereof containing gluten. ii). Wheat.', 'Crispy fried cream cheese wontons are filled with cream cheese, lemon and garlic pepper, paprika & fried to golden perfection!', 2.000000, 5, 10, 3, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 1, 2, 'Egg Roll', 'egg-roll', 'LMIV - Allergen - i). Contains cereals and products thereof containing gluten. ii). Wheat.', 'Egg roll wrappers filled with a mixture of vegetables and beef or chicken, and fried to a crispy golden brown.', 1.500000, 5, 10, 2, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1, 1, 2, 'Chicken Dumplings', 'chicken-dumplings', 'LMIV - Allergen - i). Contains cereals and products thereof containing gluten. ii). Wheat.', 'With a side of fried rice or supreme soy noodles, and steamed chinese greens with oyster sauce', 2.500000, 5, 10, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(50, 11, 2, 'Espresso', 'espresso', '', 'Smooth signature espresso roast with rich flavor and caramel sweetness.', 1.000000, 5, 5, 50, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(51, 11, 1, 'Homemade Lemonade', 'homemade-lemonade', '', 'Perfectly sweet and makes the best refreshing summer drink.', 1.500000, 5, 5, 51, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(52, 11, 1, 'Iced Coffee', 'iced-coffee', 'LMIV - Allergen - i). Contains milk and products thereof (including lactose).', 'Cold foam contrasts with dark, smooth cold brew, yielding an inviting aroma with lush infused cold foam.', 1.500000, 5, 5, 52, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(53, 11, 1, 'Mojito', 'mojito', NULL, 'Mixed drink of mint, lime, sugar, and club soda.', 2.000000, 5, 5, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-16 07:47:30'),
(54, 11, 1, 'Soda (Bottle)', 'soda-bottle', '', '0.5 ltr of soda bottle.', 1.000000, 5, 5, 54, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(55, 11, 1, 'Soda (Can)', 'soda-can', '', '0.5 ltr of soda can.', 1.500000, 5, 5, 55, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `item_addons`
--

CREATE TABLE `item_addons` (
  `id` bigint UNSIGNED NOT NULL,
  `item_id` bigint UNSIGNED NOT NULL,
  `addon_item_id` bigint UNSIGNED NOT NULL,
  `addon_item_variation` json DEFAULT NULL,
  `creator_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_id` bigint DEFAULT NULL,
  `editor_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `editor_id` bigint DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_attributes`
--

CREATE TABLE `item_attributes` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '5' COMMENT '5=Active, 10=Inactive',
  `creator_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_id` bigint DEFAULT NULL,
  `editor_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `editor_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_categories`
--

CREATE TABLE `item_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint UNSIGNED NOT NULL DEFAULT '5' COMMENT '5=Active, 10=Inactive',
  `sort` bigint UNSIGNED NOT NULL DEFAULT '1',
  `creator_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_id` bigint DEFAULT NULL,
  `editor_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `editor_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `item_categories`
--

INSERT INTO `item_categories` (`id`, `name`, `slug`, `description`, `status`, `sort`, `creator_type`, `creator_id`, `editor_type`, `editor_id`, `created_at`, `updated_at`) VALUES
(2, 'Flame Grill Burgers', 'flame-grill-burgers', NULL, 5, 1, NULL, NULL, NULL, NULL, NULL, '2026-02-16 05:54:56'),
(3, 'Veggie & Plant Based Burgers', 'veggie-plant-based-burgers', NULL, 5, 1, NULL, NULL, NULL, NULL, NULL, '2026-02-16 05:55:08'),
(4, 'Sandwich from the Grill', 'sandwich-from-the-grill', NULL, 5, 1, NULL, NULL, NULL, NULL, NULL, '2026-02-16 05:55:18'),
(5, 'Hot Chicken Entrees', 'hot-chicken-entrees', NULL, 5, 1, NULL, NULL, NULL, NULL, NULL, '2026-02-16 05:55:28'),
(6, 'Beef Entrees', 'beef-entrees', NULL, 5, 1, NULL, NULL, NULL, NULL, NULL, '2026-02-16 05:55:40'),
(7, 'Seafood Entrees', 'seafood-entrees', NULL, 5, 1, NULL, NULL, NULL, NULL, NULL, '2026-02-16 05:55:49'),
(8, 'House Special Salads', 'house-special-salads', NULL, 5, 1, NULL, NULL, NULL, NULL, NULL, '2026-02-16 05:55:58'),
(9, 'Zoop Soups', 'zoop-soups', NULL, 5, 1, NULL, NULL, NULL, NULL, NULL, '2026-02-16 05:56:06'),
(10, 'Side Orders', 'side-orders', NULL, 5, 1, NULL, NULL, NULL, NULL, NULL, '2026-02-16 05:56:13'),
(11, 'Beverages', 'beverages', NULL, 5, 1, NULL, NULL, NULL, NULL, NULL, '2026-02-16 05:56:21');

-- --------------------------------------------------------

--
-- Table structure for table `item_extras`
--

CREATE TABLE `item_extras` (
  `id` bigint UNSIGNED NOT NULL,
  `item_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(19,6) NOT NULL,
  `status` tinyint NOT NULL DEFAULT '5' COMMENT '5=Active, 10=Inactive',
  `creator_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_id` bigint DEFAULT NULL,
  `editor_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `editor_id` bigint DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_variations`
--

CREATE TABLE `item_variations` (
  `id` bigint UNSIGNED NOT NULL,
  `item_id` bigint UNSIGNED NOT NULL,
  `item_attribute_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `caution` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint NOT NULL DEFAULT '5' COMMENT '5=Active, 10=Inactive',
  `creator_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_id` bigint DEFAULT NULL,
  `editor_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `editor_id` bigint DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kiosk_machines`
--

CREATE TABLE `kiosk_machines` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `machine_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `device_token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_login` tinyint DEFAULT '10',
  `status` tinyint UNSIGNED NOT NULL DEFAULT '5' COMMENT '5=Active, 10=Inactive',
  `creator_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_id` bigint DEFAULT NULL,
  `editor_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `editor_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kiosk_machines`
--

INSERT INTO `kiosk_machines` (`id`, `user_id`, `branch_id`, `machine_id`, `username`, `password`, `device_token`, `is_login`, `status`, `creator_type`, `creator_id`, `editor_type`, `editor_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '12345', 'jamialh', '$2y$10$ba6ffyx8VDR4wAvZiPPdvuSIz390uKAbO/70vjIvfNuESX2W9hmu.', 'cji-OGa9T5SvGNipx3sERO:APA91bFiRooXmu2HYtIEq0xFWsSt_SwSWNLa-cbUVJFblqJGYKgQkHJiBEB4OQQNuKfl0ABrloP2L-W5L8aJDimaWQ1H2FA4r_O7L7W6BgaTPAVl0TRqWnw', 10, 5, NULL, NULL, NULL, NULL, '2026-02-16 05:47:54', '2026-02-17 05:50:44'),
(2, 3, 1, '45678', 'wils', '$2y$10$N/UQQGjDn8iWofy//.JEL.vZOx5Py2V.ToNGamA8cc4REBdya5Vyy', '@', 10, 5, NULL, NULL, NULL, NULL, '2026-02-17 05:48:55', '2026-02-17 05:50:40');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_mode` tinyint UNSIGNED NOT NULL DEFAULT '5',
  `status` tinyint UNSIGNED NOT NULL DEFAULT '5' COMMENT '5=Active, 10=Inactive',
  `creator_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_id` bigint DEFAULT NULL,
  `editor_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `editor_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `code`, `display_mode`, `status`, `creator_type`, `creator_id`, `editor_type`, `editor_id`, `created_at`, `updated_at`) VALUES
(1, 'English', 'en', 5, 5, NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(2, 'Bangla', 'bn', 5, 5, NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(3, 'German', 'de', 5, 5, NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(4, 'Arabic', 'ar', 10, 5, NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `collection_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `conversions_disk` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` bigint UNSIGNED NOT NULL,
  `manipulations` json NOT NULL,
  `custom_properties` json NOT NULL,
  `generated_conversions` json NOT NULL,
  `responsive_images` json NOT NULL,
  `order_column` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `model_type`, `model_id`, `uuid`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `conversions_disk`, `size`, `manipulations`, `custom_properties`, `generated_conversions`, `responsive_images`, `order_column`, `created_at`, `updated_at`) VALUES
(62, 'App\\Models\\Item', 21, '73592c20-0ac1-11f1-889d-364efe48bc56', 'item', 'hentai_chicken', 'hentai_chicken.png', 'image/png', 'public', 'public', 1309, '[]', '[]', '{\"cover\": true, \"thumb\": true, \"preview\": true}', '[]', 21, '2026-02-15 22:55:40', '2026-02-16 04:58:06'),
(61, 'App\\Models\\Item', 20, '73592b89-0ac1-11f1-889d-364efe48bc56', 'item', 'steak_sandwich', 'steak_sandwich.png', 'image/png', 'public', 'public', 1309, '[]', '[]', '{\"cover\": true, \"thumb\": true, \"preview\": true}', '[]', 20, '2026-02-15 22:55:40', '2026-02-16 04:58:06'),
(60, 'App\\Models\\Item', 19, '73592ad0-0ac1-11f1-889d-364efe48bc56', 'item', 'plain_grilled_chicken', 'plain_grilled_chicken.png', 'image/png', 'public', 'public', 1309, '[]', '[]', '{\"cover\": true, \"thumb\": true, \"preview\": true}', '[]', 19, '2026-02-15 22:55:40', '2026-02-16 04:58:06'),
(59, 'App\\Models\\Item', 18, '73592a15-0ac1-11f1-889d-364efe48bc56', 'item', 'chicken_mushroom', 'chicken_mushroom.png', 'image/png', 'public', 'public', 1309, '[]', '[]', '{\"cover\": true, \"thumb\": true, \"preview\": true}', '[]', 18, '2026-02-15 22:55:40', '2026-02-16 04:58:07'),
(58, 'App\\Models\\Item', 17, '73592999-0ac1-11f1-889d-364efe48bc56', 'item', 'bbq_pulled_pork', 'bbq_pulled_pork.png', 'image/png', 'public', 'public', 1309, '[]', '[]', '{\"cover\": true, \"thumb\": true, \"preview\": true}', '[]', 17, '2026-02-15 22:55:40', '2026-02-16 04:58:07'),
(57, 'App\\Models\\Item', 16, '735928ed-0ac1-11f1-889d-364efe48bc56', 'item', 'bbq_chicken', 'bbq_chicken.png', 'image/png', 'public', 'public', 1309, '[]', '[]', '{\"cover\": true, \"thumb\": true, \"preview\": true}', '[]', 16, '2026-02-15 22:55:40', '2026-02-16 04:58:07'),
(56, 'App\\Models\\Item', 15, '73592833-0ac1-11f1-889d-364efe48bc56', 'item', 'vegan_royale', 'vegan_royale.png', 'image/png', 'public', 'public', 1309, '[]', '[]', '{\"cover\": true, \"thumb\": true, \"preview\": true}', '[]', 15, '2026-02-15 22:55:40', '2026-02-16 04:58:08'),
(55, 'App\\Models\\Item', 14, '7359273e-0ac1-11f1-889d-364efe48bc56', 'item', 'vegan_hum-burger_with_cheese', 'vegan_hum-burger_with_cheese.png', 'image/png', 'public', 'public', 1309, '[]', '[]', '{\"cover\": true, \"thumb\": true, \"preview\": true}', '[]', 14, '2026-02-15 22:55:40', '2026-02-16 04:58:08'),
(54, 'App\\Models\\Item', 13, '73592607-0ac1-11f1-889d-364efe48bc56', 'item', 'plant_based_whopper', 'plant_based_whopper.png', 'image/png', 'public', 'public', 1309, '[]', '[]', '{\"cover\": true, \"thumb\": true, \"preview\": true}', '[]', 13, '2026-02-15 22:55:40', '2026-02-16 04:58:08'),
(53, 'App\\Models\\Item', 12, '73592512-0ac1-11f1-889d-364efe48bc56', 'item', 'plant_based_bacon', 'plant_based_bacon.png', 'image/png', 'public', 'public', 1309, '[]', '[]', '{\"cover\": true, \"thumb\": true, \"preview\": true}', '[]', 12, '2026-02-15 22:55:40', '2026-02-16 04:58:09'),
(52, 'App\\Models\\Item', 11, '7359245c-0ac1-11f1-889d-364efe48bc56', 'item', 'whopper', 'whopper.png', 'image/png', 'public', 'public', 1309, '[]', '[]', '{\"cover\": true, \"thumb\": true, \"preview\": true}', '[]', 11, '2026-02-15 22:55:40', '2026-02-16 04:58:09'),
(51, 'App\\Models\\Item', 10, '7359237b-0ac1-11f1-889d-364efe48bc56', 'item', 'peppercorn_anger', 'peppercorn_anger.png', 'image/png', 'public', 'public', 1309, '[]', '[]', '{\"cover\": true, \"thumb\": true, \"preview\": true}', '[]', 10, '2026-02-15 22:55:40', '2026-02-16 04:58:09'),
(50, 'App\\Models\\Item', 9, '73591cb8-0ac1-11f1-889d-364efe48bc56', 'item', 'cheeseburger', 'cheeseburger.png', 'image/png', 'public', 'public', 1309, '[]', '[]', '{\"cover\": true, \"thumb\": true, \"preview\": true}', '[]', 9, '2026-02-15 22:55:40', '2026-02-16 04:58:10'),
(49, 'App\\Models\\Item', 8, '73591b94-0ac1-11f1-889d-364efe48bc56', 'item', 'bacon_double_cheeseburger', 'bacon_double_cheeseburger.png', 'image/png', 'public', 'public', 1309, '[]', '[]', '{\"cover\": true, \"thumb\": true, \"preview\": true}', '[]', 8, '2026-02-15 22:55:40', '2026-02-16 04:58:10'),
(48, 'App\\Models\\Item', 7, '7359165f-0ac1-11f1-889d-364efe48bc56', 'item', 'american_bbq_single', 'american_bbq_single.png', 'image/png', 'public', 'public', 1309, '[]', '[]', '{\"cover\": true, \"thumb\": true, \"preview\": true}', '[]', 7, '2026-02-15 22:55:40', '2026-02-16 04:58:10'),
(47, 'App\\Models\\Item', 6, '735915ad-0ac1-11f1-889d-364efe48bc56', 'item', 'american_bbq_double', 'american_bbq_double.png', 'image/png', 'public', 'public', 1309, '[]', '[]', '{\"cover\": true, \"thumb\": true, \"preview\": true}', '[]', 6, '2026-02-15 22:55:40', '2026-02-16 04:58:10'),
(46, 'App\\Models\\Item', 5, '73591500-0ac1-11f1-889d-364efe48bc56', 'item', 'vegetable_roll', 'vegetable_roll.png', 'image/png', 'public', 'public', 1309, '[]', '[]', '{\"cover\": true, \"thumb\": true, \"preview\": true}', '[]', 5, '2026-02-15 22:55:40', '2026-02-16 04:58:11'),
(45, 'App\\Models\\Item', 4, '73591473-0ac1-11f1-889d-364efe48bc56', 'item', 'vegetable_dumplings', 'vegetable_dumplings.png', 'image/png', 'public', 'public', 1309, '[]', '[]', '{\"cover\": true, \"thumb\": true, \"preview\": true}', '[]', 4, '2026-02-15 22:55:40', '2026-02-16 04:58:11'),
(44, 'App\\Models\\Item', 3, '735913b0-0ac1-11f1-889d-364efe48bc56', 'item', 'fried_cheese_wonton', 'fried_cheese_wonton.png', 'image/png', 'public', 'public', 1309, '[]', '[]', '{\"cover\": true, \"thumb\": true, \"preview\": true}', '[]', 3, '2026-02-15 22:55:40', '2026-02-16 04:58:11'),
(43, 'App\\Models\\Item', 2, '7359125f-0ac1-11f1-889d-364efe48bc56', 'item', 'egg_roll', 'egg_roll.png', 'image/png', 'public', 'public', 1309, '[]', '[]', '{\"cover\": true, \"thumb\": true, \"preview\": true}', '[]', 2, '2026-02-15 22:55:40', '2026-02-16 05:10:55'),
(119, 'App\\Models\\Item', 1, '7823c3af-4774-415c-97f9-2eb74acce94d', 'item', 'Chinese-chicken-dumplings-1', 'Chinese-chicken-dumplings-1.jpg', 'image/jpeg', 'public', 'public', 68905, '[]', '[]', '{\"cover\": true, \"thumb\": true, \"preview\": true}', '[]', 1, '2026-02-16 08:09:09', '2026-02-16 08:09:09'),
(31, 'App\\Models\\ThemeSetting', 62, '0bb28ab0-50aa-4eb1-b7d5-2fbe40b0d2e7', 'theme-favicon-logo', 'logo', 'logo.png', 'image/png', 'public', 'public', 5747, '[]', '[]', '[]', '[]', 1, '2026-02-15 21:43:46', '2026-02-15 21:43:46'),
(30, 'App\\Models\\ThemeSetting', 61, '1de7082f-9bc1-4d68-afa6-8e32b5d82b48', 'theme-logo', 'main-logo1759648444', 'main-logo1759648444.png', 'image/png', 'public', 'public', 5311, '[]', '[]', '[]', '[]', 1, '2026-02-15 21:41:51', '2026-02-15 21:41:51'),
(29, 'App\\Models\\ThemeSetting', 63, '3e89d21c-47ea-4121-89c6-d1a052bcafd1', 'theme-footer-logo', 'main-logo1759648444', 'main-logo1759648444.png', 'image/png', 'public', 'public', 5311, '[]', '[]', '[]', '[]', 1, '2026-02-15 21:39:43', '2026-02-15 21:39:43'),
(28, 'App\\Models\\Language', 4, '788c6a1d-e48f-4d1f-8474-e0ea19035c81', 'language', 'arabic', 'arabic.png', 'image/png', 'public', 'public', 4388, '[]', '[]', '[]', '[]', 1, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(27, 'App\\Models\\Language', 3, '10855873-0752-40a5-8fff-f84d61bdd683', 'language', 'german', 'german.png', 'image/png', 'public', 'public', 1835, '[]', '[]', '[]', '[]', 1, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(26, 'App\\Models\\Language', 2, 'ecc575a7-8e8a-4ca6-a18f-c80f39f1c49f', 'language', 'bangla', 'bangla.png', 'image/png', 'public', 'public', 1309, '[]', '[]', '[]', '[]', 1, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(25, 'App\\Models\\Language', 1, 'ca705d67-6734-4b71-8e49-0379e3cb486b', 'language', 'english', 'english.png', 'image/png', 'public', 'public', 1149, '[]', '[]', '[]', '[]', 1, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(24, 'App\\Models\\PaymentGateway', 24, '3e818290-0657-44b5-9946-7bb0bb3748ab', 'payment-gateway', 'easypaisa', 'easypaisa.png', 'image/png', 'public', 'public', 11255, '[]', '[]', '[]', '[]', 1, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(23, 'App\\Models\\PaymentGateway', 23, 'e1f2fac2-cce6-4833-a399-b6d9ee3cfa67', 'payment-gateway', 'myfatoorah', 'myfatoorah.png', 'image/png', 'public', 'public', 5411, '[]', '[]', '[]', '[]', 1, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(22, 'App\\Models\\PaymentGateway', 22, '7704bc61-4e43-47cb-8a38-974aba48c93e', 'payment-gateway', 'twocheckout', 'twocheckout.png', 'image/png', 'public', 'public', 4063, '[]', '[]', '[]', '[]', 1, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(21, 'App\\Models\\PaymentGateway', 21, '22c92c1a-41ea-49f4-b5ed-95e5887a900d', 'payment-gateway', 'midtrans', 'midtrans.png', 'image/png', 'public', 'public', 5877, '[]', '[]', '[]', '[]', 1, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(20, 'App\\Models\\PaymentGateway', 20, '5e1d6bf7-6632-49e6-9931-4f02b977d513', 'payment-gateway', 'pesapal', 'pesapal.png', 'image/png', 'public', 'public', 9373, '[]', '[]', '[]', '[]', 1, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(19, 'App\\Models\\PaymentGateway', 19, '52e5e9cc-ab66-4ce5-85ea-9d1c5e17364a', 'payment-gateway', 'iyzico', 'iyzico.png', 'image/png', 'public', 'public', 7652, '[]', '[]', '[]', '[]', 1, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(18, 'App\\Models\\PaymentGateway', 18, 'dffa76af-15de-4857-890d-257735d34c41', 'payment-gateway', 'telr', 'telr.png', 'image/png', 'public', 'public', 7594, '[]', '[]', '[]', '[]', 1, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(17, 'App\\Models\\PaymentGateway', 17, '0c2380e0-5c16-45af-9190-b563d44e3044', 'payment-gateway', 'phonepe', 'phonepe.png', 'image/png', 'public', 'public', 4417, '[]', '[]', '[]', '[]', 1, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(16, 'App\\Models\\PaymentGateway', 16, '336016d8-045b-4a71-bfd4-fedae3fc60fc', 'payment-gateway', 'skrill', 'skrill.png', 'image/png', 'public', 'public', 7074, '[]', '[]', '[]', '[]', 1, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(15, 'App\\Models\\PaymentGateway', 15, '4e0d6cd4-1860-4bf4-a3e8-8676b095a451', 'payment-gateway', 'payfast', 'payfast.png', 'image/png', 'public', 'public', 2173, '[]', '[]', '[]', '[]', 1, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(14, 'App\\Models\\PaymentGateway', 14, '6738c706-0c8e-46ac-9b47-c1e239927f7a', 'payment-gateway', 'cashfree', 'cashfree.png', 'image/png', 'public', 'public', 4940, '[]', '[]', '[]', '[]', 1, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(13, 'App\\Models\\PaymentGateway', 13, '84115185-42d1-4907-9934-ce5b7617363e', 'payment-gateway', 'mercadopago', 'mercadopago.png', 'image/png', 'public', 'public', 11423, '[]', '[]', '[]', '[]', 1, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(12, 'App\\Models\\PaymentGateway', 12, '563ee631-440f-44b3-a1cb-ed9e423c69af', 'payment-gateway', 'razorpay', 'razorpay.png', 'image/png', 'public', 'public', 4847, '[]', '[]', '[]', '[]', 1, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(11, 'App\\Models\\PaymentGateway', 11, '7e1b3807-9f20-41b2-bc51-ff189f2e0085', 'payment-gateway', 'paytm', 'paytm.png', 'image/png', 'public', 'public', 3285, '[]', '[]', '[]', '[]', 1, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(10, 'App\\Models\\PaymentGateway', 10, 'd10331ec-7707-4bfd-8943-5be6a49821c2', 'payment-gateway', 'bkash', 'bkash.png', 'image/png', 'public', 'public', 5282, '[]', '[]', '[]', '[]', 1, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(9, 'App\\Models\\PaymentGateway', 9, '9ec7b30c-afd0-41ae-9448-7b1d09f049f9', 'payment-gateway', 'senangpay', 'senangpay.png', 'image/png', 'public', 'public', 6541, '[]', '[]', '[]', '[]', 1, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(8, 'App\\Models\\PaymentGateway', 8, '013e5def-1887-4462-ab61-857ef3d9d081', 'payment-gateway', 'mollie', 'mollie.png', 'image/png', 'public', 'public', 8116, '[]', '[]', '[]', '[]', 1, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(7, 'App\\Models\\PaymentGateway', 7, 'b08ecdfa-b6d7-4dae-ad90-5c58c0457d26', 'payment-gateway', 'sslcommerz', 'sslcommerz.png', 'image/png', 'public', 'public', 4546, '[]', '[]', '[]', '[]', 1, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(6, 'App\\Models\\PaymentGateway', 6, 'bad0b5a9-da39-4b8e-ad41-87f32e1767b9', 'payment-gateway', 'paystack', 'paystack.png', 'image/png', 'public', 'public', 4195, '[]', '[]', '[]', '[]', 1, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(5, 'App\\Models\\PaymentGateway', 5, 'c2c7d690-eee8-430f-bf20-fc9682af4781', 'payment-gateway', 'flutterwave', 'flutterwave.png', 'image/png', 'public', 'public', 5191, '[]', '[]', '[]', '[]', 1, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(4, 'App\\Models\\PaymentGateway', 4, '37783b00-b827-4a1d-adf9-e8b86f1ed383', 'payment-gateway', 'stripe', 'stripe.png', 'image/png', 'public', 'public', 3635, '[]', '[]', '[]', '[]', 1, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(3, 'App\\Models\\PaymentGateway', 3, 'ef0d9b05-30c9-47a4-825d-2d24b3386936', 'payment-gateway', 'paypal', 'paypal.png', 'image/png', 'public', 'public', 3809, '[]', '[]', '[]', '[]', 1, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(1, 'App\\Models\\PaymentGateway', 1, 'b8d81d42-6d1c-4850-a1df-e10050e7531e', 'payment-gateway', 'cash-on-delivery', 'cash-on-delivery.png', 'image/png', 'public', 'public', 3437, '[]', '[]', '[]', '[]', 1, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(2, 'App\\Models\\PaymentGateway', 2, '9a1cc6ef-9a9b-4329-9b84-3f138093addb', 'payment-gateway', 'credit', 'credit.png', 'image/png', 'public', 'public', 3885, '[]', '[]', '[]', '[]', 1, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(63, 'App\\Models\\Item', 22, '73592cd3-0ac1-11f1-889d-364efe48bc56', 'item', 'kung_pao_chicken', 'kung_pao_chicken.png', 'image/png', 'public', 'public', 1309, '[]', '[]', '{\"cover\": true, \"thumb\": true, \"preview\": true}', '[]', 22, '2026-02-15 22:55:40', '2026-02-16 04:58:12'),
(64, 'App\\Models\\Item', 23, '73592d4c-0ac1-11f1-889d-364efe48bc56', 'item', 'sesame_chicken', 'sesame_chicken.png', 'image/png', 'public', 'public', 1309, '[]', '[]', '{\"cover\": true, \"thumb\": true, \"preview\": true}', '[]', 23, '2026-02-15 22:55:40', '2026-02-16 04:58:12'),
(65, 'App\\Models\\Item', 24, '73592dc5-0ac1-11f1-889d-364efe48bc56', 'item', 'sweet_&_sour_chicken', 'sweet_&_sour_chicken.png', 'image/png', 'public', 'public', 1309, '[]', '[]', '{\"cover\": true, \"thumb\": true, \"preview\": true}', '[]', 24, '2026-02-15 22:55:40', '2026-02-16 04:58:13'),
(66, 'App\\Models\\Item', 25, '73592e41-0ac1-11f1-889d-364efe48bc56', 'item', 'yemete_kudasai_chicken', 'yemete_kudasai_chicken.png', 'image/png', 'public', 'public', 1309, '[]', '[]', '{\"cover\": true, \"thumb\": true, \"preview\": true}', '[]', 25, '2026-02-15 22:55:40', '2026-02-16 04:58:13'),
(67, 'App\\Models\\Item', 26, '73592ec7-0ac1-11f1-889d-364efe48bc56', 'item', 'beef_with_broccoli', 'beef_with_broccoli.png', 'image/png', 'public', 'public', 1309, '[]', '[]', '{\"cover\": true, \"thumb\": true, \"preview\": true}', '[]', 26, '2026-02-15 22:55:40', '2026-02-16 04:58:13'),
(68, 'App\\Models\\Item', 27, '73592f43-0ac1-11f1-889d-364efe48bc56', 'item', 'beef_with_mix_vegetables', 'beef_with_mix_vegetables.png', 'image/png', 'public', 'public', 1309, '[]', '[]', '{\"cover\": true, \"thumb\": true, \"preview\": true}', '[]', 27, '2026-02-15 22:55:40', '2026-02-16 04:58:14'),
(69, 'App\\Models\\Item', 28, '73593004-0ac1-11f1-889d-364efe48bc56', 'item', 'pepper_steak_with_onions', 'pepper_steak_with_onions.png', 'image/png', 'public', 'public', 1309, '[]', '[]', '{\"cover\": true, \"thumb\": true, \"preview\": true}', '[]', 28, '2026-02-15 22:55:40', '2026-02-16 04:58:14'),
(70, 'App\\Models\\Item', 29, '7359307a-0ac1-11f1-889d-364efe48bc56', 'item', 'szechuan_beef', 'szechuan_beef.png', 'image/png', 'public', 'public', 1309, '[]', '[]', '{\"cover\": true, \"thumb\": true, \"preview\": true}', '[]', 29, '2026-02-15 22:55:40', '2026-02-16 04:58:14'),
(71, 'App\\Models\\Item', 30, '735930f0-0ac1-11f1-889d-364efe48bc56', 'item', 'kung_pao_squid', 'kung_pao_squid.png', 'image/png', 'public', 'public', 1309, '[]', '[]', '{\"cover\": true, \"thumb\": true, \"preview\": true}', '[]', 30, '2026-02-15 22:55:40', '2026-02-16 04:58:15'),
(72, 'App\\Models\\Item', 31, '73593167-0ac1-11f1-889d-364efe48bc56', 'item', 'salmon_with_mix_vegetables', 'salmon_with_mix_vegetables.png', 'image/png', 'public', 'public', 1309, '[]', '[]', '{\"cover\": true, \"thumb\": true, \"preview\": true}', '[]', 31, '2026-02-15 22:55:40', '2026-02-16 04:58:15'),
(73, 'App\\Models\\Item', 32, '735931e0-0ac1-11f1-889d-364efe48bc56', 'item', 'shrimp_with_broccoli', 'shrimp_with_broccoli.png', 'image/png', 'public', 'public', 1309, '[]', '[]', '{\"cover\": true, \"thumb\": true, \"preview\": true}', '[]', 32, '2026-02-15 22:55:40', '2026-02-16 07:36:01'),
(74, 'App\\Models\\Item', 33, '7359325a-0ac1-11f1-889d-364efe48bc56', 'item', 'szechuan_shrimp', 'szechuan_shrimp.png', 'image/png', 'public', 'public', 1309, '[]', '[]', '{\"cover\": true, \"thumb\": true, \"preview\": true}', '[]', 33, '2026-02-15 22:55:40', '2026-02-16 04:58:16'),
(75, 'App\\Models\\Item', 34, '735932d4-0ac1-11f1-889d-364efe48bc56', 'item', 'classic_caesar_salad', 'classic_caesar_salad.png', 'image/png', 'public', 'public', 1309, '[]', '[]', '{\"cover\": true, \"thumb\": true, \"preview\": true}', '[]', 34, '2026-02-15 22:55:40', '2026-02-16 04:58:16'),
(76, 'App\\Models\\Item', 35, '73593384-0ac1-11f1-889d-364efe48bc56', 'item', 'fresh_tuna_salad', 'fresh_tuna_salad.png', 'image/png', 'public', 'public', 1309, '[]', '[]', '{\"cover\": true, \"thumb\": true, \"preview\": true}', '[]', 35, '2026-02-15 22:55:40', '2026-02-16 04:58:16'),
(77, 'App\\Models\\Item', 36, '73593442-0ac1-11f1-889d-364efe48bc56', 'item', 'mix_vegetables_salad', 'mix_vegetables_salad.png', 'image/png', 'public', 'public', 1309, '[]', '[]', '{\"cover\": true, \"thumb\": true, \"preview\": true}', '[]', 36, '2026-02-15 22:55:40', '2026-02-16 04:58:17'),
(78, 'App\\Models\\Item', 37, '735934e8-0ac1-11f1-889d-364efe48bc56', 'item', 'poached_pear_salad', 'poached_pear_salad.png', 'image/png', 'public', 'public', 1309, '[]', '[]', '{\"cover\": true, \"thumb\": true, \"preview\": true}', '[]', 37, '2026-02-15 22:55:40', '2026-02-16 04:58:17'),
(79, 'App\\Models\\Item', 38, '7359358f-0ac1-11f1-889d-364efe48bc56', 'item', 'roasted_salmon_salad', 'roasted_salmon_salad.png', 'image/png', 'public', 'public', 1309, '[]', '[]', '{\"cover\": true, \"thumb\": true, \"preview\": true}', '[]', 38, '2026-02-15 22:55:40', '2026-02-16 04:58:17'),
(80, 'App\\Models\\Item', 39, '7359363e-0ac1-11f1-889d-364efe48bc56', 'item', 'chicken_noodles_soup', 'chicken_noodles_soup.png', 'image/png', 'public', 'public', 1309, '[]', '[]', '{\"cover\": true, \"thumb\": true, \"preview\": true}', '[]', 39, '2026-02-15 22:55:40', '2026-02-16 04:58:17'),
(81, 'App\\Models\\Item', 40, '735936f4-0ac1-11f1-889d-364efe48bc56', 'item', 'egg_drop_soup', 'egg_drop_soup.png', 'image/png', 'public', 'public', 1309, '[]', '[]', '{\"cover\": true, \"thumb\": true, \"preview\": true}', '[]', 40, '2026-02-15 22:55:40', '2026-02-16 04:58:18'),
(82, 'App\\Models\\Item', 41, '73593d04-0ac1-11f1-889d-364efe48bc56', 'item', 'hot_&_sour_soup', 'hot_&_sour_soup.png', 'image/png', 'public', 'public', 1309, '[]', '[]', '{\"cover\": true, \"thumb\": true, \"preview\": true}', '[]', 41, '2026-02-15 22:55:40', '2026-02-16 04:58:18'),
(83, 'App\\Models\\Item', 42, '73593e30-0ac1-11f1-889d-364efe48bc56', 'item', 'wonton_soup', 'wonton_soup.png', 'image/png', 'public', 'public', 1309, '[]', '[]', '{\"cover\": true, \"thumb\": true, \"preview\": true}', '[]', 42, '2026-02-15 22:55:40', '2026-02-16 04:58:18'),
(84, 'App\\Models\\Item', 43, '73593ef4-0ac1-11f1-889d-364efe48bc56', 'item', 'baked_potato', 'baked_potato.png', 'image/png', 'public', 'public', 1309, '[]', '[]', '{\"cover\": true, \"thumb\": true, \"preview\": true}', '[]', 43, '2026-02-15 22:55:40', '2026-02-16 04:58:19'),
(85, 'App\\Models\\Item', 44, '735946c8-0ac1-11f1-889d-364efe48bc56', 'item', 'french_fries', 'french_fries.png', 'image/png', 'public', 'public', 1309, '[]', '[]', '{\"cover\": true, \"thumb\": true, \"preview\": true}', '[]', 44, '2026-02-15 22:55:40', '2026-02-16 04:58:19'),
(86, 'App\\Models\\Item', 45, '735947c8-0ac1-11f1-889d-364efe48bc56', 'item', 'homemade_mashed_potato', 'homemade_mashed_potato.png', 'image/png', 'public', 'public', 1309, '[]', '[]', '{\"cover\": true, \"thumb\": true, \"preview\": true}', '[]', 45, '2026-02-15 22:55:40', '2026-02-16 04:58:19'),
(87, 'App\\Models\\Item', 46, '7359489f-0ac1-11f1-889d-364efe48bc56', 'item', 'onion_rings', 'onion_rings.png', 'image/png', 'public', 'public', 1309, '[]', '[]', '{\"cover\": true, \"thumb\": true, \"preview\": true}', '[]', 46, '2026-02-15 22:55:40', '2026-02-16 04:58:20'),
(88, 'App\\Models\\Item', 47, '73594935-0ac1-11f1-889d-364efe48bc56', 'item', 'potato_pancakes', 'potato_pancakes.png', 'image/png', 'public', 'public', 1309, '[]', '[]', '{\"cover\": true, \"thumb\": true, \"preview\": true}', '[]', 47, '2026-02-15 22:55:40', '2026-02-16 04:58:20'),
(89, 'App\\Models\\Item', 48, '735949ff-0ac1-11f1-889d-364efe48bc56', 'item', 'cappuccino', 'cappuccino.png', 'image/png', 'public', 'public', 1309, '[]', '[]', '{\"cover\": true, \"thumb\": true, \"preview\": true}', '[]', 48, '2026-02-15 22:55:40', '2026-02-16 04:58:20'),
(90, 'App\\Models\\Item', 49, '73594a89-0ac1-11f1-889d-364efe48bc56', 'item', 'chai_latte', 'chai_latte.png', 'image/png', 'public', 'public', 1309, '[]', '[]', '{\"cover\": true, \"thumb\": true, \"preview\": true}', '[]', 49, '2026-02-15 22:55:40', '2026-02-16 04:58:21'),
(91, 'App\\Models\\Item', 50, '73594b25-0ac1-11f1-889d-364efe48bc56', 'item', 'espresso', 'espresso.png', 'image/png', 'public', 'public', 1309, '[]', '[]', '{\"cover\": true, \"thumb\": true, \"preview\": true}', '[]', 50, '2026-02-15 22:55:40', '2026-02-16 04:58:21'),
(92, 'App\\Models\\Item', 51, '73594bb1-0ac1-11f1-889d-364efe48bc56', 'item', 'homemade_lemonade', 'homemade_lemonade.png', 'image/png', 'public', 'public', 1309, '[]', '[]', '{\"cover\": true, \"thumb\": true, \"preview\": true}', '[]', 51, '2026-02-15 22:55:40', '2026-02-16 04:58:21'),
(115, 'App\\Models\\Item', 52, 'd51eeda1-579a-4493-b53a-5921042028b0', 'item', 'beverages-cover', 'beverages-cover.png', 'image/png', 'public', 'public', 77596, '[]', '[]', '{\"cover\": true, \"thumb\": true, \"preview\": true}', '[]', 1, '2026-02-16 07:49:38', '2026-02-16 07:49:38'),
(109, 'App\\Models\\Item', 53, '18c7bfa4-bad0-44ac-8328-bdd141022dfd', 'item', 'mojito', 'mojito.PNG', 'image/png', 'public', 'public', 307303, '[]', '[]', '[]', '[]', 1, '2026-02-16 07:47:10', '2026-02-16 07:47:10'),
(114, 'App\\Models\\Item', 54, '1d5abd63-ee4f-418f-ac0c-4e0b8f7015f9', 'item', 'beverages-cover', 'beverages-cover.png', 'image/png', 'public', 'public', 77596, '[]', '[]', '{\"cover\": true, \"thumb\": true, \"preview\": true}', '[]', 1, '2026-02-16 07:49:20', '2026-02-16 07:49:20'),
(113, 'App\\Models\\Item', 55, '1c6309d8-cb06-440a-80d4-f28f5ea96546', 'item', 'beverages-cover', 'beverages-cover.png', 'image/png', 'public', 'public', 77596, '[]', '[]', '{\"cover\": true, \"thumb\": true, \"preview\": true}', '[]', 1, '2026-02-16 07:49:07', '2026-02-16 07:49:08'),
(97, 'App\\Models\\ItemCategory', 2, '37939fe9-4458-47f0-9677-cc864d56b205', 'item-category', 'flame_grill_burgers-cover', 'flame_grill_burgers-cover.png', 'image/png', 'public', 'public', 152794, '[]', '[]', '{\"cover\": true, \"thumb\": true}', '[]', 1, '2026-02-16 05:54:56', '2026-02-16 05:54:56'),
(98, 'App\\Models\\ItemCategory', 3, '45889fb9-ead2-411b-b9ec-eb20d78c7226', 'item-category', 'veggie_&_plant_based_burgers-cover', 'veggie_&_plant_based_burgers-cover.png', 'image/png', 'public', 'public', 131749, '[]', '[]', '{\"cover\": true, \"thumb\": true}', '[]', 1, '2026-02-16 05:55:08', '2026-02-16 05:55:08'),
(99, 'App\\Models\\ItemCategory', 4, '640f81c7-10c5-4245-a2c7-8c720ac11cc4', 'item-category', 'sandwich_from_the_grill-cover', 'sandwich_from_the_grill-cover.png', 'image/png', 'public', 'public', 153181, '[]', '[]', '{\"cover\": true, \"thumb\": true}', '[]', 1, '2026-02-16 05:55:18', '2026-02-16 05:55:18'),
(100, 'App\\Models\\ItemCategory', 5, 'e8898516-ee73-4b63-a111-02b240581bc0', 'item-category', 'hot_chicken_entrees-cover', 'hot_chicken_entrees-cover.png', 'image/png', 'public', 'public', 130322, '[]', '[]', '{\"cover\": true, \"thumb\": true}', '[]', 1, '2026-02-16 05:55:28', '2026-02-16 05:55:28'),
(101, 'App\\Models\\ItemCategory', 6, '43f21cf2-6281-4f67-8bd9-7c1adafb6910', 'item-category', 'beef_entrees-cover', 'beef_entrees-cover.png', 'image/png', 'public', 'public', 126082, '[]', '[]', '{\"cover\": true, \"thumb\": true}', '[]', 1, '2026-02-16 05:55:40', '2026-02-16 05:55:40'),
(102, 'App\\Models\\ItemCategory', 7, 'd4dd87f2-eb93-483f-843f-42a0cb0f26f6', 'item-category', 'seafood_entrees-cover', 'seafood_entrees-cover.png', 'image/png', 'public', 'public', 161601, '[]', '[]', '{\"cover\": true, \"thumb\": true}', '[]', 1, '2026-02-16 05:55:49', '2026-02-16 05:55:49'),
(103, 'App\\Models\\ItemCategory', 8, '3e986ce5-bc0a-4ebc-94bd-c2539e14284a', 'item-category', 'house_special_salads-cover', 'house_special_salads-cover.png', 'image/png', 'public', 'public', 156026, '[]', '[]', '{\"cover\": true, \"thumb\": true}', '[]', 1, '2026-02-16 05:55:58', '2026-02-16 05:55:58'),
(104, 'App\\Models\\ItemCategory', 9, '05628e2d-8b2c-482f-ad1e-bb957ffcc1ac', 'item-category', 'zoop_soups-cover', 'zoop_soups-cover.png', 'image/png', 'public', 'public', 88592, '[]', '[]', '{\"cover\": true, \"thumb\": true}', '[]', 1, '2026-02-16 05:56:06', '2026-02-16 05:56:06'),
(105, 'App\\Models\\ItemCategory', 10, '851757b7-540e-43b6-9557-c2eb9b0b4c66', 'item-category', 'side_orders-cover', 'side_orders-cover.png', 'image/png', 'public', 'public', 89102, '[]', '[]', '{\"cover\": true, \"thumb\": true}', '[]', 1, '2026-02-16 05:56:13', '2026-02-16 05:56:13'),
(106, 'App\\Models\\ItemCategory', 11, '4b2912c1-4798-4406-8dca-739ba9f539f9', 'item-category', 'beverages-cover', 'beverages-cover.png', 'image/png', 'public', 'public', 77596, '[]', '[]', '{\"cover\": true, \"thumb\": true}', '[]', 1, '2026-02-16 05:56:21', '2026-02-16 05:56:21'),
(110, 'App\\Models\\Item', 53, 'f91c297a-1aa9-453a-a80e-efe8b766e749', 'item', 'mojito', 'mojito.PNG', 'image/png', 'public', 'public', 307303, '[]', '[]', '[]', '[]', 2, '2026-02-16 07:47:30', '2026-02-16 07:47:30'),
(111, 'App\\Models\\Item', 53, '6a3e7bca-bacc-41b8-a878-659bb20907d7', 'item', 'mojito', 'mojito.JPG', 'image/jpeg', 'public', 'public', 23676, '[]', '[]', '[]', '[]', 3, '2026-02-16 07:48:24', '2026-02-16 07:48:24'),
(112, 'App\\Models\\Item', 53, '5d7527f5-158c-41c6-90bb-0962383cdeb9', 'item', 'beverages-cover', 'beverages-cover.png', 'image/png', 'public', 'public', 77596, '[]', '[]', '{\"cover\": true, \"thumb\": true, \"preview\": true}', '[]', 4, '2026-02-16 07:48:49', '2026-02-16 07:48:49'),
(124, 'App\\Models\\NotificationSetting', 58, 'ede3f30f-3d47-4525-b0bd-5fc1a5edf712', 'notification-file', 'food-king-8019b-firebase-adminsdk-fbsvc-8cbd9443ba', 'service-account-file.json', 'application/json', 'public', 'public', 2389, '[]', '[]', '[]', '[]', 1, '2026-02-18 05:10:43', '2026-02-18 05:10:43'),
(121, 'App\\Models\\Slider', 1, '8854ca0e-f732-4f3b-84b2-7aae3d46a3eb', 'slider', 'slider_one-cover[1]', 'slider_one-cover[1].png', 'image/png', 'public', 'public', 327036, '[]', '[]', '{\"cover\": true}', '[]', 1, '2026-02-16 05:33:38', '2026-02-16 05:33:38'),
(122, 'App\\Models\\Slider', 2, '41d08e7f-a897-4049-bb1c-00a433700ddf', 'slider', 'slider_two-cover[1]', 'slider_two-cover[1].png', 'image/png', 'public', 'public', 405448, '[]', '[]', '{\"cover\": true}', '[]', 1, '2026-02-16 05:34:22', '2026-02-16 05:34:23'),
(123, 'App\\Models\\Slider', 3, '22762925-b763-4dfd-a037-9913ec0e7393', 'slider', 'slider_three-cover[1]', 'slider_three-cover[1].png', 'image/png', 'public', 'public', 436190, '[]', '[]', '{\"cover\": true}', '[]', 1, '2026-02-16 05:34:57', '2026-02-16 05:34:57');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint UNSIGNED NOT NULL,
  `parent` int UNSIGNED NOT NULL DEFAULT '0',
  `type` int UNSIGNED NOT NULL DEFAULT '1',
  `priority` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `language`, `url`, `icon`, `status`, `parent`, `type`, `priority`, `created_at`, `updated_at`) VALUES
(1, 'Dashboard', 'dashboard', 'dashboard', 'lab lab-dashboard', 1, 0, 1, 100, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(2, 'Items', 'items', 'items', 'lab lab-items', 1, 0, 1, 100, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(3, 'Dining Tables', 'dining_tables', 'dining-tables', 'lab lab-dining-table', 1, 0, 1, 100, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(4, 'Pos & Orders', 'pos_and_orders', '#', 'lab lab-pos', 1, 0, 1, 100, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(5, 'POS', 'pos', 'pos', 'lab lab-pos', 1, 4, 1, 100, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(6, 'POS Orders', 'pos_orders', 'pos-orders', 'lab lab-pos-orders', 1, 4, 1, 100, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(7, 'Online Orders', 'online_orders', 'online-orders', 'lab lab-online-orders', 1, 4, 1, 100, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(8, 'Table Orders', 'table_orders', 'table-orders', 'lab lab-reserve-line', 1, 4, 1, 100, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(9, 'K.D.S', 'k_d_s', 'kitchen-display-system', 'lab lab-kds', 1, 4, 1, 100, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(10, 'O.S.S', 'o_s_s', 'order-status-screen', 'lab lab-cds', 1, 4, 1, 100, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(11, 'Promo', 'promo', '#', 'lab ', 1, 0, 1, 100, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(12, 'Coupons', 'coupons', 'coupons', 'lab lab-coupons', 1, 11, 1, 100, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(13, 'Offers', 'offers', 'offers', 'lab lab-offers', 1, 11, 1, 100, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(14, 'Communications', 'communications', '#', 'lab ', 1, 0, 1, 100, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(15, 'Push Notifications', 'push_notifications', 'push-notifications', 'lab lab-push-notification', 1, 14, 1, 100, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(16, 'Messages', 'messages', 'messages', 'lab lab-messages', 1, 14, 1, 100, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(17, 'Subscribers', 'subscribers', 'subscribers', 'lab lab-subscribers', 1, 14, 1, 100, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(18, 'Users', 'users', '#', 'lab ', 1, 0, 1, 100, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(19, 'Administrators', 'administrators', 'administrators', 'lab lab-administrators', 1, 18, 1, 100, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(20, 'Delivery Boys', 'delivery_boys', 'delivery-boys', 'lab lab-delivery-boys', 1, 18, 1, 100, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(21, 'Customers', 'customers', 'customers', 'lab lab-customers', 1, 18, 1, 100, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(22, 'Employees', 'employees', 'employees', 'lab lab-employee-2', 1, 18, 1, 100, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(23, 'Waiters', 'waiters', 'waiters', 'lab lab-waiter', 1, 18, 1, 100, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(24, 'Chef', 'chefs', 'chefs', 'lab lab-chef', 1, 18, 1, 100, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(25, 'Accounts', 'accounts', '#', 'lab ', 1, 0, 1, 100, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(26, 'Transactions', 'transactions', 'transactions', 'lab lab-transactions', 1, 25, 1, 100, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(27, 'Reports', 'reports', '#', 'lab ', 1, 0, 1, 100, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(28, 'Sales Report', 'sales_report', 'sales-report', 'lab lab-sales-report', 1, 27, 1, 100, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(29, 'Items Report', 'items_report', 'items-report', 'lab lab-items-report', 1, 27, 1, 100, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(30, 'Credit Balance Report', 'credit_balance_report', 'credit-balance-report', 'lab lab-credit-balance-report', 1, 27, 1, 100, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(31, 'Setup', 'setup', '#', 'lab ', 1, 0, 1, 100, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(32, 'Settings', 'settings', 'settings', 'lab lab-settings', 1, 31, 1, 100, '2026-02-15 05:52:21', '2026-02-15 05:52:21');

-- --------------------------------------------------------

--
-- Table structure for table `menu_sections`
--

CREATE TABLE `menu_sections` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `creator_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_id` bigint DEFAULT NULL,
  `editor_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `editor_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_sections`
--

INSERT INTO `menu_sections` (`id`, `name`, `creator_type`, `creator_id`, `editor_type`, `editor_id`, `created_at`, `updated_at`) VALUES
(1, 'Header Section', NULL, NULL, NULL, NULL, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(2, 'Footer Section', NULL, NULL, NULL, NULL, '2026-02-15 05:52:21', '2026-02-15 05:52:21');

-- --------------------------------------------------------

--
-- Table structure for table `menu_templates`
--

CREATE TABLE `menu_templates` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `creator_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_id` bigint DEFAULT NULL,
  `editor_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `editor_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_templates`
--

INSERT INTO `menu_templates` (`id`, `name`, `creator_type`, `creator_id`, `editor_type`, `editor_id`, `created_at`, `updated_at`) VALUES
(1, 'Contact Us', NULL, NULL, NULL, NULL, '2026-02-15 05:52:21', '2026-02-15 05:52:21');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `branch_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2026-02-18 03:25:03', '2026-02-18 03:25:03'),
(2, 1, 2, '2026-02-18 03:25:15', '2026-02-18 03:25:15'),
(3, 1, 3, '2026-02-18 03:30:53', '2026-02-18 03:30:53');

-- --------------------------------------------------------

--
-- Table structure for table `message_histories`
--

CREATE TABLE `message_histories` (
  `id` bigint UNSIGNED NOT NULL,
  `message_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_read` tinyint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `message_histories`
--

INSERT INTO `message_histories` (`id`, `message_id`, `user_id`, `text`, `is_read`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Hi', 10, '2026-02-18 03:25:03', '2026-02-18 03:25:03'),
(2, 2, 1, 'hi', 10, '2026-02-18 03:25:15', '2026-02-18 03:25:15'),
(3, 3, 3, 'Hi', 10, '2026-02-18 03:30:53', '2026-02-18 03:30:53'),
(4, 2, 2, 'Hi again', 5, '2026-02-18 03:35:36', '2026-02-18 03:35:49'),
(5, 2, 2, 'How are you', 5, '2026-02-18 03:35:58', '2026-02-18 03:36:09'),
(6, 2, 1, 'i am good', 10, '2026-02-18 03:36:09', '2026-02-18 03:36:09'),
(7, 2, 2, 'Hi', 5, '2026-02-18 03:36:47', '2026-02-18 03:37:24'),
(8, 2, 2, 'Hi for brave', 5, '2026-02-18 03:53:51', '2026-02-18 04:02:49'),
(9, 2, 2, 'Hi', 5, '2026-02-18 04:55:48', '2026-02-18 04:56:00'),
(10, 2, 2, 'Hi2', 5, '2026-02-18 05:16:45', '2026-02-18 06:09:58'),
(11, 2, 2, 'Hi 3', 5, '2026-02-18 05:35:53', '2026-02-18 06:09:58');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2020_09_10_080029_create_menus_table', 1),
(6, '2022_05_01_142407_create_permission_tables', 1),
(7, '2022_05_24_204620_create_settings_table', 1),
(8, '2022_05_25_124629_create_currencies_table', 1),
(9, '2022_06_26_055545_create_default_access_table', 1),
(10, '2022_08_10_143500_create_media_table', 1),
(11, '2022_10_31_015126_create_pesapals_table', 1),
(12, '2022_11_10_075751_create_subscribers_table', 1),
(13, '2022_11_17_110125_create_branches_table', 1),
(14, '2022_11_17_110157_create_languages_table', 1),
(15, '2022_11_17_110300_create_addresses_table', 1),
(16, '2022_11_17_110319_create_sliders_table', 1),
(17, '2022_11_17_110428_create_item_categories_table', 1),
(18, '2022_11_17_110455_create_offers_table', 1),
(19, '2022_11_17_110459_create_taxes_table', 1),
(20, '2022_11_17_110514_create_items_table', 1),
(21, '2022_11_17_110541_create_item_attributes_table', 1),
(22, '2022_11_17_110621_create_item_variations_table', 1),
(23, '2022_11_17_110650_create_item_extras_table', 1),
(24, '2022_11_17_110810_create_orders_table', 1),
(25, '2022_11_17_110832_create_order_items_table', 1),
(26, '2022_11_17_110910_create_coupons_table', 1),
(27, '2022_11_17_111737_create_offer_items_table', 1),
(28, '2022_11_17_113842_create_menu_sections_table', 1),
(29, '2022_11_17_114040_create_menu_templates_table', 1),
(30, '2022_11_17_114144_create_analytics_table', 1),
(31, '2022_11_17_114516_create_analytics_sections_table', 1),
(32, '2022_11_17_114835_create_payment_gateways_table', 1),
(33, '2022_11_17_115136_create_sms_gateways_table', 1),
(34, '2022_11_17_115341_create_gateway_options_table', 1),
(35, '2022_11_17_115716_create_addons_table', 1),
(36, '2022_11_17_120130_create_notifications_table', 1),
(37, '2022_11_17_120408_create_messages_table', 1),
(38, '2022_11_17_120624_create_message_histories_table', 1),
(39, '2022_11_17_120625_create_order_coupons_table', 1),
(40, '2022_11_17_120626_create_pages_table', 1),
(41, '2022_11_17_120627_create_item_addons_table', 1),
(42, '2022_11_23_125038_create_push_notifications_table', 1),
(43, '2023_01_09_111734_create_time_slots_table', 1),
(44, '2023_02_20_180253_create_order_addresses_table', 1),
(45, '2023_03_06_154954_create_otps_table', 1),
(46, '2023_03_23_143747_create_transactions_table', 1),
(47, '2023_03_23_170303_create_capture_payment_notifications_table', 1),
(48, '2023_03_27_140107_create_notification_alerts_table', 1),
(49, '2023_07_19_135307_add_soft_delete_column_to_users_table', 1),
(50, '2023_07_20_095727_add_total_tax_to_orders_table', 1),
(51, '2023_07_20_095843_add_tax_to_order_items_table', 1),
(52, '2023_09_05_133748_create_dining_tables_table', 1),
(53, '2023_11_18_154743_add_dining_table_id_to_order_table', 1),
(54, '2024_01_22_172712_add_display_mode_to_languages_table', 1),
(55, '2024_02_29_095727_add_sort_to_item_categories_table', 1),
(56, '2024_10_28_000000_add_pos_payment_method_and_note_to_orders_table', 1),
(57, '2025_02_09_000000_add_pos_received_amount_to_orders_table', 1),
(58, '2025_02_12_000000_add_zone_to_branches_table', 1),
(59, '2025_02_21_110459_create_kiosk_machines_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 2),
(6, 'App\\Models\\User', 3);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notification_alerts`
--

CREATE TABLE `notification_alerts` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mail_message` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_message` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `push_notification_message` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail` tinyint DEFAULT NULL,
  `sms` tinyint DEFAULT NULL,
  `push_notification` tinyint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notification_alerts`
--

INSERT INTO `notification_alerts` (`id`, `name`, `language`, `mail_message`, `sms_message`, `push_notification_message`, `mail`, `sms`, `push_notification`, `created_at`, `updated_at`) VALUES
(1, 'Order Pending Message', 'order_pending_message', 'Your order is successfully placed.', 'Your order is successfully placed.', 'Your order is successfully placed.', 10, 10, 10, '2026-02-15 05:52:23', '2026-02-18 05:59:42'),
(2, 'Order Confirmation Message', 'order_confirmation_message', 'Your order is Confirmed.', 'Your order is Confirmed.', 'Your order is Confirmed.', 5, 10, 5, '2026-02-15 05:52:23', '2026-02-18 05:59:42'),
(3, 'Order preparing Message', 'order_preparing_message', 'Your order is being Prepared.', 'Your order is being Prepared.', 'Your order is being Prepared.', 10, 10, 10, '2026-02-15 05:52:23', '2026-02-18 05:59:42'),
(4, 'Order prepared Message', 'order_prepared_message', 'The order has been prepared and is waiting for delivery.', 'The order has been prepared and is waiting for delivery.', 'The order has been prepared and is waiting for delivery.', 10, 10, 10, '2026-02-15 05:52:23', '2026-02-18 05:59:42'),
(5, 'Order Out For Delivery Message', 'order_out_for_delivery_message', 'Your order is Out for delivery.', 'Your order is Out for delivery.', 'Your order is Out for delivery.', 10, 10, 10, '2026-02-15 05:52:23', '2026-02-18 05:59:42'),
(6, 'Order Delivered Message', 'order_delivered_message', 'Your order is Successfully delivered.', 'Your order is Successfully delivered.', 'Your order is Successfully delivered.', 10, 10, 10, '2026-02-15 05:52:23', '2026-02-18 05:59:42'),
(7, 'Order Canceled Message', 'order_canceled_message', 'Your order is Canceled.', 'Your order is Canceled.', 'Your order is Canceled.', 10, 10, 10, '2026-02-15 05:52:23', '2026-02-18 05:59:42'),
(8, 'Order Rejected Message', 'order_rejected_message', 'Your order is Rejected.', 'Your order is Rejected.', 'Your order is Rejected.', 10, 10, 10, '2026-02-15 05:52:23', '2026-02-18 05:59:42'),
(9, 'Order Returned Message', 'order_returned_message', 'Your order is Returned.', 'Your order is Returned.', 'Your order is Returned.', 10, 10, 10, '2026-02-15 05:52:23', '2026-02-18 05:59:42'),
(10, 'Delivery Boy After Assign Message', 'delivery_boy_after_assign_message', 'You have been assigned an order for delivery.', 'You have been assigned an order for delivery.', 'You have been assigned an order for delivery.', 10, 10, 10, '2026-02-15 05:52:23', '2026-02-18 05:59:42'),
(11, 'Admin And Branch Manager New Order Message', 'admin_and_branch_manager_new_order_message', 'You have a new order.', 'You have a new order.', 'You have a new order.', 5, 10, 5, '2026-02-15 05:52:23', '2026-02-18 05:59:42');

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

CREATE TABLE `offers` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(19,6) NOT NULL,
  `status` tinyint NOT NULL DEFAULT '5' COMMENT '5=Active, 10=Inactive',
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `creator_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_id` bigint DEFAULT NULL,
  `editor_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `editor_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `offer_items`
--

CREATE TABLE `offer_items` (
  `id` bigint UNSIGNED NOT NULL,
  `offer_id` bigint UNSIGNED NOT NULL,
  `item_id` bigint UNSIGNED NOT NULL,
  `creator_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_id` bigint DEFAULT NULL,
  `editor_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `editor_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint UNSIGNED NOT NULL,
  `order_serial_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `subtotal` decimal(19,6) NOT NULL,
  `discount` decimal(19,6) DEFAULT '0.000000',
  `delivery_charge` decimal(19,6) DEFAULT '0.000000',
  `total_tax` decimal(19,6) DEFAULT NULL,
  `total` decimal(19,6) NOT NULL,
  `order_type` tinyint NOT NULL DEFAULT '5',
  `order_datetime` timestamp NOT NULL DEFAULT '2026-02-15 05:02:20',
  `delivery_time` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `preparation_time` int NOT NULL DEFAULT '0',
  `is_advance_order` tinyint NOT NULL DEFAULT '5',
  `payment_method` bigint NOT NULL DEFAULT '1',
  `pos_payment_method` tinyint DEFAULT NULL,
  `pos_received_amount` decimal(19,6) DEFAULT '0.000000',
  `pos_payment_note` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` tinyint NOT NULL DEFAULT '10',
  `status` tinyint NOT NULL,
  `dining_table_id` bigint UNSIGNED DEFAULT NULL,
  `delivery_boy_id` bigint DEFAULT NULL,
  `reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `source` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_id` bigint DEFAULT NULL,
  `editor_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `editor_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_serial_no`, `token`, `user_id`, `branch_id`, `subtotal`, `discount`, `delivery_charge`, `total_tax`, `total`, `order_type`, `order_datetime`, `delivery_time`, `preparation_time`, `is_advance_order`, `payment_method`, `pos_payment_method`, `pos_received_amount`, `pos_payment_note`, `payment_status`, `status`, `dining_table_id`, `delivery_boy_id`, `reason`, `source`, `creator_type`, `creator_id`, `editor_type`, `editor_id`, `created_at`, `updated_at`) VALUES
(1, '1602261', '67163', 1, 1, 2.500000, 0.000000, 0.000000, 0.000000, 2.500000, 10, '2026-02-16 19:59:59', NULL, 30, 10, 1, NULL, 0.000000, NULL, 10, 1, NULL, NULL, NULL, '10', NULL, NULL, NULL, NULL, '2026-02-16 19:59:59', '2026-02-16 19:59:59'),
(2, '1702262', '300517', 3, 1, 7.000000, 0.000000, 0.000000, 0.000000, 7.000000, 10, '2026-02-17 05:50:02', NULL, 30, 10, 1, NULL, 0.000000, NULL, 10, 1, NULL, NULL, NULL, '10', NULL, NULL, NULL, NULL, '2026-02-17 05:50:02', '2026-02-17 05:50:02'),
(3, '1802263', NULL, 1, 1, 8.500000, 0.000000, 0.000000, 0.000000, 8.500000, 10, '2026-02-18 03:10:24', NULL, 30, 10, 1, NULL, 0.000000, NULL, 10, 1, NULL, NULL, NULL, '5', NULL, NULL, NULL, NULL, '2026-02-18 03:10:24', '2026-02-18 03:10:24'),
(4, '1802264', NULL, 1, 1, 2.500000, 0.000000, 0.000000, 0.000000, 2.500000, 10, '2026-02-18 03:12:19', NULL, 30, 10, 1, NULL, 0.000000, NULL, 10, 1, NULL, NULL, NULL, '5', NULL, NULL, NULL, NULL, '2026-02-18 03:12:19', '2026-02-18 03:12:19'),
(5, '1802265', NULL, 2, 1, 2.000000, 0.000000, 0.000000, 0.000000, 2.000000, 10, '2026-02-18 05:17:18', NULL, 30, 10, 1, NULL, 0.000000, NULL, 10, 1, NULL, NULL, NULL, '5', NULL, NULL, NULL, NULL, '2026-02-18 05:17:18', '2026-02-18 05:17:18'),
(6, '1802266', NULL, 2, 1, 7.500000, 0.000000, 0.000000, 0.000000, 7.500000, 10, '2026-02-18 05:18:08', NULL, 30, 10, 1, NULL, 0.000000, NULL, 10, 1, NULL, NULL, NULL, '5', NULL, NULL, NULL, NULL, '2026-02-18 05:18:08', '2026-02-18 05:18:08'),
(7, '1802267', NULL, 2, 1, 3.000000, 0.000000, 0.000000, 0.000000, 3.000000, 10, '2026-02-18 05:35:14', NULL, 30, 10, 1, NULL, 0.000000, NULL, 10, 1, NULL, NULL, NULL, '5', NULL, NULL, NULL, NULL, '2026-02-18 05:35:14', '2026-02-18 05:35:14'),
(8, '1802268', NULL, 2, 1, 9.500000, 0.000000, 0.000000, 0.000000, 9.500000, 10, '2026-02-18 05:43:38', NULL, 30, 10, 1, NULL, 0.000000, NULL, 10, 1, NULL, NULL, NULL, '5', NULL, NULL, NULL, NULL, '2026-02-18 05:43:38', '2026-02-18 05:43:38'),
(9, '1802269', NULL, 2, 1, 5.500000, 0.000000, 0.000000, 0.000000, 5.500000, 10, '2026-02-18 05:51:49', NULL, 30, 10, 1, NULL, 0.000000, NULL, 10, 1, NULL, NULL, NULL, '5', NULL, NULL, NULL, NULL, '2026-02-18 05:51:49', '2026-02-18 05:51:49'),
(10, '18022610', NULL, 2, 1, 5.500000, 0.000000, 0.000000, 0.000000, 5.500000, 10, '2026-02-18 06:00:59', NULL, 30, 10, 1, NULL, 0.000000, NULL, 10, 1, NULL, NULL, NULL, '5', NULL, NULL, NULL, NULL, '2026-02-18 06:00:59', '2026-02-18 06:00:59'),
(11, '18022611', '68686', 2, 1, 6.500000, 0.000000, 0.000000, 0.000000, 6.500000, 10, '2026-02-18 06:48:33', '06:48 - 07:18', 30, 10, 1, 1, 7.000000, NULL, 5, 4, NULL, NULL, NULL, '15', NULL, NULL, NULL, NULL, '2026-02-18 06:48:33', '2026-02-18 06:48:33'),
(12, '18022612', NULL, 2, 1, 6.500000, 0.000000, 0.000000, 0.000000, 6.500000, 10, '2026-02-18 15:22:15', NULL, 30, 10, 1, NULL, 0.000000, NULL, 10, 1, NULL, NULL, NULL, '5', NULL, NULL, NULL, NULL, '2026-02-18 15:22:15', '2026-02-18 15:22:15'),
(13, '19022613', '2403', 2, 1, 10.500000, 0.000000, 0.000000, 0.000000, 10.500000, 10, '2026-02-19 05:44:06', '05:44 - 06:14', 30, 10, 1, 1, 10.500000, 'Cash:10.50|Card:0.00', 5, 4, NULL, NULL, NULL, '15', NULL, NULL, NULL, NULL, '2026-02-19 05:44:06', '2026-02-19 05:44:06'),
(14, '19022614', '9477', 2, 1, 9.000000, 0.000000, 0.000000, 0.000000, 9.000000, 10, '2026-02-19 05:45:46', '05:45 - 06:15', 30, 10, 1, 2, NULL, '1235', 5, 4, NULL, NULL, NULL, '15', NULL, NULL, NULL, NULL, '2026-02-19 05:45:46', '2026-02-19 05:45:46'),
(15, '19022615', '7253', 2, 1, 4.000000, 0.000000, 0.000000, 0.000000, 4.000000, 10, '2026-02-19 05:46:28', '05:46 - 06:16', 30, 10, 1, 2, NULL, '5632', 5, 4, NULL, NULL, NULL, '15', NULL, NULL, NULL, NULL, '2026-02-19 05:46:28', '2026-02-19 05:46:28'),
(16, '19022616', '5073', 2, 1, 5.500000, 0.000000, 0.000000, 0.000000, 5.500000, 10, '2026-02-19 06:12:37', '06:12 - 06:42', 30, 10, 1, 1, 7.000000, 'Cash:1.00|Cash:2.00|Card:4.00', 5, 4, NULL, NULL, NULL, '15', NULL, NULL, NULL, NULL, '2026-02-19 06:12:37', '2026-02-19 06:12:37'),
(17, '19022617', '2582', 2, 1, 5.500000, 0.000000, 0.000000, 0.000000, 5.500000, 10, '2026-02-19 06:34:12', '06:34 - 07:04', 30, 10, 1, 1, 5.500000, 'Cash:2.00|Card:3.00|Card:0.50', 5, 4, NULL, NULL, NULL, '15', NULL, NULL, NULL, NULL, '2026-02-19 06:34:12', '2026-02-19 06:34:12'),
(18, '19022618', '3773', 2, 1, 9.500000, 0.000000, 0.000000, 0.000000, 9.500000, 10, '2026-02-19 06:38:57', '06:38 - 07:08', 30, 10, 1, 1, 11.000000, 'Cash:2.00|Card:8.00|Card:1.00', 5, 4, NULL, NULL, NULL, '15', NULL, NULL, NULL, NULL, '2026-02-19 06:38:57', '2026-02-19 06:38:57'),
(19, '19022619', '7210', 2, 1, 4.000000, 0.000000, 0.000000, 0.000000, 4.000000, 10, '2026-02-19 07:33:58', '07:33 - 08:03', 30, 10, 1, 1, 7.000000, 'Cash:1.00|Card:6.00', 5, 4, NULL, NULL, NULL, '15', NULL, NULL, NULL, NULL, '2026-02-19 07:33:58', '2026-02-19 07:33:58'),
(20, '19022620', NULL, 2, 1, 6.500000, 0.000000, 0.000000, 0.000000, 6.500000, 10, '2026-02-19 14:57:05', NULL, 30, 10, 1, NULL, 0.000000, NULL, 10, 1, NULL, NULL, NULL, '5', NULL, NULL, NULL, NULL, '2026-02-19 14:57:05', '2026-02-19 14:57:05'),
(21, '21022621', '3861', 2, 1, 9.000000, 0.000000, 0.000000, 0.000000, 9.000000, 10, '2026-02-21 21:59:47', '21:59 - 22:29', 30, 10, 1, 1, 10.000000, NULL, 5, 4, NULL, NULL, NULL, '15', NULL, NULL, NULL, NULL, '2026-02-21 21:59:47', '2026-02-21 21:59:47'),
(22, '22022622', '9166', 2, 1, 4.000000, 0.000000, 0.000000, 0.000000, 4.000000, 10, '2026-02-22 03:30:11', '03:30 - 04:00', 30, 10, 1, 1, 7.000000, 'Cash:2.00|Card:5.00', 5, 4, NULL, NULL, NULL, '15', NULL, NULL, NULL, NULL, '2026-02-22 03:30:11', '2026-02-22 03:30:11');

-- --------------------------------------------------------

--
-- Table structure for table `order_addresses`
--

CREATE TABLE `order_addresses` (
  `id` bigint UNSIGNED NOT NULL,
  `order_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `apartment` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitude` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_coupons`
--

CREATE TABLE `order_coupons` (
  `id` bigint UNSIGNED NOT NULL,
  `order_id` bigint UNSIGNED NOT NULL,
  `coupon_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `discount` decimal(19,6) NOT NULL,
  `creator_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_id` bigint DEFAULT NULL,
  `editor_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `editor_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint UNSIGNED NOT NULL,
  `order_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `item_id` bigint UNSIGNED NOT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  `discount` decimal(19,6) NOT NULL,
  `tax_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_rate` decimal(19,6) DEFAULT NULL,
  `tax_type` tinyint DEFAULT NULL,
  `tax_amount` decimal(19,6) DEFAULT NULL,
  `price` decimal(19,6) NOT NULL,
  `item_variations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `item_extras` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `item_variation_total` decimal(19,6) DEFAULT '0.000000',
  `item_extra_total` decimal(19,6) DEFAULT '0.000000',
  `total_price` decimal(19,6) DEFAULT '0.000000',
  `instruction` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `creator_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_id` bigint DEFAULT NULL,
  `editor_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `editor_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `branch_id`, `item_id`, `quantity`, `discount`, `tax_name`, `tax_rate`, `tax_type`, `tax_amount`, `price`, `item_variations`, `item_extras`, `item_variation_total`, `item_extra_total`, `total_price`, `instruction`, `creator_type`, `creator_id`, `editor_type`, `editor_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 10, 1, 0.000000, NULL, 0.000000, 5, 0.000000, 2.500000, '[]', '[]', 0.000000, 0.000000, 2.500000, '', NULL, NULL, NULL, NULL, NULL, NULL),
(2, 2, 1, 18, 1, 0.000000, NULL, 0.000000, 5, 0.000000, 3.500000, '[]', '[]', 0.000000, 0.000000, 3.500000, '', NULL, NULL, NULL, NULL, NULL, NULL),
(3, 2, 1, 27, 1, 0.000000, NULL, 0.000000, 5, 0.000000, 3.500000, '[]', '[]', 0.000000, 0.000000, 3.500000, '', NULL, NULL, NULL, NULL, NULL, NULL),
(4, 3, 1, 19, 1, 0.000000, NULL, 0.000000, 5, 0.000000, 4.000000, '[]', '[]', 0.000000, 0.000000, 4.000000, '', NULL, NULL, NULL, NULL, NULL, NULL),
(5, 3, 1, 42, 1, 0.000000, NULL, 0.000000, 5, 0.000000, 2.500000, '[]', '[]', 0.000000, 0.000000, 2.500000, '', NULL, NULL, NULL, NULL, NULL, NULL),
(6, 3, 1, 53, 1, 0.000000, NULL, 0.000000, 5, 0.000000, 2.000000, '[]', '[]', 0.000000, 0.000000, 2.000000, '', NULL, NULL, NULL, NULL, NULL, NULL),
(7, 4, 1, 10, 1, 0.000000, NULL, 0.000000, 5, 0.000000, 2.500000, '[]', '[]', 0.000000, 0.000000, 2.500000, '', NULL, NULL, NULL, NULL, NULL, NULL),
(8, 5, 1, 11, 1, 0.000000, NULL, 0.000000, 5, 0.000000, 2.000000, '[]', '[]', 0.000000, 0.000000, 2.000000, '', NULL, NULL, NULL, NULL, NULL, NULL),
(9, 6, 1, 7, 1, 0.000000, NULL, 0.000000, 5, 0.000000, 4.000000, '[]', '[]', 0.000000, 0.000000, 4.000000, '', NULL, NULL, NULL, NULL, NULL, NULL),
(10, 6, 1, 8, 1, 0.000000, NULL, 0.000000, 5, 0.000000, 3.500000, '[]', '[]', 0.000000, 0.000000, 3.500000, '', NULL, NULL, NULL, NULL, NULL, NULL),
(11, 7, 1, 9, 1, 0.000000, NULL, 0.000000, 5, 0.000000, 3.000000, '[]', '[]', 0.000000, 0.000000, 3.000000, '', NULL, NULL, NULL, NULL, NULL, NULL),
(12, 8, 1, 6, 1, 0.000000, NULL, 0.000000, 5, 0.000000, 5.500000, '[]', '[]', 0.000000, 0.000000, 5.500000, '', NULL, NULL, NULL, NULL, NULL, NULL),
(13, 8, 1, 7, 1, 0.000000, NULL, 0.000000, 5, 0.000000, 4.000000, '[]', '[]', 0.000000, 0.000000, 4.000000, '', NULL, NULL, NULL, NULL, NULL, NULL),
(14, 9, 1, 6, 1, 0.000000, NULL, 0.000000, 5, 0.000000, 5.500000, '[]', '[]', 0.000000, 0.000000, 5.500000, '', NULL, NULL, NULL, NULL, NULL, NULL),
(15, 10, 1, 6, 1, 0.000000, NULL, 0.000000, 5, 0.000000, 5.500000, '[]', '[]', 0.000000, 0.000000, 5.500000, '', NULL, NULL, NULL, NULL, NULL, NULL),
(16, 11, 1, 25, 1, 0.000000, NULL, 0.000000, 5, 0.000000, 3.000000, '[]', '[]', 0.000000, 0.000000, 3.000000, '', NULL, NULL, NULL, NULL, NULL, NULL),
(17, 11, 1, 23, 1, 0.000000, NULL, 0.000000, 5, 0.000000, 3.500000, '[]', '[]', 0.000000, 0.000000, 3.500000, '', NULL, NULL, NULL, NULL, NULL, NULL),
(18, 12, 1, 9, 1, 0.000000, NULL, 0.000000, 5, 0.000000, 3.000000, '[]', '[]', 0.000000, 0.000000, 3.000000, '', NULL, NULL, NULL, NULL, NULL, NULL),
(19, 12, 1, 8, 1, 0.000000, NULL, 0.000000, 5, 0.000000, 3.500000, '[]', '[]', 0.000000, 0.000000, 3.500000, '', NULL, NULL, NULL, NULL, NULL, NULL),
(20, 13, 1, 25, 1, 0.000000, NULL, 0.000000, 5, 0.000000, 3.000000, '[]', '[]', 0.000000, 0.000000, 3.000000, '', NULL, NULL, NULL, NULL, NULL, NULL),
(21, 13, 1, 23, 1, 0.000000, NULL, 0.000000, 5, 0.000000, 3.500000, '[]', '[]', 0.000000, 0.000000, 3.500000, '', NULL, NULL, NULL, NULL, NULL, NULL),
(22, 13, 1, 7, 1, 0.000000, NULL, 0.000000, 5, 0.000000, 4.000000, '[]', '[]', 0.000000, 0.000000, 4.000000, '', NULL, NULL, NULL, NULL, NULL, NULL),
(23, 14, 1, 12, 1, 0.000000, NULL, 0.000000, 5, 0.000000, 3.500000, '[]', '[]', 0.000000, 0.000000, 3.500000, '', NULL, NULL, NULL, NULL, NULL, NULL),
(24, 14, 1, 6, 1, 0.000000, NULL, 0.000000, 5, 0.000000, 5.500000, '[]', '[]', 0.000000, 0.000000, 5.500000, '', NULL, NULL, NULL, NULL, NULL, NULL),
(25, 15, 1, 7, 1, 0.000000, NULL, 0.000000, 5, 0.000000, 4.000000, '[]', '[]', 0.000000, 0.000000, 4.000000, '', NULL, NULL, NULL, NULL, NULL, NULL),
(26, 16, 1, 6, 1, 0.000000, NULL, 0.000000, 5, 0.000000, 5.500000, '[]', '[]', 0.000000, 0.000000, 5.500000, '', NULL, NULL, NULL, NULL, NULL, NULL),
(27, 17, 1, 6, 1, 0.000000, NULL, 0.000000, 5, 0.000000, 5.500000, '[]', '[]', 0.000000, 0.000000, 5.500000, '', NULL, NULL, NULL, NULL, NULL, NULL),
(28, 18, 1, 6, 1, 0.000000, NULL, 0.000000, 5, 0.000000, 5.500000, '[]', '[]', 0.000000, 0.000000, 5.500000, '', NULL, NULL, NULL, NULL, NULL, NULL),
(29, 18, 1, 7, 1, 0.000000, NULL, 0.000000, 5, 0.000000, 4.000000, '[]', '[]', 0.000000, 0.000000, 4.000000, '', NULL, NULL, NULL, NULL, NULL, NULL),
(30, 19, 1, 7, 1, 0.000000, NULL, 0.000000, 5, 0.000000, 4.000000, '[]', '[]', 0.000000, 0.000000, 4.000000, '', NULL, NULL, NULL, NULL, NULL, NULL),
(31, 20, 1, 8, 1, 0.000000, NULL, 0.000000, 5, 0.000000, 3.500000, '[]', '[]', 0.000000, 0.000000, 3.500000, '', NULL, NULL, NULL, NULL, NULL, NULL),
(32, 20, 1, 9, 1, 0.000000, NULL, 0.000000, 5, 0.000000, 3.000000, '[]', '[]', 0.000000, 0.000000, 3.000000, '', NULL, NULL, NULL, NULL, NULL, NULL),
(33, 21, 1, 25, 1, 0.000000, NULL, 0.000000, 5, 0.000000, 3.000000, '[]', '[]', 0.000000, 0.000000, 3.000000, '', NULL, NULL, NULL, NULL, NULL, NULL),
(34, 21, 1, 23, 1, 0.000000, NULL, 0.000000, 5, 0.000000, 3.500000, '[]', '[]', 0.000000, 0.000000, 3.500000, '', NULL, NULL, NULL, NULL, NULL, NULL),
(35, 21, 1, 14, 1, 0.000000, NULL, 0.000000, 5, 0.000000, 2.500000, '[]', '[]', 0.000000, 0.000000, 2.500000, '', NULL, NULL, NULL, NULL, NULL, NULL),
(36, 22, 1, 7, 1, 0.000000, NULL, 0.000000, 5, 0.000000, 4.000000, '[]', '[]', 0.000000, 0.000000, 4.000000, '', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `otps`
--

CREATE TABLE `otps` (
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `menu_section_id` bigint UNSIGNED NOT NULL,
  `template_id` bigint DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '5' COMMENT '5=Active, 10=Inactive',
  `creator_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_id` bigint DEFAULT NULL,
  `editor_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `editor_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_gateways`
--

CREATE TABLE `payment_gateways` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `misc` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint NOT NULL DEFAULT '5' COMMENT '5=Active, 10=Inactive',
  `creator_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_id` bigint DEFAULT NULL,
  `editor_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `editor_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_gateways`
--

INSERT INTO `payment_gateways` (`id`, `name`, `slug`, `misc`, `status`, `creator_type`, `creator_id`, `editor_type`, `editor_id`, `created_at`, `updated_at`) VALUES
(1, 'Cash On Delivery', 'cash-on-delivery', 'null', 5, NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(2, 'Credit', 'credit', 'null', 5, NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(3, 'Paypal', 'paypal', 'null', 10, NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(4, 'Stripe', 'stripe', '{\"input\":[\"stripe.stripeInput.blade.php\"],\"js\":[\"stripe.stripeJs.blade.php\"],\"submit\":true}', 10, NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(5, 'Flutterwave', 'flutterwave', 'null', 10, NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(6, 'Paystack', 'paystack', 'null', 10, NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(7, 'SslCommerz', 'sslcommerz', 'null', 10, NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(8, 'Mollie', 'mollie', 'null', 10, NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(9, 'Senangpay', 'senangpay', 'null', 10, NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(10, 'Bkash', 'bkash', 'null', 10, NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(11, 'Paytm', 'paytm', 'null', 10, NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(12, 'Razorpay', 'razorpay', '{\"input\":[],\"js\":[\"razorpay.razorpayJs.blade.php\"],\"submit\":false}', 10, NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(13, 'Mercadopago', 'mercadopago', 'null', 10, NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(14, 'Cashfree', 'cashfree', 'null', 10, NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(15, 'Payfast', 'payfast', 'null', 10, NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(16, 'Skrill', 'skrill', 'null', 10, NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(17, 'PhonePe', 'phonepe', 'null', 10, NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(18, 'Telr', 'telr', 'null', 10, NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(19, 'Iyzico', 'iyzico', 'null', 10, NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(20, 'Pesapal', 'pesapal', 'null', 10, NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(21, 'Midtrans', 'midtrans', 'null', 10, NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(22, 'TwoCheckout', 'twocheckout', 'null', 10, NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(23, 'MyFatoorah', 'myfatoorah', 'null', 10, NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(24, 'EasyPaisa', 'easypaisa', 'null', 10, NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent` bigint UNSIGNED DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `title`, `name`, `guard_name`, `url`, `parent`, `created_at`, `updated_at`) VALUES
(1, 'Dashboard', 'dashboard', 'sanctum', 'dashboard', 0, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(2, 'Items', 'items', 'sanctum', 'items', 0, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(3, 'Items Create', 'items_create', 'sanctum', 'items/create', 2, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(4, 'Items Edit', 'items_edit', 'sanctum', 'items/edit', 2, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(5, 'Items Delete', 'items_delete', 'sanctum', 'items/delete', 2, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(6, 'Items Show', 'items_show', 'sanctum', 'items/show', 2, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(7, 'Dining Tables', 'dining-tables', 'sanctum', 'dining-tables', 0, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(8, 'Dining Tables Create', 'dining_tables_create', 'sanctum', 'dining-tables/create', 7, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(9, 'Dining Tables Edit', 'dining_tables_edit', 'sanctum', 'dining-tables/edit', 7, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(10, 'Dining Tables Delete', 'dining_tables_delete', 'sanctum', 'dining-tables/delete', 7, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(11, 'Dining Tables Show', 'dining_tables_show', 'sanctum', 'dining-tables/show', 7, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(12, 'POS', 'pos', 'sanctum', 'pos', 0, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(13, 'POS Orders', 'pos-orders', 'sanctum', 'pos-orders', 0, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(14, 'Online Orders', 'online-orders', 'sanctum', 'online-orders', 0, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(15, 'Table Orders', 'table-orders', 'sanctum', 'table-orders', 0, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(16, 'K.D.S', 'kitchen-display-system', 'sanctum', 'kitchen-display-system', 0, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(17, 'O.S.S', 'order-status-screen', 'sanctum', 'order-status-screen', 0, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(18, 'Coupons', 'coupons', 'sanctum', 'coupons', 0, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(19, 'Coupons Create', 'coupons_create', 'sanctum', 'coupons/create', 18, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(20, 'Coupons Edit', 'coupons_edit', 'sanctum', 'coupons/edit', 18, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(21, 'Coupons Delete', 'coupons_delete', 'sanctum', 'coupons/delete', 18, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(22, 'Coupons Show', 'coupons_show', 'sanctum', 'coupons/show', 18, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(23, 'Offers', 'offers', 'sanctum', 'offers', 0, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(24, 'Offers Create', 'offers_create', 'sanctum', 'offers/create', 23, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(25, 'Offers Edit', 'offers_edit', 'sanctum', 'offers/edit', 23, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(26, 'Offers Delete', 'offers_delete', 'sanctum', 'offers/delete', 23, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(27, 'Offers Show', 'offers_show', 'sanctum', 'offers/show', 23, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(28, 'Push Notifications', 'push-notifications', 'sanctum', 'push-notifications', 0, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(29, 'Push Notifications Create', 'push-notifications_create', 'sanctum', 'push-notifications/create', 28, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(30, 'Push Notifications Edit', 'push-notifications_edit', 'sanctum', 'push-notifications/edit', 28, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(31, 'Push Notifications Delete', 'push-notifications_delete', 'sanctum', 'push-notifications/delete', 28, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(32, 'Push Notifications Show', 'push-notifications_show', 'sanctum', 'push-notifications/show', 28, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(33, 'Messages', 'messages', 'sanctum', 'messages', 0, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(34, 'Subscribers', 'subscribers', 'sanctum', 'subscribers', 0, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(35, 'Administrators', 'administrators', 'sanctum', 'administrators', 0, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(36, 'Administrators Create', 'administrators_create', 'sanctum', 'administrators/create', 35, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(37, 'Administrators Edit', 'administrators_edit', 'sanctum', 'administrators/edit', 35, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(38, 'Administrators Delete', 'administrators_delete', 'sanctum', 'administrators/delete', 35, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(39, 'Administrators Show', 'administrators_show', 'sanctum', 'administrators/show', 35, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(40, 'Delivery Boys', 'delivery-boys', 'sanctum', 'delivery-boys', 0, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(41, 'Delivery Boys Create', 'delivery-boys_create', 'sanctum', 'delivery-boys/create', 40, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(42, 'Delivery Boys Edit', 'delivery-boys_edit', 'sanctum', 'delivery-boys/edit', 40, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(43, 'Delivery Boys Delete', 'delivery-boys_delete', 'sanctum', 'delivery-boys/delete', 40, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(44, 'Delivery Boys Show', 'delivery-boys_show', 'sanctum', 'delivery-boys/show', 40, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(45, 'Customers', 'customers', 'sanctum', 'customers', 0, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(46, 'Customers Create', 'customers_create', 'sanctum', 'customers/create', 45, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(47, 'Customers Edit', 'customers_edit', 'sanctum', 'customers/edit', 45, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(48, 'Customers Delete', 'customers_delete', 'sanctum', 'customers/delete', 45, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(49, 'Customers Show', 'customers_show', 'sanctum', 'customers/show', 45, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(50, 'Employees', 'employees', 'sanctum', 'employees', 0, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(51, 'Employees Create', 'employees_create', 'sanctum', 'employees/create', 50, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(52, 'Employees Edit', 'employees_edit', 'sanctum', 'employees/edit', 50, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(53, 'Employees Delete', 'employees_delete', 'sanctum', 'employees/delete', 50, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(54, 'Employees Show', 'employees_show', 'sanctum', 'employees/show', 50, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(55, 'Waiters', 'waiters', 'sanctum', 'waiters', 0, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(56, 'Waiters Create', 'waiters_create', 'sanctum', 'waiters/create', 55, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(57, 'Waiters Edit', 'waiters_edit', 'sanctum', 'waiters/edit', 55, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(58, 'Waiters Delete', 'waiters_delete', 'sanctum', 'waiters/delete', 55, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(59, 'Waiters Show', 'waiters_show', 'sanctum', 'waiters/show', 55, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(60, 'Chefs', 'chefs', 'sanctum', 'chefs', 0, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(61, 'Chefs Create', 'chefs_create', 'sanctum', 'chefs/create', 60, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(62, 'Chefs Edit', 'chefs_edit', 'sanctum', 'chefs/edit', 60, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(63, 'Chefs Delete', 'chefs_delete', 'sanctum', 'chefs/delete', 60, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(64, 'Chefs Show', 'chefs_show', 'sanctum', 'chefs/show', 60, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(65, 'Transactions', 'transactions', 'sanctum', 'transactions', 0, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(66, 'Sales Report', 'sales-report', 'sanctum', 'sales-report', 0, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(67, 'Items Report', 'items-report', 'sanctum', 'items-report', 0, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(68, 'Credit Balance Report', 'credit-balance-report', 'sanctum', 'credit-balance-report', 0, '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(69, 'Settings', 'settings', 'sanctum', 'settings', 0, '2026-02-15 05:52:21', '2026-02-15 05:52:21');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(7, 'App\\Models\\User', 1, 'auth_token', 'cbb1c2048ae9e117e86d282ec3563d163cda61aaeedb88e5d1b8ab30c1ac7b9a', '[\"*\"]', '2026-02-24 00:37:39', NULL, '2026-02-17 02:51:12', '2026-02-24 00:37:39'),
(2, 'App\\Models\\User', 1, 'auth_token', '9466539a0f3f92acc25a2af145aeab66911fee13881619927eb2a737afb563ee', '[\"*\"]', '2026-02-16 18:25:51', NULL, '2026-02-16 16:50:57', '2026-02-16 18:25:51'),
(3, 'App\\Models\\User', 1, 'auth_token', 'dccb3f344cc2c597ba6f622509e590854a11b9d7c021a69160b84719e7ad5ca2', '[\"*\"]', '2026-02-16 18:38:33', NULL, '2026-02-16 18:25:51', '2026-02-16 18:38:33'),
(4, 'App\\Models\\User', 1, 'auth_token', 'bae49cd899ba528f7d6f54d40fa8f32568fd8908b59f143c08651f947e84cc83', '[\"*\"]', '2026-02-16 19:09:50', NULL, '2026-02-16 18:38:33', '2026-02-16 19:09:50'),
(5, 'App\\Models\\User', 1, 'auth_token', '63a9a6453578a95e4b025596773d6d5d44c602af4d9f650b95b854a77d89eb65', '[\"*\"]', '2026-02-16 21:30:57', NULL, '2026-02-16 19:09:50', '2026-02-16 21:30:57'),
(6, 'App\\Models\\User', 1, 'auth_token', 'e310cc6de6a6ce956263d1254506e5e802a42bd4bdc970d01bcc93f4395c43cb', '[\"*\"]', '2026-02-17 05:30:17', NULL, '2026-02-16 21:30:57', '2026-02-17 05:30:17'),
(8, 'App\\Models\\User', 1, 'auth_token', '0892305f8c843061cc9ec984b664c6db4341add95cf66ca932813a336b676919', '[\"*\"]', '2026-02-17 05:01:32', NULL, '2026-02-17 05:01:30', '2026-02-17 05:01:32'),
(9, 'App\\Models\\User', 1, 'auth_token', '100169d833c5268a35b5e53a3353bde24ad65dd2fc622e192f5c1a793ce9d561', '[\"*\"]', '2026-02-17 05:09:24', NULL, '2026-02-17 05:01:31', '2026-02-17 05:09:24'),
(10, 'App\\Models\\User', 1, 'auth_token', 'ea290a7524cc410090a974a0abc2ce4081ab060d08031ebab9d460b918411e99', '[\"*\"]', '2026-02-17 05:09:24', NULL, '2026-02-17 05:09:22', '2026-02-17 05:09:24'),
(11, 'App\\Models\\User', 1, 'auth_token', 'f32d7149009af34e1dcb9239ee316dc1a5c76944e55d0aabc07b923967169bc6', '[\"*\"]', '2026-02-17 05:09:36', NULL, '2026-02-17 05:09:23', '2026-02-17 05:09:36'),
(12, 'App\\Models\\User', 1, 'auth_token', 'fefb0803348bdae733ceb0b72130de1b572f84734df6258d6cfc7c8a466021a2', '[\"*\"]', '2026-02-17 05:10:39', NULL, '2026-02-17 05:10:37', '2026-02-17 05:10:39'),
(13, 'App\\Models\\User', 1, 'auth_token', 'e1efd448c99619fafbc43e7f8630260867d68499d09dc3ac281f310c038eea22', '[\"*\"]', '2026-02-17 05:10:46', NULL, '2026-02-17 05:10:39', '2026-02-17 05:10:46'),
(14, 'App\\Models\\User', 1, 'auth_token', '4d63b93aec51c643e49be557bbb6abb81236bda64068047ce41b7f03bfef5c9b', '[\"*\"]', '2026-02-17 05:24:37', NULL, '2026-02-17 05:24:37', '2026-02-17 05:24:37'),
(15, 'App\\Models\\User', 1, 'auth_token', 'd989349189a8e1950ab228819dc66fcc74e8b9830e752407b033d1733ea0646b', '[\"*\"]', '2026-02-17 05:24:47', NULL, '2026-02-17 05:24:37', '2026-02-17 05:24:47'),
(16, 'App\\Models\\User', 1, 'auth_token', '7ef6c073594d75a20ae81eecacdcad00bf6f848f2d27db4e0f39fba03acb1011', '[\"*\"]', '2026-02-17 05:30:20', NULL, '2026-02-17 05:30:17', '2026-02-17 05:30:20'),
(17, 'App\\Models\\User', 3, 'auth_token', '78e51d77a7ba9d4dfa89f222fa551f816815f4bee6838cb8007bca8604945656', '[\"*\"]', '2026-02-17 05:50:02', NULL, '2026-02-17 05:49:37', '2026-02-17 05:50:02'),
(18, 'App\\Models\\User', 1, 'auth_token', '4ff800dfcf842dc5923ef5de202c3fda0999f5a8e6cad4d584ada47b2c6842ef', '[\"*\"]', '2026-02-18 03:37:27', NULL, '2026-02-18 01:11:45', '2026-02-18 03:37:27'),
(19, 'App\\Models\\User', 1, 'auth_token', '5cc4821fcbb222e73951d578e74841727535efde993c720fec12d79bf974037f', '[\"*\"]', '2026-02-18 03:42:40', NULL, '2026-02-18 03:07:50', '2026-02-18 03:42:40'),
(31, 'App\\Models\\User', 1, 'auth_token', 'bbf67779c0e7dd8bf4aa84638af54b17913e01c1f732293c6110fe02e7a72cbc', '[\"*\"]', '2026-02-22 08:41:31', NULL, '2026-02-22 08:39:40', '2026-02-22 08:41:31'),
(28, 'App\\Models\\User', 2, 'auth_token', '25797116a77d3a80112030321e405924b94a57fbda35e08e1e8f16772599df20', '[\"*\"]', '2026-02-19 14:59:35', NULL, '2026-02-19 14:53:00', '2026-02-19 14:59:35'),
(30, 'App\\Models\\User', 1, 'auth_token', 'f3892b479a6be0c5bd6f8fea52eea8e97af1560e8063b0cd18348c884b566943', '[\"*\"]', '2026-02-23 02:16:59', NULL, '2026-02-21 04:10:59', '2026-02-23 02:16:59');

-- --------------------------------------------------------

--
-- Table structure for table `pesapals`
--

CREATE TABLE `pesapals` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `first_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `middle_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` bigint UNSIGNED DEFAULT NULL,
  `billing_address_line_1` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_address_line_2` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `amount` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `merchant_reference` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `tracking_id` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payment_method` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `push_notifications`
--

CREATE TABLE `push_notifications` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` bigint UNSIGNED DEFAULT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `branch_id` bigint UNSIGNED DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `push_notifications`
--

INSERT INTO `push_notifications` (`id`, `title`, `description`, `role_id`, `user_id`, `branch_id`, `created_at`, `updated_at`) VALUES
(1, 'Hi', 'Hi Jamial', 1, 1, 1, '2026-02-18 03:13:41', '2026-02-18 03:13:41'),
(2, 'Hi 2', 'Hi 2', 1, 1, 1, '2026-02-18 03:16:25', '2026-02-18 03:16:25'),
(3, 'Hi', 'Hi', 6, 3, 1, '2026-02-18 03:31:42', '2026-02-18 03:31:42');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'sanctum', '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(2, 'Customer', 'sanctum', '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(3, 'Delivery Boy', 'sanctum', '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(4, 'Waiter', 'sanctum', '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(5, 'Chef', 'sanctum', '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(6, 'Branch Manager', 'sanctum', '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(7, 'POS Operator', 'sanctum', '2026-02-15 05:52:21', '2026-02-15 05:52:21'),
(8, 'Stuff', 'sanctum', '2026-02-15 05:52:21', '2026-02-15 05:52:21');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 5),
(1, 6),
(1, 7),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(7, 6),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(12, 6),
(12, 7),
(13, 1),
(13, 6),
(13, 7),
(14, 1),
(14, 6),
(15, 1),
(15, 6),
(16, 1),
(16, 5),
(16, 6),
(17, 1),
(17, 5),
(17, 6),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(28, 6),
(29, 1),
(29, 6),
(30, 1),
(30, 6),
(31, 1),
(31, 6),
(32, 1),
(32, 6),
(33, 1),
(33, 6),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(40, 6),
(41, 1),
(41, 6),
(42, 1),
(42, 6),
(43, 1),
(43, 6),
(44, 1),
(44, 6),
(45, 1),
(45, 6),
(46, 1),
(46, 6),
(47, 1),
(47, 6),
(48, 1),
(48, 6),
(49, 1),
(49, 6),
(50, 1),
(50, 6),
(51, 1),
(51, 6),
(52, 1),
(52, 6),
(53, 1),
(53, 6),
(54, 1),
(54, 6),
(55, 1),
(55, 6),
(56, 1),
(56, 6),
(57, 1),
(57, 6),
(58, 1),
(58, 6),
(59, 1),
(59, 6),
(60, 1),
(60, 6),
(61, 1),
(61, 6),
(62, 1),
(62, 6),
(63, 1),
(63, 6),
(64, 1),
(64, 6),
(65, 1),
(65, 6),
(66, 1),
(66, 6),
(67, 1),
(68, 1),
(69, 1);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint UNSIGNED NOT NULL,
  `group` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` json NOT NULL,
  `settingable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settingable_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `group`, `key`, `payload`, `settingable_type`, `settingable_id`, `created_at`, `updated_at`) VALUES
(1, 'company', 'company_name', '{\"$cast\": null, \"$value\": \"Restaurant Food Ordering & Delivery App\"}', NULL, NULL, '2026-02-17 02:36:27', '2026-02-17 02:36:27'),
(2, 'company', 'company_email', '{\"$cast\": null, \"$value\": \"info@iclouds.co.uk\"}', NULL, NULL, '2026-02-17 02:36:27', '2026-02-17 02:36:27'),
(3, 'company', 'company_phone', '{\"$cast\": null, \"$value\": \"+13333846282\"}', NULL, NULL, '2026-02-17 02:36:27', '2026-02-17 02:36:27'),
(4, 'company', 'company_website', '{\"$cast\": null, \"$value\": \"https://iclouds.co.uk\"}', NULL, NULL, '2026-02-17 02:36:27', '2026-02-17 02:36:27'),
(5, 'company', 'company_city', '{\"$cast\": null, \"$value\": \"Mirpur 1\"}', NULL, NULL, '2026-02-17 02:36:27', '2026-02-17 02:36:27'),
(6, 'company', 'company_state', '{\"$cast\": null, \"$value\": \"Oxford\"}', NULL, NULL, '2026-02-17 02:36:27', '2026-02-17 02:36:27'),
(7, 'company', 'company_country_code', '{\"$cast\": null, \"$value\": \"GBR\"}', NULL, NULL, '2026-02-17 02:36:27', '2026-02-17 02:36:27'),
(8, 'company', 'company_zip_code', '{\"$cast\": null, \"$value\": \"OX44BT\"}', NULL, NULL, '2026-02-17 02:36:27', '2026-02-17 02:36:27'),
(9, 'company', 'company_address', '{\"$cast\": null, \"$value\": \"17 Freeland Road, Oxford, OX44BT\"}', NULL, NULL, '2026-02-17 02:36:27', '2026-02-17 02:36:27'),
(10, 'site', 'site_date_format', '{\"$cast\": null, \"$value\": \"d-m-Y\"}', NULL, NULL, '2026-02-16 05:25:42', '2026-02-16 05:25:42'),
(11, 'site', 'site_time_format', '{\"$cast\": null, \"$value\": \"h:i A\"}', NULL, NULL, '2026-02-16 05:25:42', '2026-02-16 05:25:42'),
(12, 'site', 'site_default_timezone', '{\"$cast\": null, \"$value\": \"Europe/Istanbul\"}', NULL, NULL, '2026-02-16 05:25:42', '2026-02-16 05:25:42'),
(13, 'site', 'site_default_branch', '{\"$cast\": null, \"$value\": 1}', NULL, NULL, '2026-02-16 05:25:42', '2026-02-16 05:25:42'),
(14, 'site', 'site_default_currency', '{\"$cast\": null, \"$value\": 2}', NULL, NULL, '2026-02-16 05:25:42', '2026-02-16 05:25:42'),
(15, 'site', 'site_default_currency_symbol', '{\"$cast\": null, \"$value\": \"£\"}', NULL, NULL, '2026-02-16 05:25:43', '2026-02-16 05:25:43'),
(16, 'site', 'site_currency_position', '{\"$cast\": null, \"$value\": 5}', NULL, NULL, '2026-02-16 05:25:42', '2026-02-16 05:25:42'),
(17, 'site', 'site_digit_after_decimal_point', '{\"$cast\": null, \"$value\": \"2\"}', NULL, NULL, '2026-02-16 05:25:42', '2026-02-16 05:25:42'),
(18, 'site', 'site_email_verification', '{\"$cast\": null, \"$value\": 5}', NULL, NULL, '2026-02-16 05:25:42', '2026-02-16 05:25:42'),
(19, 'site', 'site_phone_verification', '{\"$cast\": null, \"$value\": 10}', NULL, NULL, '2026-02-16 05:25:42', '2026-02-16 05:25:42'),
(20, 'site', 'site_default_language', '{\"$cast\": null, \"$value\": 1}', NULL, NULL, '2026-02-16 05:25:42', '2026-02-16 05:25:42'),
(21, 'site', 'site_google_map_key', '{\"$cast\": null, \"$value\": \"AIzaSyDraZaF-CUoNpwvEiCRE4OtCMFfriq1hZM\"}', NULL, NULL, '2026-02-16 05:25:42', '2026-02-16 05:25:42'),
(22, 'site', 'site_android_app_link', '{\"$cast\": null, \"$value\": null}', NULL, NULL, '2026-02-16 05:25:42', '2026-02-16 05:25:42'),
(23, 'site', 'site_ios_app_link', '{\"$cast\": null, \"$value\": null}', NULL, NULL, '2026-02-16 05:25:42', '2026-02-16 05:25:42'),
(24, 'site', 'site_copyright', '{\"$cast\": null, \"$value\": \"© 2025 iClouds PWA. All rights reserved.\"}', NULL, NULL, '2026-02-16 05:25:42', '2026-02-16 05:25:42'),
(25, 'site', 'site_language_switch', '{\"$cast\": null, \"$value\": 5}', NULL, NULL, '2026-02-16 05:25:42', '2026-02-16 05:25:42'),
(26, 'site', 'site_app_debug', '{\"$cast\": null, \"$value\": 10}', NULL, NULL, '2026-02-16 05:25:42', '2026-02-16 05:25:42'),
(27, 'site', 'site_auto_update', '{\"$cast\": null, \"$value\": 10}', NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(28, 'site', 'site_online_payment_gateway', '{\"$cast\": null, \"$value\": 10}', NULL, NULL, '2026-02-16 05:25:42', '2026-02-16 05:25:42'),
(29, 'site', 'site_default_sms_gateway', '{\"$cast\": null, \"$value\": null}', NULL, NULL, '2026-02-16 05:25:43', '2026-02-16 05:25:43'),
(30, 'site', 'site_guest_login', '{\"$cast\": null, \"$value\": 5}', NULL, NULL, '2026-02-16 05:25:43', '2026-02-16 05:25:43'),
(31, 'site', 'site_default_phone_digit_length', '{\"$cast\": null, \"$value\": 10}', NULL, NULL, '2026-02-16 05:25:43', '2026-02-16 05:25:43'),
(32, 'mail', 'mail_mailer', '{\"$cast\": null, \"$value\": \"smtp\"}', NULL, NULL, '2026-02-15 05:52:23', '2026-02-15 05:52:23'),
(33, 'mail', 'mail_host', '{\"$cast\": null, \"$value\": \"\"}', NULL, NULL, '2026-02-15 05:52:23', '2026-02-15 05:52:23'),
(34, 'mail', 'mail_port', '{\"$cast\": null, \"$value\": \"0\"}', NULL, NULL, '2026-02-15 05:52:23', '2026-02-15 05:52:23'),
(35, 'mail', 'mail_username', '{\"$cast\": null, \"$value\": \"\"}', NULL, NULL, '2026-02-15 05:52:23', '2026-02-15 05:52:23'),
(36, 'mail', 'mail_password', '{\"$cast\": null, \"$value\": \"\"}', NULL, NULL, '2026-02-15 05:52:23', '2026-02-15 05:52:23'),
(37, 'mail', 'mail_encryption', '{\"$cast\": null, \"$value\": \"\"}', NULL, NULL, '2026-02-15 05:52:23', '2026-02-15 05:52:23'),
(38, 'mail', 'mail_from_name', '{\"$cast\": null, \"$value\": \"\"}', NULL, NULL, '2026-02-15 05:52:23', '2026-02-15 05:52:23'),
(39, 'mail', 'mail_from_email', '{\"$cast\": null, \"$value\": \"\"}', NULL, NULL, '2026-02-15 05:52:23', '2026-02-15 05:52:23'),
(40, 'order_setup', 'order_setup_food_preparation_time', '{\"$cast\": null, \"$value\": \"30\"}', NULL, NULL, '2026-02-15 05:52:23', '2026-02-15 05:52:23'),
(41, 'order_setup', 'order_setup_schedule_order_slot_duration', '{\"$cast\": null, \"$value\": \"30\"}', NULL, NULL, '2026-02-15 05:52:23', '2026-02-15 05:52:23'),
(42, 'order_setup', 'order_setup_takeaway', '{\"$cast\": null, \"$value\": 5}', NULL, NULL, '2026-02-15 05:52:23', '2026-02-15 05:52:23'),
(43, 'order_setup', 'order_setup_delivery', '{\"$cast\": null, \"$value\": 5}', NULL, NULL, '2026-02-15 05:52:23', '2026-02-15 05:52:23'),
(44, 'order_setup', 'order_setup_free_delivery_kilometer', '{\"$cast\": null, \"$value\": \"2\"}', NULL, NULL, '2026-02-15 05:52:23', '2026-02-15 05:52:23'),
(45, 'order_setup', 'order_setup_basic_delivery_charge', '{\"$cast\": null, \"$value\": \"1\"}', NULL, NULL, '2026-02-15 05:52:23', '2026-02-15 05:52:23'),
(46, 'order_setup', 'order_setup_charge_per_kilo', '{\"$cast\": null, \"$value\": \"1\"}', NULL, NULL, '2026-02-15 05:52:23', '2026-02-15 05:52:23'),
(47, 'otp', 'otp_type', '{\"$cast\": null, \"$value\": \"5\"}', NULL, NULL, '2026-02-15 05:52:23', '2026-02-15 05:52:23'),
(48, 'otp', 'otp_digit_limit', '{\"$cast\": null, \"$value\": \"4\"}', NULL, NULL, '2026-02-15 05:52:23', '2026-02-15 05:52:23'),
(49, 'otp', 'otp_expire_time', '{\"$cast\": null, \"$value\": \"10\"}', NULL, NULL, '2026-02-15 05:52:23', '2026-02-15 05:52:23'),
(50, 'notification', 'notification_fcm_public_vapid_key', '{\"$cast\": null, \"$value\": \"BHgY4lEJ8E3ANgKUcEqJXCZOFeg4kkzbiESghzbBg5pIeDRDgMHw7-w-yjdYuXtGpr3AYeto6sx4QTwzTUs3gX0\"}', NULL, NULL, '2026-02-18 05:10:43', '2026-02-18 05:10:43'),
(51, 'notification', 'notification_fcm_api_key', '{\"$cast\": null, \"$value\": \"AIzaSyBglalD2ZYNHFubRIJsZIQNXem7w4twdfI\"}', NULL, NULL, '2026-02-18 05:10:43', '2026-02-18 05:10:43'),
(52, 'notification', 'notification_fcm_auth_domain', '{\"$cast\": null, \"$value\": \"food-king-8019b.firebaseapp.com\"}', NULL, NULL, '2026-02-18 05:10:43', '2026-02-18 05:10:43'),
(53, 'notification', 'notification_fcm_project_id', '{\"$cast\": null, \"$value\": \"food-king-8019b\"}', NULL, NULL, '2026-02-18 05:10:43', '2026-02-18 05:10:43'),
(54, 'notification', 'notification_fcm_storage_bucket', '{\"$cast\": null, \"$value\": \"food-king-8019b.firebasestorage.app\"}', NULL, NULL, '2026-02-18 05:10:43', '2026-02-18 05:10:43'),
(55, 'notification', 'notification_fcm_messaging_sender_id', '{\"$cast\": null, \"$value\": \"368617750753\"}', NULL, NULL, '2026-02-18 05:10:43', '2026-02-18 05:10:43'),
(56, 'notification', 'notification_fcm_app_id', '{\"$cast\": null, \"$value\": \"1:368617750753:web:487abd08cfe9ceb47bb7a0\"}', NULL, NULL, '2026-02-18 05:10:43', '2026-02-18 05:10:43'),
(57, 'notification', 'notification_fcm_measurement_id', '{\"$cast\": null, \"$value\": \"G-37W45EPY79\"}', NULL, NULL, '2026-02-18 05:10:43', '2026-02-18 05:10:43'),
(58, 'notification', 'notification_fcm_json_file', '{\"$cast\": null, \"$value\": {}}', NULL, NULL, '2026-02-18 05:10:43', '2026-02-18 05:10:43'),
(59, 'cookies', 'cookies_details_page_id', '{\"$cast\": null, \"$value\": null}', NULL, NULL, '2026-02-15 05:52:23', '2026-02-15 05:52:23'),
(60, 'cookies', 'cookies_summary', '{\"$cast\": null, \"$value\": \"\"}', NULL, NULL, '2026-02-15 05:52:23', '2026-02-15 05:52:23'),
(61, 'theme', 'theme_logo', '{\"$cast\": null, \"$value\": {}}', NULL, NULL, '2026-02-15 21:41:51', '2026-02-15 21:41:51'),
(62, 'theme', 'theme_favicon_logo', '{\"$cast\": null, \"$value\": {}}', NULL, NULL, '2026-02-15 21:43:46', '2026-02-15 21:43:46'),
(63, 'theme', 'theme_footer_logo', '{\"$cast\": null, \"$value\": {}}', NULL, NULL, '2026-02-15 21:39:43', '2026-02-15 21:39:43'),
(64, 'license', 'license_key', '{\"$cast\": null, \"$value\": \"\"}', NULL, NULL, '2026-02-15 05:52:23', '2026-02-15 05:52:23'),
(65, 'social_media', 'social_media_facebook', '{\"$cast\": null, \"$value\": \"\"}', NULL, NULL, '2026-02-15 05:52:23', '2026-02-15 05:52:23'),
(66, 'social_media', 'social_media_youtube', '{\"$cast\": null, \"$value\": \"\"}', NULL, NULL, '2026-02-15 05:52:23', '2026-02-15 05:52:23'),
(67, 'social_media', 'social_media_instagram', '{\"$cast\": null, \"$value\": \"\"}', NULL, NULL, '2026-02-15 05:52:23', '2026-02-15 05:52:23'),
(68, 'social_media', 'social_media_twitter', '{\"$cast\": null, \"$value\": \"\"}', NULL, NULL, '2026-02-15 05:52:23', '2026-02-15 05:52:23');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint UNSIGNED NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint UNSIGNED NOT NULL DEFAULT '5' COMMENT '5=Active, 10=Inactive',
  `creator_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_id` bigint DEFAULT NULL,
  `editor_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `editor_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `title`, `description`, `status`, `creator_type`, `creator_id`, `editor_type`, `editor_id`, `created_at`, `updated_at`) VALUES
(1, 'Slider One', NULL, 5, NULL, NULL, NULL, NULL, '2026-02-16 05:33:38', '2026-02-16 05:33:38'),
(2, 'Slider Two', NULL, 5, NULL, NULL, NULL, NULL, '2026-02-16 05:34:22', '2026-02-16 05:34:22'),
(3, 'Slider Three', NULL, 5, NULL, NULL, NULL, NULL, '2026-02-16 05:34:57', '2026-02-16 05:34:57');

-- --------------------------------------------------------

--
-- Table structure for table `sms_gateways`
--

CREATE TABLE `sms_gateways` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `misc` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint NOT NULL DEFAULT '5' COMMENT '5=Active, 10=Inactive',
  `creator_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_id` bigint DEFAULT NULL,
  `editor_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `editor_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sms_gateways`
--

INSERT INTO `sms_gateways` (`id`, `name`, `slug`, `misc`, `status`, `creator_type`, `creator_id`, `editor_type`, `editor_id`, `created_at`, `updated_at`) VALUES
(1, 'Twilio', 'twilio', 'null', 5, NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(2, 'Clickatell', 'clickatell', 'null', 5, NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(3, 'Nexmo', 'nexmo', 'null', 5, NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(4, 'Msg91', 'msg91', 'null', 5, NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(5, '2Factor', 'twofactor', 'null', 5, NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(6, 'Bulksms', 'bulksms', 'null', 5, NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(7, 'Bulksmsbd', 'bulksmsbd', 'null', 5, NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22'),
(8, 'Telesign', 'telesign', 'null', 5, NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-15 05:52:22');

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` bigint UNSIGNED NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_rate` decimal(13,6) NOT NULL,
  `type` tinyint NOT NULL,
  `status` tinyint UNSIGNED NOT NULL DEFAULT '5' COMMENT '5=Active, 10=Inactive',
  `creator_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_id` bigint DEFAULT NULL,
  `editor_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `editor_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `time_slots`
--

CREATE TABLE `time_slots` (
  `id` bigint UNSIGNED NOT NULL,
  `opening_time` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `closing_time` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `day` tinyint NOT NULL,
  `creator_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_id` bigint DEFAULT NULL,
  `editor_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `editor_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint UNSIGNED NOT NULL,
  `sign` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '+',
  `order_id` bigint UNSIGNED NOT NULL,
  `transaction_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `payment_method` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'payment',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `device_token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `web_token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch_id` bigint UNSIGNED DEFAULT '0',
  `country_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_guest` tinyint UNSIGNED NOT NULL DEFAULT '10',
  `status` tinyint UNSIGNED NOT NULL DEFAULT '5' COMMENT '5=Active, 10=Inactive',
  `balance` decimal(19,6) NOT NULL DEFAULT '0.000000',
  `creator_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_id` bigint DEFAULT NULL,
  `editor_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `editor_id` bigint DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `username`, `email_verified_at`, `password`, `device_token`, `web_token`, `branch_id`, `country_code`, `is_guest`, `status`, `balance`, `creator_type`, `creator_id`, `editor_type`, `editor_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Jamial Hasan', 'jamialhasan@gmail.com', '7926373552', 'admin', '2026-02-15 05:52:22', '$2y$10$bZVjgtKLZBIsPe.hvVV66eoWnHMBamDSXJkwEdCj/JkyrArUMHlzm', '@', 'fFaKkBd9lvGMgoCvbrxZV0:APA91bEjl7G9xuNZypJtFwpQrY1HnPA6s0po5IZECKph-VeLxFY3xa_Nfdn1kx8F4ur3xyODCMOMqNdCyIhGIwoZmLWKQBzzI49tY2ieGrrBneUr-GDf3dA', 0, '+44', 10, 5, 0.000000, NULL, NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-18 05:13:52', NULL),
(2, 'Walking Customer', 'inlaysoft@yahoo.com', '7926373551', 'default-customer', '2026-02-15 05:52:22', '$2y$10$qR/qQ5OAyArJz2KMAZkFEOBOxhHMThmLK9AdP34Jrry.muDdEE//2', NULL, NULL, 0, '+44', 10, 5, 0.000000, NULL, NULL, NULL, NULL, NULL, '2026-02-15 05:52:22', '2026-02-18 03:34:18', NULL),
(3, 'Shamial', 'jamial@iclouds.co.uk', NULL, 'jamial452797749', '2026-02-17 02:49:23', '$2y$10$Cz/FRwb5o5aBhE3hc6zfP.cohLX/CohAm/sWwh5Xq6f5IxwayqRC6', NULL, NULL, 1, '+44', 10, 5, 0.000000, NULL, NULL, NULL, NULL, NULL, '2026-02-17 02:49:23', '2026-02-17 02:49:23', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addons`
--
ALTER TABLE `addons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addresses_user_id_foreign` (`user_id`);

--
-- Indexes for table `analytics`
--
ALTER TABLE `analytics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `analytic_sections`
--
ALTER TABLE `analytic_sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `analytic_sections_analytic_id_foreign` (`analytic_id`);

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `default_access`
--
ALTER TABLE `default_access`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dining_tables`
--
ALTER TABLE `dining_tables`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `dining_tables_slug_unique` (`slug`),
  ADD KEY `dining_tables_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `gateway_options`
--
ALTER TABLE `gateway_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `items_item_category_id_foreign` (`item_category_id`),
  ADD KEY `items_tax_id_foreign` (`tax_id`);

--
-- Indexes for table `item_addons`
--
ALTER TABLE `item_addons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_addons_item_id_foreign` (`item_id`),
  ADD KEY `item_addons_addon_item_id_foreign` (`addon_item_id`);

--
-- Indexes for table `item_attributes`
--
ALTER TABLE `item_attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_categories`
--
ALTER TABLE `item_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_extras`
--
ALTER TABLE `item_extras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_extras_item_id_foreign` (`item_id`);

--
-- Indexes for table `item_variations`
--
ALTER TABLE `item_variations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_variations_item_id_foreign` (`item_id`),
  ADD KEY `item_variations_item_attribute_id_foreign` (`item_attribute_id`);

--
-- Indexes for table `kiosk_machines`
--
ALTER TABLE `kiosk_machines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kiosk_machines_user_id_foreign` (`user_id`),
  ADD KEY `kiosk_machines_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `media_uuid_unique` (`uuid`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`),
  ADD KEY `media_order_column_index` (`order_column`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_sections`
--
ALTER TABLE `menu_sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_templates`
--
ALTER TABLE `menu_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `messages_user_id_foreign` (`user_id`);

--
-- Indexes for table `message_histories`
--
ALTER TABLE `message_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `message_histories_message_id_foreign` (`message_id`),
  ADD KEY `message_histories_user_id_foreign` (`user_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_alerts`
--
ALTER TABLE `notification_alerts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offer_items`
--
ALTER TABLE `offer_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `offer_items_offer_id_foreign` (`offer_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `order_addresses`
--
ALTER TABLE `order_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_addresses_order_id_foreign` (`order_id`),
  ADD KEY `order_addresses_user_id_foreign` (`user_id`);

--
-- Indexes for table `order_coupons`
--
ALTER TABLE `order_coupons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_coupons_order_id_foreign` (`order_id`),
  ADD KEY `order_coupons_user_id_foreign` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`),
  ADD KEY `order_items_branch_id_foreign` (`branch_id`),
  ADD KEY `order_items_item_id_foreign` (`item_id`);

--
-- Indexes for table `otps`
--
ALTER TABLE `otps`
  ADD KEY `otps_phone_index` (`phone`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pages_menu_section_id_foreign` (`menu_section_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `pesapals`
--
ALTER TABLE `pesapals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `push_notifications`
--
ALTER TABLE `push_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `settings_settingable_type_settingable_id_index` (`settingable_type`,`settingable_id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_gateways`
--
ALTER TABLE `sms_gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscribers_email_unique` (`email`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `time_slots`
--
ALTER TABLE `time_slots`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
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
-- AUTO_INCREMENT for table `addons`
--
ALTER TABLE `addons`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `analytics`
--
ALTER TABLE `analytics`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `analytic_sections`
--
ALTER TABLE `analytic_sections`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `default_access`
--
ALTER TABLE `default_access`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `dining_tables`
--
ALTER TABLE `dining_tables`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gateway_options`
--
ALTER TABLE `gateway_options`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `item_addons`
--
ALTER TABLE `item_addons`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_attributes`
--
ALTER TABLE `item_attributes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_categories`
--
ALTER TABLE `item_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `item_extras`
--
ALTER TABLE `item_extras`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_variations`
--
ALTER TABLE `item_variations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kiosk_machines`
--
ALTER TABLE `kiosk_machines`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `menu_sections`
--
ALTER TABLE `menu_sections`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `menu_templates`
--
ALTER TABLE `menu_templates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `message_histories`
--
ALTER TABLE `message_histories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notification_alerts`
--
ALTER TABLE `notification_alerts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `offers`
--
ALTER TABLE `offers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `offer_items`
--
ALTER TABLE `offer_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `order_addresses`
--
ALTER TABLE `order_addresses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_coupons`
--
ALTER TABLE `order_coupons`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `pesapals`
--
ALTER TABLE `pesapals`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `push_notifications`
--
ALTER TABLE `push_notifications`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sms_gateways`
--
ALTER TABLE `sms_gateways`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `time_slots`
--
ALTER TABLE `time_slots`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
