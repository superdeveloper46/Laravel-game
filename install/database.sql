-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 13, 2021 at 01:29 PM
-- Server version: 10.4.16-MariaDB
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `xaxino`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `access` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `username`, `email_verified_at`, `image`, `access`, `password`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'admin@site.com', 'admin', NULL, '5ff1c3531ed3f1609679699.jpg', NULL, '$2y$10$2qcOUKrDIUqyyCklvHp7IO8fGNcJ1gAXtxouTn1isZPHu6H8CfHPq', NULL, '2021-05-07 07:54:06');

-- --------------------------------------------------------

--
-- Table structure for table `admin_notifications`
--

CREATE TABLE `admin_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `read_status` tinyint(4) NOT NULL DEFAULT 0,
  `click_url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin_password_resets`
--

CREATE TABLE `admin_password_resets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `commission_logs`
--

CREATE TABLE `commission_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `who` int(11) NOT NULL,
  `level` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(11,2) NOT NULL,
  `main_amo` decimal(11,2) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `trx` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

CREATE TABLE `deposits` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `method_code` int(10) UNSIGNED NOT NULL,
  `amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `method_currency` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `rate` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `final_amo` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `detail` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `btc_amo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `btc_wallet` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trx` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `try` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1=>success, 2=>pending, 3=>cancel',
  `from_api` tinyint(4) NOT NULL DEFAULT 0,
  `admin_feedback` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_logs`
--

CREATE TABLE `email_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `mail_sender` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `to` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_sms_templates`
--

CREATE TABLE `email_sms_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `act` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subj` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shortcodes` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_status` tinyint(4) NOT NULL DEFAULT 1,
  `sms_status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_sms_templates`
--

INSERT INTO `email_sms_templates` (`id`, `act`, `name`, `subj`, `email_body`, `sms_body`, `shortcodes`, `email_status`, `sms_status`, `created_at`, `updated_at`) VALUES
(1, 'PASS_RESET_CODE', 'Password Reset', 'Password Reset', '<div>We have received a request to reset the password for your account on <b>{{time}} .<br></b></div><div>Requested From IP: <b>{{ip}}</b> using <b>{{browser}}</b> on <b>{{operating_system}} </b>.</div><div><br></div><br><div><div><div>Your account recovery code is:&nbsp;&nbsp; <font size=\"6\"><b>{{code}}</b></font></div><div><br></div></div></div><div><br></div><div><font size=\"4\" color=\"#CC0000\">If you do not wish to reset your password, please disregard this message.&nbsp;</font><br></div><br>', 'Your account recovery code is: {{code}}', ' {\"code\":\"Password Reset Code\",\"ip\":\"IP of User\",\"browser\":\"Browser of User\",\"operating_system\":\"Operating System of User\",\"time\":\"Request Time\"}', 1, 1, '2019-09-24 23:04:05', '2021-01-06 00:49:06'),
(2, 'PASS_RESET_DONE', 'Password Reset Confirmation', 'You have Reset your password', '<div><p>\r\n    You have successfully reset your password.</p><p>You changed from&nbsp; IP: <b>{{ip}}</b> using <b>{{browser}}</b> on <b>{{operating_system}}&nbsp;</b> on <b>{{time}}</b></p><p><b><br></b></p><p><font color=\"#FF0000\"><b>If you did not changed that, Please contact with us as soon as possible.</b></font><br></p></div>', 'Your password has been changed successfully', '{\"ip\":\"IP of User\",\"browser\":\"Browser of User\",\"operating_system\":\"Operating System of User\",\"time\":\"Request Time\"}', 1, 1, '2019-09-24 23:04:05', '2020-03-07 10:23:47'),
(3, 'EVER_CODE', 'Email Verification', 'Please verify your email address', '<div><br></div><div>Thanks For join with us. <br></div><div>Please use below code to verify your email address.<br></div><div><br></div><div>Your email verification code is:<font size=\"6\"><b> {{code}}</b></font></div>', 'Your email verification code is: {{code}}', '{\"code\":\"Verification code\"}', 1, 1, '2019-09-24 23:04:05', '2021-01-03 23:35:10'),
(4, 'SVER_CODE', 'SMS Verification ', 'Please verify your phone', 'Your phone verification code is: {{code}}', 'Your phone verification code is: {{code}}', '{\"code\":\"Verification code\"}', 0, 1, '2019-09-24 23:04:05', '2020-03-08 01:28:52'),
(5, '2FA_ENABLE', 'Google Two Factor - Enable', 'Google Two Factor Authentication is now  Enabled for Your Account', '<div>You just enabled Google Two Factor Authentication for Your Account.</div><div><br></div><div>Enabled at <b>{{time}} </b>From IP: <b>{{ip}}</b> using <b>{{browser}}</b> on <b>{{operating_system}} </b>.</div>', 'Your verification code is: {{code}}', '{\"ip\":\"IP of User\",\"browser\":\"Browser of User\",\"operating_system\":\"Operating System of User\",\"time\":\"Request Time\"}', 1, 1, '2019-09-24 23:04:05', '2020-03-08 01:42:59'),
(6, '2FA_DISABLE', 'Google Two Factor Disable', 'Google Two Factor Authentication is now  Disabled for Your Account', '<div>You just Disabled Google Two Factor Authentication for Your Account.</div><div><br></div><div>Disabled at <b>{{time}} </b>From IP: <b>{{ip}}</b> using <b>{{browser}}</b> on <b>{{operating_system}} </b>.</div>', 'Google two factor verification is disabled', '{\"ip\":\"IP of User\",\"browser\":\"Browser of User\",\"operating_system\":\"Operating System of User\",\"time\":\"Request Time\"}', 1, 1, '2019-09-24 23:04:05', '2020-03-08 01:43:46'),
(16, 'ADMIN_SUPPORT_REPLY', 'Support Ticket Reply ', 'Reply Support Ticket', '<div><p><span style=\"font-size: 11pt;\" data-mce-style=\"font-size: 11pt;\"><strong>A member from our support team has replied to the following ticket:</strong></span></p><p><b><span style=\"font-size: 11pt;\" data-mce-style=\"font-size: 11pt;\"><strong><br></strong></span></b></p><p><b>[Ticket#{{ticket_id}}] {{ticket_subject}}<br><br>Click here to reply:&nbsp; {{link}}</b></p><p>----------------------------------------------</p><p>Here is the reply : <br></p><p> {{reply}}<br></p></div><div><br></div>', '{{subject}}\r\n\r\n{{reply}}\r\n\r\n\r\nClick here to reply:  {{link}}', '{\"ticket_id\":\"Support Ticket ID\", \"ticket_subject\":\"Subject Of Support Ticket\", \"reply\":\"Reply from Staff/Admin\",\"link\":\"Ticket URL For relpy\"}', 1, 1, '2020-06-08 18:00:00', '2020-05-04 02:24:40'),
(206, 'DEPOSIT_COMPLETE', 'Automated Deposit - Successful', 'Deposit Completed Successfully', '<div>Your deposit of <b>{{amount}} {{currency}}</b> is via&nbsp; <b>{{method_name}} </b>has been completed Successfully.<b><br></b></div><div><b><br></b></div><div><b>Details of your Deposit :<br></b></div><div><br></div><div>Amount : {{amount}} {{currency}}</div><div>Charge: <font color=\"#000000\">{{charge}} {{currency}}</font></div><div><br></div><div>Conversion Rate : 1 {{currency}} = {{rate}} {{method_currency}}</div><div>Payable : {{method_amount}} {{method_currency}} <br></div><div>Paid via :&nbsp; {{method_name}}</div><div><br></div><div>Transaction Number : {{trx}}</div><div><font size=\"5\"><b><br></b></font></div><div><font size=\"5\">Your current Balance is <b>{{post_balance}} {{currency}}</b></font></div><div><br></div><div><br><br><br></div>', '{{amount}} {{currrency}} Deposit successfully by {{gateway_name}}', '{\"trx\":\"Transaction Number\",\"amount\":\"Request Amount By user\",\"charge\":\"Gateway Charge\",\"currency\":\"Site Currency\",\"rate\":\"Conversion Rate\",\"method_name\":\"Deposit Method Name\",\"method_currency\":\"Deposit Method Currency\",\"method_amount\":\"Deposit Method Amount After Conversion\", \"post_balance\":\"Users Balance After this operation\"}', 1, 1, '2020-06-24 18:00:00', '2020-11-17 03:10:00'),
(207, 'DEPOSIT_REQUEST', 'Manual Deposit - User Requested', 'Deposit Request Submitted Successfully', '<div>Your deposit request of <b>{{amount}} {{currency}}</b> is via&nbsp; <b>{{method_name}} </b>submitted successfully<b> .<br></b></div><div><b><br></b></div><div><b>Details of your Deposit :<br></b></div><div><br></div><div>Amount : {{amount}} {{currency}}</div><div>Charge: <font color=\"#FF0000\">{{charge}} {{currency}}</font></div><div><br></div><div>Conversion Rate : 1 {{currency}} = {{rate}} {{method_currency}}</div><div>Payable : {{method_amount}} {{method_currency}} <br></div><div>Pay via :&nbsp; {{method_name}}</div><div><br></div><div>Transaction Number : {{trx}}</div><div><br></div><div><br></div>', '{{amount}} Deposit requested by {{method}}. Charge: {{charge}} . Trx: {{trx}}\r\n', '{\"trx\":\"Transaction Number\",\"amount\":\"Request Amount By user\",\"charge\":\"Gateway Charge\",\"currency\":\"Site Currency\",\"rate\":\"Conversion Rate\",\"method_name\":\"Deposit Method Name\",\"method_currency\":\"Deposit Method Currency\",\"method_amount\":\"Deposit Method Amount After Conversion\"}', 1, 1, '2020-05-31 18:00:00', '2020-06-01 18:00:00'),
(208, 'DEPOSIT_APPROVE', 'Manual Deposit - Admin Approved', 'Your Deposit is Approved', '<div>Your deposit request of <b>{{amount}} {{currency}}</b> is via&nbsp; <b>{{method_name}} </b>is Approved .<b><br></b></div><div><b><br></b></div><div><b>Details of your Deposit :<br></b></div><div><br></div><div>Amount : {{amount}} {{currency}}</div><div>Charge: <font color=\"#FF0000\">{{charge}} {{currency}}</font></div><div><br></div><div>Conversion Rate : 1 {{currency}} = {{rate}} {{method_currency}}</div><div>Payable : {{method_amount}} {{method_currency}} <br></div><div>Paid via :&nbsp; {{method_name}}</div><div><br></div><div>Transaction Number : {{trx}}</div><div><font size=\"5\"><b><br></b></font></div><div><font size=\"5\">Your current Balance is <b>{{post_balance}} {{currency}}</b></font></div><div><br></div><div><br><br></div>', 'Admin Approve Your {{amount}} {{gateway_currency}} payment request by {{gateway_name}} transaction : {{transaction}}', '{\"trx\":\"Transaction Number\",\"amount\":\"Request Amount By user\",\"charge\":\"Gateway Charge\",\"currency\":\"Site Currency\",\"rate\":\"Conversion Rate\",\"method_name\":\"Deposit Method Name\",\"method_currency\":\"Deposit Method Currency\",\"method_amount\":\"Deposit Method Amount After Conversion\", \"post_balance\":\"Users Balance After this operation\"}', 1, 1, '2020-06-16 18:00:00', '2020-06-14 18:00:00'),
(209, 'DEPOSIT_REJECT', 'Manual Deposit - Admin Rejected', 'Your Deposit Request is Rejected', '<div>Your deposit request of <b>{{amount}} {{currency}}</b> is via&nbsp; <b>{{method_name}} has been rejected</b>.<b><br></b></div><br><div>Transaction Number was : {{trx}}</div><div><br></div><div>if you have any query, feel free to contact us.<br></div><br><div><br><br></div>\r\n\r\n\r\n\r\n{{rejection_message}}', 'Admin Rejected Your {{amount}} {{gateway_currency}} payment request by {{gateway_name}}\r\n\r\n{{rejection_message}}', '{\"trx\":\"Transaction Number\",\"amount\":\"Request Amount By user\",\"charge\":\"Gateway Charge\",\"currency\":\"Site Currency\",\"rate\":\"Conversion Rate\",\"method_name\":\"Deposit Method Name\",\"method_currency\":\"Deposit Method Currency\",\"method_amount\":\"Deposit Method Amount After Conversion\",\"rejection_message\":\"Rejection message\"}', 1, 1, '2020-06-09 18:00:00', '2020-06-14 18:00:00'),
(210, 'WITHDRAW_REQUEST', 'Withdraw  - User Requested', 'Withdraw Request Submitted Successfully', '<div>Your withdraw request of <b>{{amount}} {{currency}}</b>&nbsp; via&nbsp; <b>{{method_name}} </b>has been submitted Successfully.<b><br></b></div><div><b><br></b></div><div><b>Details of your withdraw:<br></b></div><div><br></div><div>Amount : {{amount}} {{currency}}</div><div>Charge: <font color=\"#FF0000\">{{charge}} {{currency}}</font></div><div><br></div><div>Conversion Rate : 1 {{currency}} = {{rate}} {{method_currency}}</div><div>You will get: {{method_amount}} {{method_currency}} <br></div><div>Via :&nbsp; {{method_name}}</div><div><br></div><div>Transaction Number : {{trx}}</div><div><font size=\"4\" color=\"#FF0000\"><b><br></b></font></div><div><font size=\"4\" color=\"#FF0000\"><b>This may take {{delay}} to process the payment.</b></font><br></div><div><font size=\"5\"><b><br></b></font></div><div><font size=\"5\"><b><br></b></font></div><div><font size=\"5\">Your current Balance is <b>{{post_balance}} {{currency}}</b></font></div><div><br></div><div><br><br><br><br></div>', '{{amount}} {{currency}} withdraw requested by {{method_name}}. You will get {{method_amount}} {{method_currency}} in {{delay}}. Trx: {{trx}}', '{\"trx\":\"Transaction Number\",\"amount\":\"Request Amount By user\",\"charge\":\"Gateway Charge\",\"currency\":\"Site Currency\",\"rate\":\"Conversion Rate\",\"method_name\":\"Deposit Method Name\",\"method_currency\":\"Deposit Method Currency\",\"method_amount\":\"Deposit Method Amount After Conversion\", \"post_balance\":\"Users Balance After this operation\", \"delay\":\"Delay time for processing\"}', 1, 1, '2020-06-07 18:00:00', '2021-05-08 06:49:06'),
(211, 'WITHDRAW_REJECT', 'Withdraw - Admin Rejected', 'Withdraw Request has been Rejected and your money is refunded to your account', '<div>Your withdraw request of <b>{{amount}} {{currency}}</b>&nbsp; via&nbsp; <b>{{method_name}} </b>has been Rejected.<b><br></b></div><div><b><br></b></div><div><b>Details of your withdraw:<br></b></div><div><br></div><div>Amount : {{amount}} {{currency}}</div><div>Charge: <font color=\"#FF0000\">{{charge}} {{currency}}</font></div><div><br></div><div>Conversion Rate : 1 {{currency}} = {{rate}} {{method_currency}}</div><div>You should get: {{method_amount}} {{method_currency}} <br></div><div>Via :&nbsp; {{method_name}}</div><div><br></div><div>Transaction Number : {{trx}}</div><div><br></div><div><br></div><div>----</div><div><font size=\"3\"><br></font></div><div><font size=\"3\"> {{amount}} {{currency}} has been <b>refunded </b>to your account and your current Balance is <b>{{post_balance}}</b><b> {{currency}}</b></font></div><div><br></div><div>-----</div><div><br></div><div><font size=\"4\">Details of Rejection :</font></div><div><font size=\"4\"><b>{{admin_details}}</b></font></div><div><br></div><div><br><br><br><br><br><br></div>', 'Admin Rejected Your {{amount}} {{currency}} withdraw request. Your Main Balance {{main_balance}}  {{method}} , Transaction {{transaction}}', '{\"trx\":\"Transaction Number\",\"amount\":\"Request Amount By user\",\"charge\":\"Gateway Charge\",\"currency\":\"Site Currency\",\"rate\":\"Conversion Rate\",\"method_name\":\"Deposit Method Name\",\"method_currency\":\"Deposit Method Currency\",\"method_amount\":\"Deposit Method Amount After Conversion\", \"post_balance\":\"Users Balance After this operation\", \"admin_details\":\"Details Provided By Admin\"}', 1, 1, '2020-06-09 18:00:00', '2020-06-14 18:00:00'),
(212, 'WITHDRAW_APPROVE', 'Withdraw - Admin  Approved', 'Withdraw Request has been Processed and your money is sent', '<div>Your withdraw request of <b>{{amount}} {{currency}}</b>&nbsp; via&nbsp; <b>{{method_name}} </b>has been Processed Successfully.<b><br></b></div><div><b><br></b></div><div><b>Details of your withdraw:<br></b></div><div><br></div><div>Amount : {{amount}} {{currency}}</div><div>Charge: <font color=\"#FF0000\">{{charge}} {{currency}}</font></div><div><br></div><div>Conversion Rate : 1 {{currency}} = {{rate}} {{method_currency}}</div><div>You will get: {{method_amount}} {{method_currency}} <br></div><div>Via :&nbsp; {{method_name}}</div><div><br></div><div>Transaction Number : {{trx}}</div><div><br></div><div>-----</div><div><br></div><div><font size=\"4\">Details of Processed Payment :</font></div><div><font size=\"4\"><b>{{admin_details}}</b></font></div><div><br></div><div><br><br><br><br><br></div>', 'Admin Approve Your {{amount}} {{currency}} withdraw request by {{method}}. Transaction {{transaction}}', '{\"trx\":\"Transaction Number\",\"amount\":\"Request Amount By user\",\"charge\":\"Gateway Charge\",\"currency\":\"Site Currency\",\"rate\":\"Conversion Rate\",\"method_name\":\"Deposit Method Name\",\"method_currency\":\"Deposit Method Currency\",\"method_amount\":\"Deposit Method Amount After Conversion\", \"admin_details\":\"Details Provided By Admin\"}', 1, 1, '2020-06-10 18:00:00', '2020-06-06 18:00:00'),
(215, 'BAL_ADD', 'Balance Add by Admin', 'Your Account has been Credited', '<div>{{amount}} {{currency}} has been added to your account .</div><div><br></div><div>Transaction Number : {{trx}}</div><div><br></div>Your Current Balance is : <font size=\"3\"><b>{{post_balance}}&nbsp; {{currency}}&nbsp;</b></font>', '{{amount}} {{currency}} credited in your account. Your Current Balance {{remaining_balance}} {{currency}} . Transaction: #{{trx}}', '{\"trx\":\"Transaction Number\",\"amount\":\"Request Amount By Admin\",\"currency\":\"Site Currency\", \"post_balance\":\"Users Balance After this operation\"}', 1, 1, '2019-09-14 19:14:22', '2021-01-06 00:46:18'),
(216, 'BAL_SUB', 'Balance Subtracted by Admin', 'Your Account has been Debited', '<div>{{amount}} {{currency}} has been subtracted from your account .</div><div><br></div><div>Transaction Number : {{trx}}</div><div><br></div>Your Current Balance is : <font size=\"3\"><b>{{post_balance}}&nbsp; {{currency}}</b></font>', '{{amount}} {{currency}} debited from your account. Your Current Balance {{remaining_balance}} {{currency}} . Transaction: #{{trx}}', '{\"trx\":\"Transaction Number\",\"amount\":\"Request Amount By Admin\",\"currency\":\"Site Currency\", \"post_balance\":\"Users Balance After this operation\"}', 1, 1, '2019-09-14 19:14:22', '2019-11-10 09:07:12'),
(217, 'REFERRAL_COMMISSION', 'REFERRAL COMMISSION', 'User Referral Commission', 'Bonus: {{amount}}&nbsp;<span style=\"color: rgb(33, 37, 41);\">{{currency}}</span>,&nbsp;<div>Current Balance: {{post_balance}},</div><div><span style=\"font-family: &quot;Open Sans&quot;, sans-serif;\">{{level}}</span><span style=\"font-family: &quot;Open Sans&quot;, sans-serif;\">,</span></div><div>Transaction: {{trx}},</div>', NULL, '{\"amount\":\"Amount\", \"post_balance\":\"Post Balance\", \"trx\":\"Transaction\",\"level\":\"Level\", 	\"currency\":\"currency\" }', 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `extensions`
--

CREATE TABLE `extensions` (
  `id` int(10) UNSIGNED NOT NULL,
  `act` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `script` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shortcode` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'object',
  `support` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'help section',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=>enable, 2=>disable',
  `deleted_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `extensions`
--

INSERT INTO `extensions` (`id`, `act`, `name`, `description`, `image`, `script`, `shortcode`, `support`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'tawk-chat', 'Tawk.to', 'Key location is shown bellow', 'tawky_big.png', '<script>\r\n                        var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();\r\n                        (function(){\r\n                        var s1=document.createElement(\"script\"),s0=document.getElementsByTagName(\"script\")[0];\r\n                        s1.async=true;\r\n                        s1.src=\"https://embed.tawk.to/{{app_key}}\";\r\n                        s1.charset=\"UTF-8\";\r\n                        s1.setAttribute(\"crossorigin\",\"*\");\r\n                        s0.parentNode.insertBefore(s1,s0);\r\n                        })();\r\n                    </script>', '{\"app_key\":{\"title\":\"App Key\",\"value\":\"------\"}}', 'twak.png', 0, NULL, '2019-10-18 23:16:05', '2021-05-18 05:37:12'),
(2, 'google-recaptcha2', 'Google Recaptcha 2', 'Key location is shown bellow', 'recaptcha3.png', '\r\n<script src=\"https://www.google.com/recaptcha/api.js\"></script>\r\n<div class=\"g-recaptcha\" data-sitekey=\"{{sitekey}}\" data-callback=\"verifyCaptcha\"></div>\r\n<div id=\"g-recaptcha-error\"></div>', '{\"sitekey\":{\"title\":\"Site Key\",\"value\":\"-----\"}}', 'recaptcha.png', 0, NULL, '2019-10-18 23:16:05', '2021-08-03 04:42:09'),
(3, 'custom-captcha', 'Custom Captcha', 'Just Put Any Random String', 'customcaptcha.png', NULL, '{\"random_key\":{\"title\":\"Random String\",\"value\":\"SecureString\"}}', 'na', 1, NULL, '2019-10-18 23:16:05', '2021-06-17 12:23:05'),
(4, 'google-analytics', 'Google Analytics', 'Key location is shown bellow', 'google_analytics.png', '<script async src=\"https://www.googletagmanager.com/gtag/js?id={{app_key}}\"></script>\r\n                <script>\r\n                  window.dataLayer = window.dataLayer || [];\r\n                  function gtag(){dataLayer.push(arguments);}\r\n                  gtag(\"js\", new Date());\r\n                \r\n                  gtag(\"config\", \"{{app_key}}\");\r\n                </script>', '{\"app_key\":{\"title\":\"App Key\",\"value\":\"------\"}}', 'ganalytics.png', 0, NULL, NULL, '2021-05-04 10:19:12'),
(5, 'fb-comment', 'Facebook Comment ', 'Key location is shown bellow', 'Facebook.png', '<div id=\"fb-root\"></div><script async defer crossorigin=\"anonymous\" src=\"https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v4.0&appId={{app_key}}&autoLogAppEvents=1\"></script>', '{\"app_key\":{\"title\":\"App Key\",\"value\":\"----\"}}', 'fb_com.PNG', 0, NULL, NULL, '2021-06-17 12:02:01');

-- --------------------------------------------------------

--
-- Table structure for table `frontends`
--

CREATE TABLE `frontends` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_keys` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_values` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `frontends`
--

INSERT INTO `frontends` (`id`, `data_keys`, `data_values`, `views`, `created_at`, `updated_at`) VALUES
(1, 'seo.data', '{\"seo_image\":\"1\",\"keywords\":[\"Live Game\",\"gaming platform\",\"xaxino\"],\"description\":\"Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit\",\"social_title\":\"Xaxino - Ultimate Casino Platform\",\"social_description\":\"Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit\",\"image\":\"618faf3a1c0221636806458.png\"}', 0, '2020-07-04 17:42:52', '2021-11-13 06:28:10'),
(31, 'banner.content', '{\"has_image\":\"1\",\"heading\":\"Play online games and win a lot of bonuses.\",\"sub_heading\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Quos error quo cum illum, alias similique, suscipit nihil tempore.\",\"button_1\":\"Sign Up\",\"button_url_1\":\"register\",\"button_2\":\"Sign In\",\"button_url_2\":\"login\",\"image\":\"6107bff04a0da1627897840.jpg\"}', 0, '2020-11-03 17:58:28', '2021-08-02 03:50:40'),
(32, 'about.content', '{\"has_image\":\"1\",\"heading\":\"We are the best online lottery gaming platform.\",\"description\":\"<div>Tolor sit amet consectetur adipisicing elit. Ipsa, harum quidem fuga ipsam dolores odio architecto, non neque minima atque nisi temporibus ullam numquam officiis unde culpa sunt temporibus ullam numquam.<\\/div>\",\"button\":\"Learn More\",\"button_url\":\"about\",\"image\":\"6107c19dcf99a1627898269.png\"}', 0, '2020-11-03 18:06:22', '2021-08-02 03:57:50'),
(33, 'about.element', '{\"icon\":\"<i class=\\\"las la-cogs\\\"><\\/i>\",\"title\":\"Best Platform\"}', 0, '2020-11-03 18:07:06', '2020-11-03 18:07:06'),
(34, 'about.element', '{\"icon\":\"<i class=\\\"las la-credit-card\\\"><\\/i>\",\"title\":\"Quick Deposit\"}', 0, '2020-11-03 18:08:01', '2020-11-03 18:08:01'),
(35, 'about.element', '{\"icon\":\"<i class=\\\"las la-cloud-download-alt\\\"><\\/i>\",\"title\":\"Quick Withdraw\"}', 0, '2020-11-03 18:08:24', '2020-11-03 18:08:24'),
(36, 'about.element', '{\"icon\":\"<i class=\\\"las la-hands-helping\\\"><\\/i>\",\"title\":\"24\\/7 Support\"}', 0, '2020-11-03 18:08:43', '2020-11-03 18:08:43'),
(37, 'game.content', '{\"heading\":\"Our Awesome Games\",\"sub_heading\":\"Dolor sit amet consectetur adipisicing elit. Ipsa, harum quidem fuga ipsam dolores odio architecto, non neque minima atque nisi temporibus ullam\"}', 0, '2020-11-03 18:14:53', '2020-11-03 18:14:53'),
(38, 'trx_win.content', '{\"heading\":\"Latest Transactions And Winners\",\"sub_heading\":\"Dolor sit amet consectetur adipisicing elit. Ipsa, harum quidem fuga ipsam dolores odio architecto, non neque minima atque nisi temporibus ullam\"}', 0, '2020-11-03 18:18:25', '2020-11-03 18:20:37'),
(39, 'choose_us.content', '{\"has_image\":\"1\",\"heading\":\"Why Choose Xaxino\",\"sub_heading\":\"Dolor sit amet consectetur adipisicing elit. Ipsa, harum quidem fuga ipsam dolores odio architecto, non neque minima atque nisi temporibus ullam\",\"image\":\"6107c3e6ac8fa1627898854.jpg\"}', 0, '2020-11-03 18:23:21', '2021-08-02 04:07:35'),
(40, 'choose_us.element', '{\"icon\":\"<i class=\\\"far fa-heart\\\"><\\/i>\",\"title\":\"Awesome Gaming Platform\",\"description\":\"Adipisci harum cum, ipsum nulla hic earum quidem repellat ad! At quam odio non harum minima nihil exercitationem ex, distinctio.\"}', 0, '2020-11-03 18:25:01', '2021-07-28 06:20:51'),
(41, 'choose_us.element', '{\"icon\":\"<i class=\\\"fab fa-hubspot\\\"><\\/i>\",\"title\":\"Referral Commission System\",\"description\":\"Adipisci harum cum, ipsum nulla hic earum quidem repellat ad! At quam odio non harum minima nihil exercitationem ex, distinctio.\"}', 0, '2020-11-03 18:26:07', '2021-07-28 06:20:55'),
(42, 'choose_us.element', '{\"icon\":\"<i class=\\\"las la-lock\\\"><\\/i>\",\"title\":\"Secure Betting Platform\",\"description\":\"Adipisci harum cum, ipsum nulla hic earum quidem repellat ad! At quam odio non harum minima nihil exercitationem ex, distinctio.\"}', 0, '2020-11-03 18:28:21', '2021-07-28 06:20:59'),
(43, 'choose_us.element', '{\"icon\":\"<i class=\\\"las la-dollar-sign\\\"><\\/i>\",\"title\":\"Invest Win And Earn\",\"description\":\"Adipisci harum cum, ipsum nulla hic earum quidem repellat ad! At quam odio non harum minima nihil exercitationem ex, distinctio.\"}', 0, '2020-11-03 18:29:06', '2021-07-28 06:21:03'),
(44, 'choose_us.element', '{\"icon\":\"<i class=\\\"lar la-hand-paper\\\"><\\/i>\",\"title\":\"Quick Response\",\"description\":\"Adipisci harum cum, ipsum nulla hic earum quidem repellat ad! At quam odio non harum minima nihil exercitationem ex, distinctio.\"}', 0, '2020-11-03 18:30:18', '2021-07-28 06:21:07'),
(45, 'choose_us.element', '{\"icon\":\"<i class=\\\"lab la-amazon-pay\\\"><\\/i>\",\"title\":\"26+ Payment Gateway\",\"description\":\"Adipisci harum cum, ipsum nulla hic earum quidem repellat ad! At quam odio non harum minima nihil exercitationem ex, distinctio.\"}', 0, '2020-11-03 18:31:01', '2021-07-28 06:21:11'),
(47, 'statistics.element', '{\"icon\":\"<i class=\\\"las la-users\\\"><\\/i>\",\"title\":\"Total User\",\"amount\":\"1,255,000\"}', 0, '2020-11-03 18:42:22', '2021-07-28 03:23:57'),
(48, 'statistics.element', '{\"icon\":\"<i class=\\\"las la-trophy\\\"><\\/i>\",\"title\":\"Total Winners\",\"amount\":\"845,000\"}', 0, '2020-11-03 18:43:05', '2021-07-28 03:24:06'),
(49, 'statistics.element', '{\"icon\":\"<i class=\\\"lar la-credit-card\\\"><\\/i>\",\"title\":\"Total Deposit\",\"amount\":\"4,845,000\"}', 0, '2020-11-03 18:43:34', '2021-07-28 03:24:14'),
(50, 'statistics.element', '{\"icon\":\"<i class=\\\"las la-download\\\"><\\/i>\",\"title\":\"Total Withdraw\",\"amount\":\"945,000\"}', 0, '2020-11-03 18:45:03', '2021-07-28 03:24:25'),
(51, 'faq.content', '{\"heading\":\"Frequently Asked Questions\",\"sub_heading\":\"Dolor sit amet consectetur adipisicing elit. Ipsa, harum quidem fuga ipsam dolores odio architecto, non neque minima atque nisi temporibus ullam\"}', 0, '2020-11-03 19:03:08', '2021-07-28 06:38:23'),
(52, 'faq.element', '{\"question\":\"Why Xaxino?\",\"answer\":\"Donec quisque sem molestie tortor ut, libero libero interdum nec quisque, et scelerisque nam, elit lectus mauris sed maecenas. Veniam urna eget habitasse aliquam\"}', 0, '2020-11-03 19:03:22', '2021-07-28 06:28:49'),
(53, 'faq.element', '{\"question\":\"How to prediction?\",\"answer\":\"Donec quisque sem molestie tortor ut, libero libero interdum nec quisque, et scelerisque nam, elit lectus mauris sed maecenas. Veniam urna eget habitasse aliquam\"}', 0, '2020-11-03 19:03:35', '2020-11-03 19:03:35'),
(54, 'faq.element', '{\"id\":\"54\",\"question\":\"Our vission And mission?\",\"answer\":\"Donec quisque sem molestie tortor ut, libero libero interdum nec quisque, et scelerisque nam, elit lectus mauris sed maecenas. Veniam urna eget habitasse aliquam\"}', 0, '2020-11-03 19:03:48', '2020-11-03 19:11:42'),
(55, 'faq.element', '{\"question\":\"Why Xaxino?\",\"answer\":\"Donec quisque sem molestie tortor ut, libero libero interdum nec quisque, et scelerisque nam, elit lectus mauris sed maecenas. Veniam urna eget habitasse aliquam\"}', 0, '2020-11-03 19:04:06', '2021-07-28 06:28:59'),
(56, 'faq.element', '{\"question\":\"How to prediction?\",\"answer\":\"Donec quisque sem molestie tortor ut, libero libero interdum nec quisque, et scelerisque nam, elit lectus mauris sed maecenas. Veniam urna eget habitasse aliquam\"}', 0, '2020-11-03 19:04:18', '2020-11-03 19:04:18'),
(57, 'faq.element', '{\"id\":\"57\",\"question\":\"Our vission And mission?\",\"answer\":\"Donec quisque sem molestie tortor ut, libero libero interdum nec quisque, et scelerisque nam, elit lectus mauris sed maecenas. Veniam urna eget habitasse aliquam\"}', 0, '2020-11-03 19:04:29', '2020-11-03 19:11:32'),
(58, 'faq.element', '{\"id\":\"58\",\"question\":\"Our vission And mission?\",\"answer\":\"Donec quisque sem molestie tortor ut, libero libero interdum nec quisque, et scelerisque nam, elit lectus mauris sed maecenas. Veniam urna eget habitasse aliquam\"}', 0, '2020-11-03 19:04:43', '2020-11-03 19:11:26'),
(59, 'cta.content', '{\"has_image\":\"1\",\"heading\":\"Buy ticket and get million dollars for a click\",\"button\":\"Play Now\",\"button_url\":\"user\\/dashboard\",\"background_image\":\"6107c4624ae9f1627898978.jpg\"}', 0, '2020-11-03 19:17:29', '2021-08-02 04:09:38'),
(60, 'how_work.content', '{\"heading\":\"How Work Xaxino\"}', 0, '2020-11-03 21:02:06', '2021-07-28 06:50:39'),
(61, 'how_work.element', '{\"icon\":\"<i class=\\\"las la-trophy\\\"><\\/i>\",\"title\":\"Win Lottery!\",\"description\":\"Amet odit iure eaeos autiste perferendis numquam sint excepturi.\"}', 0, '2020-11-03 21:02:55', '2021-07-28 07:55:08'),
(62, 'how_work.element', '{\"icon\":\"<i class=\\\"las la-check-circle\\\"><\\/i>\",\"title\":\"Confirm Lottery\",\"description\":\"Amet odit iure eaeos autiste perferendis numquam sint excepturi.\"}', 0, '2020-11-03 21:03:31', '2021-07-28 07:55:14'),
(63, 'how_work.element', '{\"icon\":\"<i class=\\\"las la-hand-pointer\\\"><\\/i>\",\"title\":\"Pick Number\",\"description\":\"Amet odit iure eaeos autiste perferendis numquam sint excepturi.\"}', 0, '2020-11-03 21:03:58', '2021-07-28 07:55:18'),
(64, 'how_work.element', '{\"icon\":\"<i class=\\\"las la-check-square\\\"><\\/i>\",\"title\":\"Choose Lottery\",\"description\":\"Amet odit iure eaeos autiste perferendis numquam sint excepturi.\"}', 0, '2020-11-03 21:04:23', '2021-07-28 07:55:21'),
(65, 'referral.content', '{\"has_image\":\"1\",\"heading\":\"15% Referral Commission\",\"description\":\"<p style=\\\"margin-right:0px;margin-left:0px;font-size:16px;color:rgba(255,255,255,0.7);font-family:\'Open Sans\', sans-serif;background-color:rgb(6,3,34);\\\">Lorem ipsum dolor sit amet consectetur adipisicing elit. Reiciendis omnis recusandae non quos aspernatur? Quisquam excepturi nobis laborum minima recusandae, quidem voluptas, iusto fuga animi omnis eius eos assumenda dolore ipsum adipisci, iure aliquam exercitationem qui aliquid aperiam dolorum voluptate? Esse corrupti quia voluptatum minima natus voluptas aspernatur quisquam id.<\\/p><p style=\\\"margin-right:0px;margin-left:0px;color:rgba(255,255,255,0.85);font-family:Roboto, sans-serif;font-size:16px;background-color:rgb(2,12,37);\\\"><\\/p><ul class=\\\"cmn-list\\\" style=\\\"margin-top:20px;color:rgba(255,255,255,0.85);font-family:Roboto, sans-serif;background-color:rgb(2,12,37);\\\"><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;padding-left:40px;\\\">10% Bibendum purus feugiat at, dolor convallis auctor congue Aliquam urna et neque nulla proin<\\/li><li style=\\\"margin-top:15px;margin-right:0px;margin-left:0px;padding-left:40px;\\\">03% Magnis faucibus amet irure metus, adipiscing ultricies elit interdum odio vel nibh.<\\/li><li style=\\\"margin-top:15px;margin-right:0px;margin-left:0px;padding-left:40px;\\\">02% Magnis faucibus amet irure metus, adipiscing ultricies elit interdu<\\/li><\\/ul>\",\"image\":\"61016a7a845b11627482746.png\"}', 0, '2020-11-03 21:28:40', '2021-08-02 04:11:32'),
(66, 'testimonial.content', '{\"heading\":\"What User Say About Xaxino\"}', 0, '2020-11-03 22:11:44', '2021-07-28 08:38:13'),
(67, 'testimonial.element', '{\"has_image\":\"1\",\"name\":\"Auyesha Hatun\",\"quote\":\"Doloribus porro nobis in provident rem eum reandae quasi voluptatum, quibusdam et itaque tenetur quos alias quo harum officiis quis vero. Enim omnis porro, cupiditate repellat harum et eius distinctio neque dolorem expedita obcaecati commodi.\",\"person_image\":\"61016c12de0c21627483154.jpg\"}', 0, '2020-11-03 22:18:51', '2021-07-28 09:02:38'),
(68, 'testimonial.element', '{\"has_image\":\"1\",\"name\":\"Raba Khan\",\"quote\":\"Doloribus porro nobis in provident rem eum reandae quasi voluptatum, quibusdam et itaque tenetur quos alias quo harum officiis quis vero. Enim omnis porro, cupiditate repellat harum et eius distinctio neque dolorem expedita obcaecati commodi.\",\"person_image\":\"61016c22d7e091627483170.jpg\"}', 0, '2020-11-04 18:39:57', '2021-07-28 09:02:43'),
(69, 'testimonial.element', '{\"has_image\":\"1\",\"name\":\"Shunil Bhat\",\"quote\":\"Doloribus porro nobis in provident rem eum reandae quasi voluptatum, quibusdam et itaque tenetur quos alias quo harum officiis quis vero. Enim omnis porro, cupiditate repellat harum et eius distinctio neque dolorem expedita obcaecati commodi.\",\"person_image\":\"61016c29c44201627483177.jpg\"}', 0, '2020-11-04 18:40:22', '2021-07-28 09:02:57'),
(70, 'testimonial.element', '{\"has_image\":\"1\",\"name\":\"Raziya Khanam\",\"quote\":\"Doloribus porro nobis in provident rem eum reandae quasi voluptatum, quibusdam et itaque tenetur quos alias quo harum officiis quis vero. Enim omnis porro, cupiditate repellat harum et eius distinctio neque dolorem expedita obcaecati commodi.\",\"person_image\":\"61016c330425b1627483187.jpg\"}', 0, '2020-11-04 18:40:36', '2021-07-28 09:03:02'),
(71, 'blog.content', '{\"heading\":\"Our Blog News\",\"sub_heading\":\"Dolor sit amet consectetur adipisicing elit. Ipsa, harum quidem fuga ipsam dolores odio architecto, non neque minima atque nisi temporibus ullam\"}', 0, '2020-11-04 18:44:42', '2020-11-04 18:44:42'),
(72, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Aut modi soluta nihil, repellat adipisci similique dolores.\",\"preview_text\":\"Delectus velit adipisci amet offici molestias minus qui praesentium itaque incidunt sunt porro maxime sit veniam facere, reprehen.\",\"description_nic\":\"<p style=\\\"margin-top:20px;margin-right:0px;margin-left:0px;color:rgb(151,175,213);font-size:16px;font-family:Roboto, sans-serif;\\\">Pellentesque magna vel fermentum, libero nulla fermentum integer elit ut maecenas, diam suspendisse lectus, felis elit cras sint orci. Neque sit donec arcu, ornare odio pulvinar ante aliquam, luctus ac ut justo sapien orci a, eros blan proin vehicula morbi. Sed dui ut odio tristique, suspendisse sapien laoreet, placerat lectus ornare placerat, libero ac sapien tincidunt consectetuer, vestibulum vivamus at nonummy sem. Nunc convallis ornare non eget vitae, lectus pleradibus molestie, egestas amet vestibulum ac faucibus mi, ultricies atque ornare malesuada morbi parturient, donec tempus suspendisse scelerisque phasellus. Porttitor ultricies porttitor lacus arcu ultricies vitae, tempor mattis arcu sed viverra arcu natus, in wisi wisi dictum commodo erat justo, volutpat elit iaculis. Sit vel mauris nec magna odio. Et vel lobortis et. Aliquam enim felis turpis quis magnis consectetuer, tristique justo pulvinar mi libero maxime lectus. In massa semper reiciendis nulla a ante, quis vel, cras morbi sed.<\\/p><p style=\\\"margin-top:20px;margin-right:0px;margin-left:0px;color:rgb(151,175,213);font-size:16px;font-family:Roboto, sans-serif;\\\">Malesuada massa nibh interdum vel, adipiscing amet, vestibulum pede, nec ut vitae eros volutpat cras. Sed venenatis hymenaeos vestibulum at magna, ipsa mollis posuere ante lorem, sed erat, pulvinar vestibulum. Litora praesent duis eu amet at. Interdum urna eu malesuada vestibulum curabitur velit, wisi vitae. Nulla sem. Mauris venenatis a vivamus sit, egestas magna commodo vestibulum amet libero.<\\/p><p style=\\\"margin-top:20px;margin-right:0px;margin-left:0px;color:rgb(151,175,213);font-size:16px;font-family:Roboto, sans-serif;\\\">Turpis fusce dui, sed dui donec pharetra, integer imperdiet molestie tristique. Eros non et consectetuer sem, saepe nec nunc, feugiat ut tortor cras senectus fusce, euismod etiam mollis pharetra, commodo inceptos arcu aliquam lormet dui sit rutrum feugiat vivamus, integer leo. Hac eu urna eleifend quisque, at urna. Urna vel cras, pulvinar a nam leo gravida pede curabitur. Id justo dignissim pellentesque at, amet odit fusce, sit rutrum justo. Ornare nec nunc nibh consectetuer, ullamcorper montes sociis. Etiam luctus porta velit, sed pellentesque metus commodo<\\/p><p style=\\\"margin-top:20px;margin-right:0px;margin-left:0px;color:rgb(151,175,213);font-size:16px;font-family:Roboto, sans-serif;\\\">Enim malesuada massa nibh interdum vel, adipiscing amet, vestibulum pede, nec ut vitae eros volutpat crasSeivenatis hymenaeos vestibulum at magna, ipsa mollis posuere ante lorem, sed erat, pulvinar vestibulum. Litora pesent duis eu amet at. Interdum urna eu malesuada vestibulum curabitur velit, wisi vitae. Nulla sem. Mauris venenatis a vivamus sit, egestas magna commodo vestibulum, amet libero. commodo erat justo, volutpat elit iaculis. Sit vel mauris nec magna odio. Et vel lobortis et. Aliquam enim felis turpis quis magnis consectetuer, tristique justo pulvinar mi libero maxime lectus. In massa semper reiciendis nulla a ante quis velcras morbi sed.<\\/p><p style=\\\"margin-top:20px;margin-right:0px;margin-left:0px;color:rgb(151,175,213);font-size:16px;font-family:Roboto, sans-serif;\\\">Feugiat nibh, dis magna fusce turpis ut ante quam, ante neque non condimentum nec montes, enim vitae interdum. Id elementum enim volutpat pharetra erat sapien. Penatibus tincidunt praesent fringilla, dui eget in tristique nam nullam feugiat, sit auctor integer arcu risus. Aliquam interdum nulla vestibulum sit, molestie elit eros mi, at nunc eget posuere duis. Gravida cum sit, nam nibh interdum nulla, suspendisse adipiscing fusce wisi. Curabitur ac non aptent volutpat nascetur sed, odio iaculis placerat, neque integer. Sagittis mauris egestas consequat sunt cras, sapien ac nunc magnis nisl, sed mi integer in. Accumsan dui, erat tristique tristique vitae mi augue.<\\/p>\",\"blog_image\":\"6104f5a4f146b1627714980.jpg\"}', 8, '2020-11-04 18:45:06', '2021-07-31 01:03:01'),
(73, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Aut modi soluta nihil, repellat adipisci similique dolores.\",\"preview_text\":\"Delectus velit adipisci amet offici molestias minus qui praesentium itaque incidunt sunt porro maxime sit veniam facere, reprehen.\",\"description_nic\":\"<p style=\\\"margin-top:20px;margin-right:0px;margin-left:0px;color:rgb(151,175,213);font-size:16px;font-family:Roboto, sans-serif;\\\">Pellentesque magna vel fermentum, libero nulla fermentum integer elit ut maecenas, diam suspendisse lectus, felis elit cras sint orci. Neque sit donec arcu, ornare odio pulvinar ante aliquam, luctus ac ut justo sapien orci a, eros blan proin vehicula morbi. Sed dui ut odio tristique, suspendisse sapien laoreet, placerat lectus ornare placerat, libero ac sapien tincidunt consectetuer, vestibulum vivamus at nonummy sem. Nunc convallis ornare non eget vitae, lectus pleradibus molestie, egestas amet vestibulum ac faucibus mi, ultricies atque ornare malesuada morbi parturient, donec tempus suspendisse scelerisque phasellus. Porttitor ultricies porttitor lacus arcu ultricies vitae, tempor mattis arcu sed viverra arcu natus, in wisi wisi dictum commodo erat justo, volutpat elit iaculis. Sit vel mauris nec magna odio. Et vel lobortis et. Aliquam enim felis turpis quis magnis consectetuer, tristique justo pulvinar mi libero maxime lectus. In massa semper reiciendis nulla a ante, quis vel, cras morbi sed.<\\/p><p style=\\\"margin-top:20px;margin-right:0px;margin-left:0px;color:rgb(151,175,213);font-size:16px;font-family:Roboto, sans-serif;\\\">Malesuada massa nibh interdum vel, adipiscing amet, vestibulum pede, nec ut vitae eros volutpat cras. Sed venenatis hymenaeos vestibulum at magna, ipsa mollis posuere ante lorem, sed erat, pulvinar vestibulum. Litora praesent duis eu amet at. Interdum urna eu malesuada vestibulum curabitur velit, wisi vitae. Nulla sem. Mauris venenatis a vivamus sit, egestas magna commodo vestibulum amet libero.<\\/p><p style=\\\"margin-top:20px;margin-right:0px;margin-left:0px;color:rgb(151,175,213);font-size:16px;font-family:Roboto, sans-serif;\\\">Turpis fusce dui, sed dui donec pharetra, integer imperdiet molestie tristique. Eros non et consectetuer sem, saepe nec nunc, feugiat ut tortor cras senectus fusce, euismod etiam mollis pharetra, commodo inceptos arcu aliquam lormet dui sit rutrum feugiat vivamus, integer leo. Hac eu urna eleifend quisque, at urna. Urna vel cras, pulvinar a nam leo gravida pede curabitur. Id justo dignissim pellentesque at, amet odit fusce, sit rutrum justo. Ornare nec nunc nibh consectetuer, ullamcorper montes sociis. Etiam luctus porta velit, sed pellentesque metus commodo<\\/p><p style=\\\"margin-top:20px;margin-right:0px;margin-left:0px;color:rgb(151,175,213);font-size:16px;font-family:Roboto, sans-serif;\\\">Enim malesuada massa nibh interdum vel, adipiscing amet, vestibulum pede, nec ut vitae eros volutpat crasSeivenatis hymenaeos vestibulum at magna, ipsa mollis posuere ante lorem, sed erat, pulvinar vestibulum. Litora pesent duis eu amet at. Interdum urna eu malesuada vestibulum curabitur velit, wisi vitae. Nulla sem. Mauris venenatis a vivamus sit, egestas magna commodo vestibulum, amet libero. commodo erat justo, volutpat elit iaculis. Sit vel mauris nec magna odio. Et vel lobortis et. Aliquam enim felis turpis quis magnis consectetuer, tristique justo pulvinar mi libero maxime lectus. In massa semper reiciendis nulla a ante quis velcras morbi sed.<\\/p><p style=\\\"margin-top:20px;margin-right:0px;margin-left:0px;color:rgb(151,175,213);font-size:16px;font-family:Roboto, sans-serif;\\\">Feugiat nibh, dis magna fusce turpis ut ante quam, ante neque non condimentum nec montes, enim vitae interdum. Id elementum enim volutpat pharetra erat sapien. Penatibus tincidunt praesent fringilla, dui eget in tristique nam nullam feugiat, sit auctor integer arcu risus. Aliquam interdum nulla vestibulum sit, molestie elit eros mi, at nunc eget posuere duis. Gravida cum sit, nam nibh interdum nulla, suspendisse adipiscing fusce wisi. Curabitur ac non aptent volutpat nascetur sed, odio iaculis placerat, neque integer. Sagittis mauris egestas consequat sunt cras, sapien ac nunc magnis nisl, sed mi integer in. Accumsan dui, erat tristique tristique vitae mi augue.<\\/p>\",\"blog_image\":\"6104f59e8ab7a1627714974.jpg\"}', 7, '2020-11-04 18:45:20', '2021-07-31 01:02:54'),
(74, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Aut modi soluta nihil, repellat adipisci similique dolores.\",\"preview_text\":\"Delectus velit adipisci amet offici molestias minus qui praesentium itaque incidunt sunt porro maxime sit veniam facere, reprehen.\",\"description_nic\":\"<p style=\\\"margin-top:20px;margin-right:0px;margin-left:0px;color:rgb(151,175,213);font-size:16px;font-family:Roboto, sans-serif;\\\">Pellentesque magna vel fermentum, libero nulla fermentum integer elit ut maecenas, diam suspendisse lectus, felis elit cras sint orci. Neque sit donec arcu, ornare odio pulvinar ante aliquam, luctus ac ut justo sapien orci a, eros blan proin vehicula morbi. Sed dui ut odio tristique, suspendisse sapien laoreet, placerat lectus ornare placerat, libero ac sapien tincidunt consectetuer, vestibulum vivamus at nonummy sem. Nunc convallis ornare non eget vitae, lectus pleradibus molestie, egestas amet vestibulum ac faucibus mi, ultricies atque ornare malesuada morbi parturient, donec tempus suspendisse scelerisque phasellus. Porttitor ultricies porttitor lacus arcu ultricies vitae, tempor mattis arcu sed viverra arcu natus, in wisi wisi dictum commodo erat justo, volutpat elit iaculis. Sit vel mauris nec magna odio. Et vel lobortis et. Aliquam enim felis turpis quis magnis consectetuer, tristique justo pulvinar mi libero maxime lectus. In massa semper reiciendis nulla a ante, quis vel, cras morbi sed.<\\/p><p style=\\\"margin-top:20px;margin-right:0px;margin-left:0px;color:rgb(151,175,213);font-size:16px;font-family:Roboto, sans-serif;\\\">Malesuada massa nibh interdum vel, adipiscing amet, vestibulum pede, nec ut vitae eros volutpat cras. Sed venenatis hymenaeos vestibulum at magna, ipsa mollis posuere ante lorem, sed erat, pulvinar vestibulum. Litora praesent duis eu amet at. Interdum urna eu malesuada vestibulum curabitur velit, wisi vitae. Nulla sem. Mauris venenatis a vivamus sit, egestas magna commodo vestibulum amet libero.<\\/p><p style=\\\"margin-top:20px;margin-right:0px;margin-left:0px;color:rgb(151,175,213);font-size:16px;font-family:Roboto, sans-serif;\\\">Turpis fusce dui, sed dui donec pharetra, integer imperdiet molestie tristique. Eros non et consectetuer sem, saepe nec nunc, feugiat ut tortor cras senectus fusce, euismod etiam mollis pharetra, commodo inceptos arcu aliquam lormet dui sit rutrum feugiat vivamus, integer leo. Hac eu urna eleifend quisque, at urna. Urna vel cras, pulvinar a nam leo gravida pede curabitur. Id justo dignissim pellentesque at, amet odit fusce, sit rutrum justo. Ornare nec nunc nibh consectetuer, ullamcorper montes sociis. Etiam luctus porta velit, sed pellentesque metus commodo<\\/p><p style=\\\"margin-top:20px;margin-right:0px;margin-left:0px;color:rgb(151,175,213);font-size:16px;font-family:Roboto, sans-serif;\\\">Enim malesuada massa nibh interdum vel, adipiscing amet, vestibulum pede, nec ut vitae eros volutpat crasSeivenatis hymenaeos vestibulum at magna, ipsa mollis posuere ante lorem, sed erat, pulvinar vestibulum. Litora pesent duis eu amet at. Interdum urna eu malesuada vestibulum curabitur velit, wisi vitae. Nulla sem. Mauris venenatis a vivamus sit, egestas magna commodo vestibulum, amet libero. commodo erat justo, volutpat elit iaculis. Sit vel mauris nec magna odio. Et vel lobortis et. Aliquam enim felis turpis quis magnis consectetuer, tristique justo pulvinar mi libero maxime lectus. In massa semper reiciendis nulla a ante quis velcras morbi sed.<\\/p><p style=\\\"margin-top:20px;margin-right:0px;margin-left:0px;color:rgb(151,175,213);font-size:16px;font-family:Roboto, sans-serif;\\\">Feugiat nibh, dis magna fusce turpis ut ante quam, ante neque non condimentum nec montes, enim vitae interdum. Id elementum enim volutpat pharetra erat sapien. Penatibus tincidunt praesent fringilla, dui eget in tristique nam nullam feugiat, sit auctor integer arcu risus. Aliquam interdum nulla vestibulum sit, molestie elit eros mi, at nunc eget posuere duis. Gravida cum sit, nam nibh interdum nulla, suspendisse adipiscing fusce wisi. Curabitur ac non aptent volutpat nascetur sed, odio iaculis placerat, neque integer. Sagittis mauris egestas consequat sunt cras, sapien ac nunc magnis nisl, sed mi integer in. Accumsan dui, erat tristique tristique vitae mi augue.<\\/p>\",\"blog_image\":\"6104f59768bf31627714967.jpg\"}', 2, '2020-11-04 18:45:31', '2021-07-31 01:02:47'),
(75, 'payment_method.content', '{\"heading\":\"We accept 21+ payment methods\"}', 0, '2020-11-04 18:56:03', '2020-11-04 19:01:21'),
(76, 'payment_method.element', '{\"has_image\":\"1\",\"method_image\":\"5fa3a216a0be21604559382.png\"}', 0, '2020-11-04 18:56:22', '2020-11-04 18:56:22'),
(77, 'payment_method.element', '{\"has_image\":\"1\",\"method_image\":\"5fa3a21c3bc101604559388.png\"}', 0, '2020-11-04 18:56:28', '2020-11-04 18:56:28'),
(78, 'payment_method.element', '{\"has_image\":\"1\",\"method_image\":\"5fa3a22252e7e1604559394.png\"}', 0, '2020-11-04 18:56:34', '2020-11-04 18:56:34'),
(79, 'payment_method.element', '{\"has_image\":\"1\",\"method_image\":\"5fa3a228cc9f01604559400.png\"}', 0, '2020-11-04 18:56:40', '2020-11-04 18:56:40'),
(80, 'payment_method.element', '{\"has_image\":\"1\",\"method_image\":\"5fa3a22faadaa1604559407.png\"}', 0, '2020-11-04 18:56:47', '2020-11-04 18:56:47'),
(81, 'payment_method.element', '{\"has_image\":\"1\",\"method_image\":\"5fa3a237c36d91604559415.png\"}', 0, '2020-11-04 18:56:55', '2020-11-04 18:56:55'),
(82, 'payment_method.element', '{\"has_image\":\"1\",\"method_image\":\"5fa3a23fe1ad11604559423.png\"}', 0, '2020-11-04 18:57:03', '2020-11-04 18:57:03'),
(83, 'payment_method.element', '{\"has_image\":\"1\",\"method_image\":\"5fa3a247df8c71604559431.png\"}', 0, '2020-11-04 18:57:11', '2020-11-04 18:57:11'),
(84, 'breadcrumb.content', '{\"has_image\":\"1\",\"breadcrumb_image\":\"6105392c281261627732268.jpg\"}', 0, '2020-11-04 21:40:58', '2021-07-31 05:51:08'),
(85, 'login.content', '{\"has_image\":\"1\",\"title\":\"Welcome to Xaxino\",\"sub_title\":\"Sit iste delectus iure animi facere. Est veritatis illo officia.\",\"image\":\"6107c68d9ed171627899533.jpg\"}', 0, '2020-11-04 21:44:02', '2021-08-02 04:18:54'),
(86, 'footer.content', '{\"footer_content\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt ea possimus facilis aut veritatis, voluptate ullam, dolorem fugiat maxime cupiditate reiciendis voluptatum  incidunt deserunt.\",\"subscribe_title\":\"Subscribe to get updates\",\"subscribe_content\":\"Lorem ipsum dolor sit amet soluta consectetur adipisicing elit. Iste amet soluta possimus veniam non eaque.\"}', 0, '2021-05-10 21:49:38', '2021-05-10 21:49:38'),
(87, 'footer.element', '{\"id\":\"87\",\"social_icon\":\"<i class=\\\"lab la-google-plus\\\"><\\/i>\",\"social_url\":\"https:\\/\\/www.google.com\\/\"}', 0, '2021-05-10 21:52:00', '2021-05-20 00:49:34'),
(88, 'footer.element', '{\"social_icon\":\"<i class=\\\"lab la-instagram\\\"><\\/i>\",\"social_url\":\"https:\\/\\/www.instagram.com\\/\"}', 0, '2021-05-10 21:52:09', '2021-05-10 21:52:09'),
(89, 'footer.element', '{\"social_icon\":\"<i class=\\\"lab la-twitter\\\"><\\/i>\",\"social_url\":\"https:\\/\\/www.twitter.com\\/\"}', 0, '2021-05-10 21:52:18', '2021-05-10 21:52:18'),
(90, 'footer.element', '{\"social_icon\":\"<i class=\\\"lab la-facebook-f\\\"><\\/i>\",\"social_url\":\"https:\\/\\/www.facebook.com\\/\"}', 0, '2021-05-10 21:52:29', '2021-05-10 21:52:29'),
(91, 'address.content', '{\"phone\":\"5488848798\",\"email\":\"demo@demo.com\",\"address\":\"Medino, NY 10012, USA\"}', 0, '2021-05-10 21:57:14', '2021-05-10 21:57:14'),
(92, 'extra.element', '{\"id\":\"92\",\"title\":\"Terms and Condition\",\"content\":\"<div class=\\\"divide\\\" style=\\\"margin-top:10px;clear:both;width:1122px;padding:15px 0px;border-bottom:1px solid rgb(177,177,177);color:rgb(102,102,102);font-family:Roboto, sans-serif;font-size:12.8px;\\\"><h3 class=\\\"title\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:\'Josefin Sans\', sans-serif;color:rgb(255,255,255);background-color:rgb(6,3,34);\\\">Introduction<\\/h3><h3 class=\\\"title\\\" style=\\\"margin-bottom:0.5rem;font-weight:600;line-height:1.2em;font-size:20px;clear:both;color:rgb(3,28,108);text-transform:capitalize;font-family:Poppins, sans-serif;\\\"><\\/h3><p style=\\\"margin-right:0px;margin-left:0px;color:rgba(255,255,255,0.7);font-family:\'Open Sans\', sans-serif;font-size:16px;text-transform:none;background-color:rgb(6,3,34);\\\">Dictumst molestie dui nulla bibendum tellus. Purus tincidunt amet pellentesque dis aliquet, urna dicongen pebus suspendissjusto, eget adipiscing, eros in donec ligula curseger. Accumsan egestas tpmagna debitis plarat vestibulum commodo nascetur odio at, tortor dui posuere ornare donec mauris, phasellus ipsum.commodo augue. Adalenatismassa fringilla, euismod elit tellus amet. Commodoostie dolor amet imperdiet feugiat. Enim lacus eu duis est. Risus gravida eget, consequat tortor, felis elit dolor mauris purus tesque augue, leo nisl dis vehicula, vehicula magna.Habitant eu amet cras nonummy, purus sagittis, curae interdum ipsum, sed vulputate varius, a sapien nunc aliquamc qui nec dutasse tempor, vitae velit viverra, aliquam purus quam varius ipsum, eu dolor enim ridiculus proin. Purus pede cras, varius risus mi, eros placerat tristique enim non fermentum nibh, enim diam mi venenatis quam nostra. Pulvinar adipisci et nullam fringilla nec, esse dui metus arcu. Nam massa erat nullam, fermentum nulla, proin eleifend eu est sed tristique, porta id mi congue semper conubia vitae, inceptos id mauris. Morbi viverra suspendisse non, maecenas commodo tristique suspendisse eleifend nec.<\\/p><h3 class=\\\"title mt-50\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:\'Josefin Sans\', sans-serif;color:rgb(255,255,255);background-color:rgb(6,3,34);\\\">Ownership of Right<\\/h3><h3 class=\\\"title\\\" style=\\\"margin-bottom:0.5rem;font-weight:600;line-height:1.2em;font-size:20px;clear:both;color:rgb(3,28,108);text-transform:capitalize;font-family:Poppins, sans-serif;\\\"><\\/h3><p style=\\\"margin-right:0px;margin-left:0px;color:rgba(255,255,255,0.7);font-family:\'Open Sans\', sans-serif;font-size:16px;text-transform:none;background-color:rgb(6,3,34);\\\">Dictumst molestie dui nulla bibendum tellus. Purus tincidunt amet pellentesque dis aliquet, urna dicongen pebus suspendissjusto, eget adipiscing, eros in donec ligula curseger. Accumsan egestas tpmagna debitis plarat vestibulum commodo nascetur odio at, tortor dui posuere ornare donec mauris, phasellus ipsum.commodo augue. Adalenatismassa fringilla, euismod elit tellus amet. Commodoostie dolor amet imperdiet feugiat. Enim lacus eu duis est. Risus gravida eget, consequat tortor, felis elit dolor mauris purus tesque augue, leo nisl dis vehicula, vehicula magna.Habitant eu amet cras nonummy, purus sagittis, curae interdum ipsum, sed vulputate varius, a sapien nunc aliquamc qui nec dutasse tempor, vitae velit viverra, aliquam purus quam varius ipsum, eu dolor enim ridiculus proin.<\\/p><ul class=\\\"cmn-list\\\" style=\\\"margin-top:20px;color:rgba(255,255,255,0.7);font-family:\'Open Sans\', sans-serif;font-size:16px;font-weight:400;text-transform:none;background-color:rgb(6,3,34);\\\"><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;padding-left:40px;\\\">Habitant eu amet cras nonummy, purus sagittis, curae interdum ipsum, sed vulputate varius, a sapien nunc aliquam. Ac qui nec duis habitasse tempor, vitae velit viverquam purus quam varius ipsum, eu dolor enim ridiculus proin. Purus pede cras, varius risus mi, eros placerat tristique Habitant eu amet cras nonummy, purus sagittis, curaerdum ipsum, sed vulputate varius, a sapien nunc aliquam. Ac qui nec duis habitasse tempor, vitae velit viverra.<\\/li><li style=\\\"margin-top:15px;margin-right:0px;margin-left:0px;padding-left:40px;\\\">Habitant eu amet cras nonummy, purus sagittis, curae interdum ipsum, sed vulputate varius, a sapien nunc aliquam. Ac qui nec duis habitasse tempor, vitae velit viverquam purus quam varius ipsum, eu dolor enim ridiculus proin. Purus pede cras, varius risus mi, eros placerat tristique Habitant eu amet cras nonummy, purus sagittis, curaerdum ipsum, sed vulputate varius, a sapien nunc aliquam. Ac qui nec duis habitasse tempor, vitae velit viverra.<\\/li><li style=\\\"margin-top:15px;margin-right:0px;margin-left:0px;padding-left:40px;\\\">Habitant eu amet cras nonummy, purus sagittis, curae interdum ipsum, sed vulputate varius, a sapien nunc aliquam. Ac qui nec duis habitasse tempor, vitae velit viverquam purus quam varius ipsum, eu dolor enim ridiculus proin. Purus pede cras, varius risus mi, eros placerat tristique Habitant eu amet cras nonummy, purus sagittis, curaerdum ipsum, sed vulputate varius, a sapien nunc aliquam. Ac qui nec duis habitasse tempor, vitae velit viverra.<\\/li><li style=\\\"margin-top:15px;margin-right:0px;margin-left:0px;padding-left:40px;\\\">Habitant eu amet cras nonummy, purus sagittis, curae interdum ipsum, sed vulputate varius, a sapien nunc aliquam. Ac qui nec duis habitasse tempor, vitae velit viverquam purus quam varius ipsum, eu dolor enim ridiculus proin. Purus pede cras, varius risus mi, eros placerat tristique Habitant eu amet cras nonummy, purus sagittis, curaerdum ipsum, sed vulputate varius, a sapien nunc aliquam. Ac qui nec duis habitasse tempor, vitae velit viverra.<\\/li><\\/ul><h3 class=\\\"title mt-50\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:\'Josefin Sans\', sans-serif;color:rgb(255,255,255);background-color:rgb(6,3,34);\\\">Accuracy of Content<\\/h3><h3 class=\\\"title\\\" style=\\\"margin-bottom:0.5rem;font-weight:600;line-height:1.2em;font-size:20px;clear:both;color:rgb(3,28,108);text-transform:capitalize;font-family:Poppins, sans-serif;\\\"><\\/h3><p style=\\\"margin-right:0px;margin-left:0px;color:rgba(255,255,255,0.7);font-family:\'Open Sans\', sans-serif;font-size:16px;text-transform:none;background-color:rgb(6,3,34);\\\">Dictumst molestie dui nulla bibendum tellus. Purus tincidunt amet pellentesque dis aliquet, urna dicongen pebus suspendissjusto, eget adipiscing, eros in donec ligula curseger. Accumsan egestas tpmagna debitis plarat vestibulum commodo nascetur odio at, tortor dui posuere ornare donec mauris, phasellus ipsum.commodo augue. Adalenatismassa fringilla, euismod elit tellus amet. Commodoostie dolor amet imperdiet feugiat. Enim lacus eu duis est. Risus gravida eget, consequat tortor, felis elit dolor mauris purus tesque augue, leo nisl dis vehicula, vehicula magna.Habitant eu amet cras nonummy, purus sagittis, curae interdum ipsum, sed vulputate varius, a sapien nunc aliquamc qui nec dutasse tempor, vitae velit viverra, aliquam purus quam varius ipsum, eu dolor enim ridiculus proin. Purus pede cras, varius risus mi, eros placerat tristique enim non fermentum nibh, enim diam mi venenatis quam nostra. Pulvinar adipisci et nullam fringilla nec, esse dui metus arcu. Nam massa erat nullam, fermentum nulla, proin eleifend eu est sed tristique, porta id mi congue semper conubia vitae, inceptos id mauris. Morbi viverra suspendisse non, maecenas commodo tristique suspendisse eleifend nec.<\\/p><ul class=\\\"cmn-list\\\" style=\\\"margin-top:20px;color:rgba(255,255,255,0.7);font-family:\'Open Sans\', sans-serif;font-size:16px;font-weight:400;text-transform:none;background-color:rgb(6,3,34);\\\"><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;padding-left:40px;\\\">Aras mi ac facilisis nec turpis maecenas, curabitur penatibus bibendum nibh nec, lorem integer donec a, risus quis ullamcorper, ante sapien wisi integer. Neque accumsan vestibulum. Vestibulum venenatis sem sit. Mauris eu curabitur eros, turpis elit alias in morbi, ac natoque quis, porttitor amet ut, eu eu aenean aliquam augue vel. Sed placat in scelerisque, purus metus est, scelerisque quis purusi<\\/li><li style=\\\"margin-top:15px;margin-right:0px;margin-left:0px;padding-left:40px;\\\">Cras mi ac facilisis nec turpis maecenas, curabitur penatibus bibendum nibh nec, lorem integer donec a, risus quis ullamcorper, ante sapien wisi integer. Neque accumiulum. Vestibulum venenatis sem sit. Mauris eu curabitur eros, turpis elit alias in morbi, ac natoque quis, porttitor amet ut, eu eu aenean aliquam augue vel. Sed placerat in scesque, purus metus est, scelerisque quis purusi<\\/li><li style=\\\"margin-top:15px;margin-right:0px;margin-left:0px;padding-left:40px;\\\">Qras mi ac facilisis nec turpis maecenas, curabitur penatibus bibendum nibh nec, lorem integer donec a, risus quis ullamcorper, ante sapien wisi integer. Neque accumsan vestibulum. Vestibulum venenatis sem sit. Mauris eu curabitur eros, turpis elit alias in morbi, ac natoque quis, porttitor amet ut, eu eu aenean aliquam augue vel. Sed placerat in scelerisque, purus metus est, scelerisque quis purus<\\/li><\\/ul><h3 class=\\\"title mt-50\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:\'Josefin Sans\', sans-serif;color:rgb(255,255,255);background-color:rgb(6,3,34);\\\">Terms of Use<\\/h3><h3 class=\\\"title\\\" style=\\\"margin-bottom:0.5rem;font-weight:600;line-height:1.2em;font-size:20px;clear:both;color:rgb(3,28,108);text-transform:capitalize;font-family:Poppins, sans-serif;\\\"><\\/h3><p style=\\\"margin-right:0px;margin-left:0px;color:rgba(255,255,255,0.7);font-family:\'Open Sans\', sans-serif;font-size:16px;text-transform:none;background-color:rgb(6,3,34);\\\">Fringilla a nunc commodo. Elit amet ipsum tempus mauris sapien nisl, malesuada cum id, euismod ut. Vel sollicitudin wisi mattis, nunc turpis conubia ac semper, suscipit donec nulla. Risus in consectetuer non risus pede platea, eu consectetuer nostra mi justo venenatis elit, pretium amet diam litora mus fames, habitasse felis suscipit sit, magnis gittis. Auctor integer cum amet tellus pharetra pellentesque,\\u00a0<a href=\\\"http:\\/\\/localhost\\/7-Xaxino\\/extra\\/92\\/terms-and-condition#0\\\">www.demosite.com<\\/a>\\u00a0neque est ut ut nulla, magna ipsum, faucibus urna enim a sollicitudin purus. Sem commodo nulla voluptatem Imperdiet ut egestas. Faucibus venenatis tincidunt, sociosqu mauris, est malesuada nullam porta odio ante metus. Habitasse donec maecenas quam semper, voluptate suspendisse veniam, adipiscing non lectus, libero morbi mi odio nulla, condimentum tincidunt at rhoncus vulputate et. Justo auctor ante, justo adipiscing sodales ac dolor nonummy purus, sapien lacus. Curabitur pellentesque, sodales gravida platea convallis, imperdiet pellentesque turpis adipiscing id vestibulum, ornare et et at adipiscing urna nulla.<\\/p><h3 class=\\\"title mt-50\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:\'Josefin Sans\', sans-serif;color:rgb(255,255,255);background-color:rgb(6,3,34);\\\">Eligibility<\\/h3><h3 class=\\\"title\\\" style=\\\"margin-bottom:0.5rem;font-weight:600;line-height:1.2em;font-size:20px;clear:both;color:rgb(3,28,108);text-transform:capitalize;font-family:Poppins, sans-serif;\\\"><\\/h3><p style=\\\"margin-right:0px;margin-left:0px;color:rgba(255,255,255,0.7);font-family:\'Open Sans\', sans-serif;font-size:16px;text-transform:none;background-color:rgb(6,3,34);\\\">Quisque dictum est torquent volutpat quam, nascetur donec ultricies tellus, vehicula gravida, enim montes adipiscing wisi orci sociis vestibulum. Per sit, nisl sed cras nisl neque lectus, turpis leo tortor ligula pede laoreet ac, sapien tellus nam, mauris aut rutrum. Dapibus litora pulvinar in, porta tempus nunc orci, eros sit mi est sociis eget ut, wisi dolocus. Pellentesque ut ac varius dolorem risus, ac in, mauris vel posuere, neque at orci, est a tempor scelerisque ipsum ornare magna eget risus ante natoque. Dui est scelerisque. Odio nibh amet, vel vitae aliquet nec pede. Erat risus, nunc libero integer at tristique elit egestas, euismod convallis vestibulum rutrum qui, feugiat diam, risus quam tristique sit dales. Interdum et netus curabitur, in consequat molestie leo ultricies, neque diam phasellus egestas, litora magna porttitor orci. ligula pede laoreet ac, sapien tellus nam, mauris aut rutrum. Dapibus litora pulvinar in, porta tempus nunc orci, eros sit mi est sociis eget ut, wisi dolor rhoncus. Pellentesque ut ac varius dolorem risus, ac in, mauris vel posuere, neque at orci, est a tempor scelerisque ipsum. Venenatis auctor in interdum neque curabitur, aliquet ut in leo in ultrices. Justo id viverra cursus, tempus nunc amet.<\\/p><ul class=\\\"cmn-list\\\" style=\\\"margin-top:20px;color:rgba(255,255,255,0.7);font-family:\'Open Sans\', sans-serif;font-size:16px;font-weight:400;text-transform:none;background-color:rgb(6,3,34);\\\"><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;padding-left:40px;\\\">Aras mi ac facilisis nec turpis maecenas, curabitur penatibus bibendum nibh nec, lorem integer donec a, risus quis ullamcorper, ante sapien wisi integer. Neque accumsan vestibulum. Vestibulum venenatis sem sit. Mauris eu curabitur eros, turpis elit alias in morbi, ac natoque quis, porttitor amet ut, eu eu aenean aliquam augue vel. Sed placat in scelerisque, purus metus est, scelerisque quis purusi<\\/li><li style=\\\"margin-top:15px;margin-right:0px;margin-left:0px;padding-left:40px;\\\">Cras mi ac facilisis nec turpis maecenas, curabitur penatibus bibendum nibh nec, lorem integer donec a, risus quis ullamcorper, ante sapien wisi integer. Neque accumiulum. Vestibulum venenatis sem sit. Mauris eu curabitur eros, turpis elit alias in morbi, ac natoque quis, porttitor amet ut, eu eu aenean aliquam augue vel. Sed placerat in scesque, purus metus est, scelerisque quis purusi<\\/li><li style=\\\"margin-top:15px;margin-right:0px;margin-left:0px;padding-left:40px;\\\">Qras mi ac facilisis nec turpis maecenas, curabitur penatibus bibendum nibh nec, lorem integer donec a, risus quis ullamcorper, ante sapien wisi integer. Neque accumsan vestibulum. Vestibulum venenatis sem sit. Mauris eu curabitur eros, turpis elit alias in morbi, ac natoque quis, porttitor amet ut, eu eu aenean aliquam augue vel. Sed placerat in scelerisque, purus metus est, scelerisque quis purus i<\\/li><\\/ul><\\/div>\"}', 0, '2021-05-10 22:05:44', '2021-05-11 00:42:29');
INSERT INTO `frontends` (`id`, `data_keys`, `data_values`, `views`, `created_at`, `updated_at`) VALUES
(93, 'extra.element', '{\"id\":\"93\",\"title\":\"Privacy and Policy\",\"content\":\"<div class=\\\"divide\\\" style=\\\"margin-top:10px;clear:both;width:1122px;padding:15px 0px;border-bottom:1px solid rgb(177,177,177);color:rgb(102,102,102);font-family:Roboto, sans-serif;font-size:12.8px;\\\"><h3 class=\\\"title\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:\'Josefin Sans\', sans-serif;color:rgb(255,255,255);background-color:rgb(6,3,34);\\\">Introduction<\\/h3><h3 class=\\\"title\\\" style=\\\"margin-bottom:0.5rem;font-weight:600;line-height:1.2em;font-size:20px;clear:both;color:rgb(3,28,108);text-transform:capitalize;font-family:Poppins, sans-serif;\\\"><\\/h3><p style=\\\"margin-right:0px;margin-left:0px;color:rgba(255,255,255,0.7);font-family:\'Open Sans\', sans-serif;font-size:16px;text-transform:none;background-color:rgb(6,3,34);\\\">Dictumst molestie dui nulla bibendum tellus. Purus tincidunt amet pellentesque dis aliquet, urna dicongen pebus suspendissjusto, eget adipiscing, eros in donec ligula curseger. Accumsan egestas tpmagna debitis plarat vestibulum commodo nascetur odio at, tortor dui posuere ornare donec mauris, phasellus ipsum.commodo augue. Adalenatismassa fringilla, euismod elit tellus amet. Commodoostie dolor amet imperdiet feugiat. Enim lacus eu duis est. Risus gravida eget, consequat tortor, felis elit dolor mauris purus tesque augue, leo nisl dis vehicula, vehicula magna.Habitant eu amet cras nonummy, purus sagittis, curae interdum ipsum, sed vulputate varius, a sapien nunc aliquamc qui nec dutasse tempor, vitae velit viverra, aliquam purus quam varius ipsum, eu dolor enim ridiculus proin. Purus pede cras, varius risus mi, eros placerat tristique enim non fermentum nibh, enim diam mi venenatis quam nostra. Pulvinar adipisci et nullam fringilla nec, esse dui metus arcu. Nam massa erat nullam, fermentum nulla, proin eleifend eu est sed tristique, porta id mi congue semper conubia vitae, inceptos id mauris. Morbi viverra suspendisse non, maecenas commodo tristique suspendisse eleifend nec.<\\/p><h3 class=\\\"title mt-50\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:\'Josefin Sans\', sans-serif;color:rgb(255,255,255);background-color:rgb(6,3,34);\\\">Ownership of Right<\\/h3><h3 class=\\\"title\\\" style=\\\"margin-bottom:0.5rem;font-weight:600;line-height:1.2em;font-size:20px;clear:both;color:rgb(3,28,108);text-transform:capitalize;font-family:Poppins, sans-serif;\\\"><\\/h3><p style=\\\"margin-right:0px;margin-left:0px;color:rgba(255,255,255,0.7);font-family:\'Open Sans\', sans-serif;font-size:16px;text-transform:none;background-color:rgb(6,3,34);\\\">Dictumst molestie dui nulla bibendum tellus. Purus tincidunt amet pellentesque dis aliquet, urna dicongen pebus suspendissjusto, eget adipiscing, eros in donec ligula curseger. Accumsan egestas tpmagna debitis plarat vestibulum commodo nascetur odio at, tortor dui posuere ornare donec mauris, phasellus ipsum.commodo augue. Adalenatismassa fringilla, euismod elit tellus amet. Commodoostie dolor amet imperdiet feugiat. Enim lacus eu duis est. Risus gravida eget, consequat tortor, felis elit dolor mauris purus tesque augue, leo nisl dis vehicula, vehicula magna.Habitant eu amet cras nonummy, purus sagittis, curae interdum ipsum, sed vulputate varius, a sapien nunc aliquamc qui nec dutasse tempor, vitae velit viverra, aliquam purus quam varius ipsum, eu dolor enim ridiculus proin.<\\/p><ul class=\\\"cmn-list\\\" style=\\\"margin-top:20px;color:rgba(255,255,255,0.7);font-family:\'Open Sans\', sans-serif;font-size:16px;font-weight:400;text-transform:none;background-color:rgb(6,3,34);\\\"><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;padding-left:40px;\\\">Habitant eu amet cras nonummy, purus sagittis, curae interdum ipsum, sed vulputate varius, a sapien nunc aliquam. Ac qui nec duis habitasse tempor, vitae velit viverquam purus quam varius ipsum, eu dolor enim ridiculus proin. Purus pede cras, varius risus mi, eros placerat tristique Habitant eu amet cras nonummy, purus sagittis, curaerdum ipsum, sed vulputate varius, a sapien nunc aliquam. Ac qui nec duis habitasse tempor, vitae velit viverra.<\\/li><li style=\\\"margin-top:15px;margin-right:0px;margin-left:0px;padding-left:40px;\\\">Habitant eu amet cras nonummy, purus sagittis, curae interdum ipsum, sed vulputate varius, a sapien nunc aliquam. Ac qui nec duis habitasse tempor, vitae velit viverquam purus quam varius ipsum, eu dolor enim ridiculus proin. Purus pede cras, varius risus mi, eros placerat tristique Habitant eu amet cras nonummy, purus sagittis, curaerdum ipsum, sed vulputate varius, a sapien nunc aliquam. Ac qui nec duis habitasse tempor, vitae velit viverra.<\\/li><li style=\\\"margin-top:15px;margin-right:0px;margin-left:0px;padding-left:40px;\\\">Habitant eu amet cras nonummy, purus sagittis, curae interdum ipsum, sed vulputate varius, a sapien nunc aliquam. Ac qui nec duis habitasse tempor, vitae velit viverquam purus quam varius ipsum, eu dolor enim ridiculus proin. Purus pede cras, varius risus mi, eros placerat tristique Habitant eu amet cras nonummy, purus sagittis, curaerdum ipsum, sed vulputate varius, a sapien nunc aliquam. Ac qui nec duis habitasse tempor, vitae velit viverra.<\\/li><li style=\\\"margin-top:15px;margin-right:0px;margin-left:0px;padding-left:40px;\\\">Habitant eu amet cras nonummy, purus sagittis, curae interdum ipsum, sed vulputate varius, a sapien nunc aliquam. Ac qui nec duis habitasse tempor, vitae velit viverquam purus quam varius ipsum, eu dolor enim ridiculus proin. Purus pede cras, varius risus mi, eros placerat tristique Habitant eu amet cras nonummy, purus sagittis, curaerdum ipsum, sed vulputate varius, a sapien nunc aliquam. Ac qui nec duis habitasse tempor, vitae velit viverra.<\\/li><\\/ul><h3 class=\\\"title mt-50\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:\'Josefin Sans\', sans-serif;color:rgb(255,255,255);background-color:rgb(6,3,34);\\\">Accuracy of Content<\\/h3><h3 class=\\\"title\\\" style=\\\"margin-bottom:0.5rem;font-weight:600;line-height:1.2em;font-size:20px;clear:both;color:rgb(3,28,108);text-transform:capitalize;font-family:Poppins, sans-serif;\\\"><\\/h3><p style=\\\"margin-right:0px;margin-left:0px;color:rgba(255,255,255,0.7);font-family:\'Open Sans\', sans-serif;font-size:16px;text-transform:none;background-color:rgb(6,3,34);\\\">Dictumst molestie dui nulla bibendum tellus. Purus tincidunt amet pellentesque dis aliquet, urna dicongen pebus suspendissjusto, eget adipiscing, eros in donec ligula curseger. Accumsan egestas tpmagna debitis plarat vestibulum commodo nascetur odio at, tortor dui posuere ornare donec mauris, phasellus ipsum.commodo augue. Adalenatismassa fringilla, euismod elit tellus amet. Commodoostie dolor amet imperdiet feugiat. Enim lacus eu duis est. Risus gravida eget, consequat tortor, felis elit dolor mauris purus tesque augue, leo nisl dis vehicula, vehicula magna.Habitant eu amet cras nonummy, purus sagittis, curae interdum ipsum, sed vulputate varius, a sapien nunc aliquamc qui nec dutasse tempor, vitae velit viverra, aliquam purus quam varius ipsum, eu dolor enim ridiculus proin. Purus pede cras, varius risus mi, eros placerat tristique enim non fermentum nibh, enim diam mi venenatis quam nostra. Pulvinar adipisci et nullam fringilla nec, esse dui metus arcu. Nam massa erat nullam, fermentum nulla, proin eleifend eu est sed tristique, porta id mi congue semper conubia vitae, inceptos id mauris. Morbi viverra suspendisse non, maecenas commodo tristique suspendisse eleifend nec.<\\/p><ul class=\\\"cmn-list\\\" style=\\\"margin-top:20px;color:rgba(255,255,255,0.7);font-family:\'Open Sans\', sans-serif;font-size:16px;font-weight:400;text-transform:none;background-color:rgb(6,3,34);\\\"><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;padding-left:40px;\\\">Aras mi ac facilisis nec turpis maecenas, curabitur penatibus bibendum nibh nec, lorem integer donec a, risus quis ullamcorper, ante sapien wisi integer. Neque accumsan vestibulum. Vestibulum venenatis sem sit. Mauris eu curabitur eros, turpis elit alias in morbi, ac natoque quis, porttitor amet ut, eu eu aenean aliquam augue vel. Sed placat in scelerisque, purus metus est, scelerisque quis purusi<\\/li><li style=\\\"margin-top:15px;margin-right:0px;margin-left:0px;padding-left:40px;\\\">Cras mi ac facilisis nec turpis maecenas, curabitur penatibus bibendum nibh nec, lorem integer donec a, risus quis ullamcorper, ante sapien wisi integer. Neque accumiulum. Vestibulum venenatis sem sit. Mauris eu curabitur eros, turpis elit alias in morbi, ac natoque quis, porttitor amet ut, eu eu aenean aliquam augue vel. Sed placerat in scesque, purus metus est, scelerisque quis purusi<\\/li><li style=\\\"margin-top:15px;margin-right:0px;margin-left:0px;padding-left:40px;\\\">Qras mi ac facilisis nec turpis maecenas, curabitur penatibus bibendum nibh nec, lorem integer donec a, risus quis ullamcorper, ante sapien wisi integer. Neque accumsan vestibulum. Vestibulum venenatis sem sit. Mauris eu curabitur eros, turpis elit alias in morbi, ac natoque quis, porttitor amet ut, eu eu aenean aliquam augue vel. Sed placerat in scelerisque, purus metus est, scelerisque quis purus<\\/li><\\/ul><h3 class=\\\"title mt-50\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:\'Josefin Sans\', sans-serif;color:rgb(255,255,255);background-color:rgb(6,3,34);\\\">Terms of Use<\\/h3><h3 class=\\\"title\\\" style=\\\"margin-bottom:0.5rem;font-weight:600;line-height:1.2em;font-size:20px;clear:both;color:rgb(3,28,108);text-transform:capitalize;font-family:Poppins, sans-serif;\\\"><\\/h3><p style=\\\"margin-right:0px;margin-left:0px;color:rgba(255,255,255,0.7);font-family:\'Open Sans\', sans-serif;font-size:16px;text-transform:none;background-color:rgb(6,3,34);\\\">Fringilla a nunc commodo. Elit amet ipsum tempus mauris sapien nisl, malesuada cum id, euismod ut. Vel sollicitudin wisi mattis, nunc turpis conubia ac semper, suscipit donec nulla. Risus in consectetuer non risus pede platea, eu consectetuer nostra mi justo venenatis elit, pretium amet diam litora mus fames, habitasse felis suscipit sit, magnis gittis. Auctor integer cum amet tellus pharetra pellentesque,\\u00a0<a href=\\\"http:\\/\\/localhost\\/7-Xaxino\\/extra\\/92\\/terms-and-condition#0\\\">www.demosite.com<\\/a>\\u00a0neque est ut ut nulla, magna ipsum, faucibus urna enim a sollicitudin purus. Sem commodo nulla voluptatem Imperdiet ut egestas. Faucibus venenatis tincidunt, sociosqu mauris, est malesuada nullam porta odio ante metus. Habitasse donec maecenas quam semper, voluptate suspendisse veniam, adipiscing non lectus, libero morbi mi odio nulla, condimentum tincidunt at rhoncus vulputate et. Justo auctor ante, justo adipiscing sodales ac dolor nonummy purus, sapien lacus. Curabitur pellentesque, sodales gravida platea convallis, imperdiet pellentesque turpis adipiscing id vestibulum, ornare et et at adipiscing urna nulla.<\\/p><h3 class=\\\"title mt-50\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:\'Josefin Sans\', sans-serif;color:rgb(255,255,255);background-color:rgb(6,3,34);\\\">Eligibility<\\/h3><h3 class=\\\"title\\\" style=\\\"margin-bottom:0.5rem;font-weight:600;line-height:1.2em;font-size:20px;clear:both;color:rgb(3,28,108);text-transform:capitalize;font-family:Poppins, sans-serif;\\\"><\\/h3><p style=\\\"margin-right:0px;margin-left:0px;color:rgba(255,255,255,0.7);font-family:\'Open Sans\', sans-serif;font-size:16px;text-transform:none;background-color:rgb(6,3,34);\\\">Quisque dictum est torquent volutpat quam, nascetur donec ultricies tellus, vehicula gravida, enim montes adipiscing wisi orci sociis vestibulum. Per sit, nisl sed cras nisl neque lectus, turpis leo tortor ligula pede laoreet ac, sapien tellus nam, mauris aut rutrum. Dapibus litora pulvinar in, porta tempus nunc orci, eros sit mi est sociis eget ut, wisi dolocus. Pellentesque ut ac varius dolorem risus, ac in, mauris vel posuere, neque at orci, est a tempor scelerisque ipsum ornare magna eget risus ante natoque. Dui est scelerisque. Odio nibh amet, vel vitae aliquet nec pede. Erat risus, nunc libero integer at tristique elit egestas, euismod convallis vestibulum rutrum qui, feugiat diam, risus quam tristique sit dales. Interdum et netus curabitur, in consequat molestie leo ultricies, neque diam phasellus egestas, litora magna porttitor orci. ligula pede laoreet ac, sapien tellus nam, mauris aut rutrum. Dapibus litora pulvinar in, porta tempus nunc orci, eros sit mi est sociis eget ut, wisi dolor rhoncus. Pellentesque ut ac varius dolorem risus, ac in, mauris vel posuere, neque at orci, est a tempor scelerisque ipsum. Venenatis auctor in interdum neque curabitur, aliquet ut in leo in ultrices. Justo id viverra cursus, tempus nunc amet.<\\/p><ul class=\\\"cmn-list\\\" style=\\\"margin-top:20px;color:rgba(255,255,255,0.7);font-family:\'Open Sans\', sans-serif;font-size:16px;font-weight:400;text-transform:none;background-color:rgb(6,3,34);\\\"><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;padding-left:40px;\\\">Aras mi ac facilisis nec turpis maecenas, curabitur penatibus bibendum nibh nec, lorem integer donec a, risus quis ullamcorper, ante sapien wisi integer. Neque accumsan vestibulum. Vestibulum venenatis sem sit. Mauris eu curabitur eros, turpis elit alias in morbi, ac natoque quis, porttitor amet ut, eu eu aenean aliquam augue vel. Sed placat in scelerisque, purus metus est, scelerisque quis purusi<\\/li><li style=\\\"margin-top:15px;margin-right:0px;margin-left:0px;padding-left:40px;\\\">Cras mi ac facilisis nec turpis maecenas, curabitur penatibus bibendum nibh nec, lorem integer donec a, risus quis ullamcorper, ante sapien wisi integer. Neque accumiulum. Vestibulum venenatis sem sit. Mauris eu curabitur eros, turpis elit alias in morbi, ac natoque quis, porttitor amet ut, eu eu aenean aliquam augue vel. Sed placerat in scesque, purus metus est, scelerisque quis purusi<\\/li><li style=\\\"margin-top:15px;margin-right:0px;margin-left:0px;padding-left:40px;\\\">Qras mi ac facilisis nec turpis maecenas, curabitur penatibus bibendum nibh nec, lorem integer donec a, risus quis ullamcorper, ante sapien wisi integer. Neque accumsan vestibulum. Vestibulum venenatis sem sit. Mauris eu curabitur eros, turpis elit alias in morbi, ac natoque quis, porttitor amet ut, eu eu aenean aliquam augue vel. Sed placerat in scelerisque, purus metus est, scelerisque quis purus i<\\/li><\\/ul><\\/div>\"}', 0, '2021-05-10 22:05:52', '2021-05-11 00:42:13'),
(94, 'contact_us.content', '{\"has_image\":\"1\",\"title\":\"Get in touch\",\"image\":\"61054c5d1fb631627737181.jpg\"}', 0, '2021-05-11 00:49:24', '2021-07-31 07:13:01'),
(95, 'cookie.data', '{\"link\":\"#\",\"description\":\"<font color=\\\"#ffffff\\\" face=\\\"Exo, sans-serif\\\"><span style=\\\"font-size: 18px;\\\">We may use cookies or any other tracking technologies when you visit our website, including any other media form, mobile website, or mobile application related or connected to help customize the Site and improve your experience.<\\/span><\\/font><br>\",\"status\":1}', 0, '2021-05-24 10:32:14', '2021-05-24 10:32:14'),
(96, 'faq.element', '{\"question\":\"How to predict?\",\"answer\":\"Donec quisque sem molestie tortor ut, libero libero interdum nec quisque, et scelerisque nam, elit lectus mauris sed maecenas. Veniam urna eget habitasse aliquam\"}', 0, '2021-06-02 09:51:46', '2021-06-02 09:51:46'),
(97, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Aut modi soluta nihil, repellat adipisci similique dolores.\",\"preview_text\":\"Delectus velit adipisci amet offici molestias minus qui praesentium itaque incidunt sunt porro maxime sit veniam facere, reprehen.\",\"description_nic\":\"<p style=\\\"margin-top:20px;margin-right:0px;margin-left:0px;color:rgb(151,175,213);font-size:16px;font-family:Roboto, sans-serif;\\\">Pellentesque magna vel fermentum, libero nulla fermentum integer elit ut maecenas, diam suspendisse lectus, felis elit cras sint orci. Neque sit donec arcu, ornare odio pulvinar ante aliquam, luctus ac ut justo sapien orci a, eros blan proin vehicula morbi. Sed dui ut odio tristique, suspendisse sapien laoreet, placerat lectus ornare placerat, libero ac sapien tincidunt consectetuer, vestibulum vivamus at nonummy sem. Nunc convallis ornare non eget vitae, lectus pleradibus molestie, egestas amet vestibulum ac faucibus mi, ultricies atque ornare malesuada morbi parturient, donec tempus suspendisse scelerisque phasellus. Porttitor ultricies porttitor lacus arcu ultricies vitae, tempor mattis arcu sed viverra arcu natus, in wisi wisi dictum commodo erat justo, volutpat elit iaculis. Sit vel mauris nec magna odio. Et vel lobortis et. Aliquam enim felis turpis quis magnis consectetuer, tristique justo pulvinar mi libero maxime lectus. In massa semper reiciendis nulla a ante, quis vel, cras morbi sed.<\\/p><p style=\\\"margin-top:20px;margin-right:0px;margin-left:0px;color:rgb(151,175,213);font-size:16px;font-family:Roboto, sans-serif;\\\">Malesuada massa nibh interdum vel, adipiscing amet, vestibulum pede, nec ut vitae eros volutpat cras. Sed venenatis hymenaeos vestibulum at magna, ipsa mollis posuere ante lorem, sed erat, pulvinar vestibulum. Litora praesent duis eu amet at. Interdum urna eu malesuada vestibulum curabitur velit, wisi vitae. Nulla sem. Mauris venenatis a vivamus sit, egestas magna commodo vestibulum amet libero.<\\/p><p style=\\\"margin-top:20px;margin-right:0px;margin-left:0px;color:rgb(151,175,213);font-size:16px;font-family:Roboto, sans-serif;\\\">Turpis fusce dui, sed dui donec pharetra, integer imperdiet molestie tristique. Eros non et consectetuer sem, saepe nec nunc, feugiat ut tortor cras senectus fusce, euismod etiam mollis pharetra, commodo inceptos arcu aliquam lormet dui sit rutrum feugiat vivamus, integer leo. Hac eu urna eleifend quisque, at urna. Urna vel cras, pulvinar a nam leo gravida pede curabitur. Id justo dignissim pellentesque at, amet odit fusce, sit rutrum justo. Ornare nec nunc nibh consectetuer, ullamcorper montes sociis. Etiam luctus porta velit, sed pellentesque metus commodo<\\/p><p style=\\\"margin-top:20px;margin-right:0px;margin-left:0px;color:rgb(151,175,213);font-size:16px;font-family:Roboto, sans-serif;\\\">Enim malesuada massa nibh interdum vel, adipiscing amet, vestibulum pede, nec ut vitae eros volutpat crasSeivenatis hymenaeos vestibulum at magna, ipsa mollis posuere ante lorem, sed erat, pulvinar vestibulum. Litora pesent duis eu amet at. Interdum urna eu malesuada vestibulum curabitur velit, wisi vitae. Nulla sem. Mauris venenatis a vivamus sit, egestas magna commodo vestibulum, amet libero. commodo erat justo, volutpat elit iaculis. Sit vel mauris nec magna odio. Et vel lobortis et. Aliquam enim felis turpis quis magnis consectetuer, tristique justo pulvinar mi libero maxime lectus. In massa semper reiciendis nulla a ante quis velcras morbi sed.<\\/p><p style=\\\"margin-top:20px;margin-right:0px;margin-left:0px;color:rgb(151,175,213);font-size:16px;font-family:Roboto, sans-serif;\\\">Feugiat nibh, dis magna fusce turpis ut ante quam, ante neque non condimentum nec montes, enim vitae interdum. Id elementum enim volutpat pharetra erat sapien. Penatibus tincidunt praesent fringilla, dui eget in tristique nam nullam feugiat, sit auctor integer arcu risus. Aliquam interdum nulla vestibulum sit, molestie elit eros mi, at nunc eget posuere duis. Gravida cum sit, nam nibh interdum nulla, suspendisse adipiscing fusce wisi. Curabitur ac non aptent volutpat nascetur sed, odio iaculis placerat, neque integer. Sagittis mauris egestas consequat sunt cras, sapien ac nunc magnis nisl, sed mi integer in. Accumsan dui, erat tristique tristique vitae mi augue.<\\/p>\",\"blog_image\":\"6104f58f7a1d71627714959.jpg\"}', 1, '2020-11-04 18:45:31', '2021-07-31 01:02:39'),
(98, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Aut modi soluta nihil, repellat adipisci similique dolores.\",\"preview_text\":\"Delectus velit adipisci amet offici molestias minus qui praesentium itaque incidunt sunt porro maxime sit veniam facere, reprehen.\",\"description_nic\":\"<p style=\\\"margin-top:20px;margin-right:0px;margin-left:0px;color:rgb(151,175,213);font-size:16px;font-family:Roboto, sans-serif;\\\">Pellentesque magna vel fermentum, libero nulla fermentum integer elit ut maecenas, diam suspendisse lectus, felis elit cras sint orci. Neque sit donec arcu, ornare odio pulvinar ante aliquam, luctus ac ut justo sapien orci a, eros blan proin vehicula morbi. Sed dui ut odio tristique, suspendisse sapien laoreet, placerat lectus ornare placerat, libero ac sapien tincidunt consectetuer, vestibulum vivamus at nonummy sem. Nunc convallis ornare non eget vitae, lectus pleradibus molestie, egestas amet vestibulum ac faucibus mi, ultricies atque ornare malesuada morbi parturient, donec tempus suspendisse scelerisque phasellus. Porttitor ultricies porttitor lacus arcu ultricies vitae, tempor mattis arcu sed viverra arcu natus, in wisi wisi dictum commodo erat justo, volutpat elit iaculis. Sit vel mauris nec magna odio. Et vel lobortis et. Aliquam enim felis turpis quis magnis consectetuer, tristique justo pulvinar mi libero maxime lectus. In massa semper reiciendis nulla a ante, quis vel, cras morbi sed.<\\/p><p style=\\\"margin-top:20px;margin-right:0px;margin-left:0px;color:rgb(151,175,213);font-size:16px;font-family:Roboto, sans-serif;\\\">Malesuada massa nibh interdum vel, adipiscing amet, vestibulum pede, nec ut vitae eros volutpat cras. Sed venenatis hymenaeos vestibulum at magna, ipsa mollis posuere ante lorem, sed erat, pulvinar vestibulum. Litora praesent duis eu amet at. Interdum urna eu malesuada vestibulum curabitur velit, wisi vitae. Nulla sem. Mauris venenatis a vivamus sit, egestas magna commodo vestibulum amet libero.<\\/p><p style=\\\"margin-top:20px;margin-right:0px;margin-left:0px;color:rgb(151,175,213);font-size:16px;font-family:Roboto, sans-serif;\\\">Turpis fusce dui, sed dui donec pharetra, integer imperdiet molestie tristique. Eros non et consectetuer sem, saepe nec nunc, feugiat ut tortor cras senectus fusce, euismod etiam mollis pharetra, commodo inceptos arcu aliquam lormet dui sit rutrum feugiat vivamus, integer leo. Hac eu urna eleifend quisque, at urna. Urna vel cras, pulvinar a nam leo gravida pede curabitur. Id justo dignissim pellentesque at, amet odit fusce, sit rutrum justo. Ornare nec nunc nibh consectetuer, ullamcorper montes sociis. Etiam luctus porta velit, sed pellentesque metus commod<\\/p><p style=\\\"margin-top:20px;margin-right:0px;margin-left:0px;color:rgb(151,175,213);font-size:16px;font-family:Roboto, sans-serif;\\\">Enim malesuada massa nibh interdum vel, adipiscing amet, vestibulum pede, nec ut vitae eros volutpat crasSeivenatis hymenaeos vestibulum at magna, ipsa mollis posuere ante lorem, sed erat, pulvinar vestibulum. Litora pesent duis eu amet at. Interdum urna eu malesuada vestibulum curabitur velit, wisi vitae. Nulla sem. Mauris venenatis a vivamus sit, egestas magna commodo vestibulum, amet libero. commodo erat justo, volutpat elit iaculis. Sit vel mauris nec magna odio. Et vel lobortis et. Aliquam enim felis turpis quis magnis consectetuer, tristique justo pulvinar mi libero maxime lectus. In massa semper reiciendis nulla a ante quis velcras morbi sed.<\\/p><p style=\\\"margin-top:20px;margin-right:0px;margin-left:0px;color:rgb(151,175,213);font-size:16px;font-family:Roboto, sans-serif;\\\">Feugiat nibh, dis magna fusce turpis ut ante quam, ante neque non condimentum nec montes, enim vitae interdum. Id elementum enim volutpat pharetra erat sapien. Penatibus tincidunt praesent fringilla, dui eget in tristique nam nullam feugiat, sit auctor integer arcu risus. Aliquam interdum nulla vestibulum sit, molestie elit eros mi, at nunc eget posuere duis. Gravida cum sit, nam nibh interdum nulla, suspendisse adipiscing fusce wisi. Curabitur ac non aptent volutpat nascetur sed, odio iaculis placerat, neque integer. Sagittis mauris egestas consequat sunt cras, sapien ac nunc magnis nisl, sed mi integer in. Accumsan dui, erat tristique tristique vitae mi augue.<\\/p>\",\"blog_image\":\"6104f5888e32a1627714952.jpg\"}', 4, '2020-11-04 18:45:31', '2021-07-31 01:02:32'),
(99, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Aut modi soluta nihil, repellat adipisci similique dolores.\",\"preview_text\":\"Delectus velit adipisci amet offici molestias minus qui praesentium itaque incidunt sunt porro maxime sit veniam facere, reprehen.\",\"description_nic\":\"<p style=\\\"margin-top:20px;margin-right:0px;margin-left:0px;color:rgb(151,175,213);font-size:16px;font-family:Roboto, sans-serif;\\\">Pellentesque magna vel fermentum, libero nulla fermentum integer elit ut maecenas, diam suspendisse lectus, felis elit cras sint orci. Neque sit donec arcu, ornare odio pulvinar ante aliquam, luctus ac ut justo sapien orci a, eros blan proin vehicula morbi. Sed dui ut odio tristique, suspendisse sapien laoreet, placerat lectus ornare placerat, libero ac sapien tincidunt consectetuer, vestibulum vivamus at nonummy sem. Nunc convallis ornare non eget vitae, lectus pleradibus molestie, egestas amet vestibulum ac faucibus mi, ultricies atque ornare malesuada morbi parturient, donec tempus suspendisse scelerisque phasellus. Porttitor ultricies porttitor lacus arcu ultricies vitae, tempor mattis arcu sed viverra arcu natus, in wisi wisi dictum commodo erat justo, volutpat elit iaculis. Sit vel mauris nec magna odio. Et vel lobortis et. Aliquam enim felis turpis quis magnis consectetuer, tristique justo pulvinar mi libero maxime lectus. In massa semper reiciendis nulla a ante, quis vel, cras morbi sed.<\\/p><p style=\\\"margin-top:20px;margin-right:0px;margin-left:0px;color:rgb(151,175,213);font-size:16px;font-family:Roboto, sans-serif;\\\">Malesuada massa nibh interdum vel, adipiscing amet, vestibulum pede, nec ut vitae eros volutpat cras. Sed venenatis hymenaeos vestibulum at magna, ipsa mollis posuere ante lorem, sed erat, pulvinar vestibulum. Litora praesent duis eu amet at. Interdum urna eu malesuada vestibulum curabitur velit, wisi vitae. Nulla sem. Mauris venenatis a vivamus sit, egestas magna commodo vestibulum amet libero.<\\/p><p style=\\\"margin-top:20px;margin-right:0px;margin-left:0px;color:rgb(151,175,213);font-size:16px;font-family:Roboto, sans-serif;\\\">Turpis fusce dui, sed dui donec pharetra, integer imperdiet molestie tristique. Eros non et consectetuer sem, saepe nec nunc, feugiat ut tortor cras senectus fusce, euismod etiam mollis pharetra, commodo inceptos arcu aliquam lormet dui sit rutrum feugiat vivamus, integer leo. Hac eu urna eleifend quisque, at urna. Urna vel cras, pulvinar a nam leo gravida pede curabitur. Id justo dignissim pellentesque at, amet odit fusce, sit rutrum justo. Ornare nec nunc nibh consectetuer, ullamcorper montes sociis. Etiam luctus porta velit, sed pellentesque metus commodo<\\/p><p style=\\\"margin-top:20px;margin-right:0px;margin-left:0px;color:rgb(151,175,213);font-size:16px;font-family:Roboto, sans-serif;\\\">Enim malesuada massa nibh interdum vel, adipiscing amet, vestibulum pede, nec ut vitae eros volutpat crasSeivenatis hymenaeos vestibulum at magna, ipsa mollis posuere ante lorem, sed erat, pulvinar vestibulum. Litora pesent duis eu amet at. Interdum urna eu malesuada vestibulum curabitur velit, wisi vitae. Nulla sem. Mauris venenatis a vivamus sit, egestas magna commodo vestibulum, amet libero. commodo erat justo, volutpat elit iaculis. Sit vel mauris nec magna odio. Et vel lobortis et. Aliquam enim felis turpis quis magnis consectetuer, tristique justo pulvinar mi libero maxime lectus. In massa semper reiciendis nulla a ante quis velcras morbi sed.<\\/p><p style=\\\"margin-top:20px;margin-right:0px;margin-left:0px;color:rgb(151,175,213);font-size:16px;font-family:Roboto, sans-serif;\\\">Feugiat nibh, dis magna fusce turpis ut ante quam, ante neque non condimentum nec montes, enim vitae interdum. Id elementum enim volutpat pharetra erat sapien. Penatibus tincidunt praesent fringilla, dui eget in tristique nam nullam feugiat, sit auctor integer arcu risus. Aliquam interdum nulla vestibulum sit, molestie elit eros mi, at nunc eget posuere duis. Gravida cum sit, nam nibh interdum nulla, suspendisse adipiscing fusce wisi. Curabitur ac non aptent volutpat nascetur sed, odio iaculis placerat, neque integer. Sagittis mauris egestas consequat sunt cras, sapien ac nunc magnis nisl, sed mi integer in. Accumsan dui, erat tristique tristique vitae mi augue.<\\/p>\",\"blog_image\":\"6104f58044ec81627714944.jpg\"}', 33, '2020-11-04 18:45:31', '2021-07-31 06:05:30'),
(100, 'payment_method.element', '{\"has_image\":\"1\",\"method_image\":\"6104ed99708221627712921.png\"}', 0, '2021-07-31 00:28:41', '2021-07-31 00:28:41'),
(101, 'payment_method.element', '{\"has_image\":\"1\",\"method_image\":\"6104edad157401627712941.png\"}', 0, '2021-07-31 00:29:01', '2021-07-31 00:29:01'),
(102, 'payment_method.element', '{\"has_image\":\"1\",\"method_image\":\"6104edb2e1eef1627712946.png\"}', 0, '2021-07-31 00:29:06', '2021-07-31 00:29:06'),
(103, 'register.content', '{\"has_image\":\"1\",\"title\":\"Welcome to Xaxino\",\"sub_title\":\"Sit iste delectus iure animi facere. Est veritatis illo officia.\",\"image\":\"6107c75e4e88c1627899742.jpg\"}', 0, '2021-08-02 04:22:22', '2021-08-02 04:22:22');

-- --------------------------------------------------------

--
-- Table structure for table `games`
--

CREATE TABLE `games` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `win` decimal(18,8) DEFAULT NULL COMMENT 'Win Bonus',
  `max_limit` decimal(11,2) NOT NULL,
  `min_limit` decimal(11,2) NOT NULL,
  `invest_back` int(11) DEFAULT NULL,
  `probable_win` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instruction` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `games`
