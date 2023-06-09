-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : jeu. 04 mai 2023 à 10:40
-- Version du serveur : 10.6.12-MariaDB-0ubuntu0.22.04.1
-- Version de PHP : 8.1.2-1ubuntu2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `village_green_ddb`
--

-- --------------------------------------------------------

--
-- Structure de la table `achete`
--

CREATE TABLE `achete` (
  `ref_produit` varchar(10) NOT NULL,
  `id_cli` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Banque_photo`
--

CREATE TABLE `Banque_photo` (
  `id_photo` int(11) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `ref_produit` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Client`
--

CREATE TABLE `Client` (
  `id_cli` int(11) NOT NULL,
  `nom` varchar(30) DEFAULT NULL,
  `prenom` varchar(30) DEFAULT NULL,
  `adresse_livraison` varchar(255) DEFAULT NULL,
  `code_postal_livraison` varchar(5) DEFAULT NULL,
  `adresse_facturation` varchar(255) DEFAULT NULL,
  `code_postal_facturation` varchar(5) DEFAULT NULL,
  `mdp_utilisateur` varchar(50) DEFAULT NULL,
  `archive_cli` varchar(50) DEFAULT NULL,
  `ref_employe` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Commande`
--

CREATE TABLE `Commande` (
  `id_commande` varchar(10) NOT NULL,
  `date_com` date DEFAULT NULL,
  `num_bon_livraison` varchar(15) DEFAULT NULL,
  `date_livraison` varchar(50) DEFAULT NULL,
  `coef_cli` decimal(2,2) DEFAULT NULL,
  `taux_tva` varchar(50) DEFAULT NULL,
  `tarif_ttc` decimal(5,2) DEFAULT NULL,
  `ref_employe` varchar(10) NOT NULL,
  `id_cli` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `controle`
--

CREATE TABLE `controle` (
  `ref_produit` varchar(10) NOT NULL,
  `id_commande` varchar(10) NOT NULL,
  `qt_produit` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Employe`
--

CREATE TABLE `Employe` (
  `ref_employe` varchar(10) NOT NULL,
  `equipe` varchar(30) DEFAULT NULL,
  `nom` varchar(30) DEFAULT NULL,
  `prenom` varchar(30) DEFAULT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `code_postal` varchar(5) DEFAULT NULL,
  `ref_employe_1` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Fournisseur`
--

CREATE TABLE `Fournisseur` (
  `id_four` int(11) NOT NULL,
  `adresse_four` varchar(50) DEFAULT NULL,
  `nom_contact` varchar(30) DEFAULT NULL,
  `prenom_contact` varchar(30) DEFAULT NULL,
  `tel_contact` varchar(20) DEFAULT NULL,
  `mail_contact` varchar(50) DEFAULT NULL,
  `ref_produit` varchar(50) DEFAULT NULL,
  `nom_produit` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Produit`
--

CREATE TABLE `Produit` (
  `ref_produit` varchar(10) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `libelle` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `date_ajout` datetime DEFAULT NULL,
  `tarif_ht` decimal(5,2) DEFAULT NULL,
  `id_four` int(11) NOT NULL,
  `id_sous_rubrique` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Rubrique`
--

CREATE TABLE `Rubrique` (
  `id_rubrique` int(11) NOT NULL,
  `code_rubrique` varchar(50) DEFAULT NULL,
  `nom_rubrique` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Sous_Rubrique`
--

CREATE TABLE `Sous_Rubrique` (
  `id_sous_rubrique` int(11) NOT NULL,
  `nom_sous_rubrique` varchar(50) DEFAULT NULL,
  `code_sous_rubrique` varchar(50) DEFAULT NULL,
  `id_rubrique` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `achete`
--
ALTER TABLE `achete`
  ADD PRIMARY KEY (`ref_produit`,`id_cli`),
  ADD KEY `id_cli` (`id_cli`);

--
-- Index pour la table `Banque_photo`
--
ALTER TABLE `Banque_photo`
  ADD PRIMARY KEY (`id_photo`),
  ADD KEY `ref_produit` (`ref_produit`);

--
-- Index pour la table `Client`
--
ALTER TABLE `Client`
  ADD PRIMARY KEY (`id_cli`),
  ADD KEY `ref_employe` (`ref_employe`);

--
-- Index pour la table `Commande`
--
ALTER TABLE `Commande`
  ADD PRIMARY KEY (`id_commande`),
  ADD KEY `ref_employe` (`ref_employe`),
  ADD KEY `id_cli` (`id_cli`);

--
-- Index pour la table `controle`
--
ALTER TABLE `controle`
  ADD PRIMARY KEY (`ref_produit`,`id_commande`),
  ADD KEY `id_commande` (`id_commande`);

--
-- Index pour la table `Employe`
--
ALTER TABLE `Employe`
  ADD PRIMARY KEY (`ref_employe`),
  ADD KEY `ref_employe_1` (`ref_employe_1`);

--
-- Index pour la table `Fournisseur`
--
ALTER TABLE `Fournisseur`
  ADD PRIMARY KEY (`id_four`);

--
-- Index pour la table `Produit`
--
ALTER TABLE `Produit`
  ADD PRIMARY KEY (`ref_produit`),
  ADD KEY `id_four` (`id_four`),
  ADD KEY `id_sous_rubrique` (`id_sous_rubrique`);

--
-- Index pour la table `Rubrique`
--
ALTER TABLE `Rubrique`
  ADD PRIMARY KEY (`id_rubrique`);

--
-- Index pour la table `Sous_Rubrique`
--
ALTER TABLE `Sous_Rubrique`
  ADD PRIMARY KEY (`id_sous_rubrique`),
  ADD KEY `id_rubrique` (`id_rubrique`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Banque_photo`
--
ALTER TABLE `Banque_photo`
  MODIFY `id_photo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Client`
--
ALTER TABLE `Client`
  MODIFY `id_cli` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Fournisseur`
--
ALTER TABLE `Fournisseur`
  MODIFY `id_four` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Rubrique`
--
ALTER TABLE `Rubrique`
  MODIFY `id_rubrique` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Sous_Rubrique`
--
ALTER TABLE `Sous_Rubrique`
  MODIFY `id_sous_rubrique` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `achete`
--
ALTER TABLE `achete`
  ADD CONSTRAINT `achete_ibfk_1` FOREIGN KEY (`ref_produit`) REFERENCES `Produit` (`ref_produit`),
  ADD CONSTRAINT `achete_ibfk_2` FOREIGN KEY (`id_cli`) REFERENCES `Client` (`id_cli`);

--
-- Contraintes pour la table `Banque_photo`
--
ALTER TABLE `Banque_photo`
  ADD CONSTRAINT `Banque_photo_ibfk_1` FOREIGN KEY (`ref_produit`) REFERENCES `Produit` (`ref_produit`);

--
-- Contraintes pour la table `Client`
--
ALTER TABLE `Client`
  ADD CONSTRAINT `Client_ibfk_1` FOREIGN KEY (`ref_employe`) REFERENCES `Employe` (`ref_employe`);

--
-- Contraintes pour la table `Commande`
--
ALTER TABLE `Commande`
  ADD CONSTRAINT `Commande_ibfk_1` FOREIGN KEY (`ref_employe`) REFERENCES `Employe` (`ref_employe`),
  ADD CONSTRAINT `Commande_ibfk_2` FOREIGN KEY (`id_cli`) REFERENCES `Client` (`id_cli`);

--
-- Contraintes pour la table `controle`
--
ALTER TABLE `controle`
  ADD CONSTRAINT `controle_ibfk_1` FOREIGN KEY (`ref_produit`) REFERENCES `Produit` (`ref_produit`),
  ADD CONSTRAINT `controle_ibfk_2` FOREIGN KEY (`id_commande`) REFERENCES `Commande` (`id_commande`);

--
-- Contraintes pour la table `Employe`
--
ALTER TABLE `Employe`
  ADD CONSTRAINT `Employe_ibfk_1` FOREIGN KEY (`ref_employe_1`) REFERENCES `Employe` (`ref_employe`);

--
-- Contraintes pour la table `Produit`
--
ALTER TABLE `Produit`
  ADD CONSTRAINT `Produit_ibfk_1` FOREIGN KEY (`id_four`) REFERENCES `Fournisseur` (`id_four`),
  ADD CONSTRAINT `Produit_ibfk_2` FOREIGN KEY (`id_sous_rubrique`) REFERENCES `Sous_Rubrique` (`id_sous_rubrique`);

--
-- Contraintes pour la table `Sous_Rubrique`
--
ALTER TABLE `Sous_Rubrique`
  ADD CONSTRAINT `Sous_Rubrique_ibfk_1` FOREIGN KEY (`id_rubrique`) REFERENCES `Rubrique` (`id_rubrique`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
