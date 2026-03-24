-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 24 mars 2026 à 18:15
-- Version du serveur : 10.4.24-MariaDB
-- Version de PHP : 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `sportuni`
--

-- --------------------------------------------------------

--
-- Structure de la table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `email` varchar(180) NOT NULL,
  `mot_de_passe` varchar(255) NOT NULL,
  `siege_id` int(11) DEFAULT NULL,
  `super_admin` tinyint(1) DEFAULT 0,
  `actif` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `admins`
--

INSERT INTO `admins` (`id`, `nom`, `email`, `mot_de_passe`, `siege_id`, `super_admin`, `actif`, `created_at`) VALUES
(1, 'Super Admin', 'admin@courssonou.bj', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 1, 1, '2026-03-24 08:10:54');

-- --------------------------------------------------------

--
-- Structure de la table `articles`
--

CREATE TABLE `articles` (
  `id` int(11) NOT NULL,
  `titre` varchar(250) NOT NULL,
  `slug` varchar(250) DEFAULT NULL,
  `extrait` text DEFAULT NULL,
  `contenu` text DEFAULT NULL,
  `categorie` enum('tournoi','resultat','sante','evenement','annonce') DEFAULT 'annonce',
  `siege_id` int(11) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `publie` tinyint(1) DEFAULT 1,
  `vues` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `articles`
--

INSERT INTO `articles` (`id`, `titre`, `slug`, `extrait`, `contenu`, `categorie`, `siege_id`, `admin_id`, `image`, `publie`, `vues`, `created_at`, `updated_at`) VALUES
(1, 'Tournoi inter-sieges de football 2025', 'tournoi-football-2025', 'Les 8 sieges s affrontent pour le trophe annuel.', NULL, 'tournoi', NULL, NULL, NULL, 1, 0, '2026-03-24 08:10:55', '2026-03-24 08:10:55'),
(2, 'Basketball Cotonou champion 2025', 'basketball-cotonou-2025', 'Cotonou remporte le championnat apres une finale serree.', NULL, 'resultat', NULL, NULL, NULL, 1, 0, '2026-03-24 08:10:55', '2026-03-24 08:10:55'),
(3, 'Visite medicale obligatoire 2025', 'visite-medicale-2025', 'Tous les etudiants doivent passer la visite avant les competitions.', NULL, 'sante', NULL, NULL, NULL, 1, 0, '2026-03-24 08:10:55', '2026-03-24 08:10:55'),
(4, 'Cross universitaire Parakou 2025', 'cross-parakou-2025', 'Plus de 400 participants attendus a Parakou.', NULL, 'evenement', NULL, NULL, NULL, 1, 0, '2026-03-24 08:10:55', '2026-03-24 08:10:55'),
(5, 'Volleyball feminin inscriptions ouvertes', 'volleyball-feminin-2025', 'Le championnat feminin debute en avril.', NULL, 'tournoi', NULL, NULL, NULL, 1, 0, '2026-03-24 08:10:55', '2026-03-24 08:10:55'),
(6, 'Judo podium Abomey-Calavi', 'judo-abomey-2025', 'Trois medailles au championnat national universitaire.', NULL, 'resultat', NULL, NULL, NULL, 1, 0, '2026-03-24 08:10:55', '2026-03-24 08:10:55'),
(7, 'iheeoezhzozueu', 'iheeoezhzozueu', 'hhvvjegejegkejvqrgiuioùlqjgouerhgrug', 'houzhohigozeeourzhgourozuogrouguegdqknmsqkvrioogujzizMKGGOIOUGHZHOIUZHGRHOHRRGDLKVVlkùjr', 'tournoi', NULL, 1, NULL, 1, 0, '2026-03-24 12:17:51', '2026-03-24 12:17:51');

-- --------------------------------------------------------

--
-- Structure de la table `disciplines`
--

CREATE TABLE `disciplines` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `actif` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `disciplines`
--

INSERT INTO `disciplines` (`id`, `nom`, `slug`, `actif`) VALUES
(1, 'Football', 'football', 1),
(2, 'Basketball', 'basketball', 1),
(3, 'Volleyball', 'volleyball', 1),
(4, 'Athletisme', 'athletisme', 1),
(5, 'Natation', 'natation', 1),
(6, 'Tennis de table', 'tennis-de-table', 1),
(7, 'Handball', 'handball', 1),
(8, 'Judo Arts martiaux', 'judo', 1);

-- --------------------------------------------------------

--
-- Structure de la table `encadreurs`
--

CREATE TABLE `encadreurs` (
  `id` int(11) NOT NULL,
  `utilisateur_id` int(11) NOT NULL,
  `departement` varchar(150) DEFAULT NULL,
  `statut_pro` varchar(50) DEFAULT NULL,
  `matricule` varchar(80) DEFAULT NULL,
  `diplome` varchar(100) DEFAULT NULL,
  `annees_experience` varchar(50) DEFAULT NULL,
  `experiences` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `encadreur_disciplines`
--

CREATE TABLE `encadreur_disciplines` (
  `id` int(11) NOT NULL,
  `encadreur_id` int(11) NOT NULL,
  `discipline_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `equipes`
--

CREATE TABLE `equipes` (
  `id` int(11) NOT NULL,
  `nom` varchar(150) NOT NULL,
  `siege_id` int(11) DEFAULT NULL,
  `discipline_id` int(11) DEFAULT NULL,
  `tournoi_id` int(11) DEFAULT NULL,
  `encadreur_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `etudiants`
--

CREATE TABLE `etudiants` (
  `id` int(11) NOT NULL,
  `utilisateur_id` int(11) NOT NULL,
  `faculte` varchar(150) DEFAULT NULL,
  `niveau_etude` varchar(50) DEFAULT NULL,
  `matricule` varchar(80) DEFAULT NULL,
  `annee_academique` varchar(20) DEFAULT '2024-2025',
  `role_souhaite` varchar(50) DEFAULT NULL,
  `palmares` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `etudiants`
--

INSERT INTO `etudiants` (`id`, `utilisateur_id`, `faculte`, `niveau_etude`, `matricule`, `annee_academique`, `role_souhaite`, `palmares`) VALUES
(1, 1, 'ssri', 'Licence 1', '72614616877867', '2024 – 2025', 'Joueur / Athlète', 'dgfhgjhkrdftuygiuho');

-- --------------------------------------------------------

--
-- Structure de la table `etudiant_disciplines`
--

CREATE TABLE `etudiant_disciplines` (
  `id` int(11) NOT NULL,
  `etudiant_id` int(11) NOT NULL,
  `discipline_id` int(11) NOT NULL,
  `poste_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `etudiant_disciplines`
--

INSERT INTO `etudiant_disciplines` (`id`, `etudiant_id`, `discipline_id`, `poste_id`) VALUES
(1, 1, 1, 3);

-- --------------------------------------------------------

--
-- Structure de la table `medecins`
--

CREATE TABLE `medecins` (
  `id` int(11) NOT NULL,
  `utilisateur_id` int(11) NOT NULL,
  `matricule` varchar(80) DEFAULT NULL,
  `numero_ordre` varchar(80) DEFAULT NULL,
  `structure` varchar(150) DEFAULT NULL,
  `diplome` varchar(100) DEFAULT NULL,
  `annees_experience` varchar(50) DEFAULT NULL,
  `disponibilite` varchar(80) DEFAULT NULL,
  `langues` varchar(150) DEFAULT NULL,
  `experiences` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `medecin_specialites`
--

CREATE TABLE `medecin_specialites` (
  `id` int(11) NOT NULL,
  `medecin_id` int(11) NOT NULL,
  `specialite` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `postes`
--

CREATE TABLE `postes` (
  `id` int(11) NOT NULL,
  `discipline_id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `postes`
--

INSERT INTO `postes` (`id`, `discipline_id`, `nom`) VALUES
(1, 1, 'Gardien de but'),
(2, 1, 'Defenseur central'),
(3, 1, 'Lateral droit'),
(4, 1, 'Lateral gauche'),
(5, 1, 'Milieu defensif'),
(6, 1, 'Milieu central'),
(7, 1, 'Milieu offensif'),
(8, 1, 'Ailier droit'),
(9, 1, 'Ailier gauche'),
(10, 1, 'Attaquant centre'),
(11, 2, 'Meneur PG'),
(12, 2, 'Arriere SG'),
(13, 2, 'Ailier SF'),
(14, 2, 'Ailier fort PF'),
(15, 2, 'Pivot C'),
(16, 3, 'Passeur'),
(17, 3, 'Libero'),
(18, 3, 'Receptionneur attaquant'),
(19, 3, 'Pointu'),
(20, 3, 'Central'),
(21, 3, 'Oppose'),
(22, 4, '100m Sprint'),
(23, 4, '200m'),
(24, 4, '400m'),
(25, 4, '800m Demi-fond'),
(26, 4, '1500m et plus'),
(27, 4, 'Haies'),
(28, 4, 'Saut en hauteur'),
(29, 4, 'Saut en longueur'),
(30, 4, 'Lancer du poids'),
(31, 4, 'Decathlon'),
(32, 5, 'Nage libre'),
(33, 5, 'Dos crawle'),
(34, 5, 'Brasse'),
(35, 5, 'Papillon'),
(36, 5, '4 nages'),
(37, 5, 'Relais'),
(38, 6, 'Simple'),
(39, 6, 'Double'),
(40, 6, 'Double mixte'),
(41, 7, 'Gardien de but'),
(42, 7, 'Ailier gauche'),
(43, 7, 'Ailier droit'),
(44, 7, 'Arriere gauche'),
(45, 7, 'Arriere droit'),
(46, 7, 'Demi-centre'),
(47, 7, 'Pivot'),
(48, 8, 'Moins 60kg'),
(49, 8, '60 66kg'),
(50, 8, '66 73kg'),
(51, 8, '73 81kg'),
(52, 8, '81 90kg'),
(53, 8, '90 100kg'),
(54, 8, 'Plus 100kg'),
(55, 8, 'Kata');

-- --------------------------------------------------------

--
-- Structure de la table `sieges`
--

CREATE TABLE `sieges` (
  `id` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `ville` varchar(100) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `actif` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `sieges`
--

INSERT INTO `sieges` (`id`, `numero`, `ville`, `description`, `actif`, `created_at`) VALUES
(1, 1, 'CABOMA', 'Siege principal', 1, '2026-03-24 08:10:53'),
(2, 2, 'Porto-Novo', 'Siege regional', 1, '2026-03-24 08:10:53'),
(3, 3, 'Parakou', 'Siege regional', 1, '2026-03-24 08:10:53'),
(4, 4, 'Abomey-Calavi', 'Siege regional', 1, '2026-03-24 08:10:53'),
(5, 5, 'DASSA', 'Siege regional', 1, '2026-03-24 08:10:53'),
(6, 6, 'AKPAKPA', 'Siege regional', 1, '2026-03-24 08:10:53'),
(7, 7, 'COME', 'Siege regional', 1, '2026-03-24 08:10:53'),
(8, 8, 'Bohicon', 'Siege regional', 1, '2026-03-24 08:10:53'),
(9, 5, 'DASSA', 'Siege regional', 1, '2026-03-24 08:10:53');

-- --------------------------------------------------------

--
-- Structure de la table `tournois`
--

CREATE TABLE `tournois` (
  `id` int(11) NOT NULL,
  `nom` varchar(200) NOT NULL,
  `discipline_id` int(11) DEFAULT NULL,
  `siege_id` int(11) DEFAULT NULL,
  `date_debut` date DEFAULT NULL,
  `date_fin` date DEFAULT NULL,
  `description` text DEFAULT NULL,
  `statut` enum('planifie','en_cours','termine','annule') DEFAULT 'planifie',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

CREATE TABLE `utilisateurs` (
  `id` int(11) NOT NULL,
  `type_profil` enum('etudiant','encadreur','medecin') NOT NULL,
  `nom` varchar(100) NOT NULL,
  `prenoms` varchar(150) NOT NULL,
  `date_naissance` date DEFAULT NULL,
  `sexe` enum('Masculin','Feminin') DEFAULT NULL,
  `nationalite` varchar(80) DEFAULT 'Beninoise',
  `email` varchar(180) NOT NULL,
  `telephone` varchar(30) DEFAULT NULL,
  `siege_id` int(11) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `mot_de_passe` varchar(255) NOT NULL,
  `statut` enum('en_attente','valide','rejete') DEFAULT 'en_attente',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`id`, `type_profil`, `nom`, `prenoms`, `date_naissance`, `sexe`, `nationalite`, `email`, `telephone`, `siege_id`, `photo`, `mot_de_passe`, `statut`, `created_at`, `updated_at`) VALUES
(1, 'etudiant', 'SENAHOUN', 'Laurice', '0005-04-02', 'Masculin', 'Béninoise', 'senahounlaurice@gmail.com', '+2290168722683', 5, 'etudiant_69c28046ab73b.png', '$2y$10$0eXxdQ9RPoR.l23wOSBSmOiS3kmj4hImfepncI9c61CqbyT1YsnZG', 'valide', '2026-03-24 12:15:02', '2026-03-24 12:15:47');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `siege_id` (`siege_id`);

--
-- Index pour la table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `siege_id` (`siege_id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Index pour la table `disciplines`
--
ALTER TABLE `disciplines`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `encadreurs`
--
ALTER TABLE `encadreurs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `utilisateur_id` (`utilisateur_id`);

--
-- Index pour la table `encadreur_disciplines`
--
ALTER TABLE `encadreur_disciplines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `encadreur_id` (`encadreur_id`),
  ADD KEY `discipline_id` (`discipline_id`);

--
-- Index pour la table `equipes`
--
ALTER TABLE `equipes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `siege_id` (`siege_id`),
  ADD KEY `discipline_id` (`discipline_id`),
  ADD KEY `tournoi_id` (`tournoi_id`),
  ADD KEY `encadreur_id` (`encadreur_id`);

--
-- Index pour la table `etudiants`
--
ALTER TABLE `etudiants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `utilisateur_id` (`utilisateur_id`);

--
-- Index pour la table `etudiant_disciplines`
--
ALTER TABLE `etudiant_disciplines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `etudiant_id` (`etudiant_id`),
  ADD KEY `discipline_id` (`discipline_id`),
  ADD KEY `poste_id` (`poste_id`);

--
-- Index pour la table `medecins`
--
ALTER TABLE `medecins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `utilisateur_id` (`utilisateur_id`);

--
-- Index pour la table `medecin_specialites`
--
ALTER TABLE `medecin_specialites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `medecin_id` (`medecin_id`);

--
-- Index pour la table `postes`
--
ALTER TABLE `postes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discipline_id` (`discipline_id`);

--
-- Index pour la table `sieges`
--
ALTER TABLE `sieges`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `tournois`
--
ALTER TABLE `tournois`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discipline_id` (`discipline_id`),
  ADD KEY `siege_id` (`siege_id`);

--
-- Index pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `siege_id` (`siege_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `disciplines`
--
ALTER TABLE `disciplines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `encadreurs`
--
ALTER TABLE `encadreurs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `encadreur_disciplines`
--
ALTER TABLE `encadreur_disciplines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `equipes`
--
ALTER TABLE `equipes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `etudiants`
--
ALTER TABLE `etudiants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `etudiant_disciplines`
--
ALTER TABLE `etudiant_disciplines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `medecins`
--
ALTER TABLE `medecins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `medecin_specialites`
--
ALTER TABLE `medecin_specialites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `postes`
--
ALTER TABLE `postes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT pour la table `sieges`
--
ALTER TABLE `sieges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `tournois`
--
ALTER TABLE `tournois`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `admins`
--
ALTER TABLE `admins`
  ADD CONSTRAINT `admins_ibfk_1` FOREIGN KEY (`siege_id`) REFERENCES `sieges` (`id`);

--
-- Contraintes pour la table `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `articles_ibfk_1` FOREIGN KEY (`siege_id`) REFERENCES `sieges` (`id`),
  ADD CONSTRAINT `articles_ibfk_2` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `encadreurs`
--
ALTER TABLE `encadreurs`
  ADD CONSTRAINT `encadreurs_ibfk_1` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateurs` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `encadreur_disciplines`
--
ALTER TABLE `encadreur_disciplines`
  ADD CONSTRAINT `encadreur_disciplines_ibfk_1` FOREIGN KEY (`encadreur_id`) REFERENCES `encadreurs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `encadreur_disciplines_ibfk_2` FOREIGN KEY (`discipline_id`) REFERENCES `disciplines` (`id`);

--
-- Contraintes pour la table `equipes`
--
ALTER TABLE `equipes`
  ADD CONSTRAINT `equipes_ibfk_1` FOREIGN KEY (`siege_id`) REFERENCES `sieges` (`id`),
  ADD CONSTRAINT `equipes_ibfk_2` FOREIGN KEY (`discipline_id`) REFERENCES `disciplines` (`id`),
  ADD CONSTRAINT `equipes_ibfk_3` FOREIGN KEY (`tournoi_id`) REFERENCES `tournois` (`id`),
  ADD CONSTRAINT `equipes_ibfk_4` FOREIGN KEY (`encadreur_id`) REFERENCES `encadreurs` (`id`);

--
-- Contraintes pour la table `etudiants`
--
ALTER TABLE `etudiants`
  ADD CONSTRAINT `etudiants_ibfk_1` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateurs` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `etudiant_disciplines`
--
ALTER TABLE `etudiant_disciplines`
  ADD CONSTRAINT `etudiant_disciplines_ibfk_1` FOREIGN KEY (`etudiant_id`) REFERENCES `etudiants` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `etudiant_disciplines_ibfk_2` FOREIGN KEY (`discipline_id`) REFERENCES `disciplines` (`id`),
  ADD CONSTRAINT `etudiant_disciplines_ibfk_3` FOREIGN KEY (`poste_id`) REFERENCES `postes` (`id`);

--
-- Contraintes pour la table `medecins`
--
ALTER TABLE `medecins`
  ADD CONSTRAINT `medecins_ibfk_1` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateurs` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `medecin_specialites`
--
ALTER TABLE `medecin_specialites`
  ADD CONSTRAINT `medecin_specialites_ibfk_1` FOREIGN KEY (`medecin_id`) REFERENCES `medecins` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `postes`
--
ALTER TABLE `postes`
  ADD CONSTRAINT `postes_ibfk_1` FOREIGN KEY (`discipline_id`) REFERENCES `disciplines` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `tournois`
--
ALTER TABLE `tournois`
  ADD CONSTRAINT `tournois_ibfk_1` FOREIGN KEY (`discipline_id`) REFERENCES `disciplines` (`id`),
  ADD CONSTRAINT `tournois_ibfk_2` FOREIGN KEY (`siege_id`) REFERENCES `sieges` (`id`);

--
-- Contraintes pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD CONSTRAINT `utilisateurs_ibfk_1` FOREIGN KEY (`siege_id`) REFERENCES `sieges` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
