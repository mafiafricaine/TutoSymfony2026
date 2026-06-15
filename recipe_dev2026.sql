-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: recipe_dev2026
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctrine_migration_versions`
--

LOCK TABLES `doctrine_migration_versions` WRITE;
/*!40000 ALTER TABLE `doctrine_migration_versions` DISABLE KEYS */;
INSERT INTO `doctrine_migration_versions` VALUES ('DoctrineMigrations\\Version20260513075539','2026-05-13 08:30:33',73),('DoctrineMigrations\\Version20260513085442','2026-05-13 08:55:14',41),('DoctrineMigrations\\Version20260604120930','2026-06-04 14:10:31',183),('DoctrineMigrations\\Version20260604135558','2026-06-04 15:56:46',42),('DoctrineMigrations\\Version20260608071843','2026-06-08 09:19:53',52),('DoctrineMigrations\\Version20260608083753','2026-06-08 10:38:38',253);
/*!40000 ALTER TABLE `doctrine_migration_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messenger_messages`
--

DROP TABLE IF EXISTS `messenger_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messenger_messages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E0FB7336F0E3BD61CE16BA31DBBF396750` (`queue_name`,`available_at`,`delivered_at`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messenger_messages`
--

LOCK TABLES `messenger_messages` WRITE;
/*!40000 ALTER TABLE `messenger_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messenger_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipes`
--

DROP TABLE IF EXISTS `recipes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `duration` int DEFAULT NULL,
  `image_name` varchar(500) DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_A369E2B5A76ED395` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipes`
--

LOCK TABLES `recipes` WRITE;
/*!40000 ALTER TABLE `recipes` DISABLE KEYS */;
INSERT INTO `recipes` VALUES (1,'Poulet Mayo','poulet-mayo','Du poulet et de la mayonnaise, la base pour moi. Le bon poulet rôti du dimanche accompagné de pommes de terre mais aujourd\'hui je vais vous parler d\'une tout autre version. Le poulet mayo de la RDC qui est très populaire et qui a vu le jour il y a une dizaine d\'années à peine dans les bars et les rues de Kinshasa.\n \nLe poulet mayo est tout simplement du poulet cuit au feu de bois, qui va ensuite être emballé dans du papier (en papillote) et cuit à l\'étouffé avec des oignons, poivrons. On va ensuite l\'enrober généreusement de mayonnaise.\nLe poulet mayo a prit une place importante dans la street food congolaise au même titre que les kamundele (brochettes), le dibi congolais version chèvre avec le ntaba. .. On parle de street food et de plat conviviaux qui sont généralement cuits en barbecue mais voici une version au four hyper simple à réaliser. J\'ai hâte de démarrer la saison des barbecues pour tester la version braisé au charbon de bois qui est juste dingue.\n\nC\'est proposé avec des bananes plantains (makemba) mais aussi avec de la chikwangue (bâton de manioc). La chikwangue est une racine/feuille de manioc écrasée et cuite entouré d\'une feuille.\n\nIngrédients pour 4 personnes\n1 poulet entier\n\n4 c.à s. d\'huile d\'olive\n\n1 c.à s. de gingembre en poudre\n\nSel et poivre\n\n1 c.à s. de muscade en poudre\n\n1 zestes d\'un citron vert\n\n1 c.à s. d\'épices\n\n2 poivrons\n\n1 jus d\'un citron jaune ( bio )\n\n1 oignon blanc\n\n2 branche d\'oignons verts\n\n3 c.à s. de mayonnaise\n\n\nÉtape 1/3\nPrenez votre poulet entier et coupez les parties indésirables (croupe de poulet,..). Nettoyez le poulet avec un citron jaune en frottant le citron coupé en deux sur et dans le poulet. Mettez votre poulet dans un grand récipient et ajoutez y l\'huile, le gingembre, le sel, le poivre , la muscade , l\'ail écrasé, le zeste et jus du citron vert, le mélange d\'épice pour poulet. Mélangez le tout et mettez au frigo pour minimum 4 heures voir une nuit.\n\nÉtape 2/3\nAprès le temps de pause, préchauffez votre four à 200 degrés sur chaleur tournante. Mettez votre poulet sur une plaque recouverte de papier sulfurisé. Faites le cuire durant une grosse demie heure voir 40 minutes.\n\nÉtape 3/3\nAprès ce temps de cuisson, sortez le et coupez le en morceaux. Mettez ces morceaux dans du papier sulfurisé, ajoutez y vos poivrons et oignons émincés, les jeunes oignons, le jus du citron jaune ainsi que la mayonnaise. Mélangez le tout.','2026-05-13 09:00:33','2026-06-04 14:54:19',60,'https://kelianfood.com/wp-content/uploads/2022/11/IMG_3695.jpg',1),(2,'Pondu (Saka Saka)','pondu-saka-saka','Pour ceux et celles qui ne savent pas ce qu\'est le pondu, il s\'agit en fait de feuilles de manioc pilées préparées avec des aubergines, poireaux, c\'est un accompagnement très apprécié au Congo.\n\nIngrédients pour 8 personnes\n2 sachets de pondu\n\n1 piment\n\n1 aubergine\n\n1 poireau\n\n2 oignons blancs\n\n2 gousses d\'ail ( bio )\n\n2 cubes de bouillon de légumes\n\n1 pincée de sel\n\n200 grammes de cacahuètes ( moulues )\n\n\nÉtape 1/5\nPour commencer laisser dégeler entièrement le pondu dans un casserole. Le rincer plusieurs fois afin d’éliminer toutes les « saletés »(utiliser une passoire à très très petits trous). Une fois bien rincé à l’eau claire ajoutez un peu d\'eau et le faire cuire durant 20 minutes.\n\nÉtape 2/5\nEnsuite ,jetez l’eau puis remettez de l’eau propre(environ 3L) et remettez le pondu sur feu moyen(+ 1 cuillère à café de bicarbonate de soude alimentaire afin d’accélérer le temps de cuisson). Mettez y le piment (sans le percer) cuisez le tout durant 30 minutes. Ajoutez l’aubergine coupée en morceaux, les oignons émincés, l’ail râpé,le poireau émincé, le bouillon cube de légumes,et l’huile de palme/ou l’huile olive.\n\nÉtape 3/5\nAssaisonnez avec le sel selon vos goûts et laissez cuire au moins 2-3 heures,puis mélangez(rajoutez de l\'eau entre temps, si besoin). 20 minutes avant la fin de cuisson, rajoutez votre poudre d\'arachide ( cacahuètes que vous avez moulues au blinder et qui sont devenus une poudre). Ne mélangez pas et laissez cuire tranquillement.\n\nÉtape 4/5\nLe pondu doit être bien tendre et l’eau doit avoir très très bien réduit. Moi j’adore le manger avec du riz blanc. C’est un délice !\n\nÉtape 5/5\nBon appétit mes gourmands.','2026-05-13 09:16:10','2026-06-04 15:12:13',130,'https://muriellebanackissa.com/wp-content/uploads/2022/10/Vegan-Saka-Saka-Congolese-Cassava-Leaf-Spinach-Stew-XX1-scaled.jpg?ver=1.2.2',2),(3,'Poulet DG (PDG)','poulet-dg-pdg','Aujourd\'hui, je vous présente une recette tout droit venue du Cameroun. C\'est leur plat national. DG veut dire directeur général. Le poulet DG est né dans les années 80 et à cette époque, il était réservé aux personnes d’une certaine importance. Depuis il est devenu accessible à tous. C’est un bon ragoût avec tout ce que j’aime dedans et en plus ce petit goût sucré-salé qu’apporte la banane plantain au plat toute la famille adore ce plat!\n\nIngrédients pour 4 personnes\n1 poulet entier\n\n200 grammes d\'haricots verts\n\n3 carotte\n\n2 poivrons\n\n2 gousses d\'ail\n\n3 bananes plantain jaunes\n\n1 boîte de tomate ( pelées )\n\nLaurier\n\n1 c.à s. de persil ( haché )\n\n1 c.à.c de gingembre en poudre\n\n1 cube de bouillon de poulet\n\n1 verre d\'eau\n\n2 c.à s. d\'huile d\'olive\n\nSel et poivre\n\n\nÉtape 1/3\nCoupez le poulet en plus ou moins 4 parts, si il est en entier et le nettoyer avec du citron. Mettez l’huile dans une marmite et faites frire les morceaux de poulet.\n\nÉtape 2/3\nPendant ce temps épluchez et coupez en fines lamelles les oignons et les poivrons. Une fois les morceaux de poulet bien doré, les retirer et réservez. Faites rissoler les oignons avec l’ail écrasé (environ 3 minutes) et lorsqu’ils deviennent translucides ajouter la boîte de tomates pelées. Laissez mijoter 5 minutes. Ajoutez les haricots verts, les poivrons et les carottes. Ajoutez le gingembre, le piment en poudre, le bouillon et les feuilles de laurier. Saler et poivrer.\n\nÉtape 3/3\nAjoutez le poulet, le verre d’eau et laisser mijoter environ 30 minutes. Faites frire les bananes plantain et les ajouter dans les 10 dernières minutes de cuisson. C\'est un plat complet donc il se mange comme cela. Bon appétit les gourmands.','2026-05-13 09:18:33','2026-06-04 15:15:48',55,'https://afrovitalityeats.com/wp-content/uploads/2018/08/POULET-DG-FROM-CAMEROON.jpg',1),(4,'Omelette japonaise','omelette-japonaise','Prenez des oeufs, cassez les et ensuite battez les en rajoutant du sel.','2026-05-20 06:49:25','2026-06-04 15:31:51',6,'https://odelices.ouest-france.fr/images/recettes/2013/omuraisu_omelette_japonaise_farcie_au_riz_et_poulet.jpg',2),(6,'Bruschette aux Tomates','bruschette-aux-tomates','Ingrédients :\n            -pain blanc\n            -tomates\n            -huile d\'olive\n\n            Préparation :\n            Prenez une tranche de pain, prenez des tomates, coupez-les, mettez-les sur le pain, ajoutez de l\'huile d\\olive.','2026-05-20 07:49:35','2026-06-04 15:27:13',5,'https://www.stefanofaita.com/wp-content/uploads/2023/08/STEFANO_FAITA_Bruschetta-706x1058.jpg',1),(7,'Tilapia Braisé','tilapia-braise','Difficulté: Facile\nIngrédients (2 personnes)\n2 Poisson (pour moi du Tilapia)\n\nPour la marinade:\nl\'ail\nl\'oignon\nl’origan\ngingembre\nle poivre\nle sel\nle laurier\n\nPour la décoration:\ndu piment vert et une tomate. Un peu d\'huile d\'olive\nUn peu de charbon pour braiser les poisson\nUne grille pour y poser les poissons\n\nPréparation\nEcailler vos poissons, laver les et laisser essorer l\'eau. 2 craser : l\'ail, poivre, gingembre, laurier l\'oignon.\n\n\n\nMélanger le tout et ajouter un peu de sel. Piquer les poissons avec le couteau pour permettre aux poissons d\'ête imbiber de l\'assaisonnement.\n\n\nMariner vos poissons avec les épices mélangés et laisser reposer 1h de temps au frais afin que le poisson soit bien imbibé.\n\n\n\nApprêter le feu. Dans une poele mettre quelque goutte d\'huile de votre choix et faite revenir les oignons hachés et les tomates hachées et enfin décorer avec le piment vert et saupoudrer. Réserver de côté.\n\n\n\nPoser votre grille imbibée d\'huile afin que le poisson ne se colle pas sur le charbon chaud et commencer par griller votre poisson tout en retournant la grille de temps en temps pour bien cuire votre poisson.\n\n\n\nServir vos poissons dans un plat et étaler l\'oignon mis à côté avec la tomate et le piment vert.\n\n\n\nBon appétit','2026-05-21 13:02:54','2026-06-04 15:26:08',50,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTpl-AnoQcTLD0Mm4DWXYZjp5xaXkiQh7ocbxp7m05f0JdNHYRjwSw-No&s=10',2),(16,'Mikate (Beignet)','mikate-beignet','Comment faire de bon beignet congolais','2026-05-26 08:51:16','2026-06-04 15:19:15',80,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZeHiTBieD8kA6voxmJnsotB0N3awGDgkI96jqyRO9YcryJmj550WjnKk&s=10',1),(18,'Durum Pita','durum-pita','Comment faire un durum pita','2026-05-26 11:18:14','2026-06-04 15:23:01',25,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQq3-Uf7jyMB-15dR5Ochkb4Z5KMghrOb4_sZBJy6seALRmZOOQ_2f89Aku&s=10',2),(24,'Sushi saumon','sushi-saumon','Comment faire un sushi (un seul) au saumon','2026-06-04 14:16:08','2026-06-04 14:16:08',18,'https://resize.elle.fr/original/var/plain_site/storage/images/elle-a-table/recettes-de-cuisine/sushis-et-makis-de-thon-et-saumon-920672/12002898-2-fre-FR/Sushis-et-makis-de-thon-et-saumon.jpg',1),(25,'Recette d\'un inconnu 36','recette-d-un-inconnu-36','Comment faire une recette d\'un connu','2026-06-04 14:52:50','2026-06-08 09:48:07',15,'https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg',2),(26,'Omelette au Fromage 5','omelette-au-fromage-5','lmkjkhsqjfjqhksfjlqsjhkfjlqsjkhfjlqsklf','2026-06-08 09:46:41','2026-06-08 09:46:41',12,'https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg',1);
/*!40000 ALTER TABLE `recipes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(180) NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_IDENTIFIER_EMAIL` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'jamesbond@cfitech.be','[]','$2y$13$hp630KI.PmUnASkdwmWVtekFyGk69vN0IGwSqQC5E4A0u8ApFboiG','James','Bond','2026-06-08 11:26:48','2026-06-08 11:26:48'),(2,'julien@cfitech.be','[]','$2y$13$vX6QET7FQy/vIxYYKdgbR.48sDIegSDFv.Z82HhMjVJJo/VyrYkOm','Julien','Dunia','2026-06-08 11:30:32','2026-06-08 11:30:32');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-10 11:20:37
