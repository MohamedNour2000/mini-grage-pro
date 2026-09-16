-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 06, 2026 at 06:50 PM
-- Server version: 8.0.43
-- PHP Version: 8.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `garage_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` smallint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_09_06_145533_create_vehicules_table', 1),
(5, '2026_09_06_145534_create_reparations_table', 1),
(6, '2026_09_06_145535_create_techniciens_table', 1),
(7, '2026_09_06_145536_create_reparation_technicien_table', 1),
(8, '2026_09_06_174838_create_personal_access_tokens_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reparations`
--

CREATE TABLE `reparations` (
  `id` bigint UNSIGNED NOT NULL,
  `vehicule_id` bigint UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `duree_main_oeuvre` decimal(5,2) NOT NULL,
  `objet_reparation` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reparations`
--

INSERT INTO `reparations` (`id`, `vehicule_id`, `date`, `duree_main_oeuvre`, `objet_reparation`, `created_at`, `updated_at`) VALUES
(3, 2, '1973-12-20', 7.10, 'Réparation de la climatisation', '2026-09-06 17:16:29', '2026-09-06 17:16:29'),
(4, 2, '1974-08-17', 6.44, 'Changement des bougies', '2026-09-06 17:16:29', '2026-09-06 17:16:29'),
(5, 3, '2006-06-04', 1.27, 'Remplacement de la batterie', '2026-09-06 17:16:29', '2026-09-06 17:16:29'),
(6, 3, '1979-03-08', 2.90, 'Révision générale', '2026-09-06 17:16:29', '2026-09-06 17:16:29'),
(7, 4, '1985-07-19', 8.76, 'Révision générale', '2026-09-06 17:16:29', '2026-09-06 17:16:29'),
(8, 4, '1996-04-20', 9.07, 'Changement des bougies', '2026-09-06 17:16:29', '2026-09-06 17:16:29'),
(9, 5, '2024-11-09', 5.40, 'Diagnostic électronique', '2026-09-06 17:16:29', '2026-09-06 17:16:29'),
(10, 5, '1991-05-03', 7.46, 'Changement des bougies', '2026-09-06 17:16:29', '2026-09-06 17:16:29'),
(11, 6, '1987-05-03', 9.24, 'Remplacement de la batterie', '2026-09-06 17:16:29', '2026-09-06 17:16:29'),
(12, 6, '1992-09-22', 9.56, 'Réparation de la climatisation', '2026-09-06 17:16:29', '2026-09-06 17:16:29'),
(13, 7, '1995-03-24', 6.24, 'Révision générale', '2026-09-06 17:16:29', '2026-09-06 17:16:29'),
(14, 7, '1971-11-16', 5.23, 'Changement des pneus', '2026-09-06 17:16:29', '2026-09-06 17:16:29'),
(15, 8, '2011-09-26', 6.27, 'Diagnostic électronique', '2026-09-06 17:16:29', '2026-09-06 17:16:29'),
(16, 8, '1985-04-10', 1.21, 'Remplacement de l\'embrayage', '2026-09-06 17:16:29', '2026-09-06 17:16:29'),
(17, 9, '1971-01-18', 9.44, 'Remplacement du filtre à air', '2026-09-06 17:16:29', '2026-09-06 17:16:29'),
(18, 9, '2005-01-16', 2.82, 'Remplacement des plaquettes de frein', '2026-09-06 17:16:29', '2026-09-06 17:16:29'),
(19, 10, '2007-11-16', 6.21, 'Changement des pneus', '2026-09-06 17:16:29', '2026-09-06 17:16:29'),
(20, 10, '1989-03-05', 8.02, 'Changement des pneus', '2026-09-06 17:16:29', '2026-09-06 17:16:29'),
(21, 11, '2003-10-06', 9.12, 'Changement des pneus', '2026-09-06 17:21:23', '2026-09-06 17:21:23'),
(22, 11, '1990-12-25', 8.33, 'Remplacement du filtre à air', '2026-09-06 17:21:23', '2026-09-06 17:21:23'),
(23, 12, '2018-07-12', 8.83, 'Changement des pneus', '2026-09-06 17:21:23', '2026-09-06 17:21:23'),
(24, 12, '2022-10-02', 6.51, 'Remplacement du filtre à air', '2026-09-06 17:21:23', '2026-09-06 17:21:23'),
(25, 13, '2015-01-29', 4.22, 'Diagnostic électronique', '2026-09-06 17:21:23', '2026-09-06 17:21:23'),
(26, 13, '1998-04-03', 1.36, 'Vidange moteur', '2026-09-06 17:21:23', '2026-09-06 17:21:23'),
(27, 14, '1989-09-09', 8.15, 'Remplacement des plaquettes de frein', '2026-09-06 17:21:23', '2026-09-06 17:21:23'),
(28, 14, '1970-04-04', 6.66, 'Diagnostic électronique', '2026-09-06 17:21:23', '2026-09-06 17:21:23'),
(29, 15, '2014-07-28', 6.26, 'Réparation de la boîte de vitesses', '2026-09-06 17:21:23', '2026-09-06 17:21:23'),
(30, 15, '2014-04-30', 8.12, 'Remplacement de la batterie', '2026-09-06 17:21:23', '2026-09-06 17:21:23'),
(31, 16, '2013-06-13', 3.05, 'Réparation de la climatisation', '2026-09-06 17:21:23', '2026-09-06 17:21:23'),
(32, 16, '1980-10-14', 2.21, 'Remplacement du pare-brise', '2026-09-06 17:21:23', '2026-09-06 17:21:23'),
(33, 17, '1977-05-13', 7.60, 'Révision générale', '2026-09-06 17:21:23', '2026-09-06 17:21:23'),
(34, 17, '1980-07-30', 8.54, 'Vidange moteur', '2026-09-06 17:21:23', '2026-09-06 17:21:23'),
(35, 18, '1994-08-18', 4.26, 'Diagnostic électronique', '2026-09-06 17:21:23', '2026-09-06 17:21:23'),
(36, 18, '1978-06-30', 6.59, 'Remplacement des plaquettes de frein', '2026-09-06 17:21:23', '2026-09-06 17:21:23'),
(37, 19, '2001-10-17', 7.26, 'Remplacement du pare-brise', '2026-09-06 17:21:23', '2026-09-06 17:21:23'),
(38, 19, '2013-08-03', 9.16, 'Changement des bougies', '2026-09-06 17:21:23', '2026-09-06 17:21:23'),
(39, 20, '2014-03-15', 6.14, 'Révision générale', '2026-09-06 17:21:23', '2026-09-06 17:21:23'),
(40, 20, '2018-05-27', 8.18, 'Remplacement des plaquettes de frein', '2026-09-06 17:21:23', '2026-09-06 17:21:23');

-- --------------------------------------------------------

--
-- Table structure for table `reparation_technicien`
--

CREATE TABLE `reparation_technicien` (
  `reparation_id` bigint UNSIGNED NOT NULL,
  `technicien_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reparation_technicien`
--

INSERT INTO `reparation_technicien` (`reparation_id`, `technicien_id`) VALUES
(5, 1),
(7, 1),
(17, 1),
(19, 1),
(20, 1),
(4, 2),
(6, 2),
(8, 2),
(12, 2),
(3, 3),
(9, 3),
(10, 3),
(11, 3),
(13, 3),
(14, 3),
(18, 3),
(9, 4),
(10, 4),
(11, 4),
(14, 4),
(16, 4),
(18, 4),
(3, 5),
(5, 5),
(8, 5),
(12, 5),
(13, 5),
(15, 5),
(20, 5),
(21, 6),
(23, 6),
(26, 6),
(28, 6),
(34, 6),
(36, 6),
(37, 6),
(38, 6),
(39, 6),
(21, 7),
(24, 7),
(25, 7),
(28, 7),
(29, 7),
(30, 7),
(37, 7),
(39, 7),
(22, 8),
(23, 8),
(27, 8),
(35, 8),
(36, 8),
(40, 8),
(24, 9),
(31, 9),
(33, 9),
(34, 9),
(35, 9),
(25, 10),
(26, 10),
(27, 10),
(29, 10),
(32, 10),
(38, 10);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('0aRWg2JczbKH7ixDvNVcNenLVOt7GkbP6e9f58FV', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', 'eyJfdG9rZW4iOiJPcnZidjhiTFdIVUN6cjFxVnBzQmhUVHgzcWJwcHplUTNUbzhhUnFBIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwXC92ZWhpY3VsZXNcLzIiLCJyb3V0ZSI6InZlaGljdWxlcy5zaG93In0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=', 1788720033),
('6i8r3ds7cpVP96U5k1fbGLhQY8WJ8qafUX2q6QoX', NULL, '127.0.0.1', 'Thunder Client (https://www.thunderclient.com)', 'eyJfdG9rZW4iOiJhbFhsdG95TERpbGdCblRXNjgxbFpvdWd1VjF6SEU4S2o2TTJOd29tIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwXC92ZWhpY3VsZXMiLCJyb3V0ZSI6InZlaGljdWxlcy5pbmRleCJ9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19', 1788717123),
('CSMnuHTfrMOww53LbK6GbqBXgrWS6Yl0UqMZOuhq', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.136.1 Chrome/148.0.7778.280 Electron/42.10.0 Safari/537.36', 'eyJfdG9rZW4iOiJXdWdacUxmS0U1NWlEOHJFRzZvYmZTMGowakk0cVNDek1ETzN6a1owIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwXC92ZWhpY3VsZXMiLCJyb3V0ZSI6InZlaGljdWxlcy5pbmRleCJ9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19', 1788719488);

-- --------------------------------------------------------

--
-- Table structure for table `techniciens`
--

CREATE TABLE `techniciens` (
  `id` bigint UNSIGNED NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `specialite` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `techniciens`
--

INSERT INTO `techniciens` (`id`, `nom`, `prenom`, `specialite`, `created_at`, `updated_at`) VALUES
(1, 'Diallo', 'Ousmane', 'Diagnostic Électrique', '2026-09-06 17:16:28', '2026-09-06 17:59:03'),
(2, 'Konopelski', 'Julius', 'Freinage', '2026-09-06 17:16:28', '2026-09-06 17:16:28'),
(3, 'Heaney', 'Camilla', 'Moteur', '2026-09-06 17:16:29', '2026-09-06 17:16:29'),
(4, 'Miller', 'Nikko', 'Freinage', '2026-09-06 17:16:29', '2026-09-06 17:16:29'),
(5, 'Von', 'Hannah', 'Moteur', '2026-09-06 17:16:29', '2026-09-06 17:16:29'),
(6, 'Schuster', 'Green', 'Freinage', '2026-09-06 17:21:23', '2026-09-06 17:21:23'),
(7, 'Lebsack', 'Maximo', 'Diagnostic', '2026-09-06 17:21:23', '2026-09-06 17:21:23'),
(8, 'Reichert', 'Korbin', 'Diagnostic', '2026-09-06 17:21:23', '2026-09-06 17:21:23'),
(9, 'Bode', 'Willy', 'Freinage', '2026-09-06 17:21:23', '2026-09-06 17:21:23'),
(10, 'Buckridge', 'Sylvan', 'Moteur', '2026-09-06 17:21:23', '2026-09-06 17:21:23');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vehicules`
--

CREATE TABLE `vehicules` (
  `id` bigint UNSIGNED NOT NULL,
  `immatriculation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `marque` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modele` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `couleur` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `annee` int NOT NULL,
  `kilometrage` int NOT NULL,
  `carrosserie` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `energie` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `boite` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vehicules`
--

INSERT INTO `vehicules` (`id`, `immatriculation`, `marque`, `modele`, `couleur`, `annee`, `kilometrage`, `carrosserie`, `energie`, `boite`, `created_at`, `updated_at`) VALUES
(2, 'US-463-NZ', 'Peugeot', 'provident', 'olive', 2022, 93531, 'SUV', 'Diesel', 'Manuelle', '2026-09-06 17:16:29', '2026-09-06 17:16:29'),
(3, 'BU-421-CE', 'Toyota', 'sunt', 'blue', 2014, 181045, 'Pickup', 'Hybride', 'Manuelle', '2026-09-06 17:16:29', '2026-09-06 17:16:29'),
(4, 'ZD-573-GI', 'Mercedes', 'at', 'white', 2022, 40262, 'SUV', 'Diesel', 'Automatique', '2026-09-06 17:16:29', '2026-09-06 17:16:29'),
(5, 'IO-709-MQ', 'Toyota', 'natus', 'fuchsia', 2017, 75442, 'SUV', 'Hybride', 'Manuelle', '2026-09-06 17:16:29', '2026-09-06 17:16:29'),
(6, 'FJ-679-JN', 'Renault', 'nisi', 'olive', 2015, 91892, 'Berline', 'Essence', 'Automatique', '2026-09-06 17:16:29', '2026-09-06 17:16:29'),
(7, 'EY-815-UV', 'Peugeot', 'explicabo', 'maroon', 2019, 87341, 'Berline', 'Diesel', 'Automatique', '2026-09-06 17:16:29', '2026-09-06 17:16:29'),
(8, 'FP-734-PS', 'Peugeot', 'tenetur', 'olive', 2019, 37383, 'Pickup', 'Essence', 'Automatique', '2026-09-06 17:16:29', '2026-09-06 17:16:29'),
(9, 'VQ-019-LT', 'Peugeot', 'unde', 'gray', 2018, 54434, 'SUV', 'Essence', 'Manuelle', '2026-09-06 17:16:29', '2026-09-06 17:16:29'),
(10, 'FT-937-OA', 'Mercedes', 'libero', 'white', 2017, 167313, 'Pickup', 'Essence', 'Manuelle', '2026-09-06 17:16:29', '2026-09-06 17:16:29'),
(11, 'VL-058-FL', 'Mercedes', 'enim', 'gray', 2022, 87791, 'SUV', 'Hybride', 'Manuelle', '2026-09-06 17:21:23', '2026-09-06 17:21:23'),
(12, 'NV-528-TB', 'Toyota', 'aliquid', 'gray', 2012, 54328, 'SUV', 'Diesel', 'Automatique', '2026-09-06 17:21:23', '2026-09-06 17:21:23'),
(13, 'ZO-354-SL', 'Mercedes', 'quos', 'yellow', 2023, 190614, 'SUV', 'Essence', 'Automatique', '2026-09-06 17:21:23', '2026-09-06 17:21:23'),
(14, 'RQ-636-LP', 'Peugeot', 'facere', 'aqua', 2023, 78874, 'SUV', 'Hybride', 'Manuelle', '2026-09-06 17:21:23', '2026-09-06 17:21:23'),
(15, 'KC-567-NE', 'Renault', 'qui', 'gray', 2015, 56918, 'Berline', 'Diesel', 'Manuelle', '2026-09-06 17:21:23', '2026-09-06 17:21:23'),
(16, 'GU-763-MS', 'Renault', 'quia', 'gray', 2020, 127194, 'Berline', 'Diesel', 'Manuelle', '2026-09-06 17:21:23', '2026-09-06 17:21:23'),
(17, 'SY-874-GA', 'Toyota', 'voluptas', 'green', 2023, 193149, 'Berline', 'Diesel', 'Manuelle', '2026-09-06 17:21:23', '2026-09-06 17:21:23'),
(18, 'NC-030-FY', 'Mercedes', 'illo', 'teal', 2012, 12955, 'SUV', 'Essence', 'Automatique', '2026-09-06 17:21:23', '2026-09-06 17:21:23'),
(19, 'DY-116-AF', 'Mercedes', 'error', 'maroon', 2010, 109427, 'Berline', 'Hybride', 'Manuelle', '2026-09-06 17:21:23', '2026-09-06 17:21:23'),
(20, 'CM-075-NL', 'Toyota', 'eius', 'silver', 2018, 160763, 'Berline', 'Hybride', 'Automatique', '2026-09-06 17:21:23', '2026-09-06 17:21:23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`),
  ADD KEY `failed_jobs_connection_queue_failed_at_index` (`connection`,`queue`,`failed_at`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

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
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indexes for table `reparations`
--
ALTER TABLE `reparations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reparations_vehicule_id_foreign` (`vehicule_id`);

--
-- Indexes for table `reparation_technicien`
--
ALTER TABLE `reparation_technicien`
  ADD PRIMARY KEY (`reparation_id`,`technicien_id`),
  ADD KEY `reparation_technicien_technicien_id_foreign` (`technicien_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `techniciens`
--
ALTER TABLE `techniciens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `vehicules`
--
ALTER TABLE `vehicules`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vehicules_immatriculation_unique` (`immatriculation`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reparations`
--
ALTER TABLE `reparations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `techniciens`
--
ALTER TABLE `techniciens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vehicules`
--
ALTER TABLE `vehicules`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `reparations`
--
ALTER TABLE `reparations`
  ADD CONSTRAINT `reparations_vehicule_id_foreign` FOREIGN KEY (`vehicule_id`) REFERENCES `vehicules` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reparation_technicien`
--
ALTER TABLE `reparation_technicien`
  ADD CONSTRAINT `reparation_technicien_reparation_id_foreign` FOREIGN KEY (`reparation_id`) REFERENCES `reparations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reparation_technicien_technicien_id_foreign` FOREIGN KEY (`technicien_id`) REFERENCES `techniciens` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