--

INSERT INTO `games` (`id`, `name`, `alias`, `image`, `status`, `win`, `max_limit`, `min_limit`, `invest_back`, `probable_win`, `type`, `level`, `instruction`, `created_at`, `updated_at`) VALUES
(1, 'Head & Tail', 'head-tail', '61051300dc8531627722496.jpg', 1, '50.00000000', '500.00', '5.86', 1, '\"10\"', NULL, NULL, '<br><h2 style=\"font-family: Roboto, \" open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-weight:=\"\" 400;=\"\" line-height:=\"\" 1.4;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" font-size:=\"\" 2.3125rem;=\"\" background-color:=\"transparent\">How to Play (Rule)</h2><div><br></div><div><b>Admin can write as he want. This text is controllable from admin panel.</b></div><div><br></div><div> Admin can write as he want. This text is controllable from admin panel. Admin can write as he want. This text is controllable from admin panel. Admin can write as he want. This text is controllable from admin panel. Admin can write as he want. This text is controllable from admin panel. Admin can write as he want. This text is controllable from admin panel. Admin can write as he want. This text is controllable from admin panel. Admin can write as he want. This text is controllable from admin panel. Admin can write as he want. This text is controllable from admin panel. Admin can write as he want. This text is controllable from admin panel.</div>', NULL, '2021-08-03 01:07:47'),
(2, 'Rock Paper scissors', 'rockPaperScissors', '610515f76a27a1627723255.jpg', 1, '100.00000000', '1000.00', '1.00', 1, '\"44\"', NULL, NULL, '<div><br></div><div><h2 open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-weight:=\"\" 400;=\"\" line-height:=\"\" 1.4;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" font-size:=\"\" 2.3125rem;=\"\" background-color:=\"transparent\" style=\"margin-top: 0.2rem; margin-bottom: 0.5rem; font-family: \" color:=\"\" rgb(85,=\"\" 85,=\"\" 85);\"=\"\">How to play: Rock Paper &amp; Scissors</h2><p open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px; font-family: \" padding:=\"\" 0px;\"=\"\">Finding engaging ways to generate more revenue at your event (aka: giving donors every opportunity to give) is a key task. Don’t knock the traditional activities like Wall of Wine or Heads and Tails, just add your own flare.&nbsp;A Heads and Tails game isn’t your usual raffle;&nbsp;it’s a fun, novel way to engage event guests who might otherwise be hesitant to participate and bid in the live auction. It operates the same way as a standard raffle, but with a twist!</p><p open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px; font-family: \" padding:=\"\" 0px=\"\" 30px;\"=\"\"><span style=\"font-family: var(--para-font); font-weight: 700; line-height: inherit;\">Pick Your Prize</span></p><p open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px; font-family: \" padding:=\"\" 0px=\"\" 30px;\"=\"\">First, select an item for your raffle that will appeal to a broad audience, to get as many people as possible to participate. The value of the prize itself can vary, but pick something that costs relative &nbsp;in relation to the ticket sale price.</p></div>', NULL, '2021-08-03 01:07:53'),
(3, 'Spin Wheel', 'spinWheel', '61051d8469d731627725188.jpg', 1, '50.00000000', '1000.00', '1.00', 1, '\"100\"', NULL, NULL, '<div><br></div><div><h2 open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-weight:=\"\" 400;=\"\" line-height:=\"\" 1.4;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" font-size:=\"\" 2.3125rem;=\"\" background-color:=\"transparent\" style=\"margin-top: 0.2rem; margin-bottom: 0.5rem; font-family: \" color:=\"\" rgb(85,=\"\" 85,=\"\" 85);\"=\"\">How to play: Spin Wheel</h2><p open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px; font-family: \" padding:=\"\" 0px;\"=\"\">Finding engaging ways to generate more revenue at your event (aka: giving donors every opportunity to give) is a key task. Don’t knock the traditional activities like Wall of Wine or Heads and Tails, just add your own flare.&nbsp;A Heads and Tails game isn’t your usual raffle;&nbsp;it’s a fun, novel way to engage event guests who might otherwise be hesitant to participate and bid in the live auction. It operates the same way as a standard raffle, but with a twist!</p><p open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px; font-family: \" padding:=\"\" 0px=\"\" 30px;\"=\"\"><span style=\"font-family: var(--para-font); font-weight: 700; line-height: inherit;\">Pick Your Prize</span></p><p open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px; font-family: \" padding:=\"\" 0px=\"\" 30px;\"=\"\">First, select an item for your raffle that will appeal to a broad audience, to get as many people as possible to participate. The value of the prize itself can vary, but pick something that costs relative &nbsp;in relation to the ticket sale price</p></div>', NULL, '2021-08-03 01:08:05'),
(4, 'Number Guessing', 'numberGuesse', '61051a9ed28511627724446.jpg', 1, NULL, '1000.00', '1.00', 0, NULL, NULL, NULL, '<div><span style=\"color: inherit; font-family: var(--heading-font); font-size: 44px; font-weight: 600;\">How to play: Number Guessing Game</span><br></div><div><p open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px; font-family: \" padding:=\"\" 0px;\"=\"\">Finding engaging ways to generate more revenue at your event (aka: giving donors every opportunity to give) is a key task. Don’t knock the traditional activities like Wall of Wine or Heads and Tails, just add your own flare.&nbsp;A Heads and Tails game isn’t your usual raffle;&nbsp;it’s a fun, novel way to engage event guests who might otherwise be hesitant to participate and bid in the live auction. It operates the same way as a standard raffle, but with a twist!</p><p open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px; font-family: \" padding:=\"\" 0px=\"\" 30px;\"=\"\"><span style=\"font-family: var(--para-font); font-weight: 700; line-height: inherit;\">Pick Your Prize</span></p><p open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px; font-family: \" padding:=\"\" 0px=\"\" 30px;\"=\"\">First, select an item for your raffle that will appeal to a broad audience, to get as many people as possible to participate. The value of the prize itself can vary, but pick something that costs relative &nbsp;in relation to the ticket sale price.</p><blockquote open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" background-color:=\"transparent\" style=\"margin-bottom: 1.25rem; padding: 0.5625rem 1.25rem 0px 1.1875rem; border-left: 1px solid rgb(221, 221, 221); line-height: 1.6; color: rgb(145, 145, 145);\"><p style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px; font-family: inherit; padding: 0px 0px 0px 30px; font-size: 1rem; line-height: 1.6; text-rendering: optimizelegibility;\">Generally, 20-25% of your guests will participate in a raffle—so the more guests you have, the more tickets you’ll sell.</p></blockquote><p open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px; font-family: \" padding:=\"\" 0px=\"\" 30px;\"=\"\">Price your raffle ticket conscientious of your guests’ budgets; for your average smaller event, $15 is great. For larger events, $25. Big events can sometimes charge $50 or $100 depending on the value of the raffle prize.</p><p open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px; font-family: \" padding:=\"\" 0px=\"\" 30px;\"=\"\"><span style=\"font-family: var(--para-font); font-weight: 700; line-height: inherit;\">Promote the Game</span></p><p open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px; font-family: \" padding:=\"\" 0px=\"\" 30px;\"=\"\">The best way to sell more raffle tickets? Promote it! Start spreading the word about the raffle prior to the event—put up a page on your event website about it, send out fliers advertising your prize, and make tickets available for sale online. Just be sure to track who’s already bought one, then add them to the list of event night raffle participants.</p><p open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px; font-family: \" padding:=\"\" 0px=\"\" 30px;\"=\"\"><span style=\"font-family: var(--para-font); font-weight: 700; line-height: inherit;\">Make it Fun</span></p><p open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px; font-family: \" padding:=\"\" 0px=\"\" 30px;\"=\"\">Instead of giving out a ticket stub to raffle participants, give guests participating in Heads and Tails a&nbsp;<span style=\"font-family: var(--para-font); font-weight: 700; line-height: inherit;\">fun and inexpensive party favor</span>, such as a light stick, a toy, a noisemaker, or another raffle favor tied into your event theme.</p><p open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px; font-family: \" padding:=\"\" 0px=\"\" 30px;\"=\"\">For guests who purchased raffle tickets in advance, include the favors in the bidder packet that guests pick up at check-in.</p><p open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px; font-family: \" padding:=\"\" 0px=\"\" 30px;\"=\"\"><span style=\"font-family: var(--para-font); font-weight: 700; line-height: inherit;\">Maximize Participation</span></p><p open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px; font-family: \" padding:=\"\" 0px=\"\" 30px;\"=\"\">A Heads and Tails raffle is a great way to&nbsp;<span style=\"font-family: var(--para-font); font-weight: 700; line-height: inherit;\"><a href=\"https://blog.greatergiving.com/top-7-ways-to-keep-your-audience-engaged-during-the-live-auction/\" target=\"_blank\" style=\"color: rgb(120, 160, 37); font-family: var(--para-font); line-height: inherit;\">spur engagement during the entertainment portion of your event</a></span>, before or during the live auction, so be sure to make arrangements with your auctioneer in advance of event night to announce and host it.</p><p open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px; font-family: \" padding:=\"\" 0px=\"\" 30px;\"=\"\">While the auctioneer is announcing the raffle, encourage last-minute participation. For guests who do decide to participate in the raffle at the last minute, make sign-up sheets available at each table, and send out a few volunteers to walk among the tables with extra raffle favors. Be sure to collect the sign-up sheets before the raffle starts.</p><p open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px; font-family: \" padding:=\"\" 0px;\"=\"\"><span style=\"font-family: var(--para-font); font-weight: 700; line-height: inherit;\">How “Heads and Tails” Works</span></p><ol open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" style=\"margin-bottom: 1.25rem; margin-left: 1.4rem;\"><li style=\"font-family: var(--para-font); margin: 0px 0px 0.75rem; padding: 0px; counter-increment: item 1;\">When it’s time, your auctioneer should ask all Heads and Tails participants to stand up. Then participants select either “heads” or “tails” by putting their hands on their heads—or their tails!</li><li style=\"font-family: var(--para-font); margin: 0px 0px 0.75rem; padding: 0px; counter-increment: item 1;\">The auctioneer flips a coin and announces whether the coin came up heads or tails. Those participants whose choice matches the coin flip get to stay standing—everyone else sits down.</li><li style=\"font-family: var(--para-font); margin: 0px 0px 0.75rem; padding: 0px; counter-increment: item 1;\">The auctioneer continues asking participants to select “heads” or “tails,” then flipping the coin, eliminating more players until only a handful are left.</li><li style=\"font-family: var(--para-font); margin: 0px 0px 0.75rem; padding: 0px; counter-increment: item 1;\">Ask these few finalists to come to the stage for the last few coin tosses, until only one player is left standing. This is your raffle winner!</li></ol></div>', NULL, '2021-07-31 03:40:47'),
(5, 'Dice Rolling', 'diceRolling', '61051cb37ad601627724979.jpg', 1, '5.00000000', '1000.00', '1.00', 1, '\"10\"', NULL, NULL, '<br><div><h2 open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-weight:=\"\" 400;=\"\" line-height:=\"\" 1.4;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" font-size:=\"\" 2.3125rem;=\"\" background-color:=\"transparent\" color:=\"\" rgb(85,=\"\" 85,=\"\" 85);\"=\"\" style=\"margin-top: 0.2rem; margin-bottom: 0.5rem; font-family: \" rgb(33,=\"\" 37,=\"\" 41);\"=\"\"><font color=\"#ffffff\">How to play: Dice Rolling</font></h2><p open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" padding:=\"\" 0px;\"=\"\" style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px; font-family: \" sans-serif;\"=\"\">Finding engaging ways to generate more revenue at your event (aka: giving donors every opportunity to give) is a key task. Don’t knock the traditional activities like Wall of Wine or Heads and Tails, just add your own flare.&nbsp;A Heads and Tails game isn’t your usual raffle;&nbsp;it’s a fun, novel way to engage event guests who might otherwise be hesitant to participate and bid in the live auction. It operates the same way as a standard raffle, but with a twist!</p><p open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" padding:=\"\" 0px=\"\" 30px;\"=\"\" style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px; font-family: \" sans-serif;\"=\"\"><span style=\"font-family: var(--para-font); font-weight: 700; line-height: inherit;\">Pick Your Prize</span></p><p open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" padding:=\"\" 0px=\"\" 30px;\"=\"\" style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px; font-family: \" sans-serif;\"=\"\">First, select an item for your raffle that will appeal to a broad audience, to get as many people as possible to participate. The value of the prize itself can vary, but pick something that costs relative &nbsp;in relation to the ticket sale price.</p></div>', NULL, '2021-07-31 03:49:39'),
(6, 'Card Finding', 'cardFinding', '610521608fde21627726176.jpg', 1, '50.00000000', '1000.00', '1.00', 1, '\"60\"', NULL, NULL, '<div><br></div><div><h2 open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-weight:=\"\" 400;=\"\" line-height:=\"\" 1.4;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" font-size:=\"\" 2.3125rem;=\"\" background-color:=\"transparent\" color:=\"\" rgb(85,=\"\" 85,=\"\" 85);\"=\"\" rgb(33,=\"\" 37,=\"\" 41);\"=\"\" style=\"margin-top: 0.2rem; margin-bottom: 0.5rem; font-family: \"><font color=\"#ffffff\">How to play: Card Finding</font></h2><p open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" padding:=\"\" 0px;\"=\"\" sans-serif;\"=\"\" style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px; font-family: \">Finding engaging ways to generate more revenue at your event (aka: giving donors every opportunity to give) is a key task. Don’t knock the traditional activities like Wall of Wine or Heads and Tails, just add your own flare.&nbsp;A Heads and Tails game isn’t your usual raffle;&nbsp;it’s a fun, novel way to engage event guests who might otherwise be hesitant to participate and bid in the live auction. It operates the same way as a standard raffle, but with a twist!</p><p open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" padding:=\"\" 0px=\"\" 30px;\"=\"\" sans-serif;\"=\"\" style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px; font-family: \"><span style=\"font-family: var(--para-font); font-weight: 700; line-height: inherit;\">Pick Your Prize</span></p><p open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" padding:=\"\" 0px=\"\" 30px;\"=\"\" sans-serif;\"=\"\" style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px; font-family: \">First, select an item for your raffle that will appeal to a broad audience, to get as many people as possible to participate. The value of the prize itself can vary, but pick something that costs relative &nbsp;in relation to the ticket sale price.</p></div>', NULL, '2021-07-31 04:09:36'),
(7, 'Number Slot', 'numberSlot', '61052482a60ed1627726978.jpg', 1, NULL, '1000.00', '1.00', 0, '[\"50\",\"40\",\"6\",\"4\"]', NULL, '[\"100\",\"150\",\"200\"]', '<br><div><h2 open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-weight:=\"\" 400;=\"\" line-height:=\"\" 1.4;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" font-size:=\"\" 2.3125rem;=\"\" background-color:=\"transparent\" color:=\"\" rgb(85,=\"\" 85,=\"\" 85);\"=\"\" rgb(33,=\"\" 37,=\"\" 41);\"=\"\" style=\"margin-top: 0.2rem; margin-bottom: 0.5rem;\"><font color=\"#ffffff\">How to play: Number Slot</font></h2><p open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" padding:=\"\" 0px;\"=\"\" sans-serif;\"=\"\" style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px;\">Finding engaging ways to generate more revenue at your event (aka: giving donors every opportunity to give) is a key task. Don’t knock the traditional activities like Wall of Wine or Heads and Tails, just add your own flare.&nbsp;A Heads and Tails game isn’t your usual raffle;&nbsp;it’s a fun, novel way to engage event guests who might otherwise be hesitant to participate and bid in the live auction. It operates the same way as a standard raffle, but with a twist!</p><p open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" padding:=\"\" 0px=\"\" 30px;\"=\"\" sans-serif;\"=\"\" style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px;\"><span style=\"font-family: var(--para-font); font-weight: 700; line-height: inherit;\">Pick Your Prize</span></p><p open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" padding:=\"\" 0px=\"\" 30px;\"=\"\" sans-serif;\"=\"\" style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px;\">First, select an item for your raffle that will appeal to a broad audience, to get as many people as possible to participate. The value of the prize itself can vary, but pick something that costs relative &nbsp;in relation to the ticket sale price.</p></div>', NULL, '2021-08-03 01:06:52'),
(8, 'Pool Number', 'numberPoll', '610526fa315241627727610.jpg', 1, '50.00000000', '1000.00', '1.00', 1, '\"30\"', NULL, NULL, '<div><br></div><div><h2 open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-weight:=\"\" 400;=\"\" line-height:=\"\" 1.4;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" font-size:=\"\" 2.3125rem;=\"\" background-color:=\"transparent\" color:=\"\" rgb(85,=\"\" 85,=\"\" 85);\"=\"\" rgb(33,=\"\" 37,=\"\" 41);\"=\"\" style=\"margin-top: 0.2rem; margin-bottom: 0.5rem; font-family: \"><font color=\"#ffffff\">How to play: Pool Number</font></h2><p open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" padding:=\"\" 0px;\"=\"\" sans-serif;\"=\"\" style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px; font-family: \">Finding engaging ways to generate more revenue at your event (aka: giving donors every opportunity to give) is a key task. Don’t knock the traditional activities like Wall of Wine or Heads and Tails, just add your own flare.&nbsp;A Heads and Tails game isn’t your usual raffle;&nbsp;it’s a fun, novel way to engage event guests who might otherwise be hesitant to participate and bid in the live auction. It operates the same way as a standard raffle, but with a twist!</p><p open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" padding:=\"\" 0px=\"\" 30px;\"=\"\" sans-serif;\"=\"\" style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px; font-family: \"><span style=\"font-family: var(--para-font); font-weight: 700; line-height: inherit;\">Pick Your Prize</span></p><p open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" padding:=\"\" 0px=\"\" 30px;\"=\"\" sans-serif;\"=\"\" style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px; font-family: \">First, select an item for your raffle that will appeal to a broad audience, to get as many people as possible to participate. The value of the prize itself can vary, but pick something that costs relative &nbsp;in relation to the ticket sale price.</p><blockquote open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" background-color:=\"transparent\" style=\"margin-bottom: 1.25rem; padding: 0.5625rem 1.25rem 0px 1.1875rem; border-left: 1px solid rgb(221, 221, 221); line-height: 1.6; color: rgb(145, 145, 145);\"><p style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px; font-family: inherit; padding: 0px 0px 0px 30px; font-size: 1rem; line-height: 1.6; text-rendering: optimizelegibility;\">Generally, 20-25% of your guests will participate in a raffle—so the more guests you have, the more tickets you’ll sell.</p></blockquote><p open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" padding:=\"\" 0px=\"\" 30px;\"=\"\" sans-serif;\"=\"\" style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px; font-family: \">Price your raffle ticket conscientious of your guests’ budgets; for your average smaller event, $15 is great. For larger events, $25. Big events can sometimes charge $50 or $100 depending on the value of the raffle prize.</p><p open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" padding:=\"\" 0px=\"\" 30px;\"=\"\" sans-serif;\"=\"\" style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px; font-family: \"><span style=\"font-family: var(--para-font); font-weight: 700; line-height: inherit;\">Promote the Game</span></p><p open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" padding:=\"\" 0px=\"\" 30px;\"=\"\" sans-serif;\"=\"\" style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px; font-family: \">The best way to sell more raffle tickets? Promote it! Start spreading the word about the raffle prior to the event—put up a page on your event website about it, send out fliers advertising your prize, and make tickets available for sale online. Just be sure to track who’s already bought one, then add them to the list of event night raffle participants.</p><p open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" padding:=\"\" 0px=\"\" 30px;\"=\"\" sans-serif;\"=\"\" style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px; font-family: \"><span style=\"font-family: var(--para-font); font-weight: 700; line-height: inherit;\">Make it Fun</span></p><p open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" padding:=\"\" 0px=\"\" 30px;\"=\"\" sans-serif;\"=\"\" style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px; font-family: \">Instead of giving out a ticket stub to raffle participants, give guests participating in Heads and Tails a&nbsp;<span style=\"font-family: var(--para-font); font-weight: 700; line-height: inherit;\">fun and inexpensive party favor</span>, such as a light stick, a toy, a noisemaker, or another raffle favor tied into your event theme.</p><p open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" padding:=\"\" 0px=\"\" 30px;\"=\"\" sans-serif;\"=\"\" style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px; font-family: \">For guests who purchased raffle tickets in advance, include the favors in the bidder packet that guests pick up at check-in.</p><p open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" padding:=\"\" 0px=\"\" 30px;\"=\"\" sans-serif;\"=\"\" style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px; font-family: \"><span style=\"font-family: var(--para-font); font-weight: 700; line-height: inherit;\">Maximize Participation</span></p><p open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" padding:=\"\" 0px=\"\" 30px;\"=\"\" sans-serif;\"=\"\" style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px; font-family: \">A Heads and Tails raffle is a great way to&nbsp;<span style=\"font-family: var(--para-font); font-weight: 700; line-height: inherit;\"><a href=\"https://blog.greatergiving.com/top-7-ways-to-keep-your-audience-engaged-during-the-live-auction/\" target=\"_blank\" style=\"color: rgb(120, 160, 37); font-family: var(--para-font); line-height: inherit;\">spur engagement during the entertainment portion of your event</a></span>, before or during the live auction, so be sure to make arrangements with your auctioneer in advance of event night to announce and host it.</p><p open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" padding:=\"\" 0px=\"\" 30px;\"=\"\" sans-serif;\"=\"\" style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px; font-family: \">While the auctioneer is announcing the raffle, encourage last-minute participation. For guests who do decide to participate in the raffle at the last minute, make sign-up sheets available at each table, and send out a few volunteers to walk among the tables with extra raffle favors. Be sure to collect the sign-up sheets before the raffle starts.</p><p open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" padding:=\"\" 0px;\"=\"\" sans-serif;\"=\"\" style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px; font-family: \"><span style=\"font-family: var(--para-font); font-weight: 700; line-height: inherit;\">How “Heads and Tails” Works</span></p><ol open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" style=\"margin-bottom: 1.25rem; margin-left: 1.4rem;\"><li style=\"font-family: var(--para-font); margin: 0px 0px 0.75rem; padding: 0px; counter-increment: item 1;\">When it’s time, your auctioneer should ask all Heads and Tails participants to stand up. Then participants select either “heads” or “tails” by putting their hands on their heads—or their tails!</li><li style=\"font-family: var(--para-font); margin: 0px 0px 0.75rem; padding: 0px; counter-increment: item 1;\">The auctioneer flips a coin and announces whether the coin came up heads or tails. Those participants whose choice matches the coin flip get to stay standing—everyone else sits down.</li><li style=\"font-family: var(--para-font); margin: 0px 0px 0.75rem; padding: 0px; counter-increment: item 1;\">The auctioneer continues asking participants to select “heads” or “tails,” then flipping the coin, eliminating more players until only a handful are left.</li><li style=\"font-family: var(--para-font); margin: 0px 0px 0.75rem; padding: 0px; counter-increment: item 1;\">Ask these few finalists to come to the stage for the last few coin tosses, until only one player is left standing. This is your raffle winner!</li></ol></div>', NULL, '2021-07-31 04:33:30');

