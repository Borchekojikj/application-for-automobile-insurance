-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 23, 2024 at 09:07 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `challenge_27`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2024_05_20_143828_create_vehicles_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'Borche Kojikj', 'borche@gmail.com', NULL, '$2y$10$.clXAJyypqkTJ4kbPsORsuTS5x0MWhRJCh.4yc9gG8uoAzcVdvo.C', NULL, '2024-05-23 14:58:57', '2024-05-23 14:58:57');

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `brand` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `plate_number` varchar(255) NOT NULL,
  `insurance_date` date NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`id`, `brand`, `model`, `plate_number`, `insurance_date`, `deleted_at`, `created_at`, `updated_at`) VALUES
(26, 'GMC', 'TSX', 'FXY-891', '2024-06-05', '2024-05-23 15:25:33', '2024-05-20 12:58:39', '2024-05-23 15:25:33'),
(27, 'Aston Martin', 'Aero Supersports', 'PNF-517', '2024-08-25', '2024-05-23 15:25:35', '2024-05-20 12:58:39', '2024-05-23 15:25:35'),
(28, 'TVR', 'TX', 'YEW-788', '2023-11-07', '2024-05-23 15:25:36', '2024-05-20 12:58:39', '2024-05-23 15:25:36'),
(29, 'Fiat', 'Beast', 'EXL-852', '2025-01-25', '2024-05-23 15:37:41', '2024-05-20 12:58:39', '2024-05-23 15:37:41'),
(30, 'a', 'Huabey', 'RQP-398', '2024-07-24', '2024-05-23 15:42:13', '2024-05-20 12:58:39', '2024-05-23 15:42:13'),
(31, 'Gonowsdsd', '500', 'PJB-347', '2024-12-23', '2024-05-23 15:48:24', '2024-05-20 12:58:39', '2024-05-23 15:48:24'),
(32, '221', 'QM5', 'XIX-445', '2024-06-01', '2024-05-23 16:29:43', '2024-05-20 12:58:39', '2024-05-23 16:29:43'),
(33, 'Citroenasdasdasdasdsaddasasdasd', '30', 'TRW-580', '2025-03-26', '2024-05-23 16:32:02', '2024-05-20 12:58:39', '2024-05-23 16:32:02'),
(34, 'Ultima', 'Signum', 'EHR-732', '2024-10-19', '2024-05-23 16:32:09', '2024-05-20 12:58:39', '2024-05-23 16:32:09'),
(35, 'Ford', '456', 'OPN-690', '2024-10-04', '2024-05-23 16:32:11', '2024-05-20 12:58:39', '2024-05-23 16:32:11'),
(36, 'Fiat-Abarth', 'SQ7', 'JRF-320', '2024-03-30', '2024-05-23 16:32:13', '2024-05-20 12:58:39', '2024-05-23 16:32:13'),
(37, 'Zimmer', '208', 'ZUP-540', '2025-03-20', '2024-05-23 16:32:15', '2024-05-20 12:58:39', '2024-05-23 16:32:15'),
(38, 'Huabei', 'City', 'CSW-711', '2024-09-17', NULL, '2024-05-20 12:58:39', '2024-05-20 12:58:39'),
(39, 'Acura', 'Golden Spirit', 'HHR-918', '2023-07-01', '2024-05-23 16:32:17', '2024-05-20 12:58:39', '2024-05-23 16:32:17'),
(51, 'TEst', 'Corolla', '123123GT', '2024-05-05', '2024-05-23 16:32:18', '2024-05-23 15:18:25', '2024-05-23 16:32:18'),
(52, 'Mercedes-Benz', '450', 'PST-122', '2023-07-29', NULL, '2024-05-23 15:20:40', '2024-05-23 15:20:40'),
(53, 'LTI', '131', 'NTF-880', '2024-05-12', NULL, '2024-05-23 15:20:40', '2024-05-23 15:20:40'),
(54, 'Vauxhall', 'V3', 'SAL-423', '2024-04-17', NULL, '2024-05-23 15:20:40', '2024-05-23 15:20:40'),
(55, 'LTI', 'Zonda', 'FOY-417', '2025-05-18', NULL, '2024-05-23 15:20:40', '2024-05-23 15:20:40'),
(56, 'Zotye', 'Speedster', 'CNP-878', '2024-03-04', NULL, '2024-05-23 15:20:40', '2024-05-23 15:20:40'),
(57, 'Asia', 'Extrem 500', 'VCM-048', '2024-11-12', NULL, '2024-05-23 15:20:40', '2024-05-23 15:20:40'),
(58, 'Austin', 'Attiva', 'DKM-817', '2024-04-14', NULL, '2024-05-23 15:20:40', '2024-05-23 15:20:40'),
(59, 'Ram', 'City', 'TWE-964', '2025-03-08', NULL, '2024-05-23 15:20:40', '2024-05-23 15:20:40'),
(60, 'Fornasari', 'City', 'BJJ-358', '2025-04-20', NULL, '2024-05-23 15:20:40', '2024-05-23 15:20:40'),
(61, 'Eagle', 'Elba', 'NUR-977', '2025-01-06', NULL, '2024-05-23 15:20:40', '2024-05-23 15:20:40'),
(62, 'Autobianchi', '9-7X', 'TMQ-060', '2024-08-29', NULL, '2024-05-23 15:20:40', '2024-05-23 15:20:40'),
(63, 'Detroit Electric', 'Diktator', 'OKW-981', '2024-03-23', NULL, '2024-05-23 15:20:40', '2024-05-23 15:20:40'),
(64, 'Fiat-Abarth', 'Sonic', 'BCM-580', '2024-07-01', NULL, '2024-05-23 15:20:40', '2024-05-23 15:20:40'),
(65, 'Chrysler', '710', 'YJL-069', '2024-07-31', NULL, '2024-05-23 15:20:40', '2024-05-23 15:20:40'),
(66, 'Wanfeng', 'Commander', 'IIA-148', '2024-12-06', NULL, '2024-05-23 15:20:40', '2024-05-23 15:20:40'),
(67, 'Rover', 'Gonow', 'ITE-962', '2023-11-23', NULL, '2024-05-23 15:20:40', '2024-05-23 15:20:40'),
(68, 'Chrysler', 'tC', 'MAY-642', '2025-02-10', NULL, '2024-05-23 15:20:40', '2024-05-23 15:20:40'),
(69, 'Shuanghuan', '4', 'SOD-428', '2024-10-09', NULL, '2024-05-23 15:20:40', '2024-05-23 15:20:40'),
(70, 'Great Wall', 'City', 'SCP-224', '2024-01-19', NULL, '2024-05-23 15:20:40', '2024-05-23 15:20:40'),
(71, 'SsangYong', 'Kalos', 'HTN-778', '2023-12-16', NULL, '2024-05-23 15:20:40', '2024-05-23 15:20:40'),
(72, 'FUQI', '418', 'HQZ-403', '2024-12-26', NULL, '2024-05-23 15:20:40', '2024-05-23 15:20:40'),
(73, 'Nissan', 'Hijet', 'YYC-871', '2023-10-17', NULL, '2024-05-23 15:20:40', '2024-05-23 15:20:40'),
(74, 'Gonow', 'A110', 'FSM-871', '2024-01-22', NULL, '2024-05-23 15:20:40', '2024-05-23 15:20:40'),
(75, 'Zastava', 'F16', 'SLA-884', '2024-10-05', NULL, '2024-05-23 15:20:40', '2024-05-23 15:20:40'),
(76, 'Dr. Motor', 'RR', 'MRC-451', '2024-11-09', NULL, '2024-05-23 15:20:40', '2024-05-23 15:20:40'),
(77, 'Acura', '700 spider', 'UDJ-719', '2023-11-02', NULL, '2024-05-23 15:20:40', '2024-05-23 15:20:40'),
(78, 'Alfa Romeo', 'VX 2300', 'PWN-856', '2025-03-03', NULL, '2024-05-23 15:20:40', '2024-05-23 15:20:40'),
(79, 'Blonell', '3500', 'FWW-715', '2024-01-30', NULL, '2024-05-23 15:20:40', '2024-05-23 15:20:40'),
(80, 'Rezvani', 'Faster', 'CRE-782', '2024-05-20', NULL, '2024-05-23 15:20:40', '2024-05-23 15:20:40'),
(81, 'Maybach', 'Meriva', 'TWX-382', '2024-10-21', NULL, '2024-05-23 15:20:40', '2024-05-23 15:20:40'),
(82, 'Gonow', '710', 'JUZ-564', '2024-06-01', NULL, '2024-05-23 15:20:40', '2024-05-23 15:20:40'),
(83, 'Austin', 'SCEO', 'UMV-006', '2025-05-19', NULL, '2024-05-23 15:20:40', '2024-05-23 15:20:40'),
(84, 'Oltcit', '420/430', 'PYT-794', '2024-06-09', NULL, '2024-05-23 15:20:40', '2024-05-23 15:20:40'),
(85, 'Gac', 'OR70', 'LNS-375', '2024-11-24', NULL, '2024-05-23 15:20:40', '2024-05-23 15:20:40'),
(86, 'Chrysler', 'H2', 'LUJ-749', '2024-10-08', NULL, '2024-05-23 15:20:40', '2024-05-23 15:20:40'),
(87, 'TATA', 'Phantom VI', 'ECE-095', '2024-02-24', NULL, '2024-05-23 15:20:40', '2024-05-23 15:20:40'),
(88, 'Cadillac', 'Atlantique', 'RNB-684', '2024-12-31', NULL, '2024-05-23 15:20:40', '2024-05-23 15:20:40'),
(89, 'Altamarea', 'Zonda', 'KNT-958', '2024-07-02', NULL, '2024-05-23 15:20:40', '2024-05-23 15:20:40'),
(90, 'Innocenti', 'Sigra', 'STM-806', '2024-03-24', NULL, '2024-05-23 15:20:40', '2024-05-23 15:20:40'),
(91, 'Adler', '14', 'YZZ-754', '2024-12-30', NULL, '2024-05-23 15:20:40', '2024-05-23 15:20:40'),
(92, 'Bio Auto', 'RR', 'YNW-515', '2024-03-13', NULL, '2024-05-23 15:20:40', '2024-05-23 15:20:40'),
(93, 'Bio Auto', '427 KMS', 'UIR-286', '2023-10-04', NULL, '2024-05-23 15:20:40', '2024-05-23 15:20:40'),
(94, 'FSO', 'GTR', 'ZGJ-261', '2023-06-11', NULL, '2024-05-23 15:20:40', '2024-05-23 15:20:40'),
(95, 'DS', 'X5', 'YQR-594', '2023-09-08', NULL, '2024-05-23 15:20:40', '2024-05-23 15:20:40'),
(96, 'Datsun', 'Land Cruiser 60', 'EIJ-071', '2025-03-22', NULL, '2024-05-23 15:20:40', '2024-05-23 15:20:40'),
(97, 'Hyundai', 'X-Type', 'KCK-434', '2023-12-31', NULL, '2024-05-23 15:20:40', '2024-05-23 15:20:40'),
(98, 'BMW', 'Karma', 'XTU-621', '2023-07-02', NULL, '2024-05-23 15:20:40', '2024-05-23 15:20:40'),
(99, 'Saab', 'XT5', 'EJL-522', '2024-10-09', NULL, '2024-05-23 15:20:40', '2024-05-23 15:20:40'),
(100, 'Mahindra', 'Mini Classic', 'DAO-314', '2023-06-08', NULL, '2024-05-23 15:20:40', '2024-05-23 15:20:40'),
(101, 'KingWoo', 'Safari', 'IUT-252', '2024-01-21', NULL, '2024-05-23 15:20:40', '2024-05-23 15:20:40'),
(122, 'asd', 'asd', 'asd', '2024-05-19', NULL, '2024-05-23 15:46:53', '2024-05-23 15:46:53'),
(123, 'rere', 'rerer', 'erere', '2024-05-28', NULL, '2024-05-23 15:47:27', '2024-05-23 15:47:27'),
(125, 'wrwraaaa', 'wrwr', 'wrwr', '2024-06-03', NULL, '2024-05-23 15:47:37', '2024-05-23 15:49:01'),
(127, 'asdasd', 'asdasd', 'asdasd', '2024-05-08', '2024-05-23 15:48:52', '2024-05-23 15:48:30', '2024-05-23 15:48:52'),
(138, 'asddddd', 'asdddd', 'asdddd', '2024-05-21', NULL, '2024-05-23 16:01:18', '2024-05-23 16:01:18'),
(140, 'bbb', 'bb', 'bbb', '2024-05-28', NULL, '2024-05-23 16:02:13', '2024-05-23 16:02:13'),
(142, 'asdasddd', 'asdasddd', 'asdasddd', '2024-05-26', NULL, '2024-05-23 16:02:42', '2024-05-23 16:02:42'),
(144, 'test', 'test', 'test', '2024-05-22', NULL, '2024-05-23 16:03:03', '2024-05-23 16:03:03'),
(146, 'test', 'test', 'asdsad', '2024-05-22', NULL, '2024-05-23 16:03:11', '2024-05-23 16:03:11'),
(147, 'asd', 'asd', 'asdb123', '2024-05-27', NULL, '2024-05-23 16:04:16', '2024-05-23 16:04:16'),
(148, 'asddd', 'dd', 'ddas2', '2024-04-30', NULL, '2024-05-23 16:05:48', '2024-05-23 16:05:48'),
(149, 'asd', 'asd', 'TestID', '2024-05-06', NULL, '2024-05-23 16:21:06', '2024-05-23 16:21:06'),
(150, 'asdasd', 'dsadas', 'sadds213123', '2024-05-12', NULL, '2024-05-23 16:23:36', '2024-05-23 16:23:36'),
(151, 'asdads', 'asddas', '123123', '2024-05-21', NULL, '2024-05-23 16:26:13', '2024-05-23 16:26:13'),
(152, 'asdasd', 'asdasd', '12311', '2024-04-30', NULL, '2024-05-23 16:27:54', '2024-05-23 16:27:54'),
(153, 'asd', 'asd', '32312', '2024-05-07', NULL, '2024-05-23 16:28:23', '2024-05-23 16:28:23'),
(154, 'asdasd', 'asdas', 'asd22', '2024-05-09', NULL, '2024-05-23 16:29:16', '2024-05-23 16:29:16'),
(158, 'asdasdd', 'asdasdad', '213123ad', '2024-05-20', NULL, '2024-05-23 16:59:04', '2024-05-23 16:59:04'),
(165, 'asdasd', 'asdads', '123123sadasdas', '2024-05-08', NULL, '2024-05-23 17:03:57', '2024-05-23 17:03:57'),
(166, 'asd', 'asd', '12312312312 asdas', '2024-05-09', NULL, '2024-05-23 17:06:13', '2024-05-23 17:06:13');

--
-- Indexes for dumped tables
--

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
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vehicles_plate_number_unique` (`plate_number`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=167;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
