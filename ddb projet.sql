-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : ven. 27 déc. 2024 à 00:20
-- Version du serveur : 8.0.35
-- Version de PHP : 8.2.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `ecom`
--

-- --------------------------------------------------------

--
-- Structure de la table `brand`
--

CREATE TABLE `brand` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL COMMENT 'Le nom de la marque',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'La date de création de la marque',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'La date de la dernière mise à jour de la marque'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `brand`
--

INSERT INTO `brand` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Penguin Books', '2018-10-17 07:00:00', NULL),
(2, 'HarperCollins', '2018-10-17 07:00:00', NULL),
(3, 'Random House', '2018-10-17 07:00:00', NULL),
(4, 'Macmillan', '2018-10-17 07:00:00', NULL),
(5, 'Scholastic', '2018-10-17 07:00:00', NULL),
(6, 'Hachette', '2018-10-17 07:00:00', NULL),
(7, 'Simon & Schuster', '2018-10-17 07:00:00', NULL),
(8, 'Little, Brown and Company', '2018-10-17 07:00:00', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(64) NOT NULL COMMENT 'Le nom de la catégorie',
  `subtitle` varchar(64) DEFAULT NULL,
  `picture` varchar(128) DEFAULT NULL COMMENT 'L''URL de l''image de la catégorie (utilisée en home, par exemple)',
  `home_order` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'L''ordre d''affichage de la catégorie sur la home (0=pas affichée en home)',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'La date de création de la catégorie',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'La date de la dernière mise à jour de la catégorie'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `name`, `subtitle`, `picture`, `home_order`, `created_at`, `updated_at`) VALUES
(1, 'Fiction', 'Roman et récits imaginaires', 'assets/images/categ1.jpeg', 4, '2018-10-17 06:00:00', NULL),
(2, 'Non-fiction', 'Biographies, histoire et plus', 'assets/images/categ2.jpeg', 2, '2018-10-17 06:00:00', NULL),
(3, 'Science-fiction', 'Futur et technologie', 'assets/images/categ3.jpeg', 5, '2018-10-17 06:00:00', NULL),
(4, 'Fantasy', 'Magie et aventures', 'assets/images/categ4.jpeg', 3, '2018-10-17 06:00:00', NULL),
(5, 'Classiques', 'Oeuvres incontournables', 'assets/images/categ5.jpeg', 1, '2018-10-17 06:00:00', NULL),
(6, 'Jeunesse', NULL, NULL, 0, '2018-10-17 06:00:00', NULL),
(7, 'Romance', NULL, NULL, 0, '2018-10-17 06:00:00', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

CREATE TABLE `product` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(45) NOT NULL COMMENT 'Le titre du livre',
  `description` text COMMENT 'La description du livre',
  `picture` varchar(128) DEFAULT NULL COMMENT 'L''URL de l''image de couverture du livre',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'Le prix du livre',
  `rate` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'L''avis sur le livre, de 1 à 5',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Le statut du livre (0=non renseignée, 1=dispo, 2=pas dispo)',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'La date de création du livre',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'La date de la dernière mise à jour du livre',
  `brand_id` int UNSIGNED NOT NULL,
  `category_id` int UNSIGNED DEFAULT NULL,
  `type_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`id`, `name`, `description`, `picture`, `price`, `rate`, `status`, `created_at`, `updated_at`, `brand_id`, `category_id`, `type_id`) VALUES
(1, 'Le Seigneur des Anneaux', 'Un livre de fantasy épique écrit par J.R.R. Tolkien', NULL, 19.99, 0, 0, '2024-12-26 11:00:00', NULL, 1, NULL, 5),
(2, 'Harry Potter à l\'école des sorciers', 'Un roman fantastique écrit par J.K. Rowling sur un jeune sorcier', NULL, 15.99, 0, 0, '2024-12-26 11:00:00', NULL, 2, NULL, 5),
(3, '1984', 'Un roman dystopique de George Orwell sur un régime totalitaire', NULL, 12.99, 0, 0, '2024-12-26 11:00:00', NULL, 3, NULL, 5),
(4, 'Les Misérables', 'Un classique de la littérature française écrit par Victor Hugo', NULL, 22.50, 0, 0, '2024-12-26 11:00:00', NULL, 1, NULL, 5),
(5, 'Le Hobbit', 'Un roman de fantasy de J.R.R. Tolkien sur un voyage épique', NULL, 18.50, 0, 0, '2024-12-26 11:00:00', NULL, 2, NULL, 5);

-- --------------------------------------------------------

--
-- Structure de la table `type`
--

CREATE TABLE `type` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(64) NOT NULL COMMENT 'Le type de livre',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'La date de création du type',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'La date de la dernière mise à jour du type'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `type`
--

INSERT INTO `type` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Roman', '2018-10-17 08:00:00', NULL),
(2, 'Biographie', '2018-10-17 08:00:00', NULL),
(3, 'Histoire', '2018-10-17 08:00:00', NULL),
(4, 'Science-fiction', '2018-10-17 08:00:00', NULL),
(5, 'Fantasy', '2018-10-17 08:00:00', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `name` varchar(64) NOT NULL COMMENT 'Le nom du client',
  `email` varchar(64) NOT NULL COMMENT 'email',
  `password` varchar(255) NOT NULL COMMENT 'MDP'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_product_brand_idx` (`brand_id`),
  ADD KEY `fk_product_category1_idx` (`category_id`),
  ADD KEY `fk_product_type1_idx` (`type_id`);

--
-- Index pour la table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`name`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `brand`
--
ALTER TABLE `brand`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `product`
--
ALTER TABLE `product`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `type`
--
ALTER TABLE `type`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
