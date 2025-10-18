-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: cinemadb
-- ------------------------------------------------------
-- Server version	8.0.41

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `attore`
--

DROP TABLE IF EXISTS `attore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attore` (
  `Id_attore` int NOT NULL,
  `NomeFilm` varchar(45) NOT NULL,
  `NomeAttore` varchar(45) NOT NULL,
  PRIMARY KEY (`Id_attore`),
  KEY `FIlm_idx` (`NomeFilm`),
  CONSTRAINT `Film` FOREIGN KEY (`NomeFilm`) REFERENCES `film` (`NomeFIlm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attore`
--

LOCK TABLES `attore` WRITE;
/*!40000 ALTER TABLE `attore` DISABLE KEYS */;
INSERT INTO `attore` VALUES (1,'Avatar','Zoe Saldana'),(2,'Dragon Trainer','Jay Baruchel'),(3,'F1','Joseph Kosinski'),(4,'I Fantastici Quattro','Chris Evans'),(5,'Jurassic World','Chris Pratt'),(6,'LeIene','Veronica Gentili'),(7,'Presence','Callina Liang'),(8,'SuperMan','David Corenswet'),(9,'Titanic','Leonardo Di Caprio');
/*!40000 ALTER TABLE `attore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `film`
--

DROP TABLE IF EXISTS `film`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `film` (
  `NomeFIlm` varchar(45) NOT NULL,
  `Durata` varchar(45) NOT NULL,
  `CasaCinematografica` varchar(45) NOT NULL,
  PRIMARY KEY (`NomeFIlm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film`
--

LOCK TABLES `film` WRITE;
/*!40000 ALTER TABLE `film` DISABLE KEYS */;
INSERT INTO `film` VALUES ('Avatar','3:00:00','20th Century Studios'),('Dragon Trainer','02:05:00',' DreamWorks Animation'),('F1','02:35:00',' Plan B Entertainment'),('I Fantastici Quattro','2:10:00','Marvel Studios'),('Jurassic World','02:13:00','Universal Pictures'),('LeIene','01:40:00','Live America Inc'),('Presence','01:25:00','Sugar23'),('SuperMan','02:15:00','DC Studios'),('Titanic','03:00:00','20th Century Studios');
/*!40000 ALTER TABLE `film` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posto`
--

DROP TABLE IF EXISTS `posto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posto` (
  `FilaPosto` char(1) NOT NULL,
  `NumeroPosto` int NOT NULL,
  `NumeroSala` int NOT NULL,
  PRIMARY KEY (`FilaPosto`,`NumeroPosto`),
  KEY `Sala_idx` (`NumeroSala`),
  CONSTRAINT `Sala` FOREIGN KEY (`NumeroSala`) REFERENCES `sala` (`NumeroSala`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posto`
--

LOCK TABLES `posto` WRITE;
/*!40000 ALTER TABLE `posto` DISABLE KEYS */;
INSERT INTO `posto` VALUES ('A',1,1),('A',2,2),('B',6,3),('K',1,3),('O',2,3),('G',1,4),('H',1,5);
/*!40000 ALTER TABLE `posto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prenotazione`
--

DROP TABLE IF EXISTS `prenotazione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prenotazione` (
  `CodicePrenotazione` varchar(45) NOT NULL,
  `Id_Utente` int NOT NULL,
  `FilaPosto` char(1) NOT NULL,
  `NumeroPosto` int NOT NULL,
  `Id_Proiezione` int NOT NULL,
  `Stato` enum('in attesa','confermata','annullata','scaduta') NOT NULL,
  `DataOraCreazione` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`CodicePrenotazione`),
  KEY `Posto_idx` (`FilaPosto`,`NumeroPosto`),
  KEY `utente_idx` (`Id_Utente`),
  KEY `proiezione_idx` (`Id_Proiezione`),
  CONSTRAINT `Posto` FOREIGN KEY (`FilaPosto`, `NumeroPosto`) REFERENCES `posto` (`FilaPosto`, `NumeroPosto`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Proiezione` FOREIGN KEY (`Id_Proiezione`) REFERENCES `proiezione` (`Id_Proiezione`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Utente` FOREIGN KEY (`Id_Utente`) REFERENCES `utente` (`id_Utente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prenotazione`
--

LOCK TABLES `prenotazione` WRITE;
/*!40000 ALTER TABLE `prenotazione` DISABLE KEYS */;
INSERT INTO `prenotazione` VALUES ('121910e5-794c-11f0-a961-6c02e057bf64',2,'A',2,3,'annullata','2025-08-14 22:19:50'),('4642d334-794a-11f0-a961-6c02e057bf64',7,'O',2,5,'confermata','2025-08-14 22:06:58'),('558836b0-794d-11f0-a961-6c02e057bf64',3,'B',6,9,'annullata','2025-08-14 22:28:54'),('6a1e5dda-7949-11f0-a961-6c02e057bf64',5,'B',6,5,'scaduta','2025-08-14 22:01:06'),('8261c1fc-794a-11f0-a961-6c02e057bf64',8,'G',1,7,'confermata','2025-08-14 22:08:34'),('ceb73e0e-794a-11f0-a961-6c02e057bf64',9,'H',1,4,'confermata','2025-08-14 22:10:46'),('d46d35be-7949-11f0-a961-6c02e057bf64',6,'K',1,9,'confermata','2025-08-14 22:03:08'),('d79fc51f-794b-11f0-a961-6c02e057bf64',1,'A',1,1,'confermata','2025-08-14 22:18:10');
/*!40000 ALTER TABLE `prenotazione` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `check_Prenotazione_Utente` BEFORE INSERT ON `prenotazione` FOR EACH ROW BEGIN
  DECLARE totale_posti INT;
  DECLARE prenotazioni_attuali INT;
  DECLARE num_prenotazioni_utente INT;

  -- Calcolo dei posti totali nella sala per la proiezione
  SELECT COUNT(*) INTO totale_posti
  FROM posto
  WHERE NumeroSala = 
    (SELECT NumeroSala
    FROM proiezione
    WHERE Id_proiezione = NEW.Id_Proiezione
  );

  -- Calcolo delle prenotazioni già effettuate per la stessa proiezione
  SELECT COUNT(*) INTO prenotazioni_attuali
  FROM prenotazione
  WHERE Id_Proiezione = NEW.Id_Proiezione;

  -- Blocco se i posti sono terminati
  IF prenotazioni_attuali >= totale_posti THEN
    SIGNAL SQLSTATE '45001'
    SET MESSAGE_TEXT = 'Posti esauriti per questa proiezione';
  END IF;

  -- Verifica se l'utente ha già una prenotazione per la stessa proiezione
  SELECT COUNT(*) INTO num_prenotazioni_utente
  FROM prenotazione
  WHERE Id_Proiezione = NEW.Id_Proiezione
    AND Id_Utente = NEW.Id_Utente;

  IF num_prenotazioni_utente > 0 THEN
    SIGNAL SQLSTATE '45001'
    SET MESSAGE_TEXT = 'Utente ha già una prenotazione per questa proiezione';
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `proiezione`
--

DROP TABLE IF EXISTS `proiezione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proiezione` (
  `Id_Proiezione` int NOT NULL AUTO_INCREMENT,
  `NomeFilm` varchar(45) NOT NULL,
  `NumeroSala` int NOT NULL,
  `Costo` float NOT NULL,
  `Orario` time NOT NULL,
  `Data` date NOT NULL,
  PRIMARY KEY (`Id_Proiezione`),
  KEY `fim_idx` (`NomeFilm`),
  CONSTRAINT `Film2` FOREIGN KEY (`NomeFilm`) REFERENCES `film` (`NomeFIlm`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proiezione`
--

LOCK TABLES `proiezione` WRITE;
/*!40000 ALTER TABLE `proiezione` DISABLE KEYS */;
INSERT INTO `proiezione` VALUES (1,'Avatar',1,10,'21:30:00','2026-10-20'),(2,'Avatar',3,10,'21:00:00','2026-09-09'),(3,'F1',2,10,'23:30:00','2026-09-09'),(4,'Titanic',5,9,'20:00:00','2026-10-10'),(5,'Dragon Trainer',3,11,'19:00:00','2026-09-22'),(6,'Jurassic World',1,10,'19:30:00','2026-09-13'),(7,'LeIene',4,9,'19:00:00','2026-11-12'),(8,'SuperMan',2,8,'17:00:00','2026-10-20'),(9,'Presence ',3,7,'23:00:00','2026-09-22'),(10,'I Fantastici Quattro',1,5,'14:00:00','2026-10-09'),(11,'F1',2,10,'21:00:00','2025-09-08');
/*!40000 ALTER TABLE `proiezione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sala`
--

DROP TABLE IF EXISTS `sala`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sala` (
  `NumeroSala` int NOT NULL,
  PRIMARY KEY (`NumeroSala`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sala`
--

LOCK TABLES `sala` WRITE;
/*!40000 ALTER TABLE `sala` DISABLE KEYS */;
INSERT INTO `sala` VALUES (1),(2),(3),(4),(5);
/*!40000 ALTER TABLE `sala` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utente`
--

DROP TABLE IF EXISTS `utente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utente` (
  `id_Utente` int NOT NULL,
  `Nome` varchar(45) NOT NULL,
  `Cognome` varchar(45) NOT NULL,
  `DataScadenza` varchar(10) NOT NULL,
  `Numero` varchar(20) DEFAULT NULL,
  `CVV` int NOT NULL,
  PRIMARY KEY (`id_Utente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utente`
--

LOCK TABLES `utente` WRITE;
/*!40000 ALTER TABLE `utente` DISABLE KEYS */;
INSERT INTO `utente` VALUES (1,'Davide','Rossi','2030-02','34321',497),(2,'Mario','Verdi','2027-09','23453',433),(3,'Federico ','Rossi','2028-08','23456',233),(4,'Matteo','Rossi','2029-10','23454',322),(5,'Sara','Neri','2030-06','5432',777),(6,'Erasmo','Bianchi','2030-10','34345',466),(7,'Mirko','Paoluzzi','2032-06','234543',878),(8,'Simone','Marra','2028-11','3264',655),(9,'Sara','Debori','2030-09','234565',322);
/*!40000 ALTER TABLE `utente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utenti`
--

DROP TABLE IF EXISTS `utenti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utenti` (
  `username` varchar(45) NOT NULL,
  `password` char(32) NOT NULL,
  `ruoli` enum('amministratore','utente') NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utenti`
--

LOCK TABLES `utenti` WRITE;
/*!40000 ALTER TABLE `utenti` DISABLE KEYS */;
INSERT INTO `utenti` VALUES ('giuseppeverdi','bdc87b9c894da5168059e00ebffb9077','amministratore'),('mariorossi','482c811da5d5b4bc6d497ffa98491e38','utente');
/*!40000 ALTER TABLE `utenti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'cinemadb'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `scadenza_prenotazioni` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `scadenza_prenotazioni` ON SCHEDULE EVERY 1 MINUTE STARTS '2025-08-11 13:35:24' ON COMPLETION PRESERVE ENABLE COMMENT 'Scade prenotazioni in attesa più vecchie di 10 minuti' DO UPDATE prenotazione
  SET Stato = 'scaduta'
  WHERE Stato = 'in attesa'
    AND DataOraCreazione < NOW() - INTERVAL 10 MINUTE */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'cinemadb'
--
/*!50003 DROP PROCEDURE IF EXISTS `annulla_prenotazione` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `annulla_prenotazione`(IN codice CHAR(50))
BEGIN
  DECLARE proiezione_ora DATETIME;

  SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;


  START TRANSACTION;

  -- Controlla l'orario di inizio della proiezione collegata
  SELECT p.orario
  INTO proiezione_ora
  FROM prenotazione pr
  JOIN proiezione p ON pr.id_proiezione = p.id_proiezione
  WHERE pr.codiceprenotazione = codice;

  -- Se la proiezione inizia entro 30 minuti, blocca l'annullamento
  IF TIMESTAMPDIFF(MINUTE, NOW(), proiezione_ora) < 30 THEN
    -- Rollback in caso di vincolo violato
    ROLLBACK;
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Impossibile annullare: mancano meno di 30 minuti all\'inizio.';
  ELSE
    -- Aggiorna lo stato della prenotazione
    UPDATE prenotazione
    SET stato = 'annullata'
    WHERE codiceprenotazione = codice;

    -- Conferma la transazione
    COMMIT;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `confermaPrenotazione` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `confermaPrenotazione`(
    IN p_FilaPosto VARCHAR(10),
    IN p_NumeroPosto INT,
    IN p_IdProiezione VARCHAR(20),
    IN p_IdUtente VARCHAR(20),
    IN p_NumeroCarta VARCHAR(20),
    IN p_Nome VARCHAR(50),
    IN p_Cognome VARCHAR(50),
    IN p_DataScadenza VARCHAR(7),
    IN p_CVV INT,
    OUT p_CodicePrenotazione VARCHAR(36)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
    START TRANSACTION;

    -- genera UUID per codice prenotazione
    SET p_CodicePrenotazione = UUID();

    -- inserisci o aggiorna i dati nella tabella utente
    INSERT INTO utente (id_Utente, Nome, Cognome, DataScadenza, Numero, CVV)
    VALUES (p_IdUtente, p_Nome, p_Cognome, p_DataScadenza, p_NumeroCarta, p_CVV)
    ON DUPLICATE KEY UPDATE
        Nome = VALUES(Nome),
        Cognome = VALUES(Cognome),
        DataScadenza = VALUES(DataScadenza),
        Numero = VALUES(Numero),
        CVV = VALUES(CVV);

    -- aggiorna prenotazione con codice e stato confermato
    UPDATE prenotazione
    SET Stato = 'confermata',
        CodicePrenotazione = p_CodicePrenotazione
    WHERE FilaPosto = p_FilaPosto
      AND NumeroPosto = p_NumeroPosto
      AND Id_Proiezione = p_IdProiezione
      AND Id_Utente = p_IdUtente
      AND Stato = 'in attesa';

    IF ROW_COUNT() = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Prenotazione non trovata o già confermata/scaduta';
    END IF;

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `inserisci_proiezione` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `inserisci_proiezione`(
    IN p_NomeFilm VARCHAR(255),
    IN p_NumeroSala INT,
    IN p_Data DATE,
    IN p_Orario TIME,
    IN p_Costo DECIMAL(10,2)
)
BEGIN
    DECLARE v_Durata TIME;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    -- Prendi la durata del film
    SELECT Durata INTO v_Durata
    FROM film
    WHERE NomeFilm = p_NomeFilm;

    IF v_Durata IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Errore: Film non trovato!';
    END IF;

    -- Controllo sovrapposizione
    IF EXISTS (
        SELECT 1
        FROM proiezione
        WHERE NumeroSala = p_NumeroSala
          AND Data = p_Data
          AND (
            p_Orario < ADDTIME(Orario, v_Durata)
            AND ADDTIME(p_Orario, v_Durata) > Orario
          )
    ) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Errore: La sala è già occupata in questo orario!';
    END IF;

    START TRANSACTION;

    INSERT INTO proiezione (NomeFilm, NumeroSala, Data, Orario, Costo)
    VALUES (p_NomeFilm, p_NumeroSala, p_Data, p_Orario, p_Costo);

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `login`(in var_username varchar(45), in var_pass varchar(45), out var_role INT)
BEGIN
declare var_user_role ENUM('amministratore', 'utente');
select `ruoli` from `Utenti`
where `username` = var_username
and `password` = md5(var_pass)
into var_user_role;
-- See the corresponding enum in the client
if var_user_role = 'amministratore' then
set var_role = 1;
elseif var_user_role = 'utente' then
set var_role = 2;
else
set var_role = 3;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `prenotaPostoInAttesa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `prenotaPostoInAttesa`(
    IN p_FilaPosto VARCHAR(10),
    IN p_NumeroPosto INT,
    IN p_IdProiezione VARCHAR(20),
    IN p_IdUtente VARCHAR(20)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
    START TRANSACTION;

    -- verifica se posto già prenotato in stato diverso da 'scaduta' o 'annullata'
    IF EXISTS (
        SELECT 1 FROM prenotazione
        WHERE FilaPosto = p_FilaPosto
          AND NumeroPosto = p_NumeroPosto
          AND Id_Proiezione = p_IdProiezione
          AND Stato IN ('in attesa', 'confermata')
    ) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Posto già prenotato o bloccato';
    ELSE
        INSERT INTO prenotazione 
          (CodicePrenotazione, Id_Utente, FilaPosto, NumeroPosto, Id_Proiezione, Stato, DataOraCreazione)
        VALUES 
          (UUID(), p_IdUtente, p_FilaPosto, p_NumeroPosto, p_IdProiezione, 'in attesa', NOW());
    END IF;

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `report_prenotazioni` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `report_prenotazioni`()
BEGIN
    SELECT 
        s.NumeroSala as NumeroSala,
        COUNT(CASE WHEN p.Stato = 'confermata' THEN 1 END) AS Prenotazioni_Confermate,
        COUNT(CASE WHEN p.Stato = 'annullata' THEN 1 END) AS Prenotazioni_Annullate
    FROM 
        sala s
    LEFT JOIN 
        proiezione pr ON s.NumeroSala = pr.NumeroSala
    LEFT JOIN 
        prenotazione p ON pr.Id_Proiezione = p.Id_Proiezione
    GROUP BY 
        s.NumeroSala;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `visualizzaListaFilm` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `visualizzaListaFilm`()
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
    SET TRANSACTION READ ONLY;

    START TRANSACTION;

    SELECT NomeFilm, Durata, CasaCinematografica FROM film;

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

GRANT USAGE ON *.* TO login;
DROP USER login;
CREATE USER 'login' IDENTIFIED BY 'password';
GRANT EXECUTE ON procedure `cinemadb`.`login` TO 'login';


GRANT USAGE ON *.* TO utente;
DROP USER utente;
CREATE USER 'utente' IDENTIFIED BY 'utente';
GRANT EXECUTE ON procedure `cinemadb`.`prenotaPostoInAttesa` TO 'utente';
GRANT EXECUTE ON procedure `cinemadb`.`confermaPrenotazione` TO 'utente';
GRANT EXECUTE ON procedure `cinemadb`.`annulla_prenotazione` TO 'utente';
GRANT EXECUTE ON procedure `cinemadb`.`visualizzaListafilm` TO 'utente';


GRANT USAGE ON *.* TO amministratore;
DROP USER amministratore;
CREATE USER 'amministratore' IDENTIFIED BY 'amministratore';

GRANT EXECUTE ON procedure `cinemadb`.`report_prenotazioni` TO 'amministratore';
GRANT EXECUTE ON procedure `cinemadb`.`inserisci_proiezione` TO 'amministratore';

-- Dump completed on 2025-08-14 23:34:39
