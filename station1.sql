-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : mer. 18 août 2021 à 18:25
-- Version du serveur : 5.7.24
-- Version de PHP : 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `station1`
--

-- --------------------------------------------------------

--
-- Structure de la table `camion`
--

CREATE TABLE `camion` (
  `id_camion` varchar(42) NOT NULL,
  `capacite_camion` varchar(42) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `chauffeur`
--

CREATE TABLE `chauffeur` (
  `id_chauffeur` varchar(42) NOT NULL,
  `nom_chauffeur` varchar(42) DEFAULT NULL,
  `id_camion` varchar(42) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `credit`
--

CREATE TABLE `credit` (
  `id_credit` varchar(42) NOT NULL,
  `id_credit_1` varchar(42) DEFAULT NULL,
  `montant` varchar(42) DEFAULT NULL,
  `date` varchar(42) DEFAULT NULL,
  `delais_remboursement` varchar(42) DEFAULT NULL,
  `nom_siege` varchar(42) DEFAULT NULL,
  `id_gerant` varchar(42) DEFAULT NULL,
  `id_client` varchar(42) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `gerant`
--

CREATE TABLE `gerant` (
  `id_gerant` varchar(42) NOT NULL,
  `prenom_gerant` varchar(42) DEFAULT NULL,
  `adresse_gerant` varchar(42) DEFAULT NULL,
  `telephone_gerant` varchar(42) DEFAULT NULL,
  `mail_gerant` varchar(42) DEFAULT NULL,
  `id_user` varchar(42) DEFAULT NULL,
  `login` varchar(42) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `index`
--

CREATE TABLE `index` (
  `index_depart` varchar(42) NOT NULL,
  `index_fin` varchar(42) DEFAULT NULL,
  `date` varchar(42) DEFAULT NULL,
  `heur` varchar(42) DEFAULT NULL,
  `id_gerant` varchar(42) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `livraison`
--

CREATE TABLE `livraison` (
  `id_livraison` varchar(42) NOT NULL,
  `id_station` varchar(42) DEFAULT NULL,
  `id_chauffeur` varchar(42) DEFAULT NULL,
  `id_station_1` varchar(42) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `pompe`
--

CREATE TABLE `pompe` (
  `id_pompe` varchar(42) NOT NULL,
  `libelle` varchar(42) DEFAULT NULL,
  `statut` varchar(42) DEFAULT NULL,
  `cuve_id` varchar(42) DEFAULT NULL,
  `id_cuve` varchar(42) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `pompiste`
--

CREATE TABLE `pompiste` (
  `id` varchar(42) NOT NULL,
  `prenom_pompiste` varchar(42) DEFAULT NULL,
  `nom_pompiste` varchar(42) DEFAULT NULL,
  `adresse_pompiste` varchar(42) DEFAULT NULL,
  `id_user` varchar(42) DEFAULT NULL,
  `login` varchar(42) DEFAULT NULL,
  `station_id` varchar(42) DEFAULT NULL,
  `statut` varchar(42) DEFAULT NULL,
  `id_station` varchar(42) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `id_produit` varchar(42) NOT NULL,
  `nom` varchar(42) DEFAULT NULL,
  `référence` varchar(42) DEFAULT NULL,
  `prix` varchar(42) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `remboursement`
--

CREATE TABLE `remboursement` (
  `id_re` varchar(42) NOT NULL,
  `date` varchar(42) DEFAULT NULL,
  `montant` varchar(42) DEFAULT NULL,
  `id_credit` varchar(42) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `siege`
--

CREATE TABLE `siege` (
  `nom_siege` varchar(42) NOT NULL,
  `adresse` varchar(42) DEFAULT NULL,
  `libelle` varchar(42) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `station`
--

CREATE TABLE `station` (
  `id_station` varchar(42) NOT NULL,
  `nom_station` varchar(42) DEFAULT NULL,
  `adresse_station` varchar(42) DEFAULT NULL,
  `telephone_station` varchar(42) DEFAULT NULL,
  `type_de_payement` varchar(42) DEFAULT NULL,
  `statusbis_station` varchar(42) DEFAULT NULL,
  `objectif` varchar(42) DEFAULT NULL,
  `besion` varchar(42) DEFAULT NULL,
  `status` varchar(42) DEFAULT NULL,
  `id_gerant` varchar(42) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `vente`
--

CREATE TABLE `vente` (
  `id_vente` varchar(42) NOT NULL,
  `produit` varchar(42) DEFAULT NULL,
  `pompiste` varchar(42) DEFAULT NULL,
  `index_depart` varchar(42) DEFAULT NULL,
  `index_arrivée` varchar(42) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `versement`
--

CREATE TABLE `versement` (
  `id_ver` varchar(42) NOT NULL,
  `montant` varchar(42) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `id_gerant` varchar(42) DEFAULT NULL,
  `id_banque` varchar(42) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `camion`
--
ALTER TABLE `camion`
  ADD PRIMARY KEY (`id_camion`);

--
-- Index pour la table `chauffeur`
--
ALTER TABLE `chauffeur`
  ADD PRIMARY KEY (`id_chauffeur`),
  ADD KEY `id_camion` (`id_camion`);

--
-- Index pour la table `credit`
--
ALTER TABLE `credit`
  ADD PRIMARY KEY (`id_credit`);

--
-- Index pour la table `gerant`
--
ALTER TABLE `gerant`
  ADD PRIMARY KEY (`id_gerant`);

--
-- Index pour la table `index`
--
ALTER TABLE `index`
  ADD PRIMARY KEY (`index_depart`),
  ADD KEY `id_gerant` (`id_gerant`);

--
-- Index pour la table `livraison`
--
ALTER TABLE `livraison`
  ADD PRIMARY KEY (`id_livraison`),
  ADD KEY `id_station_1` (`id_station_1`),
  ADD KEY `id_chauffeur` (`id_chauffeur`);

--
-- Index pour la table `pompe`
--
ALTER TABLE `pompe`
  ADD PRIMARY KEY (`id_pompe`);

--
-- Index pour la table `pompiste`
--
ALTER TABLE `pompiste`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_station` (`id_station`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`id_produit`);

--
-- Index pour la table `remboursement`
--
ALTER TABLE `remboursement`
  ADD PRIMARY KEY (`id_re`),
  ADD KEY `id_credit` (`id_credit`);

--
-- Index pour la table `siege`
--
ALTER TABLE `siege`
  ADD PRIMARY KEY (`nom_siege`);

--
-- Index pour la table `station`
--
ALTER TABLE `station`
  ADD PRIMARY KEY (`id_station`),
  ADD KEY `id_gerant` (`id_gerant`);

--
-- Index pour la table `vente`
--
ALTER TABLE `vente`
  ADD PRIMARY KEY (`id_vente`);

--
-- Index pour la table `versement`
--
ALTER TABLE `versement`
  ADD PRIMARY KEY (`id_ver`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `chauffeur`
--
ALTER TABLE `chauffeur`
  ADD CONSTRAINT `chauffeur_ibfk_1` FOREIGN KEY (`id_camion`) REFERENCES `camion` (`id_camion`);

--
-- Contraintes pour la table `index`
--
ALTER TABLE `index`
  ADD CONSTRAINT `index_ibfk_1` FOREIGN KEY (`id_gerant`) REFERENCES `gerant` (`id_gerant`);

--
-- Contraintes pour la table `livraison`
--
ALTER TABLE `livraison`
  ADD CONSTRAINT `livraison_ibfk_1` FOREIGN KEY (`id_station_1`) REFERENCES `station` (`id_station`),
  ADD CONSTRAINT `livraison_ibfk_2` FOREIGN KEY (`id_chauffeur`) REFERENCES `chauffeur` (`id_chauffeur`);

--
-- Contraintes pour la table `pompiste`
--
ALTER TABLE `pompiste`
  ADD CONSTRAINT `pompiste_ibfk_1` FOREIGN KEY (`id_station`) REFERENCES `station` (`id_station`);

--
-- Contraintes pour la table `remboursement`
--
ALTER TABLE `remboursement`
  ADD CONSTRAINT `remboursement_ibfk_1` FOREIGN KEY (`id_credit`) REFERENCES `credit` (`id_credit`);

--
-- Contraintes pour la table `station`
--
ALTER TABLE `station`
  ADD CONSTRAINT `station_ibfk_1` FOREIGN KEY (`id_gerant`) REFERENCES `gerant` (`id_gerant`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
