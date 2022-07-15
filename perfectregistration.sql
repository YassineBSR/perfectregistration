-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : ven. 15 juil. 2022 à 08:13
-- Version du serveur : 10.5.8-MariaDB-log
-- Version de PHP : 8.1.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `perfectregistration`
--

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20220608135609', '2022-06-08 13:56:34', 138),
('DoctrineMigrations\\Version20220609080212', '2022-06-09 08:02:26', 117),
('DoctrineMigrations\\Version20220614144703', '2022-06-14 14:47:09', 102),
('DoctrineMigrations\\Version20220615094147', '2022-06-15 09:42:13', 148),
('DoctrineMigrations\\Version20220615145142', '2022-06-15 14:52:18', 127),
('DoctrineMigrations\\Version20220616150957', '2022-06-16 15:10:09', 133),
('DoctrineMigrations\\Version20220616153807', '2022-06-16 15:38:13', 105),
('DoctrineMigrations\\Version20220617084343', '2022-06-17 12:44:59', 185),
('DoctrineMigrations\\Version20220617084523', '2022-06-20 08:45:50', 217),
('DoctrineMigrations\\Version20220617123547', '2022-06-20 08:45:50', 57),
('DoctrineMigrations\\Version20220617124511', '2022-06-20 08:45:50', 11),
('DoctrineMigrations\\Version20220617124656', '2022-06-17 12:47:03', 167),
('DoctrineMigrations\\Version20220617142503', '2022-06-17 14:25:08', 170),
('DoctrineMigrations\\Version20220620084542', '2022-06-20 08:45:50', 52),
('DoctrineMigrations\\Version20220620084903', '2022-06-20 08:49:12', 230),
('DoctrineMigrations\\Version20220620145155', '2022-06-20 14:52:01', 184),
('DoctrineMigrations\\Version20220621135601', '2022-06-21 13:56:05', 153),
('DoctrineMigrations\\Version20220623113402', '2022-06-23 11:34:22', 217),
('DoctrineMigrations\\Version20220624082730', '2022-06-24 08:27:46', 131),
('DoctrineMigrations\\Version20220630135039', '2022-06-30 13:50:57', 166),
('DoctrineMigrations\\Version20220701084652', '2022-07-01 08:46:59', 186),
('DoctrineMigrations\\Version20220706075011', '2022-07-06 07:50:30', 281),
('DoctrineMigrations\\Version20220713120341', '2022-07-13 12:04:04', 1402);

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `tokens`
--

CREATE TABLE `tokens` (
  `id` int(11) NOT NULL,
  `token` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `tokens`
--

INSERT INTO `tokens` (`id`, `token`, `created_date`) VALUES
(5, 'e84hy_q3SEcyqGMX7yw92r:APA91bFII1R7Y1e7CAkHKVTOzXJX5o-2DUPDCBDVkttwhvZ6MBZlpZRNFABN4WhCKPZxu-IXV7UPjkmDPDd0VjSo0TMl27jzzRaxbzJWxuXcO21kYYzsHhU46E6PqEEa9Y6-Yr7OFE2g', '2022-07-11');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthdate` date DEFAULT NULL,
  `phone` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `genre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `github_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `newsletter` tinyint(1) DEFAULT NULL,
  `emailing` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `lastname`, `firstname`, `birthdate`, `phone`, `genre`, `github_id`, `newsletter`, `emailing`) VALUES
(14, 'Yassine60160@gmail.com', '[\"ROLE_ADMIN\"]', '$2y$13$9JQm79WoI0jiR2diV6TeGeuegE1UQG/dWMm53B8k.p9puJJ6Oh3XC', 'Admin', 'Yassine', '2001-01-11', '0768519194', 'Homme', NULL, 1, 1),
(15, 'user@gmail.com', '[]', '$2y$13$ZhhXkcvnxLEcGaRp4fF5Iu4.RUiZGjGWuCeXzmKdEK3N/FCtqOs.a', 'user', 'user', '2022-06-08', NULL, 'Homme', NULL, 0, 1),
(16, 'azerty@gmail.com', '[]', '$2y$13$/nj9WBDRKUHeHzxCUSsTwuE0IVevpcfTeSFGaKfkxZAR3ze0WecMe', 'Basrire', 'Yassine', '2022-06-01', '0768519194', 'Homme', NULL, 1, NULL),
(17, 'Yassine@gmail.com', '[]', '$2y$13$vxlpWmiZ7OnfnQT3vjiSG.kRKo2APMDIicisiJS40ChD7td9PsuVu', 'test', 'user', '2014-06-11', '2345678976', 'Homme', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `user_tokens`
--

CREATE TABLE `user_tokens` (
  `user_id` int(11) NOT NULL,
  `tokens_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Index pour la table `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- Index pour la table `user_tokens`
--
ALTER TABLE `user_tokens`
  ADD PRIMARY KEY (`user_id`,`tokens_id`),
  ADD KEY `IDX_CF080AB3A76ED395` (`user_id`),
  ADD KEY `IDX_CF080AB3558D68EA` (`tokens_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `user_tokens`
--
ALTER TABLE `user_tokens`
  ADD CONSTRAINT `FK_CF080AB3558D68EA` FOREIGN KEY (`tokens_id`) REFERENCES `tokens` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_CF080AB3A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
