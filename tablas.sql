# Host: 54.36.127.31  (Version 5.7.26-0ubuntu0.16.04.1)
# Date: 2019-05-25 13:10:25
# Generator: MySQL-Front 6.1  (Build 1.26)


#
# Structure for table "tm1_enclosures"
#

CREATE TABLE `tm1_enclosures` (
  `enclosure_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `groupid` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "tm1_groups"
#

CREATE TABLE `tm1_groups` (
  `groupid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `aprove` int(1) DEFAULT '0',
  `money` int(11) DEFAULT '0',
  PRIMARY KEY (`groupid`)
) ENGINE=InnoDB AUTO_INCREMENT=7709 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "tm1_membersgroups"
#

CREATE TABLE `tm1_membersgroups` (
  `groupid` int(11) DEFAULT '0',
  `identifier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `rank` int(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Structure for table "tm1_plants"
#

CREATE TABLE `tm1_plants` (
  `name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '',
  `label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '',
  `object` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '',
  `finalobject` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `items` (name, label) VALUES ('aditives','Aditivos'),
('canion','Cañóon de arma'),
('coca','Cocaina'),
('cocaplant','Planta de Cocaina'),
('cocaseed','Semilla de Cocaina'),
('cocawithout','Cocaina sin aditivos'),
('coke','Cocaina'),
('culett','Culata de arma'),
('grilletes','Esposas'),
('keys','Llaves de esposas'),
('nevadito','Nevadito'),
('scope','Mira de arma'),
('shovel','Pala'),
('weapon_shit','Repuestos de armas'),
('weed','Marihuana'),
('weed_pooch','Bolsa de marihuana');

INSERT INTO `tm1_plants` (`name`,`label`,`object`,`finalobject`) VALUES ('cocaseed','Cocaina','Prop_weed_01','cocaplant');

INSERT INTO `addon_inventory` (name, label, shared) VALUES
('society_mafia1','Mafia 1', 1),
('society_mafia2','Mafia 2', 1),
('society_mafia3','Mafia 3', 1),
('society_mafia4','Mafia 4', 1),
('society_mafia5','Mafia 5', 1);

INSERT INTO `datastore` (name, label, shared) VALUES
('society_mafia1','Mafia 1', 1),
('society_mafia2','Mafia 2', 1),
('society_mafia3','Mafia 3', 1),
('society_mafia4','Mafia 4', 1),
('society_mafia5','Mafia 5', 1);