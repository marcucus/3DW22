-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : Dim 13 fév. 2022 à 20:59
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `3dw22`
--

-- --------------------------------------------------------

--
-- Structure de la table `book`
--

DROP TABLE IF EXISTS `book`;
CREATE TABLE IF NOT EXISTS `book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `publish_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `updated_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `author` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nb_page` int(11) NOT NULL,
  `nb_exemplaire` int(11) NOT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_CBE5A331A76ED395` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `book`
--

INSERT INTO `book` (`id`, `title`, `description`, `publish_at`, `created_at`, `updated_at`, `author`, `nb_page`, `nb_exemplaire`, `is_active`, `user_id`, `image`) VALUES
(1, 'Harry Grogneur', '<div>A l\'école des sorciers</div>', '2022-02-01 00:00:00', '2022-02-07 18:20:06', '2022-02-07 18:20:06', 'Moi', 498, 20000000, 1, 1, ''),
(2, 'La Bible', NULL, '0000-12-30 00:00:00', '2022-02-10 19:19:24', '2022-02-10 19:19:24', 'Dieu', 100, 999999999, 1, 1, ''),
(3, 'Le Petit Livre Rouge', NULL, '1964-02-02 00:00:00', '2022-02-10 21:19:48', '2022-02-10 21:19:48', NULL, 500, 20000, 1, 6, ''),
(4, 'Don Quichotte', NULL, '2022-02-01 00:00:00', '2022-02-11 01:50:37', '2022-02-11 01:50:37', NULL, 100, 100000, 1, 6, ''),
(5, 'Un compte de deux villes', NULL, '1854-02-03 00:00:00', '2022-02-11 01:51:12', '2022-02-11 01:51:12', NULL, 100, 2000000, 1, 6, ''),
(6, 'Le Seigneur des anneaux', NULL, '1974-05-20 00:00:00', '2022-02-11 01:51:44', '2022-02-11 01:51:44', 'J.R.R TOLKIEN', 1000, 700000000, 1, 6, ''),
(7, 'Bilbo le Hobbit', NULL, '1969-06-10 00:00:00', '2022-02-11 01:52:29', '2022-02-11 01:52:29', 'J.R.R TOLKIEN', 1000, 500000000, 1, 6, ''),
(8, 'Le Petit Prince', NULL, '2022-02-02 00:00:00', '2022-02-11 01:52:44', '2022-02-11 01:52:44', NULL, 2, 1, 1, 6, ''),
(9, 'Harry Potter à l\'école des sorciers', NULL, '1997-06-04 00:00:00', '2022-02-11 01:53:30', '2022-02-11 01:53:30', 'J.K ROWLING', 1000, 120000000, 1, 6, ''),
(10, 'Okay letsgo les hamis', NULL, '2022-02-04 00:00:00', '2022-02-11 01:53:50', '2022-02-11 01:53:50', NULL, 100, 999999999, 1, 6, '');

-- --------------------------------------------------------

--
-- Structure de la table `book_category`
--

DROP TABLE IF EXISTS `book_category`;
CREATE TABLE IF NOT EXISTS `book_category` (
  `book_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`book_id`,`category_id`),
  KEY `IDX_1FB30F9816A2B381` (`book_id`),
  KEY `IDX_1FB30F9812469DE2` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `book_category`
--

