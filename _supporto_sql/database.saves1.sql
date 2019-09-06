
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `superenalotto`
--

CREATE TABLE `utenti` (
  `user_ID` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `user_Name` varchar(75) COLLATE utf8_unicode_ci NOT NULL,
  `user_email` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `user_Pwd` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `user_Active` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`user_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `utenti_asset` (
  `user_ID` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `group_ID` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `ua_Attivo` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'S',
  `ua_PercQuota` decimal(2,1) DEFAULT '1.0',
  PRIMARY KEY (`user_ID`, `group_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- Table structure for table `concorsi`

CREATE TABLE `concorsi` (
  `conc_ID` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `conc_Data` date NOT NULL,
  `conc_Distribuita` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `conc_Archiviata` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `conc_Stato` enum('DA VALIDARE','VALIDATA') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'DA VALIDARE',
  PRIMARY KEY (`conc_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Table structure for table `asset`

CREATE TABLE `asset` (
  `group_ID` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `group_Desc` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `group_Inizio` date DEFAULT NULL,
  `group_Fine` date DEFAULT NULL,
  `group_Quote` int(11) NOT NULL,
  `group_Costo` decimal(13,2) NOT NULL,
  PRIMARY KEY(`group_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- Table structure for table `asset_combinazioni`

CREATE TABLE `asset_combinazioni` (
  `group_ID` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `comb_ID` int(11) NOT NULL,
  `comb_Num1` int(11) NOT NULL,
  `comb_Num2` int(11) NOT NULL,
  `comb_Num3` int(11) NOT NULL,
  `comb_Num4` int(11) NOT NULL,
  `comb_Num5` int(11) NOT NULL,
  `comb_Num6` int(11) NOT NULL,
  `comb_DiSistema` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`group_ID`,`comb_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Table structure for table `asset_concorsi`

CREATE TABLE `asset_concorsi` (
  `group_ID` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `gioc_ID` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `gioc_DataEstrazione` date NOT NULL,
  `gioc_Esito` enum('DA GIOCARE','GIOCATA','VINCENTE','NON VINCENTE') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'DA GIOCARE',
  `gioc_Spesa` decimal(13,2) NOT NULL DEFAULT '0.00',
  `gioc_DataGiocata` date NOT NULL DEFAULT '0000-00-00',
  `gioc_Note` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `gioc_Elaborata` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `gioc_Archiviata` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`group_ID`,`gioc_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- Table structure for table `asset_giocatepreviste`

CREATE TABLE `asset_giocatepreviste` (
  `group_ID` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `pgioc_ID` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `pgioc_Data` date NOT NULL,
  `pgioc_Spesa` decimal(13,2) NOT NULL,
  `pgioc_PrimoConc` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `pgioc_UltimoConc` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `pgioc_NumConc` int(11) NOT NULL,
  `pgioc_Attiva` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`group_ID`,`pgioc_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- Table structure for table `asset_vincite`

CREATE TABLE `asset_vincite` (
  `group_ID` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `conc_ID` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `comb_ID` int(11) NOT NULL,
  `vinc_Result` int(11) NOT NULL,
  `Vinc_Vincita` decimal(13,2) NOT NULL,
  PRIMARY KEY (`group_ID`,`conc_ID`,`comb_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- Table structure for table `asset_Scadenze`

CREATE TABLE `asset_scadenze` (
  `group_ID` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `scad_Data` date NOT NULL,
  `scad_Quota` decimal(13,2) NOT NULL,
  `scad_Processata` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`group_ID`,`scad_Data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


--
-- Table structure for table `asset_scadenze_dettaglio`
--

CREATE TABLE `asset_scadenze_dettaglio` (
  `group_ID` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `User_ID` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `scad_Data` date NOT NULL,
  `scde_Rata` decimal(13,2) NOT NULL,
  `scde_Saldato` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `scde_DataSaldo` date NOT NULL DEFAULT '0000-00-00',
  `scde_Archiviato` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`group_ID`,`User_ID`,`scad_Data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ***************************************
-- *** ADD "FOREIGN KEY"
-- ***************************************

ALTER TABLE `utenti_asset` 
    ADD CONSTRAINT fk_utenti  FOREIGN KEY (`user_ID`) REFERENCES `utenti` (`user_ID`) ON UPDATE CASCADE ON DELETE CASCADE,
    ADD CONSTRAINT fk_asset  FOREIGN KEY (`group_ID`) REFERENCES `asset` (`group_ID`) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE `asset_giocatepreviste`
    ADD CONSTRAINT fk_asset_giocatepreviste  FOREIGN KEY (`group_ID`) REFERENCES `asset` (`group_ID`) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE `asset_combinazioni`
    ADD CONSTRAINT fk_asset_combinazioni  FOREIGN KEY (`group_ID`) REFERENCES `asset` (`group_ID`) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE `asset_concorsi`
    ADD CONSTRAINT fk_con_asset  FOREIGN KEY (`group_ID`) REFERENCES `asset` (`group_ID`) ON UPDATE CASCADE ON DELETE CASCADE,
    ADD CONSTRAINT fk_con_concorsi  FOREIGN KEY (`gioc_ID`) REFERENCES `concorsi` (`conc_ID`) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE `asset_vincite`
    ADD CONSTRAINT fk_vin_asset  FOREIGN KEY (`group_ID`) REFERENCES `asset` (`group_ID`) ON UPDATE CASCADE ON DELETE CASCADE,
    ADD CONSTRAINT fk_vin_concorsi  FOREIGN KEY (`conc_ID`) REFERENCES `concorsi` (`conc_ID`) ON UPDATE CASCADE ON DELETE CASCADE,
    ADD CONSTRAINT fk_vin_combinazioni  FOREIGN KEY (`group_ID`,`comb_ID`) REFERENCES `asset_combinazioni` (`group_ID`,`comb_ID`) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TAble `asset_scadenze`
    ADD CONSTRAINT fk_sc_asset  FOREIGN KEY (`group_ID`) REFERENCES `asset` (`group_ID`) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE `asset_scadenze_dettaglio`
    ADD CONSTRAINT fk_scde_asset  FOREIGN KEY (`group_ID`) REFERENCES `asset` (`group_ID`) ON UPDATE CASCADE ON DELETE CASCADE,
    ADD CONSTRAINT fk_scde_utenti  FOREIGN KEY (`user_ID`) REFERENCES `utenti` (`user_ID`) ON UPDATE CASCADE ON DELETE CASCADE,
    ADD CONSTRAINT fk_scde_scadenze  FOREIGN KEY (`group_ID`,`scad_Data`) REFERENCES `asset_scadenze` (`group_ID`,`scad_Data`) ON UPDATE CASCADE ON DELETE CASCADE;


-- ***************************************
-- *** TRIGGERS
-- ***************************************

DELIMITER $$

CREATE TRIGGER `asset_AFTER_INSERT` AFTER INSERT ON `asset` FOR EACH ROW BEGIN
	call EseguiDistribuzioneConcorsiAsset(1);
END$$

CREATE TRIGGER `NuovaRata` AFTER INSERT ON `asset_scadenze` FOR EACH ROW BEGIN
   call SCAD_CreaDettaglioScadenze(NEW.group_ID, NEW.scad_Data, NEW.scad_Quota);
END$$

CREATE TRIGGER `ModificaRata` AFTER UPDATE ON `asset_scadenze` FOR EACH ROW BEGIN
    /*
    call RigeneraDettaglioScadenze(NEW.group_ID, NEW.scad_Data, NEW.scad_Quota);
    */
END$$

CREATE TRIGGER `EliminaRata` AFTER DELETE ON `asset_scadenze` FOR EACH ROW BEGIN
    /*call pippo(3);*/
END$$

DELIMITER ;



-- **************************************
-- *** PROCEDURES
-- **************************************

DELIMITER $$
--
-- Procedures
--
CREATE PROCEDURE `distribuisci_Concorsi`(IN `p_AssetID` VARCHAR(20), OUT `p_NumRows` INTEGER)
BEGIN
	DECLARE v_NumConcorso VARCHAR(8);
  DECLARE v_finish INTEGER DEFAULT 0;
	DECLARE v_DataEstrazione DATE;
	DECLARE v_Concorso CURSOR FOR SELECT concorsi.conc_ID,concorsi.conc_Data FROM concorsi WHERE conc_Stato='VALIDATA' ORDER BY conc_ID;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_finish = 1;
    
  set p_NumRows= 0;
	OPEN v_Concorso;
	how_many : LOOP
		FETCH v_Concorso INTO v_NumConcorso,v_DataEstrazione;
		IF v_finish = 1 THEN
            LEAVE how_many;
		END IF;
		IF v_NumConcorso NOT IN (SELECT gioc_ID FROM asset_concorsi WHERE group_ID=p_AssetID) THEN
			INSERT INTO asset_concorsi(group_id,gioc_ID,gioc_DataEstrazione)VALUES(p_AssetID,v_NumConcorso,v_DataEstrazione);
      SET p_NumRows = p_NumRows + 1;
		END IF;
	END LOOP;
	
	CLOSE v_Concorso;
END$$

CREATE PROCEDURE `EseguiDistribuzioneConcorsiAsset`(IN p_SILENTE integer)
BEGIN
	DECLARE v_finish INTEGER DEFAULT 0;
  DECLARE v_TotalRow INTEGER DEFAULT 0;
  DECLARE v_temp INTEGER;
	DECLARE v_Asset VARCHAR(8);
	DECLARE v_DataGiocata DATE;
	DECLARE v_Assets CURSOR FOR SELECT asset.group_ID FROM asset ORDER BY group_ID;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_finish = 1;
	
	OPEN v_Assets;
	how_many : LOOP
		FETCH v_Assets INTO v_Asset;
    IF v_finish = 1 THEN
      LEAVE how_many;
		END IF;
		CALL distribuisci_Concorsi(v_Asset,v_temp);
    SET v_TotalRow = v_TotalRow+ v_temp;
	END LOOP;
	
	CLOSE v_Assets;
    
    /*if p_SILENTE <> 1 then
		SELECT v_TotalRow as NumeroConcorsiDistribuiti;
	end if;*/
END$$

DELIMITER ;



-- **************************************
-- *** DATA DUMPING
-- **************************************

INSERT INTO `asset` (`group_ID`, `group_Desc`, `group_Inizio`, `group_Fine`, `group_Quote`, `group_Costo`) VALUES
('EP1', 'Default', '2019-08-01', NULL, 4, '19.00');

INSERT INTO `asset_combinazioni` (`group_ID`, `comb_ID`, `comb_Num1`, `comb_Num2`, `comb_Num3`, `comb_Num4`, `comb_Num5`, `comb_Num6`, `comb_DiSistema` ) VALUES
('EP1', 0, 0, 0, 0, 0, 0, 0, 'S'),
('EP1', 1, 4, 8, 16, 20, 66, 72, 'N'),
('EP1', 2, 20, 30, 50, 75, 87, 88, 'N'),
('EP1', 3, 16, 21, 51, 65, 73, 80, 'N'),
('EP1', 4, 6, 22, 41, 44, 54, 78, 'N'),
('EP1', 5, 8, 13, 26, 35, 66, 81, 'N'),
('EP1', 6, 6, 8, 29, 45, 58, 70, 'N'),
('EP1', 7, 13, 26, 35, 54, 80, 81, 'N'),
('EP1', 8, 21, 27, 70, 81, 86, 90, 'N'),
('EP1', 9, 16, 54, 58, 65, 70, 82, 'N'),
('EP1', 10, 20, 65, 73, 81, 82, 90, 'N'),
('EP1', 11, 22, 24, 27, 30, 58, 86, 'N'),
('EP1', 12, 9, 11, 22, 25, 26, 78, 'N'),
('EP1', 13, 44, 45, 50, 55, 87, 88, 'N'),
('EP1', 14, 16, 45, 54, 70, 75, 84, 'N'),
('EP1', 15, 45, 51, 58, 65, 75, 84, 'N'),
('EP1', 16, 15, 24, 45, 70, 73, 86, 'N'),
('EP1', 17, 11, 26, 55, 72, 84, 87, 'N'),
('EP1', 18, 27, 29, 47, 58, 70, 90, 'N'),
('EP1', 19, 1, 4, 9, 25, 79, 82, 'N');


INSERT INTO `asset_giocatepreviste` (`group_ID`, `pgioc_ID`, `pgioc_Data`, `pgioc_Spesa`, `pgioc_PrimoConc`, `pgioc_UltimoConc`, `pgioc_NumConc`, `pgioc_Attiva`) VALUES
('EP1', '2019-09', '2019-09-05', '285.00', '2019-122', '2019-136', 15, 'S');


INSERT INTO `concorsi` (`conc_ID`, `conc_Data`, `conc_Distribuita`, `conc_Archiviata`, `conc_Stato`) VALUES
('2019-001', '2019-01-03', 'N', 'N', 'VALIDATA'),
('2019-002', '2019-01-05', 'N', 'N', 'VALIDATA'),
('2019-003', '2019-01-07', 'N', 'N', 'VALIDATA'),
('2019-004', '2019-01-08', 'N', 'N', 'VALIDATA'),
('2019-005', '2019-01-10', 'N', 'N', 'VALIDATA'),
('2019-006', '2019-01-12', 'N', 'N', 'VALIDATA'),
('2019-007', '2019-01-15', 'N', 'N', 'VALIDATA'),
('2019-008', '2019-01-17', 'N', 'N', 'VALIDATA'),
('2019-009', '2019-01-19', 'N', 'N', 'VALIDATA'),
('2019-010', '2019-01-22', 'N', 'N', 'VALIDATA'),
('2019-011', '2019-01-24', 'N', 'N', 'VALIDATA'),
('2019-012', '2019-01-26', 'N', 'N', 'VALIDATA'),
('2019-013', '2019-01-29', 'N', 'N', 'VALIDATA'),
('2019-014', '2019-01-31', 'N', 'N', 'VALIDATA'),
('2019-015', '2019-02-02', 'N', 'N', 'VALIDATA'),
('2019-016', '2019-02-05', 'N', 'N', 'VALIDATA'),
('2019-017', '2019-02-07', 'N', 'N', 'VALIDATA'),
('2019-018', '2019-02-09', 'N', 'N', 'VALIDATA'),
('2019-019', '2019-02-12', 'N', 'N', 'VALIDATA'),
('2019-020', '2019-02-14', 'N', 'N', 'VALIDATA'),
('2019-021', '2019-02-16', 'N', 'N', 'VALIDATA'),
('2019-022', '2019-02-19', 'N', 'N', 'VALIDATA'),
('2019-023', '2019-02-21', 'N', 'N', 'VALIDATA'),
('2019-024', '2019-02-23', 'N', 'N', 'VALIDATA'),
('2019-025', '2019-02-26', 'N', 'N', 'VALIDATA'),
('2019-026', '2019-02-28', 'N', 'N', 'VALIDATA'),
('2019-027', '2019-03-02', 'N', 'N', 'VALIDATA'),
('2019-028', '2019-03-05', 'N', 'N', 'VALIDATA'),
('2019-029', '2019-03-07', 'N', 'N', 'VALIDATA'),
('2019-030', '2019-03-09', 'N', 'N', 'VALIDATA'),
('2019-031', '2019-03-12', 'N', 'N', 'VALIDATA'),
('2019-032', '2019-03-14', 'N', 'N', 'VALIDATA'),
('2019-033', '2019-03-16', 'N', 'N', 'VALIDATA'),
('2019-034', '2019-03-19', 'N', 'N', 'VALIDATA'),
('2019-035', '2019-03-21', 'N', 'N', 'VALIDATA'),
('2019-036', '2019-03-23', 'N', 'N', 'VALIDATA'),
('2019-037', '2019-03-26', 'N', 'N', 'VALIDATA'),
('2019-038', '2019-03-28', 'N', 'N', 'VALIDATA'),
('2019-039', '2019-03-30', 'N', 'N', 'VALIDATA'),
('2019-040', '2019-04-02', 'N', 'N', 'VALIDATA'),
('2019-041', '2019-04-04', 'N', 'N', 'VALIDATA'),
('2019-042', '2019-04-06', 'N', 'N', 'VALIDATA'),
('2019-043', '2019-04-09', 'N', 'N', 'VALIDATA'),
('2019-044', '2019-04-11', 'N', 'N', 'VALIDATA'),
('2019-045', '2019-04-13', 'N', 'N', 'VALIDATA'),
('2019-046', '2019-04-16', 'N', 'N', 'VALIDATA'),
('2019-047', '2019-04-18', 'N', 'N', 'VALIDATA'),
('2019-048', '2019-04-20', 'N', 'N', 'VALIDATA'),
('2019-049', '2019-04-23', 'N', 'N', 'VALIDATA'),
('2019-050', '2019-04-27', 'N', 'N', 'VALIDATA'),
('2019-051', '2019-04-29', 'N', 'N', 'VALIDATA'),
('2019-052', '2019-04-30', 'N', 'N', 'VALIDATA'),
('2019-053', '2019-05-02', 'N', 'N', 'VALIDATA'),
('2019-054', '2019-05-04', 'N', 'N', 'VALIDATA'),
('2019-055', '2019-05-07', 'N', 'N', 'VALIDATA'),
('2019-056', '2019-05-09', 'N', 'N', 'VALIDATA'),
('2019-057', '2019-05-11', 'N', 'N', 'VALIDATA'),
('2019-058', '2019-05-14', 'N', 'N', 'VALIDATA'),
('2019-059', '2019-05-16', 'N', 'N', 'VALIDATA'),
('2019-060', '2019-05-18', 'N', 'N', 'VALIDATA'),
('2019-061', '2019-05-21', 'N', 'N', 'VALIDATA'),
('2019-062', '2019-05-23', 'N', 'N', 'VALIDATA'),
('2019-063', '2019-05-25', 'N', 'N', 'VALIDATA'),
('2019-064', '2019-05-28', 'N', 'N', 'VALIDATA'),
('2019-065', '2019-05-30', 'N', 'N', 'VALIDATA'),
('2019-066', '2019-06-01', 'N', 'N', 'VALIDATA'),
('2019-067', '2019-06-04', 'N', 'N', 'VALIDATA'),
('2019-068', '2019-06-06', 'N', 'N', 'VALIDATA'),
('2019-069', '2019-06-08', 'N', 'N', 'VALIDATA'),
('2019-070', '2019-06-11', 'N', 'N', 'VALIDATA'),
('2019-071', '2019-06-13', 'N', 'N', 'VALIDATA'),
('2019-072', '2019-06-15', 'N', 'N', 'VALIDATA'),
('2019-073', '2019-06-18', 'N', 'N', 'VALIDATA'),
('2019-074', '2019-06-20', 'N', 'N', 'VALIDATA'),
('2019-075', '2019-06-22', 'N', 'N', 'VALIDATA'),
('2019-076', '2019-06-25', 'N', 'N', 'VALIDATA'),
('2019-077', '2019-06-27', 'N', 'N', 'VALIDATA'),
('2019-078', '2019-06-29', 'N', 'N', 'VALIDATA'),
('2019-079', '2019-07-02', 'N', 'N', 'VALIDATA'),
('2019-080', '2019-07-04', 'N', 'N', 'VALIDATA'),
('2019-081', '2019-07-06', 'N', 'N', 'VALIDATA'),
('2019-082', '2019-07-09', 'N', 'N', 'VALIDATA'),
('2019-083', '2019-07-11', 'N', 'N', 'VALIDATA'),
('2019-084', '2019-07-13', 'N', 'N', 'VALIDATA'),
('2019-085', '2019-07-16', 'N', 'N', 'VALIDATA'),
('2019-086', '2019-07-18', 'N', 'N', 'VALIDATA'),
('2019-087', '2019-07-20', 'N', 'N', 'VALIDATA'),
('2019-088', '2019-07-23', 'N', 'N', 'VALIDATA'),
('2019-089', '2019-07-25', 'N', 'N', 'VALIDATA'),
('2019-090', '2019-07-27', 'N', 'N', 'VALIDATA'),
('2019-091', '2019-07-30', 'N', 'N', 'VALIDATA'),
('2019-092', '2019-08-01', 'N', 'N', 'VALIDATA'),
('2019-093', '2019-08-03', 'N', 'N', 'VALIDATA'),
('2019-094', '2019-08-06', 'N', 'N', 'VALIDATA'),
('2019-095', '2019-08-08', 'N', 'N', 'VALIDATA'),
('2019-096', '2019-08-10', 'N', 'N', 'VALIDATA'),
('2019-097', '2019-08-13', 'N', 'N', 'VALIDATA'),
('2019-098', '2019-08-17', 'N', 'N', 'VALIDATA'),
('2019-099', '2019-08-19', 'N', 'N', 'VALIDATA'),
('2019-100', '2019-08-20', 'N', 'N', 'VALIDATA'),
('2019-101', '2019-08-22', 'N', 'N', 'VALIDATA'),
('2019-102', '2019-08-24', 'N', 'N', 'VALIDATA'),
('2019-103', '2019-08-27', 'N', 'N', 'VALIDATA'),
('2019-104', '2019-08-29', 'N', 'N', 'VALIDATA'),
('2019-105', '2019-08-31', 'N', 'N', 'VALIDATA'),
('2019-106', '2019-09-03', 'N', 'N', 'VALIDATA'),
('2019-107', '2019-09-05', 'N', 'N', 'VALIDATA'),
('2019-108', '2019-09-07', 'N', 'N', 'VALIDATA'),
('2019-109', '2019-09-10', 'N', 'N', 'VALIDATA'),
('2019-110', '2019-09-12', 'N', 'N', 'VALIDATA'),
('2019-111', '2019-09-14', 'N', 'N', 'DA VALIDARE'),
('2019-112', '2019-09-17', 'N', 'N', 'DA VALIDARE'),
('2019-113', '2019-09-19', 'N', 'N', 'DA VALIDARE'),
('2019-114', '2019-09-21', 'N', 'N', 'DA VALIDARE'),
('2019-115', '2019-09-24', 'N', 'N', 'DA VALIDARE'),
('2019-116', '2019-09-26', 'N', 'N', 'DA VALIDARE'),
('2019-117', '2019-09-28', 'N', 'N', 'DA VALIDARE'),
('2019-118', '2019-10-01', 'N', 'N', 'DA VALIDARE'),
('2019-119', '2019-10-03', 'N', 'N', 'DA VALIDARE'),
('2019-120', '2019-10-05', 'N', 'N', 'DA VALIDARE'),
('2019-121', '2019-10-08', 'N', 'N', 'DA VALIDARE'),
('2019-122', '2019-10-10', 'N', 'N', 'DA VALIDARE'),
('2019-123', '2019-10-12', 'N', 'N', 'DA VALIDARE'),
('2019-124', '2019-10-15', 'N', 'N', 'DA VALIDARE'),
('2019-125', '2019-10-17', 'N', 'N', 'DA VALIDARE'),
('2019-126', '2019-10-19', 'N', 'N', 'DA VALIDARE'),
('2019-127', '2019-10-22', 'N', 'N', 'DA VALIDARE'),
('2019-128', '2019-10-24', 'N', 'N', 'DA VALIDARE'),
('2019-129', '2019-10-26', 'N', 'N', 'DA VALIDARE'),
('2019-130', '2019-10-29', 'N', 'N', 'DA VALIDARE'),
('2019-131', '2019-10-31', 'N', 'N', 'DA VALIDARE'),
('2019-132', '2019-11-02', 'N', 'N', 'DA VALIDARE'),
('2019-133', '2019-11-05', 'N', 'N', 'DA VALIDARE'),
('2019-134', '2019-11-07', 'N', 'N', 'DA VALIDARE'),
('2019-135', '2019-11-09', 'N', 'N', 'DA VALIDARE'),
('2019-136', '2019-11-12', 'N', 'N', 'DA VALIDARE'),
('2019-137', '2019-11-14', 'N', 'N', 'DA VALIDARE'),
('2019-138', '2019-11-16', 'N', 'N', 'DA VALIDARE'),
('2019-139', '2019-11-19', 'N', 'N', 'DA VALIDARE'),
('2019-140', '2019-11-21', 'N', 'N', 'DA VALIDARE'),
('2019-141', '2019-11-23', 'N', 'N', 'DA VALIDARE'),
('2019-142', '2019-11-26', 'N', 'N', 'DA VALIDARE'),
('2019-143', '2019-11-28', 'N', 'N', 'DA VALIDARE'),
('2019-144', '2019-11-30', 'N', 'N', 'DA VALIDARE'),
('2019-145', '2019-12-03', 'N', 'N', 'DA VALIDARE'),
('2019-146', '2019-12-05', 'N', 'N', 'DA VALIDARE'),
('2019-147', '2019-12-07', 'N', 'N', 'DA VALIDARE'),
('2019-148', '2019-12-10', 'N', 'N', 'DA VALIDARE'),
('2019-149', '2019-12-12', 'N', 'N', 'DA VALIDARE'),
('2019-150', '2019-12-14', 'N', 'N', 'DA VALIDARE'),
('2019-151', '2019-12-17', 'N', 'N', 'DA VALIDARE'),
('2019-152', '2019-12-19', 'N', 'N', 'DA VALIDARE'),
('2019-153', '2019-12-21', 'N', 'N', 'DA VALIDARE'),
('2019-154', '2019-12-24', 'N', 'N', 'DA VALIDARE'),
('2019-155', '2019-12-26', 'N', 'N', 'DA VALIDARE'),
('2019-156', '2019-12-28', 'N', 'N', 'DA VALIDARE'),
('2019-157', '2019-12-31', 'N', 'N', 'DA VALIDARE'),
('2020-001', '2020-01-02', 'N', 'N', 'DA VALIDARE'),
('2020-002', '2020-01-04', 'N', 'N', 'DA VALIDARE');

INSERT INTO `utenti` (`user_ID`, `user_Name`, `user_email`, `user_Pwd`, `user_Active`) VALUES
('A.BIANCHI', 'Alfredo Bianchi', 'abianchi@alfsoft.it', 'alfredo', 'S'),
('UTENTE.2', 'Utente #2', 'utente2@alfsoft.it', 'utente2', 'S'),
('UTENTE.3', 'Utente #3', 'utente3@alfsoft.it', 'utente3', 'S'),
('UTENTE.4', 'Utente #4', 'utente4@alfsoft.it', 'utente4', 'S'),
('UTENTE.5', 'Utente #5', 'utente5@alfsoft.it', 'utente5', 'S');


INSERT INTO `utenti_asset` (`user_ID`, `group_ID`, `ua_Attivo`, `ua_PercQuota`) VALUES
('A.BIANCHI', 'EP1', 'S', '1.0'),
('UTENTE.2', 'EP1', 'S', '1.0'),
('UTENTE.3', 'EP1', 'S', '0.5'),
('UTENTE.4', 'EP1', 'S', '1.0'),
('UTENTE.5', 'EP1', 'S', '0.5');



/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
