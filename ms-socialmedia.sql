-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 19 sep. 2024 à 14:45
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `ms-socialmedia`
--

-- --------------------------------------------------------

--
-- Structure de la table `content`
--

CREATE TABLE `content` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `story` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `total_likes` int(11) NOT NULL DEFAULT 0,
  `total_reads` int(11) NOT NULL DEFAULT 0,
  `date_published` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `content`
--

INSERT INTO `content` (`id`, `title`, `story`, `user_id`, `total_likes`, `total_reads`, `date_published`) VALUES
(1, 'My life as a developper', 'My story in developpement start in 2019...', 1, 0, 0, '2024-09-19 11:24:05');

-- --------------------------------------------------------

--
-- Structure de la table `eventlike`
--

CREATE TABLE `eventlike` (
  `id` int(11) NOT NULL,
  `contentid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `likedflag` tinyint(1) NOT NULL DEFAULT 0,
  `latest_event_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `eventread`
--

CREATE TABLE `eventread` (
  `id` int(11) NOT NULL,
  `contentid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `readflag` tinyint(1) NOT NULL DEFAULT 0,
  `latest_event_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `firstname`, `lastname`, `phone`, `created_at`) VALUES
(1, 'testuser@example.com', 'UT123', 'Test', 'FirstUser', '0987654321', '2024-09-19 11:09:59');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `content`
--
ALTER TABLE `content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Index pour la table `eventlike`
--
ALTER TABLE `eventlike`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contentid` (`contentid`),
  ADD KEY `userid` (`userid`);

--
-- Index pour la table `eventread`
--
ALTER TABLE `eventread`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contentid` (`contentid`),
  ADD KEY `userid` (`userid`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_unique` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `content`
--
ALTER TABLE `content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `eventlike`
--
ALTER TABLE `eventlike`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `eventread`
--
ALTER TABLE `eventread`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `content`
--
ALTER TABLE `content`
  ADD CONSTRAINT `content_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `eventlike`
--
ALTER TABLE `eventlike`
  ADD CONSTRAINT `eventlike_ibfk_1` FOREIGN KEY (`contentid`) REFERENCES `content` (`id`),
  ADD CONSTRAINT `eventlike_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `eventread`
--
ALTER TABLE `eventread`
  ADD CONSTRAINT `eventread_ibfk_1` FOREIGN KEY (`contentid`) REFERENCES `content` (`id`),
  ADD CONSTRAINT `eventread_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