INSERT INTO `book_category` (`book_id`, `category_id`) VALUES
(1, 2),
(2, 3),
(3, 3);

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `name`, `description`) VALUES
(1, 'Roman Policiers', NULL),
(2, 'Aventure', NULL),
(3, 'Culture & Société', NULL),
(4, 'Thriller', NULL),
(5, 'Poétiques', NULL),
(6, 'Narratifs', NULL),
(7, 'Théâtraux', NULL),
(8, 'Épistolaires', NULL),
(9, 'Argumentatifs', NULL),
(10, 'Descriptifs', NULL),
(11, 'Graphiques', NULL),
(12, 'Formes brèves', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20220128015857', '2022-01-28 02:00:13', 49),
('DoctrineMigrations\\Version20220128020438', '2022-01-28 02:05:06', 66),
('DoctrineMigrations\\Version20220128023839', '2022-01-28 02:38:57', 49),
('DoctrineMigrations\\Version20220207143152', '2022-02-07 14:32:04', 49),
('DoctrineMigrations\\Version20220207150243', '2022-02-07 15:02:58', 125),
('DoctrineMigrations\\Version20220207164241', '2022-02-07 16:42:49', 163),
('DoctrineMigrations\\Version20220210183625', '2022-02-10 18:36:31', 151),
('DoctrineMigrations\\Version20220210203810', '2022-02-10 20:38:13', 105),
('DoctrineMigrations\\Version20220210204343', '2022-02-10 20:43:45', 96),
('DoctrineMigrations\\Version20220210205333', '2022-02-10 21:53:10', 101),
('DoctrineMigrations\\Version20220210215440', '2022-02-10 21:54:43', 19),
('DoctrineMigrations\\Version20220210220033', '2022-02-10 22:00:40', 22),
('DoctrineMigrations\\Version20220211010243', '2022-02-11 01:02:53', 111),
('DoctrineMigrations\\Version20220211010645', '2022-02-11 01:06:48', 20),
('DoctrineMigrations\\Version20220211010809', '2022-02-11 01:08:11', 21),
('DoctrineMigrations\\Version20220211010942', '2022-02-11 01:09:44', 20),
('DoctrineMigrations\\Version20220211012710', '2022-02-11 01:27:12', 18),
('DoctrineMigrations\\Version20220211012924', '2022-02-11 01:29:26', 105);

-- --------------------------------------------------------

--
-- Structure de la table `emprunt`
--

DROP TABLE IF EXISTS `emprunt`;
CREATE TABLE IF NOT EXISTS `emprunt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_364071D716A2B381` (`book_id`),
  KEY `IDX_364071D7A76ED395` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `first_name`, `last_name`, `telephone`) VALUES
(1, 'test@test.js', '[]', '$2y$13$5qUtWLsKb1cP8/O1yqRyVO.aM0V/9QtjBd7QxJ8svuUXFKRY/zmj.', 'Adrien', 'Marques', '0000000000'),
(2, 'test@tst.ts', '[]', '$2y$13$dd9Xusnq5SrA/mNiia6OnO840JHVCi4yuje5X5U4fjJIPe6ikbq9u', 'test', 'test', '0652415788'),
(3, 'stttt@tsss.stt', '[]', '$2y$13$vMC6dSGUN1MThi6AGn0srOfFCrlRgqwdM1H29C.rbT2J8ovJDG1/u', 'test', 'tset', '0652415788'),
(4, 'sttsstt@tsss.stt', '[]', '$2y$13$XNasJOlca4nJ651udjtoXO7eIHRP8Yw/teUZ9fG6pFn.FN9MaXCga', 'test', 'tset', '0652415788'),
(5, 'sttssssstt@tsss.stt', '[]', '$2y$13$MqJjEtEdcIlD4a3GXqtI7ewG7eUpH4EsEo1NZKLpuTYG4Zr89HQLW', 'test', 'tset', '0652415788'),
(6, 'marqueslaw19@gmail.com', '[\"ROLE_ADMIN\"]', '$2y$13$un105/fRzkGzR.81P0ftUO8jl3YE74tCfgl6n3M9xE8Qs/ck.uGD.', 'Adrien', 'Marques', '0652415788'),
(7, 'tset@test.fr', '[]', '$2y$13$/D9EWIPxwaM/2./Rj8Dg5eZo.xGKjRIqb3cRQsRgJDswDciTltgUK', 'test', 'test', '0655555555');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `FK_CBE5A331A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `book_category`
--
ALTER TABLE `book_category`
  ADD CONSTRAINT `FK_1FB30F9812469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1FB30F9816A2B381` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `emprunt`
--
ALTER TABLE `emprunt`
  ADD CONSTRAINT `FK_364071D716A2B381` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`),
  ADD CONSTRAINT `FK_364071D7A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
