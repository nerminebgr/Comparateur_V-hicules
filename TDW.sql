-- Structure de la table `user`
DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `role` ENUM('utilisateur','admin') COLLATE latin1_bin DEFAULT NULL,
  `firstName` VARCHAR(255) COLLATE latin1_bin DEFAULT NULL,
  `lastName` VARCHAR(255) COLLATE latin1_bin DEFAULT NULL,
  `dateOfBirth` DATE DEFAULT NULL,
  `sex` ENUM('male','female') COLLATE latin1_bin DEFAULT NULL,
  `status` ENUM('valid','pending','rejected') COLLATE latin1_bin DEFAULT NULL,
  `password` VARCHAR(255) COLLATE latin1_bin DEFAULT NULL,
  `email` VARCHAR(255) COLLATE latin1_bin DEFAULT NULL,
  `photo` VARCHAR(255) COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- Insertion de données dans la table user
INSERT INTO `user` (`id`, `role`, `firstName`, `lastName`, `dateOfBirth`, `sex`, `status`, `password`, `email`, `photo`) VALUES
(1, 'admin', 'Nermine', 'Bougrine', '2001-08-14', 'female', 'valid', 'admin', 'admin', ''),
(2, 'utilisateur', 'Rania', 'Bougrine', '2005-01-02', 'female', 'valid', '123', 'nerminebougrin@gmail.com', '');

-- Structure de la table `GuideAchat`
DROP TABLE IF EXISTS `GuideAchat`;
CREATE TABLE IF NOT EXISTS `GuideAchat` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `content` VARCHAR(255),
  `image` VARCHAR(255)
);

-- Structure de la table `News`
DROP TABLE IF EXISTS `News`;
CREATE TABLE IF NOT EXISTS `News` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `title` VARCHAR(255),
  `image` VARCHAR(255),
  `content` VARCHAR(255)
);

-- Structure de la table `Brand`
DROP TABLE IF EXISTS `Brand`;
CREATE TABLE IF NOT EXISTS `Brand` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(100) UNIQUE,
  `country` VARCHAR(255),
  `headquarters` VARCHAR(255),
  `yearFounded` INT
);

-- Structure de la table `Model`
DROP TABLE IF EXISTS `Model`;
CREATE TABLE IF NOT EXISTS `Model` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(255),
  `brandId` INT,
  FOREIGN KEY (`brandId`) REFERENCES `Brand` (`id`)
);

-- Structure de la table `Version`
DROP TABLE IF EXISTS `Version`;
CREATE TABLE IF NOT EXISTS `Version` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(255),
  `modelId` INT,
  `year` INT,
  FOREIGN KEY (`modelId`) REFERENCES `Model` (`id`)
);

-- Structure de la table `Vehicle
-- Structure de la table `Vehicle`
DROP TABLE IF EXISTS `Vehicle`;
CREATE TABLE IF NOT EXISTS `Vehicle` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `image` VARCHAR(255),
  `name` VARCHAR(255),
  `modelId` INT,
  `versionId` INT,
  `year` INT,
  `dimensions` VARCHAR(255),
  `consumption` VARCHAR(255),
  `engine` VARCHAR(255),
  `performance` VARCHAR(255),
  `note` FLOAT,
  `tarif` VARCHAR(255),
  FOREIGN KEY (`modelId`) REFERENCES `Model` (`id`),
  FOREIGN KEY (`versionId`) REFERENCES `Version` (`id`)
);

-- Structure de la table `ReviewVeh`
DROP TABLE IF EXISTS `ReviewVeh`;
CREATE TABLE IF NOT EXISTS `ReviewVeh` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `rating` INT,
  `comment` VARCHAR(255),
  `userId` INT,
  `approved` BOOLEAN,
  FOREIGN KEY (`userId`) REFERENCES `User` (`id`)
);

-- Structure de la table `UserFavoriteVeh`
DROP TABLE IF EXISTS `UserFavoriteVeh`;
CREATE TABLE IF NOT EXISTS `UserFavoriteVeh` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `userId` INT,
  `vehicleId` INT,
  FOREIGN KEY (`userId`) REFERENCES `User` (`id`),
  FOREIGN KEY (`vehicleId`) REFERENCES `Vehicle` (`id`)
);

-- Structure de la table `BrandRating`
DROP TABLE IF EXISTS `BrandRating`;
CREATE TABLE IF NOT EXISTS `BrandRating` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `rating` INT,
  `comment` VARCHAR(255),
  `userId` INT,
  `brandId` INT,
  `approved` BOOLEAN,
  FOREIGN KEY (`userId`) REFERENCES `User` (`id`),
  FOREIGN KEY (`brandId`) REFERENCES `Brand` (`id`)
);

-- Structure de la table `BrandFavorite`
DROP TABLE IF EXISTS `BrandFavorite`;
CREATE TABLE IF NOT EXISTS `BrandFavorite` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `userId` INT,
  `brandId` INT,
  FOREIGN KEY (`userId`) REFERENCES `User` (`id`),
  FOREIGN KEY (`brandId`) REFERENCES `Brand` (`id`)
);
-- Structure de la table `Navbar`
DROP TABLE IF EXISTS `Navbar`;
CREATE TABLE IF NOT EXISTS `Navbar` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `title` VARCHAR(255),
  `link` VARCHAR(255)
);

-- Insertion de données dans la table Navbar
INSERT INTO `Navbar` (`id`, `title`, `link`) VALUES
(1, 'News', '/news'),
(2, 'Comparateur', '/comparateur'),
(3, 'Marques', '/marques'),
(4, 'Avis', '/avis'),
(5, 'Guides d\'achat', '/guides-achat'),
(6, 'Contact', '/contact');

-- Structure de la table `SocialMedia`
DROP TABLE IF EXISTS `SocialMedia`;
CREATE TABLE IF NOT EXISTS `SocialMedia` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(255),
  `image` VARCHAR(255),
  `link` VARCHAR(255)
);

-- Insertion de données dans la table SocialMedia
INSERT INTO `SocialMedia` (`id`, `name`, `image`, `link`) VALUES
(1, 'Facebook', 'facebook.png', 'https://www.facebook.com'),
(2, 'Twitter', 'twitter.png', 'https://www.twitter.com'),
(3, 'Instagram', 'instagram.png', 'https://www.instagram.com');
-- Structure de la table `VehicleComparison`
DROP TABLE IF EXISTS `VehicleComparison`;
CREATE TABLE IF NOT EXISTS `VehicleComparison` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `userId` INT,
  `vehicle1Id` INT,
  `vehicle2Id` INT,
  `vehicle3Id` INT,
  FOREIGN KEY (`userId`) REFERENCES `User` (`id`),
  FOREIGN KEY (`vehicle1Id`) REFERENCES `Vehicle` (`id`),
  FOREIGN KEY (`vehicle2Id`) REFERENCES `Vehicle` (`id`),
  FOREIGN KEY (`vehicle3Id`) REFERENCES `Vehicle` (`id`)
);

