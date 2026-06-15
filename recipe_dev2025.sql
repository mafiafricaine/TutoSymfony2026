-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: recipe_dev2025
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
  `version` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctrine_migration_versions`
--

LOCK TABLES `doctrine_migration_versions` WRITE;
/*!40000 ALTER TABLE `doctrine_migration_versions` DISABLE KEYS */;
INSERT INTO `doctrine_migration_versions` VALUES ('DoctrineMigrations\\Version20250422072937','2025-04-22 07:55:26',71),('DoctrineMigrations\\Version20250422084527','2025-04-22 08:46:56',34),('DoctrineMigrations\\Version20250611075619','2025-06-11 09:59:20',91),('DoctrineMigrations\\Version20250611095857','2025-06-11 11:59:34',105),('DoctrineMigrations\\Version20250613072459','2025-06-13 09:26:32',152),('DoctrineMigrations\\Version20250616072311','2025-06-16 09:24:49',165),('DoctrineMigrations\\Version20250616073100','2025-06-16 09:31:27',160),('DoctrineMigrations\\Version20250620074435','2025-06-20 09:47:42',347),('DoctrineMigrations\\Version20250630085219','2025-06-30 10:54:26',429),('DoctrineMigrations\\Version20250707070337','2025-07-07 09:04:49',122),('DoctrineMigrations\\Version20250707083437','2025-07-07 10:35:52',147);
/*!40000 ALTER TABLE `doctrine_migration_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipes`
--

DROP TABLE IF EXISTS `recipes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` int DEFAULT NULL,
  `image_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `updated_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `image_size` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_A369E2B52B36786B` (`title`),
  KEY `IDX_A369E2B5A76ED395` (`user_id`),
  CONSTRAINT `FK_A369E2B5A76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipes`
--

