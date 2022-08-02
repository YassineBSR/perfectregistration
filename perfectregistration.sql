-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : mar. 02 août 2022 à 09:26
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
-- Structure de la table `annonce`
--

CREATE TABLE `annonce` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) DEFAULT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `update_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `image_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `annonce`
--

INSERT INTO `annonce` (`id`, `title`, `description`, `price`, `link`, `create_at`, `update_at`, `image_name`, `user_id`) VALUES
(3, 'Chaussures adidas Grand Court SE - blanc ( taille 36 et 36 2/3) Tige en cuir véritable.', 'UN REMIX STREET D\'UNE CHAUSSURE CLASSIQUE.Des vibes vintage. Nouvel esprit. Cette chaussure présente un design épuré et contemporain avec l\'ADN d\'un modèle tennis des 70\'s. Cette version affiche des empiècements en suède doux et une tige en cuir texturé.', 25, 'https://www.adidas.fr/chaussure-grand-court-se/FW6691.html?forceSelSize=FW6691_620&cm_mmc=AdieAffiliates_PHG-_-dealabs_fr--_--_-dv:eCom-_-cn:PO-_-pc:generic&pid=partnerize_int&is_retargeting=true&clickref=1101lw2JXmkH&cm_mmc1=FR&clickid=1101lw2JXmkH&af_re', '2022-07-28 14:06:03', '2022-07-28 14:06:03', '2388729-1-62e297cb52aea655485365.jpg', 14),
(4, 'Smartphone 6.8\" Samsung Galaxy S22 Ultra 5G - 128 Go (Via ODR 150€ + bonus reprise 100€)', 'Smartphone Samsung Galaxy S22 Ultra 128Go 5G\r\n\r\nLes points clés\r\nEcran : large 6,8\" soit 17 cm\r\nMémoire interne : 128 Go\r\nCapteurs photos : 4 (108 MP en capteur principal)\r\nMémoire RAM : 8 Go - Processeur : Exynos 2200\r\nLe + : S Pen intégré pour écrire vos plus belles histoires', 899, 'https://www.boulanger.com/ref/1175348?xtor=AL-6875-[2]-[1395037010]-[deeplink]&utm_medium=affiliation&utm_source=effinity&utm_campaign=2&utm_content=1395037010&eff_cpt=13467184&eff_sub1=1300727929', '2022-07-29 12:21:35', '2022-07-29 12:21:35', '2389068-1-62e3d0cff0298424263615.jpg', 14);

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
('DoctrineMigrations\\Version20220726073555', NULL, NULL),
('DoctrineMigrations\\Version20220726083615', '2022-07-26 08:37:53', 398),
('DoctrineMigrations\\Version20220726094948', '2022-07-26 09:50:00', 141),
('DoctrineMigrations\\Version20220726114917', '2022-07-26 11:49:24', 292);

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
(6, 'cD8qaI9FNIj_pbSZKk-482:APA91bHn2bgnUz5yTr4dxujyYDLaNR6T0Gh8NbluO725o6qzOs24ox4KLisS-nblrKa-D3Opn8Sbf-kfj8wwzXhQRp-uZlhlk-PR3F01qgIiLuneFPiQB-fiHQYfecVaCjp3kFPGzuZJ', '2022-07-15');

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
(14, 'Yassine60160@gmail.com', '[\"ROLE_ADMIN\"]', '$2y$13$9JQm79WoI0jiR2diV6TeGeuegE1UQG/dWMm53B8k.p9puJJ6Oh3XC', 'Admin', 'Yassine', '2001-01-11', '0123456786', 'Homme', NULL, 1, 1),
(15, 'user@gmail.com', '[]', '$2y$13$ZhhXkcvnxLEcGaRp4fF5Iu4.RUiZGjGWuCeXzmKdEK3N/FCtqOs.a', 'user', 'user', '2022-06-08', NULL, 'Homme', NULL, 0, 1),
(16, 'azerty@gmail.com', '[]', '$2y$13$/nj9WBDRKUHeHzxCUSsTwuE0IVevpcfTeSFGaKfkxZAR3ze0WecMe', 'Basrire', 'Yassine', '2022-06-01', '0768519194', 'Homme', NULL, 1, NULL),
(17, 'Yassine@gmail.com', '[]', '$2y$13$vxlpWmiZ7OnfnQT3vjiSG.kRKo2APMDIicisiJS40ChD7td9PsuVu', 'test', 'user', '2014-06-11', '2345678976', 'Homme', NULL, NULL, NULL),
(18, 'admin@gmail.com', '[\"ROLE_ADMIN\"]', '$2y$13$Id7WjFoutjEcPp9th5gNBusUBZAXf71Tt9y4c45p6viTi560Led4.', 'admin', 'admin', '2015-06-10', '0123456789', 'Homme', NULL, NULL, NULL);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `annonce`
--
ALTER TABLE `annonce`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_F65593E5A76ED395` (`user_id`);

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
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `annonce`
--
ALTER TABLE `annonce`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `annonce`
--
ALTER TABLE `annonce`
  ADD CONSTRAINT `FK_F65593E5A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