-- --------------------------------------------------------

--
-- Table structure for table `game_logs`
--

CREATE TABLE `game_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `game_id` int(11) NOT NULL,
  `user_select` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `result` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL,
  `invest` decimal(11,8) NOT NULL,
  `win_amo` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `try` int(11) DEFAULT NULL,
  `win_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `game_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gateways`
--

CREATE TABLE `gateways` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` int(11) DEFAULT NULL,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'NULL',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=>enable, 2=>disable',
  `parameters` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `supported_currencies` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `crypto` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: fiat currency, 1: crypto currency',
  `extra` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `input_form` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gateways`
--

INSERT INTO `gateways` (`id`, `code`, `name`, `alias`, `image`, `status`, `parameters`, `supported_currencies`, `crypto`, `extra`, `description`, `input_form`, `created_at`, `updated_at`) VALUES
(1, 101, 'Paypal', 'Paypal', '5f6f1bd8678601601117144.jpg', 1, '{\"paypal_email\":{\"title\":\"PayPal Email\",\"global\":true,\"value\":\"sb-owud61543012@business.example.com\"}}', '{\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"TWD\":\"TWD\",\"NZD\":\"NZD\",\"NOK\":\"NOK\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"GBP\":\"GBP\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"USD\":\"$\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 00:04:38'),
(2, 102, 'Perfect Money', 'PerfectMoney', '5f6f1d2a742211601117482.jpg', 1, '{\"passphrase\":{\"title\":\"ALTERNATE PASSPHRASE\",\"global\":true,\"value\":\"hR26aw02Q1eEeUPSIfuwNypXX\"},\"wallet_id\":{\"title\":\"PM Wallet\",\"global\":false,\"value\":\"\"}}', '{\"USD\":\"$\",\"EUR\":\"\\u20ac\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 01:35:33'),
(3, 103, 'Stripe Hosted', 'Stripe', '5f6f1d4bc69e71601117515.jpg', 1, '{\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"sk_test_51I6GGiCGv1sRiQlEi5v1or9eR0HVbuzdMd2rW4n3DxC8UKfz66R4X6n4yYkzvI2LeAIuRU9H99ZpY7XCNFC9xMs500vBjZGkKG\"},\"publishable_key\":{\"title\":\"PUBLISHABLE KEY\",\"global\":true,\"value\":\"pk_test_51I6GGiCGv1sRiQlEOisPKrjBqQqqcFsw8mXNaZ2H2baN6R01NulFS7dKFji1NRRxuchoUTEDdB7ujKcyKYSVc0z500eth7otOM\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"SGD\":\"SGD\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 00:48:36'),
(4, 104, 'Skrill', 'Skrill', '5f6f1d41257181601117505.jpg', 1, '{\"pay_to_email\":{\"title\":\"Skrill Email\",\"global\":true,\"value\":\"merchant@skrill.com\"},\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"---\"}}', '{\"AED\":\"AED\",\"AUD\":\"AUD\",\"BGN\":\"BGN\",\"BHD\":\"BHD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"HRK\":\"HRK\",\"HUF\":\"HUF\",\"ILS\":\"ILS\",\"INR\":\"INR\",\"ISK\":\"ISK\",\"JOD\":\"JOD\",\"JPY\":\"JPY\",\"KRW\":\"KRW\",\"KWD\":\"KWD\",\"MAD\":\"MAD\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"OMR\":\"OMR\",\"PLN\":\"PLN\",\"QAR\":\"QAR\",\"RON\":\"RON\",\"RSD\":\"RSD\",\"SAR\":\"SAR\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TND\":\"TND\",\"TRY\":\"TRY\",\"TWD\":\"TWD\",\"USD\":\"USD\",\"ZAR\":\"ZAR\",\"COP\":\"COP\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 01:30:16'),
(5, 105, 'PayTM', 'Paytm', '5f6f1d1d3ec731601117469.jpg', 1, '{\"MID\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"DIY12386817555501617\"},\"merchant_key\":{\"title\":\"Merchant Key\",\"global\":true,\"value\":\"bKMfNxPPf_QdZppa\"},\"WEBSITE\":{\"title\":\"Paytm Website\",\"global\":true,\"value\":\"DIYtestingweb\"},\"INDUSTRY_TYPE_ID\":{\"title\":\"Industry Type\",\"global\":true,\"value\":\"Retail\"},\"CHANNEL_ID\":{\"title\":\"CHANNEL ID\",\"global\":true,\"value\":\"WEB\"},\"transaction_url\":{\"title\":\"Transaction URL\",\"global\":true,\"value\":\"https:\\/\\/pguat.paytm.com\\/oltp-web\\/processTransaction\"},\"transaction_status_url\":{\"title\":\"Transaction STATUS URL\",\"global\":true,\"value\":\"https:\\/\\/pguat.paytm.com\\/paytmchecksum\\/paytmCallback.jsp\"}}', '{\"AUD\":\"AUD\",\"ARS\":\"ARS\",\"BDT\":\"BDT\",\"BRL\":\"BRL\",\"BGN\":\"BGN\",\"CAD\":\"CAD\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"COP\":\"COP\",\"HRK\":\"HRK\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EGP\":\"EGP\",\"EUR\":\"EUR\",\"GEL\":\"GEL\",\"GHS\":\"GHS\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"KES\":\"KES\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"MAD\":\"MAD\",\"NPR\":\"NPR\",\"NZD\":\"NZD\",\"NGN\":\"NGN\",\"NOK\":\"NOK\",\"PKR\":\"PKR\",\"PEN\":\"PEN\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"RON\":\"RON\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"ZAR\":\"ZAR\",\"KRW\":\"KRW\",\"LKR\":\"LKR\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"TRY\":\"TRY\",\"UGX\":\"UGX\",\"UAH\":\"UAH\",\"AED\":\"AED\",\"GBP\":\"GBP\",\"USD\":\"USD\",\"VND\":\"VND\",\"XOF\":\"XOF\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 03:00:44'),
(6, 106, 'Payeer', 'Payeer', '5f6f1bc61518b1601117126.jpg', 1, '{\"merchant_id\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"866989763\"},\"secret_key\":{\"title\":\"Secret key\",\"global\":true,\"value\":\"7575\"}}', '{\"USD\":\"USD\",\"EUR\":\"EUR\",\"RUB\":\"RUB\"}', 0, '{\"status\":{\"title\": \"Status URL\",\"value\":\"ipn.Payeer\"}}', NULL, NULL, '2019-09-14 13:14:22', '2021-11-13 06:24:56'),
(7, 107, 'PayStack', 'Paystack', '5f7096563dfb71601214038.jpg', 1, '{\"public_key\":{\"title\":\"Public key\",\"global\":true,\"value\":\"pk_test_cd330608eb47970889bca397ced55c1dd5ad3783\"},\"secret_key\":{\"title\":\"Secret key\",\"global\":true,\"value\":\"sk_test_8a0b1f199362d7acc9c390bff72c4e81f74e2ac3\"}}', '{\"USD\":\"USD\",\"NGN\":\"NGN\"}', 0, '{\"callback\":{\"title\": \"Callback URL\",\"value\":\"ipn.Paystack\"},\"webhook\":{\"title\": \"Webhook URL\",\"value\":\"ipn.Paystack\"}}\r\n', NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 01:49:51'),
(8, 108, 'VoguePay', 'Voguepay', '5f6f1d5951a111601117529.jpg', 1, '{\"merchant_id\":{\"title\":\"MERCHANT ID\",\"global\":true,\"value\":\"demo\"}}', '{\"USD\":\"USD\",\"GBP\":\"GBP\",\"EUR\":\"EUR\",\"GHS\":\"GHS\",\"NGN\":\"NGN\",\"ZAR\":\"ZAR\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 01:22:38'),
(9, 109, 'Flutterwave', 'Flutterwave', '5f6f1b9e4bb961601117086.jpg', 1, '{\"public_key\":{\"title\":\"Public Key\",\"global\":true,\"value\":\"Demo_Key\"},\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"Demo_Key\"},\"encryption_key\":{\"title\":\"Encryption Key\",\"global\":true,\"value\":\"Demo_Key\"}}', '{\"BIF\":\"BIF\",\"CAD\":\"CAD\",\"CDF\":\"CDF\",\"CVE\":\"CVE\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"GHS\":\"GHS\",\"GMD\":\"GMD\",\"GNF\":\"GNF\",\"KES\":\"KES\",\"LRD\":\"LRD\",\"MWK\":\"MWK\",\"MZN\":\"MZN\",\"NGN\":\"NGN\",\"RWF\":\"RWF\",\"SLL\":\"SLL\",\"STD\":\"STD\",\"TZS\":\"TZS\",\"UGX\":\"UGX\",\"USD\":\"USD\",\"XAF\":\"XAF\",\"XOF\":\"XOF\",\"ZMK\":\"ZMK\",\"ZMW\":\"ZMW\",\"ZWD\":\"ZWD\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2021-06-17 11:23:37'),
(10, 110, 'RazorPay', 'Razorpay', '5f6f1d3672dd61601117494.jpg', 1, '{\"key_id\":{\"title\":\"Key Id\",\"global\":true,\"value\":\"rzp_test_kiOtejPbRZU90E\"},\"key_secret\":{\"title\":\"Key Secret \",\"global\":true,\"value\":\"osRDebzEqbsE1kbyQJ4y0re7\"}}', '{\"INR\":\"INR\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 02:51:32'),
(11, 111, 'Stripe Storefront', 'StripeJs', '5f7096a31ed9a1601214115.jpg', 1, '{\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"sk_test_51I6GGiCGv1sRiQlEi5v1or9eR0HVbuzdMd2rW4n3DxC8UKfz66R4X6n4yYkzvI2LeAIuRU9H99ZpY7XCNFC9xMs500vBjZGkKG\"},\"publishable_key\":{\"title\":\"PUBLISHABLE KEY\",\"global\":true,\"value\":\"pk_test_51I6GGiCGv1sRiQlEOisPKrjBqQqqcFsw8mXNaZ2H2baN6R01NulFS7dKFji1NRRxuchoUTEDdB7ujKcyKYSVc0z500eth7otOM\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"SGD\":\"SGD\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 00:53:10'),
(12, 112, 'Instamojo', 'Instamojo', '5f6f1babbdbb31601117099.jpg', 1, '{\"api_key\":{\"title\":\"API KEY\",\"global\":true,\"value\":\"test_2241633c3bc44a3de84a3b33969\"},\"auth_token\":{\"title\":\"Auth Token\",\"global\":true,\"value\":\"test_279f083f7bebefd35217feef22d\"},\"salt\":{\"title\":\"Salt\",\"global\":true,\"value\":\"19d38908eeff4f58b2ddda2c6d86ca25\"}}', '{\"INR\":\"INR\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 02:56:20'),
(13, 501, 'Blockchain', 'Blockchain', '5f6f1b2b20c6f1601116971.jpg', 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"55529946-05ca-48ff-8710-f279d86b1cc5\"},\"xpub_code\":{\"title\":\"XPUB CODE\",\"global\":true,\"value\":\"xpub6CKQ3xxWyBoFAF83izZCSFUorptEU9AF8TezhtWeMU5oefjX3sFSBw62Lr9iHXPkXmDQJJiHZeTRtD9Vzt8grAYRhvbz4nEvBu3QKELVzFK\"}}', '{\"BTC\":\"BTC\"}', 1, NULL, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 02:25:00'),
(14, 502, 'Block.io', 'Blockio', '5f6f19432bedf1601116483.jpg', 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":false,\"value\":\"1658-8015-2e5e-9afb\"},\"api_pin\":{\"title\":\"API PIN\",\"global\":true,\"value\":\"75757575\"}}', '{\"BTC\":\"BTC\",\"LTC\":\"LTC\"}', 1, '{\"cron\":{\"title\": \"Cron URL\",\"value\":\"ipn.Blockio\"}}', NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 02:31:09'),
(15, 503, 'CoinPayments', 'Coinpayments', '5f6f1b6c02ecd1601117036.jpg', 1, '{\"public_key\":{\"title\":\"Public Key\",\"global\":true,\"value\":\"---------------\"},\"private_key\":{\"title\":\"Private Key\",\"global\":true,\"value\":\"------------\"},\"merchant_id\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"93a1e014c4ad60a7980b4a7239673cb4\"}}', '{\"BTC\":\"Bitcoin\",\"BTC.LN\":\"Bitcoin (Lightning Network)\",\"LTC\":\"Litecoin\",\"CPS\":\"CPS Coin\",\"VLX\":\"Velas\",\"APL\":\"Apollo\",\"AYA\":\"Aryacoin\",\"BAD\":\"Badcoin\",\"BCD\":\"Bitcoin Diamond\",\"BCH\":\"Bitcoin Cash\",\"BCN\":\"Bytecoin\",\"BEAM\":\"BEAM\",\"BITB\":\"Bean Cash\",\"BLK\":\"BlackCoin\",\"BSV\":\"Bitcoin SV\",\"BTAD\":\"Bitcoin Adult\",\"BTG\":\"Bitcoin Gold\",\"BTT\":\"BitTorrent\",\"CLOAK\":\"CloakCoin\",\"CLUB\":\"ClubCoin\",\"CRW\":\"Crown\",\"CRYP\":\"CrypticCoin\",\"CRYT\":\"CryTrExCoin\",\"CURE\":\"CureCoin\",\"DASH\":\"DASH\",\"DCR\":\"Decred\",\"DEV\":\"DeviantCoin\",\"DGB\":\"DigiByte\",\"DOGE\":\"Dogecoin\",\"EBST\":\"eBoost\",\"EOS\":\"EOS\",\"ETC\":\"Ether Classic\",\"ETH\":\"Ethereum\",\"ETN\":\"Electroneum\",\"EUNO\":\"EUNO\",\"EXP\":\"EXP\",\"Expanse\":\"Expanse\",\"FLASH\":\"FLASH\",\"GAME\":\"GameCredits\",\"GLC\":\"Goldcoin\",\"GRS\":\"Groestlcoin\",\"KMD\":\"Komodo\",\"LOKI\":\"LOKI\",\"LSK\":\"LSK\",\"MAID\":\"MaidSafeCoin\",\"MUE\":\"MonetaryUnit\",\"NAV\":\"NAV Coin\",\"NEO\":\"NEO\",\"NMC\":\"Namecoin\",\"NVST\":\"NVO Token\",\"NXT\":\"NXT\",\"OMNI\":\"OMNI\",\"PINK\":\"PinkCoin\",\"PIVX\":\"PIVX\",\"POT\":\"PotCoin\",\"PPC\":\"Peercoin\",\"PROC\":\"ProCurrency\",\"PURA\":\"PURA\",\"QTUM\":\"QTUM\",\"RES\":\"Resistance\",\"RVN\":\"Ravencoin\",\"RVR\":\"RevolutionVR\",\"SBD\":\"Steem Dollars\",\"SMART\":\"SmartCash\",\"SOXAX\":\"SOXAX\",\"STEEM\":\"STEEM\",\"STRAT\":\"STRAT\",\"SYS\":\"Syscoin\",\"TPAY\":\"TokenPay\",\"TRIGGERS\":\"Triggers\",\"TRX\":\" TRON\",\"UBQ\":\"Ubiq\",\"UNIT\":\"UniversalCurrency\",\"USDT\":\"Tether USD (Omni Layer)\",\"VTC\":\"Vertcoin\",\"WAVES\":\"Waves\",\"XCP\":\"Counterparty\",\"XEM\":\"NEM\",\"XMR\":\"Monero\",\"XSN\":\"Stakenet\",\"XSR\":\"SucreCoin\",\"XVG\":\"VERGE\",\"XZC\":\"ZCoin\",\"ZEC\":\"ZCash\",\"ZEN\":\"Horizen\"}', 1, NULL, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 02:07:14'),
(16, 504, 'CoinPayments Fiat', 'CoinpaymentsFiat', '5f6f1b94e9b2b1601117076.jpg', 1, '{\"merchant_id\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"6515561\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"ISK\":\"ISK\",\"JPY\":\"JPY\",\"KRW\":\"KRW\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"RUB\":\"RUB\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TWD\":\"TWD\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 02:07:44'),
(17, 505, 'Coingate', 'Coingate', '5f6f1b5fe18ee1601117023.jpg', 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"6354mwVCEw5kHzRJ6thbGo-N\"}}', '{\"USD\":\"USD\",\"EUR\":\"EUR\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 02:49:30'),
(18, 506, 'Coinbase Commerce', 'CoinbaseCommerce', '5f6f1b4c774af1601117004.jpg', 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"c47cd7df-d8e8-424b-a20a\"},\"secret\":{\"title\":\"Webhook Shared Secret\",\"global\":true,\"value\":\"55871878-2c32-4f64-ab66\"}}', '{\"USD\":\"USD\",\"EUR\":\"EUR\",\"JPY\":\"JPY\",\"GBP\":\"GBP\",\"AUD\":\"AUD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CNY\":\"CNY\",\"SEK\":\"SEK\",\"NZD\":\"NZD\",\"MXN\":\"MXN\",\"SGD\":\"SGD\",\"HKD\":\"HKD\",\"NOK\":\"NOK\",\"KRW\":\"KRW\",\"TRY\":\"TRY\",\"RUB\":\"RUB\",\"INR\":\"INR\",\"BRL\":\"BRL\",\"ZAR\":\"ZAR\",\"AED\":\"AED\",\"AFN\":\"AFN\",\"ALL\":\"ALL\",\"AMD\":\"AMD\",\"ANG\":\"ANG\",\"AOA\":\"AOA\",\"ARS\":\"ARS\",\"AWG\":\"AWG\",\"AZN\":\"AZN\",\"BAM\":\"BAM\",\"BBD\":\"BBD\",\"BDT\":\"BDT\",\"BGN\":\"BGN\",\"BHD\":\"BHD\",\"BIF\":\"BIF\",\"BMD\":\"BMD\",\"BND\":\"BND\",\"BOB\":\"BOB\",\"BSD\":\"BSD\",\"BTN\":\"BTN\",\"BWP\":\"BWP\",\"BYN\":\"BYN\",\"BZD\":\"BZD\",\"CDF\":\"CDF\",\"CLF\":\"CLF\",\"CLP\":\"CLP\",\"COP\":\"COP\",\"CRC\":\"CRC\",\"CUC\":\"CUC\",\"CUP\":\"CUP\",\"CVE\":\"CVE\",\"CZK\":\"CZK\",\"DJF\":\"DJF\",\"DKK\":\"DKK\",\"DOP\":\"DOP\",\"DZD\":\"DZD\",\"EGP\":\"EGP\",\"ERN\":\"ERN\",\"ETB\":\"ETB\",\"FJD\":\"FJD\",\"FKP\":\"FKP\",\"GEL\":\"GEL\",\"GGP\":\"GGP\",\"GHS\":\"GHS\",\"GIP\":\"GIP\",\"GMD\":\"GMD\",\"GNF\":\"GNF\",\"GTQ\":\"GTQ\",\"GYD\":\"GYD\",\"HNL\":\"HNL\",\"HRK\":\"HRK\",\"HTG\":\"HTG\",\"HUF\":\"HUF\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"IMP\":\"IMP\",\"IQD\":\"IQD\",\"IRR\":\"IRR\",\"ISK\":\"ISK\",\"JEP\":\"JEP\",\"JMD\":\"JMD\",\"JOD\":\"JOD\",\"KES\":\"KES\",\"KGS\":\"KGS\",\"KHR\":\"KHR\",\"KMF\":\"KMF\",\"KPW\":\"KPW\",\"KWD\":\"KWD\",\"KYD\":\"KYD\",\"KZT\":\"KZT\",\"LAK\":\"LAK\",\"LBP\":\"LBP\",\"LKR\":\"LKR\",\"LRD\":\"LRD\",\"LSL\":\"LSL\",\"LYD\":\"LYD\",\"MAD\":\"MAD\",\"MDL\":\"MDL\",\"MGA\":\"MGA\",\"MKD\":\"MKD\",\"MMK\":\"MMK\",\"MNT\":\"MNT\",\"MOP\":\"MOP\",\"MRO\":\"MRO\",\"MUR\":\"MUR\",\"MVR\":\"MVR\",\"MWK\":\"MWK\",\"MYR\":\"MYR\",\"MZN\":\"MZN\",\"NAD\":\"NAD\",\"NGN\":\"NGN\",\"NIO\":\"NIO\",\"NPR\":\"NPR\",\"OMR\":\"OMR\",\"PAB\":\"PAB\",\"PEN\":\"PEN\",\"PGK\":\"PGK\",\"PHP\":\"PHP\",\"PKR\":\"PKR\",\"PLN\":\"PLN\",\"PYG\":\"PYG\",\"QAR\":\"QAR\",\"RON\":\"RON\",\"RSD\":\"RSD\",\"RWF\":\"RWF\",\"SAR\":\"SAR\",\"SBD\":\"SBD\",\"SCR\":\"SCR\",\"SDG\":\"SDG\",\"SHP\":\"SHP\",\"SLL\":\"SLL\",\"SOS\":\"SOS\",\"SRD\":\"SRD\",\"SSP\":\"SSP\",\"STD\":\"STD\",\"SVC\":\"SVC\",\"SYP\":\"SYP\",\"SZL\":\"SZL\",\"THB\":\"THB\",\"TJS\":\"TJS\",\"TMT\":\"TMT\",\"TND\":\"TND\",\"TOP\":\"TOP\",\"TTD\":\"TTD\",\"TWD\":\"TWD\",\"TZS\":\"TZS\",\"UAH\":\"UAH\",\"UGX\":\"UGX\",\"UYU\":\"UYU\",\"UZS\":\"UZS\",\"VEF\":\"VEF\",\"VND\":\"VND\",\"VUV\":\"VUV\",\"WST\":\"WST\",\"XAF\":\"XAF\",\"XAG\":\"XAG\",\"XAU\":\"XAU\",\"XCD\":\"XCD\",\"XDR\":\"XDR\",\"XOF\":\"XOF\",\"XPD\":\"XPD\",\"XPF\":\"XPF\",\"XPT\":\"XPT\",\"YER\":\"YER\",\"ZMW\":\"ZMW\",\"ZWL\":\"ZWL\"}\r\n\r\n', 0, '{\"endpoint\":{\"title\": \"Webhook Endpoint\",\"value\":\"ipn.CoinbaseCommerce\"}}', NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 02:02:47'),
(24, 113, 'Paypal Express', 'PaypalSdk', '5f6f1bec255c61601117164.jpg', 1, '{\"clientId\":{\"title\":\"Paypal Client ID\",\"global\":true,\"value\":\"Ae0-tixtSV7DvLwIh3Bmu7JvHrjh5EfGdXr_cEklKAVjjezRZ747BxKILiBdzlKKyp-W8W_T7CKH1Ken\"},\"clientSecret\":{\"title\":\"Client Secret\",\"global\":true,\"value\":\"EOhbvHZgFNO21soQJT1L9Q00M3rK6PIEsdiTgXRBt2gtGtxwRer5JvKnVUGNU5oE63fFnjnYY7hq3HBA\"}}', '{\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"TWD\":\"TWD\",\"NZD\":\"NZD\",\"NOK\":\"NOK\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"GBP\":\"GBP\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"USD\":\"$\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2021-05-20 23:01:08'),
(25, 114, 'Stripe Checkout', 'StripeV3', '5f709684736321601214084.jpg', 1, '{\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"sk_test_51I6GGiCGv1sRiQlEi5v1or9eR0HVbuzdMd2rW4n3DxC8UKfz66R4X6n4yYkzvI2LeAIuRU9H99ZpY7XCNFC9xMs500vBjZGkKG\"},\"publishable_key\":{\"title\":\"PUBLISHABLE KEY\",\"global\":true,\"value\":\"pk_test_51I6GGiCGv1sRiQlEOisPKrjBqQqqcFsw8mXNaZ2H2baN6R01NulFS7dKFji1NRRxuchoUTEDdB7ujKcyKYSVc0z500eth7otOM\"},\"end_point\":{\"title\":\"End Point Secret\",\"global\":true,\"value\":\"whsec_lUmit1gtxwKTveLnSe88xCSDdnPOt8g5\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"SGD\":\"SGD\"}', 0, '{\"webhook\":{\"title\": \"Webhook Endpoint\",\"value\":\"ipn.StripeV3\"}}', NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 00:58:38'),
(27, 115, 'Mollie', 'Mollie', '5f6f1bb765ab11601117111.jpg', 1, '{\"mollie_email\":{\"title\":\"Mollie Email \",\"global\":true,\"value\":\"vi@gmail.com\"},\"api_key\":{\"title\":\"API KEY\",\"global\":true,\"value\":\"test_cucfwKTWfft9s337qsVfn5CC4vNkrn\"}}', '{\"AED\":\"AED\",\"AUD\":\"AUD\",\"BGN\":\"BGN\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"HRK\":\"HRK\",\"HUF\":\"HUF\",\"ILS\":\"ILS\",\"ISK\":\"ISK\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"RON\":\"RON\",\"RUB\":\"RUB\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TWD\":\"TWD\",\"USD\":\"USD\",\"ZAR\":\"ZAR\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 02:44:45'),
(30, 116, 'Cashmaal', 'Cashmaal', '5f9a8b62bb4dd1603963746.png', 1, '{\"web_id\":{\"title\":\"Web Id\",\"global\":true,\"value\":\"3748\"},\"ipn_key\":{\"title\":\"IPN Key\",\"global\":true,\"value\":\"546254628759524554647987\"}}', '{\"PKR\":\"PKR\",\"USD\":\"USD\"}', 0, '{\"webhook\":{\"title\": \"IPN URL\",\"value\":\"ipn.Cashmaal\"}}', NULL, NULL, NULL, '2021-05-21 02:43:26');

-- --------------------------------------------------------

--
-- Table structure for table `gateway_currencies`
--

CREATE TABLE `gateway_currencies` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `symbol` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `method_code` int(11) DEFAULT NULL,
  `gateway_alias` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `min_amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `max_amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `percent_charge` decimal(5,2) NOT NULL DEFAULT 0.00,
  `fixed_charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `rate` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gateway_parameter` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `general_settings`
--

CREATE TABLE `general_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sitename` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cur_text` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'currency text',
  `cur_sym` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'currency symbol',
  `email_from` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_template` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_api` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `base_color` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secondary_color` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_config` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'email configuration',
  `sms_config` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ev` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'email verification, 0 - dont check, 1 - check',
  `en` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'email notification, 0 - dont send, 1 - send',
  `sv` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'sms verication, 0 - dont check, 1 - check',
  `sn` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'sms notification, 0 - dont send, 1 - send',
  `dc` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Deposit Commission',
  `force_ssl` tinyint(4) NOT NULL DEFAULT 0,
  `secure_password` tinyint(4) NOT NULL DEFAULT 0,
  `agree` tinyint(4) NOT NULL DEFAULT 0,
  `registration` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: Off	, 1: On',
  `active_template` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sys_version` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_cron` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `general_settings`
--

INSERT INTO `general_settings` (`id`, `sitename`, `cur_text`, `cur_sym`, `email_from`, `email_template`, `sms_api`, `base_color`, `secondary_color`, `mail_config`, `sms_config`, `ev`, `en`, `sv`, `sn`, `dc`, `force_ssl`, `secure_password`, `agree`, `registration`, `active_template`, `sys_version`, `last_cron`, `created_at`, `updated_at`) VALUES
(1, 'Xaxino', 'USD', '$', 'no-reply@viserlab.com', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\r\n  <!--[if !mso]><!-->\r\n  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n  <!--<![endif]-->\r\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n  <title></title>\r\n  <style type=\"text/css\">\r\n.ReadMsgBody { width: 100%; background-color: #ffffff; }\r\n.ExternalClass { width: 100%; background-color: #ffffff; }\r\n.ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div { line-height: 100%; }\r\nhtml { width: 100%; }\r\nbody { -webkit-text-size-adjust: none; -ms-text-size-adjust: none; margin: 0; padding: 0; }\r\ntable { border-spacing: 0; table-layout: fixed; margin: 0 auto;border-collapse: collapse; }\r\ntable table table { table-layout: auto; }\r\n.yshortcuts a { border-bottom: none !important; }\r\nimg:hover { opacity: 0.9 !important; }\r\na { color: #0087ff; text-decoration: none; }\r\n.textbutton a { font-family: \'open sans\', arial, sans-serif !important;}\r\n.btn-link a { color:#FFFFFF !important;}\r\n\r\n@media only screen and (max-width: 480px) {\r\nbody { width: auto !important; }\r\n*[class=\"table-inner\"] { width: 90% !important; text-align: center !important; }\r\n*[class=\"table-full\"] { width: 100% !important; text-align: center !important; }\r\n/* image */\r\nimg[class=\"img1\"] { width: 100% !important; height: auto !important; }\r\n}\r\n</style>\r\n\r\n\r\n\r\n  <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" bgcolor=\"#414a51\" align=\"center\">\r\n    <tbody><tr>\r\n      <td height=\"50\"><br></td>\r\n    </tr>\r\n    <tr>\r\n      <td style=\"text-align:center;vertical-align:top;font-size:0;\" align=\"center\">\r\n        <table cellspacing=\"0\" cellpadding=\"0\" border=\"0\" align=\"center\">\r\n          <tbody><tr>\r\n            <td width=\"600\" align=\"center\">\r\n              <!--header-->\r\n              <table class=\"table-inner\" width=\"95%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" align=\"center\">\r\n                <tbody><tr>\r\n                  <td style=\"border-top-left-radius:6px; border-top-right-radius:6px;text-align:center;vertical-align:top;font-size:0;\" bgcolor=\"#0087ff\" align=\"center\">\r\n                    <table width=\"90%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" align=\"center\">\r\n                      <tbody><tr>\r\n                        <td height=\"20\"><br></td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td style=\"font-family: \'Open sans\', Arial, sans-serif; color:#FFFFFF; font-size:16px; font-weight: bold;\" align=\"center\">This is a System Generated Email</td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"><br></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n              <!--end header-->\r\n              <table class=\"table-inner\" width=\"95%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\">\r\n                <tbody><tr>\r\n                  <td style=\"text-align:center;vertical-align:top;font-size:0;\" bgcolor=\"#FFFFFF\" align=\"center\">\r\n                    <table width=\"90%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" align=\"center\">\r\n                      <tbody><tr>\r\n                        <td height=\"35\"><br></td>\r\n                      </tr>\r\n                      <!--logo-->\r\n                      <tr>\r\n                        <td style=\"vertical-align:top;font-size:0;\" align=\"center\">\r\n                          <a href=\"#\">\r\n                            <img style=\"display:block; line-height:0px; font-size:0px; border:0px;\" src=\"https://i.imgur.com/Z1qtvtV.png\" alt=\"img\">\r\n                          </a>\r\n                        </td>\r\n                      </tr>\r\n                      <!--end logo-->\r\n                      <tr>\r\n                        <td height=\"40\"><br></td>\r\n                      </tr>\r\n                      <!--headline-->\r\n                      <tr>\r\n                        <td style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 22px;color:#414a51;font-weight: bold;\" align=\"center\">Hello {{fullname}} ({{username}})</td>\r\n                      </tr>\r\n                      <!--end headline-->\r\n                      <tr>\r\n                        <td style=\"text-align:center;vertical-align:top;font-size:0;\" align=\"center\">\r\n                          <table width=\"40\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" align=\"center\">\r\n                            <tbody><tr>\r\n                              <td style=\" border-bottom:3px solid #0087ff;\" height=\"20\"><br></td>\r\n                            </tr>\r\n                          </tbody></table>\r\n                        </td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"><br></td>\r\n                      </tr>\r\n                      <!--content-->\r\n                      <tr>\r\n                        <td style=\"font-family: \'Open sans\', Arial, sans-serif; color:#7f8c8d; font-size:16px; line-height: 28px;\" align=\"left\">{{message}}</td>\r\n                      </tr>\r\n                      <!--end content-->\r\n                      <tr>\r\n                        <td height=\"40\"><br></td>\r\n                      </tr>\r\n              \r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td style=\"border-bottom-left-radius:6px;border-bottom-right-radius:6px;\" height=\"45\" bgcolor=\"#f4f4f4\" align=\"center\">\r\n                    <table width=\"90%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" align=\"center\">\r\n                      <tbody><tr>\r\n                        <td height=\"10\"><br></td>\r\n                      </tr>\r\n                      <!--preference-->\r\n                      <tr>\r\n                        <td class=\"preference-link\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#95a5a6; font-size:14px;\" align=\"center\">\r\n                          © 2021 <a href=\"#\">Website Name</a> . All Rights Reserved. \r\n                        </td>\r\n                      </tr>\r\n                      <!--end preference-->\r\n                      <tr>\r\n                        <td height=\"10\"><br></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n            </td>\r\n          </tr>\r\n        </tbody></table>\r\n      </td>\r\n    </tr>\r\n    <tr>\r\n      <td height=\"60\"><br></td>\r\n    </tr>\r\n  </tbody></table>', 'hi {{name}}, {{message}}', 'E3BC3F', NULL, '{\"name\":\"php\"}', '{\"clickatell_api_key\":\"----------------\",\"infobip_username\":\"------------\",\"infobip_password\":\"-----------------\",\"message_bird_api_key\":\"-------------------\",\"nexmo_api_key\":\"----------------------\",\"nexmo_api_secret\":\"----------------------\",\"sms_broadcast_username\":\"----------------------\",\"sms_broadcast_password\":\"-----------------------------\",\"account_sid\":\"-----------------------\",\"auth_token\":\"---------------------------\",\"from\":\"----------------------\",\"text_magic_username\":\"-----------------------\",\"apiv2_key\":\"-------------------------------\",\"name\":\"textMagic\"}', 0, 1, 0, 0, 0, 0, 0, 1, 1, 'basic', NULL, '2021-08-03 10:32:58', NULL, '2021-11-13 06:12:35');

-- --------------------------------------------------------

--
-- Table structure for table `guesse_bonuses`
--

CREATE TABLE `guesse_bonuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `chance` int(11) NOT NULL,
  `percent` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_align` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0: left to right text align, 1: right to left text align',
  `is_default` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0: not default language, 1: default language',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `code`, `icon`, `text_align`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'En', 'en', '5f15968db08911595250317.png', 0, 0, '2020-07-06 03:47:55', '2021-06-17 12:28:14'),
(5, 'Hn', 'hn', NULL, 0, 0, '2020-12-29 02:20:07', '2021-07-12 07:31:36'),
(9, 'Bn', 'bn', NULL, 0, 0, '2021-03-14 04:37:41', '2021-07-12 07:31:40');

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
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_06_14_061757_create_support_tickets_table', 3),
(5, '2020_06_14_061837_create_support_messages_table', 3),
(6, '2020_06_14_061904_create_support_attachments_table', 3),
(7, '2020_06_14_062359_create_admins_table', 3),
(8, '2020_06_14_064604_create_transactions_table', 4),
(9, '2020_06_14_065247_create_general_settings_table', 5),
(12, '2014_10_12_100000_create_password_resets_table', 6),
(13, '2020_06_14_060541_create_user_logins_table', 6),
(14, '2020_06_14_071708_create_admin_password_resets_table', 7),
(15, '2020_09_14_053026_create_countries_table', 8),
(16, '2021_03_15_084721_create_admin_notifications_table', 9),
(17, '2016_06_01_000001_create_oauth_auth_codes_table', 10),
(18, '2016_06_01_000002_create_oauth_access_tokens_table', 10),
(19, '2016_06_01_000003_create_oauth_refresh_tokens_table', 10),
(20, '2016_06_01_000004_create_oauth_clients_table', 10),
(21, '2016_06_01_000005_create_oauth_personal_access_clients_table', 10),
(22, '2021_05_08_103925_create_sms_gateways_table', 11),
(23, '2019_12_14_000001_create_personal_access_tokens_table', 12),
(24, '2021_05_23_111859_create_email_logs_table', 13);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tempname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'template name',
  `secs` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `name`, `slug`, `tempname`, `secs`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'HOME', 'home', 'templates.basic.', '[\"statistics\",\"about\",\"game\",\"trx_win\",\"choose_us\",\"how_work\",\"faq\",\"cta\",\"referral\",\"testimonial\",\"blog\",\"payment_method\"]', 1, '2020-07-11 00:23:58', '2021-07-28 09:11:51'),
(10, 'About', 'about', 'templates.basic.', '[\"about\",\"choose_us\",\"faq\",\"testimonial\",\"payment_method\"]', 0, '2021-05-10 23:48:00', '2021-05-10 23:48:18'),
(11, 'Games', 'games', 'templates.basic.', '[\"game\"]', 0, '2021-06-17 12:04:10', '2021-06-17 12:04:25'),
(12, 'Blog', 'blog', 'templates.basic.', '[\"blog\"]', 0, '2021-06-17 12:04:43', '2021-06-17 12:04:54');

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
-- Table structure for table `referrals`
--

CREATE TABLE `referrals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `level` int(11) NOT NULL,
  `percent` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_attachments`
--

CREATE TABLE `support_attachments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `support_message_id` int(11) NOT NULL,
  `attachment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_messages`
--

CREATE TABLE `support_messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `supportticket_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_id` int(11) NOT NULL DEFAULT 0,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT 0,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(91) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ticket` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL COMMENT '0: Open, 1: Answered, 2: Replied, 3: Closed',
  `priority` int(11) NOT NULL DEFAULT 0 COMMENT '1 = Low, 2 = medium, 3 = heigh',
  `last_reply` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `post_balance` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `trx_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trx` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remark` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `firstname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(90) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_code` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_by` int(11) DEFAULT NULL,
  `balance` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(91) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'contains full address',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0: banned, 1: active',
  `ev` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: email unverified, 1: email verified',
  `sv` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: sms unverified, 1: sms verified',
  `ver_code` varchar(91) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'stores verification code',
  `ver_code_send_at` datetime DEFAULT NULL COMMENT 'verification send time',
  `ts` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: 2fa off, 1: 2fa on',
  `tv` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0: 2fa unverified, 1: 2fa verified',
  `tsc` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_logins`
--

CREATE TABLE `user_logins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_code` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `browser` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `os` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdrawals`
--

CREATE TABLE `withdrawals` (
  `id` int(10) UNSIGNED NOT NULL,
  `method_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `currency` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `trx` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `final_amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `after_charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `withdraw_information` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1=>success, 2=>pending, 3=>cancel,  ',
  `admin_feedback` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_methods`
--

CREATE TABLE `withdraw_methods` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `min_limit` decimal(28,8) DEFAULT 0.00000000,
  `max_limit` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `delay` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fixed_charge` decimal(28,8) DEFAULT 0.00000000,
  `rate` decimal(28,8) DEFAULT 0.00000000,
  `percent_charge` decimal(5,2) DEFAULT NULL,
  `currency` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_data` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
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
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `commission_logs`
--
ALTER TABLE `commission_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_logs`
--
ALTER TABLE `email_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_sms_templates`
--
ALTER TABLE `email_sms_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `extensions`
--
ALTER TABLE `extensions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `frontends`
--
ALTER TABLE `frontends`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `game_logs`
--
ALTER TABLE `game_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gateways`
--
ALTER TABLE `gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gateway_currencies`
--
ALTER TABLE `gateway_currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `general_settings`
--
ALTER TABLE `general_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `guesse_bonuses`
--
ALTER TABLE `guesse_bonuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `referrals`
--
ALTER TABLE `referrals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_attachments`
--
ALTER TABLE `support_attachments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_messages`
--
ALTER TABLE `support_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_tickets`
--
ALTER TABLE `support_tickets`
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
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`,`email`);

--
-- Indexes for table `user_logins`
--
ALTER TABLE `user_logins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdrawals`
--
ALTER TABLE `withdrawals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw_methods`
--
ALTER TABLE `withdraw_methods`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `commission_logs`
--
ALTER TABLE `commission_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_logs`
--
ALTER TABLE `email_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_sms_templates`
--
ALTER TABLE `email_sms_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=218;

--
-- AUTO_INCREMENT for table `extensions`
--
ALTER TABLE `extensions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `frontends`
--
ALTER TABLE `frontends`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT for table `games`
--
ALTER TABLE `games`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `game_logs`
--
ALTER TABLE `game_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gateways`
--
ALTER TABLE `gateways`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `gateway_currencies`
--
ALTER TABLE `gateway_currencies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `general_settings`
--
ALTER TABLE `general_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `guesse_bonuses`
--
ALTER TABLE `guesse_bonuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `referrals`
--
ALTER TABLE `referrals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_attachments`
--
ALTER TABLE `support_attachments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_messages`
--
ALTER TABLE `support_messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_logins`
--
ALTER TABLE `user_logins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdrawals`
--
ALTER TABLE `withdrawals`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdraw_methods`
--
ALTER TABLE `withdraw_methods`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