LOCK TABLES `recipes` WRITE;
/*!40000 ALTER TABLE `recipes` DISABLE KEYS */;
INSERT INTO `recipes` VALUES (1,1,'Poulet Mayo','poulet-mayo','Du poulet et de la mayonnaise, la base pour moi. Le bon poulet rôti du dimanche accompagné de pommes de terre mais aujourd\'hui je vais vous parler d\'une tout autre version. Le poulet mayo de la RDC qui est très populaire et qui a vu le jour il y a une dizaine d\'années à peine dans les bars et les rues de Kinshasa.\r\n \r\nLe poulet mayo est tout simplement du poulet cuit au feu de bois, qui va ensuite être emballé dans du papier (en papillote) et cuit à l\'étouffé avec des oignons, poivrons. On va ensuite l\'enrober généreusement de mayonnaise.\r\nLe poulet mayo a prit une place importante dans la street food congolaise au même titre que les kamundele (brochettes), le dibi congolais version chèvre avec le ntaba. .. On parle de street food et de plat conviviaux qui sont généralement cuits en barbecue mais voici une version au four hyper simple à réaliser. J\'ai hâte de démarrer la saison des barbecues pour tester la version braisé au charbon de bois qui est juste dingue.\r\n\r\nC\'est proposé avec des bananes plantains (makemba) mais aussi avec de la chikwangue (bâton de manioc). La chikwangue est une racine/feuille de manioc écrasée et cuite entouré d\'une feuille.\r\nIngrédients pour 4 personnes\r\n1 poulet entier\r\n\r\n4 c.à s. d\'huile d\'olive\r\n\r\n1 c.à s. de gingembre en poudre\r\n\r\nSel et poivre\r\n\r\n1 c.à s. de muscade en poudre\r\n\r\n1 zestes d\'un citron vert\r\n\r\n1 c.à s. d\'épices\r\n\r\n2 poivrons\r\n\r\n1 jus d\'un citron jaune ( bio )\r\n\r\n1 oignon blanc\r\n\r\n2 branche d\'oignons verts\r\n\r\n3 c.à s. de mayonnaise\r\n\r\n\r\nÉtape 1/3\r\nPrenez votre poulet entier et coupez les parties indésirables (croupe de poulet,..). Nettoyez le poulet avec un citron jaune en frottant le citron coupé en deux sur et dans le poulet. Mettez votre poulet dans un grand récipient et ajoutez y l\'huile, le gingembre, le sel, le poivre , la muscade , l\'ail écrasé, le zeste et jus du citron vert, le mélange d\'épice pour poulet. Mélangez le tout et mettez au frigo pour minimum 4 heures voir une nuit.\r\n\r\nÉtape 2/3\r\nAprès le temps de pause, préchauffez votre four à 200 degrés sur chaleur tournante. Mettez votre poulet sur une plaque recouverte de papier sulfurisé. Faites le cuire durant une grosse demie heure voir 40 minutes.\r\n\r\nÉtape 3/3\r\nAprès ce temps de cuisson, sortez le et coupez le en morceaux. Mettez ces morceaux dans du papier sulfurisé, ajoutez y vos poivrons et oignons émincés, les jeunes oignons, le jus du citron jaune ainsi que la mayonnaise. Mélangez le tout.',60,'f82355b1fe02234d7354a522347617eb-686b888aa86c0894059526.jpg','2025-04-22 09:02:44','2025-07-07 10:42:50',113452),(2,2,'Pondu (Saka Saka)','pondu-saka-saka','Pour ceux et celles qui ne savent pas ce qu\'est le pondu, il s\'agit en fait de feuilles de manioc pilées préparées avec des aubergines, poireaux, c\'est un accompagnement très apprécié au Congo.\r\n\r\nIngrédients pour 8 personnes\r\n2 sachets de pondu\r\n\r\n1 piment\r\n\r\n1 aubergine\r\n\r\n1 poireau\r\n\r\n2 oignons blancs\r\n\r\n2 gousses d\'ail ( bio )\r\n\r\n2 cubes de bouillon de légumes\r\n\r\n1 pincée de sel\r\n\r\n200 grammes de cacahuètes ( moulues )\r\n\r\n\r\nÉtape 1/5\r\nPour commencer laisser dégeler entièrement le pondu dans un casserole. Le rincer plusieurs fois afin d’éliminer toutes les « saletés »(utiliser une passoire à très très petits trous). Une fois bien rincé à l’eau claire ajoutez un peu d\'eau et le faire cuire durant 20 minutes.\r\n\r\nÉtape 2/5\r\nEnsuite ,jetez l’eau puis remettez de l’eau propre(environ 3L) et remettez le pondu sur feu moyen(+ 1 cuillère à café de bicarbonate de soude alimentaire afin d’accélérer le temps de cuisson). Mettez y le piment (sans le percer) cuisez le tout durant 30 minutes. Ajoutez l’aubergine coupée en morceaux, les oignons émincés, l’ail râpé,le poireau émincé, le bouillon cube de légumes,et l’huile de palme/ou l’huile olive.\r\n\r\nÉtape 3/5\r\nAssaisonnez avec le sel selon vos goûts et laissez cuire au moins 2-3 heures,puis mélangez(rajoutez de l\'eau entre temps, si besoin). 20 minutes avant la fin de cuisson, rajoutez votre poudre d\'arachide ( cacahuètes que vous avez moulues au blinder et qui sont devenus une poudre). Ne mélangez pas et laissez cuire tranquillement.\r\n\r\nÉtape 4/5\r\nLe pondu doit être bien tendre et l’eau doit avoir très très bien réduit. Moi j’adore le manger avec du riz blanc. C’est un délice !\r\n\r\nÉtape 5/5\r\nBon appétit mes gourmands.',130,'vegan-saka-saka-congolese-cassava-leaf-spinach-stew-xx1-scaled-1-686b8a88ea292670902830.jpg','2025-04-22 09:09:09','2025-07-07 10:51:20',623787),(3,1,'Poulet DG (PDG)','poulet-dg-pdg','Aujourd\'hui, je vous présente une recette tout droit venue du Cameroun. C\'est leur plat national. DG veut dire directeur général. Le poulet DG est né dans les années 80 et à cette époque, il était réservé aux personnes d’une certaine importance. Depuis il est devenu accessible à tous. C’est un bon ragoût avec tout ce que j’aime dedans et en plus ce petit goût sucré-salé qu’apporte la banane plantain au plat toute la famille adore ce plat!\r\n\r\nIngrédients pour 4 personnes\r\n1 poulet entier\r\n\r\n200 grammes d\'haricots verts\r\n\r\n3 carotte\r\n\r\n2 poivrons\r\n\r\n2 gousses d\'ail\r\n\r\n3 bananes plantain jaunes\r\n\r\n1 boîte de tomate ( pelées )\r\n\r\nLaurier\r\n\r\n1 c.à s. de persil ( haché )\r\n\r\n1 c.à.c de gingembre en poudre\r\n\r\n1 cube de bouillon de poulet\r\n\r\n1 verre d\'eau\r\n\r\n2 c.à s. d\'huile d\'olive\r\n\r\nSel et poivre\r\n\r\n\r\nÉtape 1/3\r\nCoupez le poulet en plus ou moins 4 parts, si il est en entier et le nettoyer avec du citron. Mettez l’huile dans une marmite et faites frire les morceaux de poulet.\r\n\r\nÉtape 2/3\r\nPendant ce temps épluchez et coupez en fines lamelles les oignons et les poivrons. Une fois les morceaux de poulet bien doré, les retirer et réservez. Faites rissoler les oignons avec l’ail écrasé (environ 3 minutes) et lorsqu’ils deviennent translucides ajouter la boîte de tomates pelées. Laissez mijoter 5 minutes. Ajoutez les haricots verts, les poivrons et les carottes. Ajoutez le gingembre, le piment en poudre, le bouillon et les feuilles de laurier. Saler et poivrer.\r\n\r\nÉtape 3/3\r\nAjoutez le poulet, le verre d’eau et laisser mijoter environ 30 minutes. Faites frire les bananes plantain et les ajouter dans les 10 dernières minutes de cuisson. C\'est un plat complet donc il se mange comme cela. Bon appétit les gourmands.',55,'poulet-dg-from-cameroon-686b89ed510e9401518422.webp','2025-04-22 09:09:09','2025-07-07 10:48:45',157792),(4,2,'Omelette aux Fromages','omelette-aux-fromages','Prenez des œufs, cassez les et ensuite battez les en rajoutant du sel, des fromages et du poivre.',10,'omelette-1200x1626-686b8bcac1c61386696753.webp','2025-05-14 09:52:07','2025-07-07 10:56:42',311528),(8,1,'Pizza Veneziana','pizza-veneziana','Comment faire une bonne pizza',90,'pizza-oignons-doux-686b8a0be2690012238064.jpg','2025-05-26 08:25:56','2025-07-07 10:49:15',218312),(17,2,'Sushi gastronomique','sushi-gastronomique','Comment faire des sushi',70,'d74ecc58818b3272ea45f19453069def-686b8ae433b6b302881473.jpg','2025-06-04 10:49:26','2025-07-07 10:52:52',67705),(18,1,'Mikate (beignet)','mikate-beignet','Comment bien faire de bon beignet',70,'fx8buzwaqamn1bx-686b8a23d9033597108078.jpg','2025-06-04 10:57:46','2025-07-07 10:49:39',161504),(19,2,'Tilapia braisé','tilapia-braise','Comment faire un bon poisson braisé',120,'tilapia-blog7760930850055952154-686b8be04d4a6140431678.webp','2025-06-06 10:24:27','2025-07-07 10:57:04',95100),(21,1,'Poulet tandoori','poulet-tandoori','Poulet tandoori du chef',150,'04567d2d-f235-4a8e-9833-6e737ce7386c-686b8a3eca890778794739.jpg','2025-06-06 11:39:47','2025-07-07 10:50:06',83919),(24,2,'Omelette aux lardons','omelette-aux-lardons','Comment faire une omelette aux lardons',23,'pls-047-686b8c5be33c1451178580.webp','2025-06-11 10:39:28','2025-07-07 10:59:07',23090),(25,1,'Gâteau au chocolat','gateau-au-chocolat','Comment faire un excellent gâteau au chocolat qui vous fera fondre',120,'80167-w1024h1024c1cx2880cy1920cxt0cyt0cxb5760cyb3840-686b8a5738d57512013482.jpg','2025-06-18 11:42:53','2025-07-07 10:50:31',119804),(26,2,'Tiramisu (Tire moi)','tiramisu-tire-moi','Comment faire un bon tiramisu',60,'portrait-shot-of-tiramisu-cool-686b8c6c96971834494591.jpg','2025-06-20 08:50:20','2025-07-07 10:59:24',101350),(31,6,'Pizza pronto4','pizza-pronto4','qlkjsfhkjlqksfjkhjqkjlksmfljkqkjslkf',12,'No_image_available.svg','2025-07-07 11:02:57','2025-07-07 11:02:57',NULL),(32,6,'Pizza pronto54231','pizza-pronto54231','kjhkgjhfjhkjlkmlkmjhkgjhgjhkui',12,'45330731-686b97e06f699094505770.jpg','2025-07-07 11:47:45','2025-07-07 11:48:16',206715);
/*!40000 ALTER TABLE `recipes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reset_password_request`
--

DROP TABLE IF EXISTS `reset_password_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reset_password_request` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `selector` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hashed_token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `requested_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `expires_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_7CE748AA76ED395` (`user_id`),
  CONSTRAINT `FK_7CE748AA76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reset_password_request`
--

LOCK TABLES `reset_password_request` WRITE;
/*!40000 ALTER TABLE `reset_password_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `reset_password_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `updated_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `is_verified` tinyint(1) NOT NULL,
  `image_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_size` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_IDENTIFIER_EMAIL` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'jamesbond@cfitech.be','[]','$2y$13$oAwmNflH/JoY8UKQ2/5ISeZipZIgdoy31d7aiceh7ZqNhtxty865q','James','Bond','2025-06-16 09:11:45','2025-07-07 09:45:40',1,'james-bond-sean-connery-686b7b2400497561624279.jpg',24872),(2,'julien@cfitech.be','[]','$2y$13$TYGH5GVh9LfoARz66E19vuaIDkv7O2JY0lUAQc/cec9YvYql36EMS','Julien','Dunia','2025-06-16 09:14:40','2025-08-27 09:03:46',1,'69199235-af-68aeadd2cca43742317366.webp',82524),(3,'julien1@cfitech.be','[]','$2y$13$qEW3zrZuQR12yweTR.4Q2.13x6/MUSk3JsMJGQ.7rjABxtg2NEQ.e','Julien','Dunia','2025-06-20 11:24:12','2025-06-20 11:24:12',0,NULL,NULL),(4,'mariobros@cfitech.be','[]','$2y$13$9eyyl0jrwBegGxo95UWTH.iq3L1JQg0Zmf/s3rU8kex8M0ie3sAn2','Mario','Bros','2025-06-23 09:58:09','2025-06-23 09:58:09',0,NULL,NULL),(5,'debruyne@cfitech.be','[]','$2y$13$u0/hrWvvYd3gQA9/CrM1jOAoxaJB5haY3y1sFGgUERUUYDmbxCamC','Kevin','DeBruyne','2025-06-23 11:11:18','2025-06-23 11:11:18',0,NULL,NULL),(6,'laracroft@cfitech.be','[]','$2y$13$CxB6DADBMoy9Z7QIQKOIWu7VZurj8KC2hI2zQwr9/mPq93muJXpia','Lara','Croft','2025-06-23 11:13:55','2025-07-07 11:01:18',1,'69199235-af-686b8cde0d033639467235.webp',82524),(7,'laracroft2@cfitech.be','[]','$2y$13$Z8fN6NRgQOYgew4AVf9SjOEp95I77BKxwK6j20NzdkMpynwZ3y4na','Lara','Croft','2025-06-23 11:32:00','2025-06-23 11:32:00',0,NULL,NULL),(8,'laracroft3@cfitech.be','[]','$2y$13$If.y4He1IcEYMd2X.hOTzOCv1h5RO3pnEBvlM5kIzZclRChANBJO.','Lara','Croft','2025-06-23 11:40:01','2025-06-23 11:40:01',1,NULL,NULL),(9,'laracroft4@cfitech.be','[]','$2y$13$lU8rItxAkynSjtwGiwGqW.FXEFJtqlsTaBh.UOKqXZ.gJ9rEiKwwS','Lara','Croft','2025-06-27 09:21:40','2025-06-27 09:21:40',0,NULL,NULL),(10,'laracroft5@cfitech.be','[]','$2y$13$zvBhO309mbqcfyvJ2HmISeLfUyPFJE0qe1AS8RxBF0szlFNF2iRXe','Lara','Croft','2025-07-07 09:56:36','2025-07-07 09:59:50',1,'69199235-af-686b7e7691d3a071302876.webp',82524),(11,'laracroft6@cfitech.be','[]','$2y$13$nVNcKO2sDZa1fh3IlyL50eum/WHiH9YxFFPT4Mb1npXaU/Ov32o62','Lara','Croft','2025-07-07 10:04:00','2025-07-07 10:04:00',0,'profile.jpeg',NULL),(27,'vendredi@cfitech.be','[]','$2y$13$rxQhCCV7yQqLgLSMsgyqPeTvhkTB/mlRx7xpZnNVSgIjzJxqgjfqu','Vendredi','Vendredi','2025-09-15 11:33:08','2025-09-15 11:33:08',1,'profile.jpeg',NULL),(28,'samedi@cfitech.be','[]','$2y$13$RgnnW/YruhYQW3jVn2dtiuPkHN7oW9gpLz5frJmOLlQojlrcZkz..','Samedi','Samedi','2025-09-15 11:33:10','2025-09-15 11:33:10',1,'profile.jpeg',NULL),(30,'thanos@cfitech.be','[\"ROLE_ADMIN\"]','$2y$13$GhB.F93F5DEPtlytB//74O64zUkZM4S8b/qSySwJkyAOdJYt7/XeG','Thanos','Thanos','2025-09-15 11:33:15','2025-09-15 11:33:15',1,'profile.jpeg',NULL),(31,'tokens2@cfitech.be','[]','$2y$13$eNTOz2n7ImLsKoozgVmWPuTDLYeFX53CYbRa.FMANqek1.8NkfUpi','Tokens2','Tokens2','2025-09-15 11:33:18','2025-09-15 11:33:20',1,'token.jpg',NULL);
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

-- Dump completed on 2026-06-12 10:05:22
