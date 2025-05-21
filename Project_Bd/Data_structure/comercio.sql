-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 20, 2025 at 12:55 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `comercio`
--

-- --------------------------------------------------------

--
-- Table structure for table `abastecimiento`
--

CREATE TABLE `abastecimiento` (
  `COD_PRV` char(5) NOT NULL,
  `COD_PRO` char(5) NOT NULL,
  `PRE_ABA` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `abastecimiento`
--

INSERT INTO `abastecimiento` (`COD_PRV`, `COD_PRO`, `PRE_ABA`) VALUES
('PR01', 'P003', 8.00),
('PR01', 'P005', 35.00),
('PR01', 'P007', 3.00),
('PR01', 'P009', 8.00),
('PR01', 'P011', 18.00),
('PR02', 'P002', 30.00),
('PR02', 'P007', 3.00),
('PR03', 'P002', 32.00),
('PR03', 'P004', 7.00),
('PR04', 'P001', 28.00),
('PR04', 'P006', 40.00),
('PR05', 'P018', 9.00),
('PR06', 'P009', 7.00),
('PR06', 'P017', 8.00),
('PR07', 'P016', 15.00),
('PR07', 'P019', 7.00),
('PR08', 'P006', 42.00),
('PR08', 'P010', 6.00),
('PR09', 'P002', 30.00),
('PR09', 'P014', 17.00),
('PR11', 'P001', 27.00),
('PR11', 'P006', 44.00),
('PR12', 'P002', 33.00),
('PR12', 'P010', 7.00),
('PR13', 'P005', 35.00),
('PR14', 'P016', 15.00),
('PR15', 'P020', 45.00),
('PR16', 'P008', 25.00),
('PR16', 'P012', 9.00),
('PR16', 'P013', 15.00),
('PR19', 'P008', 28.00),
('PR19', 'P016', 16.00),
('PR20', 'P012', 10.00),
('PR20', 'P020', 43.00);

-- --------------------------------------------------------

--
-- Table structure for table `auditoria_cambios`
--

CREATE TABLE `auditoria_cambios` (
  `ID_AUDIT` int(11) NOT NULL,
  `TABLA_AFECTADA` varchar(50) DEFAULT NULL,
  `OPERACION` varchar(10) DEFAULT NULL,
  `USUARIO_BD` varchar(30) DEFAULT NULL,
  `FECHA_CAMBIO` timestamp NOT NULL DEFAULT current_timestamp(),
  `VALOR_ANTES` text DEFAULT NULL,
  `VALOR_DESPUES` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auditoria_cambios`
--

INSERT INTO `auditoria_cambios` (`ID_AUDIT`, `TABLA_AFECTADA`, `OPERACION`, `USUARIO_BD`, `FECHA_CAMBIO`, `VALOR_ANTES`, `VALOR_DESPUES`) VALUES
(1, 'VENDEDOR', 'INSERT', 'root@localhost', '2025-05-19 03:29:43', NULL, 'COD:V01, NOM:JUANA'),
(2, 'VENDEDOR', 'INSERT', 'root@localhost', '2025-05-19 03:29:43', NULL, 'COD:V02, NOM:JUAN'),
(3, 'VENDEDOR', 'INSERT', 'root@localhost', '2025-05-19 03:29:43', NULL, 'COD:V03, NOM:CARLOS'),
(4, 'VENDEDOR', 'INSERT', 'root@localhost', '2025-05-19 03:29:43', NULL, 'COD:V04, NOM:CESAR'),
(5, 'VENDEDOR', 'INSERT', 'root@localhost', '2025-05-19 03:29:43', NULL, 'COD:V05, NOM:JULIO'),
(6, 'VENDEDOR', 'INSERT', 'root@localhost', '2025-05-19 03:29:43', NULL, 'COD:V06, NOM:ANA'),
(7, 'VENDEDOR', 'INSERT', 'root@localhost', '2025-05-19 03:29:43', NULL, 'COD:V07, NOM:JOSE'),
(8, 'VENDEDOR', 'INSERT', 'root@localhost', '2025-05-19 03:29:43', NULL, 'COD:V08, NOM:RUBEN'),
(9, 'VENDEDOR', 'INSERT', 'root@localhost', '2025-05-19 03:29:43', NULL, 'COD:V09, NOM:PATRICIA'),
(10, 'VENDEDOR', 'INSERT', 'root@localhost', '2025-05-19 03:29:43', NULL, 'COD:V10, NOM:RENATO'),
(11, 'VENDEDOR', 'INSERT', 'root@localhost', '2025-05-19 03:35:53', NULL, 'COD:V11, NOM:Laura'),
(12, 'VENDEDOR', 'UPDATE', 'root@localhost', '2025-05-19 04:19:31', 'Sueldo:2100.00', 'Sueldo:2000.00'),
(13, 'VENDEDOR', 'UPDATE', 'root@localhost', '2025-05-19 04:20:04', 'Sueldo:2000.00', 'Sueldo:2000.00'),
(14, 'VENDEDOR', 'DELETE', 'root@localhost', '2025-05-19 04:20:14', 'COD:V11, NOM:Laura', NULL),
(15, 'DETALLE_FACTURA', 'UPDATE', 'root@localhost', '2025-05-19 04:50:06', 'NUM_FAC:FA001, PROD:P007, CANT:6', 'NUM_FAC:FA001, PROD:P007, CANT:544'),
(16, 'DETALLE_FACTURA', 'UPDATE', 'root@localhost', '2025-05-19 04:55:45', 'NUM_FAC:FA001, PROD:P007, CANT:544', 'NUM_FAC:FA001, PROD:P007, CANT:544'),
(17, 'DETALLE_FACTURA', 'DELETE', 'root@localhost', '2025-05-19 04:55:58', 'NUM_FAC:FA001, PROD:P007, CANT:544', NULL),
(18, 'PRODUCTO', 'DELETE', 'root@localhost', '2025-05-19 05:34:03', 'COD:P022, DES:PAPEL BOND A-44, PRECIO:100.00', NULL),
(19, 'PRODUCTO', 'DELETE', 'root@localhost', '2025-05-19 05:34:21', 'COD:P021, DES:PROTECTOR DE PANTALLA, PRECIO:50.00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cliente`
--

CREATE TABLE `cliente` (
  `COD_CLI` char(5) NOT NULL,
  `RSO_CLI` varchar(50) DEFAULT NULL,
  `DIR_CLI` varchar(100) DEFAULT NULL,
  `TLF_CLI` char(9) DEFAULT NULL,
  `RUC_CLI` char(11) DEFAULT NULL,
  `COD_DIS` char(5) DEFAULT NULL,
  `FEC_REG` date DEFAULT NULL,
  `TIP_CLI` varchar(10) DEFAULT NULL,
  `CON_CLI` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cliente`
--

INSERT INTO `cliente` (`COD_CLI`, `RSO_CLI`, `DIR_CLI`, `TLF_CLI`, `RUC_CLI`, `COD_DIS`, `FEC_REG`, `TIP_CLI`, `CON_CLI`) VALUES
('C001', 'FINSETH', 'AV. LOS VIÑEDOS 150', '4342318', '48632081', 'D05', '2008-10-12', '1', 'ALICIA BARRETO'),
('C002', 'ORBI', 'AV. EMILIO CAVENECIA 225', '4406335', '57031642', 'D04', '2013-01-02', '2', 'ALFONSO BELTRAN'),
('C003', 'SERVIEMSA', 'JR. COLLAGATE 522', '75012403', NULL, 'D05', '2011-03-06', '2', 'CHRISTIAN LAGUNA'),
('C004', 'ISSA', 'CALLE LOS AVIADORES 263', '3725910', '46720159', 'D01', '2012-12-09', '1', 'LUIS APUMAYTA'),
('C005', 'MASS', 'AV. TOMAS MARSANO 880', '4446177', '83175942', 'D14', '2013-01-10', '1', 'KATIA ARMEJO'),
('C006', 'BERKER', 'AV. LOS PROCERES 521', '3810322', '54890124', 'D05', '2013-05-07', '1', 'JUDITH ASTE'),
('C007', 'FIDENZA', 'JR. EL NIQUEL 282', '5289034', '16204790', 'D20', '2012-02-10', '2', 'HECTOR VIVANCO'),
('C008', 'INTECH', 'AV. SAN LUIS 2619  5TO P', '2249493', '34021824', 'D09', '2011-07-01', '2', 'CARLOS VILLANUEVA'),
('C009', 'PROMINENT', 'JR. IQUIQUE 132', '43233519', NULL, 'D11', '2010-11-06', '1', 'JORGE VALDIVIA'),
('C010', 'LANDU', 'AV.NICOLAS DE AYLLON 1453', '3267840', '30405261', 'D05', '2013-06-11', '2', 'RAQUEL ESPINOZA'),
('C011', 'FILASUR', 'AV. EL SANTUARIO 1189', '4598175', '70345201', 'D26', '2012-04-08', '1', 'ANGELICA VIVAS'),
('C012', 'SUCERTE', 'JR. GRITO DE HUAURA 114', '4206434', '62014503', 'D05', '2011-08-11', '1', 'KARINA VEGA'),
('C013', 'HAYASHI', 'JR. AYACUCHO 359', '42847990', NULL, 'D22', '2013-09-03', '2', 'ERNESTO UEHARA'),
('C014', 'KADIA', 'AV.SANTA CRUZ 1332 OF.201', '4412418', '22202915', 'D06', '2011-05-10', '1', 'MIGUEL ARCE'),
('C015', 'MEBA', 'AV. ELMER FAUCETT 1638', '4641234', '50319542', 'D16', '2011-11-06', '2', 'RICARDO GOMEZ'),
('C016', 'CARDELI', 'JR. BARTOLOME HERRERA 451', '2658853', '26403158', 'D10', '2013-04-05', '2', 'GIANCARLO BONIFAZ'),
('C017', 'PAYET', 'CALLE JUAN FANNING 327', '4779834', '70594032', 'D07', '2013-12-05', '1', 'PAOLA URIBE'),
('C018', 'DASIN', 'AV. SAENZ PEÑA 338 - B', '4657574', '35016752', 'D17', '2011-03-12', '1', 'ANGELA BARRETO'),
('C019', 'COREFO', 'AV. CANADA 3894 - 3898', '4377499', '57201691', 'D24', '2010-03-01', '2', 'ROSALYN CORTEZ'),
('C020', 'CRAMER', 'JR. MARISCAL MILLER 1131', '4719061', '46031783', 'D02', '2010-11-08', '1', 'CHRISTOPHER RAMOS');

-- --------------------------------------------------------

--
-- Table structure for table `detalle_compra`
--

CREATE TABLE `detalle_compra` (
  `NUM_OCO` char(5) NOT NULL,
  `COD_PRO` char(5) NOT NULL,
  `CAN_DET` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detalle_compra`
--

INSERT INTO `detalle_compra` (`NUM_OCO`, `COD_PRO`, `CAN_DET`) VALUES
('OC001', 'P006', 100),
('OC001', 'P016', 20),
('OC002', 'P003', 200),
('OC002', 'P005', 500),
('OC003', 'P005', 50),
('OC004', 'P009', 10),
('OC004', 'P013', 50),
('OC005', 'P007', 150),
('OC005', 'P008', 100),
('OC008', 'P002', 10),
('OC008', 'P012', 100),
('OC009', 'P009', 50),
('OC009', 'P011', 50),
('OC010', 'P001', 100),
('OC011', 'P008', 5),
('OC011', 'P016', 10),
('OC012', 'P007', 50),
('OC012', 'P011', 100),
('OC013', 'P013', 50),
('OC014', 'P004', 50),
('OC014', 'P008', 50),
('OC014', 'P020', 50),
('OC016', 'P015', 100),
('OC017', 'P012', 100),
('OC017', 'P014', 100),
('OC019', 'P006', 100),
('OC020', 'P005', 500),
('OC020', 'P011', 100);

-- --------------------------------------------------------

--
-- Table structure for table `detalle_factura`
--

CREATE TABLE `detalle_factura` (
  `NUM_FAC` varchar(12) NOT NULL,
  `COD_PRO` char(5) NOT NULL,
  `CAN_VEN` int(11) DEFAULT NULL,
  `PRE_VEN` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detalle_factura`
--

INSERT INTO `detalle_factura` (`NUM_FAC`, `COD_PRO`, `CAN_VEN`, `PRE_VEN`) VALUES
('FA001', 'P013', 11, 20.00),
('FA002', 'P004', 8, 10.00),
('FA003', 'P002', 10, 40.00),
('FA003', 'P011', 6, 20.00),
('FA003', 'P017', 21, 12.00),
('FA003', 'P019', 12, 10.00),
('FA004', 'P004', 3, 10.00),
('FA004', 'P009', 50, 5.00),
('FA005', 'P003', 20, 10.00),
('FA005', 'P006', 50, 50.00),
('FA005', 'P020', 5, 60.00),
('FA006', 'P002', 20, 35.00),
('FA006', 'P003', 15, 10.00),
('FA006', 'P009', 12, 5.00),
('FA007', 'P003', 20, 12.00),
('FA007', 'P012', 4, 12.00),
('FA008', 'P008', 15, 30.00),
('FA008', 'P020', 50, 50.00),
('FA009', 'P001', 5, 30.00),
('FA009', 'P002', 15, 35.00),
('FA009', 'P006', 2, 50.00),
('FA009', 'P019', 1, 8.00),
('FA010', 'P002', 3, 35.00),
('FA011', 'P002', 20, 35.00),
('FA012', 'P002', 3, 35.00),
('FA012', 'P006', 1, 50.00),
('FA013', 'P002', 130, 35.00),
('FA013', 'P003', 5, 12.00),
('FA013', 'P015', 4, 12.00),
('FA014', 'P009', 10, 8.00),
('FA015', 'P008', 5, 30.00),
('FA015', 'P016', 3, 18.00),
('FA016', 'P006', 15, 50.00),
('FA016', 'P008', 2, 30.00),
('FA017', 'P002', 120, 40.00),
('FA017', 'P005', 120, 40.00),
('FA018', 'P003', 4, 12.00),
('FA018', 'P005', 6, 40.00),
('FA019', 'P002', 150, 40.00),
('FA019', 'P003', 6, 10.00),
('FA019', 'P006', 2, 45.00),
('FA019', 'P008', 10, 30.00),
('FA020', 'P009', 120, 10.00),
('FA020', 'P015', 5, 15.00);

--
-- Triggers `detalle_factura`
--
DELIMITER $$
CREATE TRIGGER `trg_detalle_delete` AFTER DELETE ON `detalle_factura` FOR EACH ROW BEGIN
  INSERT INTO auditoria_cambios (TABLA_AFECTADA, OPERACION, USUARIO_BD, VALOR_ANTES)
  VALUES ('DETALLE_FACTURA', 'DELETE', USER(),
          CONCAT('NUM_FAC:', OLD.NUM_FAC, ', PROD:', OLD.COD_PRO, ', CANT:', OLD.CAN_VEN));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_detalle_update` AFTER UPDATE ON `detalle_factura` FOR EACH ROW BEGIN
  INSERT INTO auditoria_cambios (TABLA_AFECTADA, OPERACION, USUARIO_BD, VALOR_ANTES, VALOR_DESPUES)
  VALUES ('DETALLE_FACTURA', 'UPDATE', USER(),
          CONCAT('NUM_FAC:', OLD.NUM_FAC, ', PROD:', OLD.COD_PRO, ', CANT:', OLD.CAN_VEN),
          CONCAT('NUM_FAC:', NEW.NUM_FAC, ', PROD:', NEW.COD_PRO, ', CANT:', NEW.CAN_VEN));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `distrito`
--

CREATE TABLE `distrito` (
  `COD_DIS` char(5) NOT NULL,
  `NOM_DIS` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `distrito`
--

INSERT INTO `distrito` (`COD_DIS`, `NOM_DIS`) VALUES
('D01', 'SURCO'),
('D02', 'JESUS MARIA'),
('D03', 'SAN ISIDRO'),
('D04', 'LA MOLINA'),
('D05', 'SAN MIGUEL'),
('D06', 'MIRAFLORES'),
('D07', 'BARRANCO'),
('D08', 'CHORRILLOS'),
('D09', 'SAN BORJA'),
('D10', 'LINCE'),
('D11', 'BREÑA'),
('D12', 'MAGDALENA'),
('D13', 'RIMAC'),
('D14', 'SURQUILLO'),
('D15', 'PUEBLO LIBRE'),
('D16', 'BELLAVISTA'),
('D17', 'CALLAO'),
('D18', 'SAN MARTIN DE PORRES'),
('D19', 'SANTA ANITA'),
('D20', 'LOS OLIVOS'),
('D21', 'INDEPENDENCIA'),
('D22', 'LIMA - CERCADO'),
('D24', 'SAN LUIS'),
('D25', 'EL AGUSTINO'),
('D26', 'SAN JUAN DE LURIGANCHO'),
('D27', 'ATE - VITARTE'),
('D28', 'SAN JUAN DE MIRAFLORES'),
('D29', 'CARMEN DE LA LEGUA'),
('D30', 'COMAS'),
('D31', 'VILLA MARIA DEL TRIUNFO'),
('D32', 'VILLA EL SALVADOR'),
('D33', 'LA PERLA'),
('D34', 'VENTANILLA'),
('D35', 'PUENTE PIEDRA'),
('D36', 'CARABAYLLO'),
('D37', 'SANTA MARIA');

-- --------------------------------------------------------

--
-- Table structure for table `factura`
--

CREATE TABLE `factura` (
  `NUM_FAC` varchar(12) NOT NULL,
  `FEC_FAC` date DEFAULT NULL,
  `COD_CLI` char(5) DEFAULT NULL,
  `FEC_CAN` date DEFAULT NULL,
  `EST_FAC` varchar(10) DEFAULT NULL,
  `COD_VEN` char(5) DEFAULT NULL,
  `POR_IGV` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `factura`
--

INSERT INTO `factura` (`NUM_FAC`, `FEC_FAC`, `COD_CLI`, `FEC_CAN`, `EST_FAC`, `COD_VEN`, `POR_IGV`) VALUES
('FA001', '2013-07-06', 'C001', '2013-08-05', '2', 'V01', 0.19),
('FA002', '2013-07-06', 'C019', '2013-08-05', '3', 'V02', 0.19),
('FA003', '2013-09-01', 'C003', '2013-10-03', '2', 'V04', 0.19),
('FA004', '2013-09-06', 'C016', '2013-10-05', '2', 'V07', 0.19),
('FA005', '2013-10-01', 'C015', '2013-10-12', '2', 'V08', 0.19),
('FA006', '2013-08-01', 'C009', '2013-08-05', '3', 'V05', 0.19),
('FA007', '2013-10-05', 'C019', '2013-10-10', '1', 'V09', 0.19),
('FA008', '2013-10-04', 'C012', '2013-10-06', '2', 'V10', 0.19),
('FA009', '2013-10-03', 'C008', '2013-10-10', '2', 'V09', 0.19),
('FA010', '2013-10-01', 'C017', '2013-10-06', '2', 'V02', 0.19),
('FA011', '2013-09-10', 'C019', '2013-09-10', '2', 'V05', 0.19),
('FA012', '2013-12-01', 'C014', '2013-12-01', '1', 'V04', 0.19),
('FA013', '2013-12-01', 'C011', '2013-12-01', '3', 'V08', 0.19),
('FA014', '2012-12-01', 'C020', '2013-12-01', '2', 'V09', 0.19),
('FA015', '2012-12-08', 'C015', '2013-01-06', '2', 'V07', 0.19),
('FA016', '2013-01-06', 'C016', '2013-01-09', '2', 'V05', 0.19),
('FA017', '2013-01-06', 'C015', '2013-01-06', '1', 'V06', 0.19),
('FA018', '2013-02-03', 'C016', '2013-02-04', '2', 'V10', 0.19),
('FA019', '2013-02-07', 'C008', '2013-03-01', '2', 'V03', 0.19),
('FA020', '2013-02-06', 'C013', '2013-03-10', '2', 'V02', 0.19);

--
-- Triggers `factura`
--
DELIMITER $$
CREATE TRIGGER `trg_factura_delete` AFTER DELETE ON `factura` FOR EACH ROW BEGIN
  INSERT INTO auditoria_cambios (TABLA_AFECTADA, OPERACION, USUARIO_BD, VALOR_ANTES, VALOR_DESPUES)
  VALUES (
    'FACTURA',
    'DELETE',
    USER(),
    CONCAT('NUM_FAC:', OLD.NUM_FAC, ', FEC_FAC:', OLD.FEC_FAC, ', COD_CLI:', OLD.COD_CLI, ', FEC_CAN:', OLD.FEC_CAN, ', EST_FAC:', OLD.EST_FAC, ', COD_VEN:', OLD.COD_VEN, ', IGV:', OLD.POR_IGV),
    NULL
  );
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_factura_insert` AFTER INSERT ON `factura` FOR EACH ROW BEGIN
  INSERT INTO auditoria_cambios (TABLA_AFECTADA, OPERACION, USUARIO_BD, VALOR_ANTES, VALOR_DESPUES)
  VALUES (
    'FACTURA',
    'INSERT',
    USER(),
    NULL,
    CONCAT('NUM_FAC:', NEW.NUM_FAC, ', FEC_FAC:', NEW.FEC_FAC, ', COD_CLI:', NEW.COD_CLI, ', FEC_CAN:', NEW.FEC_CAN, ', EST_FAC:', NEW.EST_FAC, ', COD_VEN:', NEW.COD_VEN, ', IGV:', NEW.POR_IGV)
  );
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_factura_update` AFTER UPDATE ON `factura` FOR EACH ROW BEGIN
  INSERT INTO auditoria_cambios (TABLA_AFECTADA, OPERACION, USUARIO_BD, VALOR_ANTES, VALOR_DESPUES)
  VALUES (
    'FACTURA',
    'UPDATE',
    USER(),
    CONCAT('NUM_FAC:', OLD.NUM_FAC, ', FEC_FAC:', OLD.FEC_FAC, ', COD_CLI:', OLD.COD_CLI, ', FEC_CAN:', OLD.FEC_CAN, ', EST_FAC:', OLD.EST_FAC, ', COD_VEN:', OLD.COD_VEN, ', IGV:', OLD.POR_IGV),
    CONCAT('NUM_FAC:', NEW.NUM_FAC, ', FEC_FAC:', NEW.FEC_FAC, ', COD_CLI:', NEW.COD_CLI, ', FEC_CAN:', NEW.FEC_CAN, ', EST_FAC:', NEW.EST_FAC, ', COD_VEN:', NEW.COD_VEN, ', IGV:', NEW.POR_IGV)
  );
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `orden_compra`
--

CREATE TABLE `orden_compra` (
  `NUM_OCO` char(5) NOT NULL,
  `FEC_OCO` date DEFAULT NULL,
  `COD_PRV` char(5) DEFAULT NULL,
  `FAT_OCO` date DEFAULT NULL,
  `EST_OCO` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orden_compra`
--

INSERT INTO `orden_compra` (`NUM_OCO`, `FEC_OCO`, `COD_PRV`, `FAT_OCO`, `EST_OCO`) VALUES
('OC001', '2013-03-05', 'PR08', '2013-03-12', '1'),
('OC002', '2013-04-08', 'PR16', '2013-04-10', '1'),
('OC003', '2013-08-02', 'PR10', '2013-08-02', '3'),
('OC004', '2013-04-05', 'PR01', '2013-04-05', '3'),
('OC005', '2013-03-06', 'PR07', '2013-03-10', '1'),
('OC006', '2013-01-02', 'PR19', '2013-01-02', '1'),
('OC007', '2013-02-06', 'PR20', '2013-04-05', '3'),
('OC008', '2013-06-02', 'PR04', '2013-07-01', '1'),
('OC009', '2013-08-03', 'PR11', '2013-09-10', '1'),
('OC010', '2013-09-05', 'PR01', '2013-09-05', '1'),
('OC011', '2013-10-02', 'PR03', '2013-10-03', '1'),
('OC012', '2013-10-04', 'PR14', '2013-10-05', '3'),
('OC013', '2013-11-02', 'PR05', '2013-11-06', '1'),
('OC014', '2013-11-03', 'PR19', '2013-12-05', '1'),
('OC015', '2013-11-03', 'PR18', '2013-12-10', '1'),
('OC016', '2013-12-06', 'PR06', '2013-12-06', '3'),
('OC017', '2013-01-08', 'PR09', '2013-01-08', '1'),
('OC018', '2013-02-01', 'PR20', '2013-02-08', '1'),
('OC019', '2013-03-03', 'PR11', '2013-03-06', '1'),
('OC020', '2013-04-02', 'PR05', '2013-04-02', '2');

-- --------------------------------------------------------

--
-- Table structure for table `producto`
--

CREATE TABLE `producto` (
  `COD_PRO` char(5) NOT NULL,
  `DES_PRO` varchar(50) DEFAULT NULL,
  `PRE_PRO` decimal(10,2) DEFAULT NULL,
  `SAC_PRO` int(11) DEFAULT NULL,
  `SMI_PRO` int(11) DEFAULT NULL,
  `UNI_PRO` varchar(20) DEFAULT NULL,
  `LIN_PRO` varchar(30) DEFAULT NULL,
  `IMP_PRO` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `producto`
--

INSERT INTO `producto` (`COD_PRO`, `DES_PRO`, `PRE_PRO`, `SAC_PRO`, `SMI_PRO`, `UNI_PRO`, `LIN_PRO`, `IMP_PRO`) VALUES
('P001', 'PAPEL BOND A-4', 100.00, 200, 1503, 'MLL', '2', 'V'),
('P002', 'PAPEL BOND OFICIO', 35.00, 50, 1500, 'MLL', '2', 'F'),
('P003', 'PAPEL BULKY', 10.00, 498, 1000, 'MLL', '2', 'V'),
('P004', 'PAPEL PERIODICO', 9.00, 4285, 1000, 'MLL', '2', 'F'),
('P005', 'CARTUCHO TINTA NEGRA', 40.00, 50, 30, 'UNI', '1', 'F'),
('P006', 'CARTUCHO TINTA COLOR', 45.00, 58, 35, 'UNI', '1', 'F'),
('P007', 'PORTA DISKETTES', 3.50, 300, 100, 'UNI', '1', 'V'),
('P008', 'CAJA DE DISKETTES * 10', 30.00, 125, 180, 'UNI', '1', 'F'),
('P009', 'BORRADOR DE TINTA', 10.00, 100, 500, 'DOC', '3', 'F'),
('P010', 'BORRADOR BLANCO', 8.00, 2000, 400, 'DOC', '3', 'F'),
('P011', 'TAJADOR METAL', 20.00, 1120, 300, 'DOC', '3', 'F'),
('P012', 'TAJADOR PLASTICO', 12.00, 608, 300, 'DOC', '3', 'F'),
('P013', 'FOLDER MANILA OFICIO', 20.00, 200, 150, 'CIE', '3', 'F'),
('P014', 'FOLDER MANILA A-4', 20.00, 150, 150, 'CIE', '3', 'V'),
('P015', 'SOBRE MANILA OFICIO', 15.00, 300, 130, 'CIE', '3', 'F'),
('P016', 'SOBRE MANILA A-4', 18.00, 200, 100, 'CIE', '3', 'F'),
('P017', 'LAPICERO NEGRO', 10.00, 3000, 1000, 'DOC', '3', 'F'),
('P018', 'LAPICERO AZUL', 10.00, 2013, 1500, 'DOC', '3', 'F'),
('P019', 'LAPICERO ROJO', 8.00, 1900, 1000, 'DOC', '3', 'V'),
('P020', 'FOLDER PLASTICO A-4', 50.00, 3080, 1100, 'CIE', '3', 'F');

--
-- Triggers `producto`
--
DELIMITER $$
CREATE TRIGGER `trg_producto_delete` AFTER DELETE ON `producto` FOR EACH ROW BEGIN
  INSERT INTO auditoria_cambios (TABLA_AFECTADA, OPERACION, USUARIO_BD, VALOR_ANTES)
  VALUES (
    'PRODUCTO',
    'DELETE',
    USER(),
    CONCAT('COD:', OLD.COD_PRO, ', DES:', OLD.DES_PRO, ', PRECIO:', OLD.PRE_PRO)
  );
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_producto_insert` AFTER INSERT ON `producto` FOR EACH ROW BEGIN
  INSERT INTO auditoria_cambios (TABLA_AFECTADA, OPERACION, USUARIO_BD, VALOR_DESPUES)
  VALUES (
    'PRODUCTO',
    'INSERT',
    USER(),
    CONCAT('COD:', NEW.COD_PRO, ', DES:', NEW.DES_PRO, ', PRECIO:', NEW.PRE_PRO)
  );
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_producto_update` AFTER UPDATE ON `producto` FOR EACH ROW BEGIN
  INSERT INTO auditoria_cambios (TABLA_AFECTADA, OPERACION, USUARIO_BD, VALOR_ANTES, VALOR_DESPUES)
  VALUES (
    'PRODUCTO',
    'UPDATE',
    USER(),
    CONCAT('COD:', OLD.COD_PRO, ', DES:', OLD.DES_PRO, ', PRECIO:', OLD.PRE_PRO),
    CONCAT('COD:', NEW.COD_PRO, ', DES:', NEW.DES_PRO, ', PRECIO:', NEW.PRE_PRO)
  );
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `proveedor`
--

CREATE TABLE `proveedor` (
  `COD_PRV` char(5) NOT NULL,
  `RSO_PRV` varchar(80) DEFAULT NULL,
  `DIR_PRV` varchar(100) DEFAULT NULL,
  `TLF_PRV` char(15) DEFAULT NULL,
  `COD_DIS` char(5) DEFAULT NULL,
  `REP_PRV` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `proveedor`
--

INSERT INTO `proveedor` (`COD_PRV`, `RSO_PRV`, `DIR_PRV`, `TLF_PRV`, `COD_DIS`, `REP_PRV`) VALUES
('PR01', 'FABER CASTELL', 'AV. ISABEL LA CATOLICA 1875', '4330895', 'D13', 'CARLOS AGUIRRE'),
('PR02', 'ATLAS', 'AV. LIMA 471', '5380926', 'D13', 'CESAR TORRES'),
('PR03', '3M', 'AV. VENEZUELA 3018', '2908165', 'D16', 'OMAR INJOQUE'),
('PR04', 'DITO', 'AV. METROPOLITANA 376', NULL, 'D19', 'RAMON FLORES'),
('PR05', 'ACKER', 'CALLE LAS DUNAS 245', '4780143', 'D27', 'JULIO ACUÑA'),
('PR06', 'DEDITEC', 'CALLE PICHINCHA 644', '5662848', 'D11', 'JAVIER GONZALES'),
('PR07', 'OFFICETEC', 'CALLE LAS PERDICES 225 OF. 204', '4216184', 'D03', 'CARLOS ROBLES'),
('PR08', 'INVICTA', 'AV. LOS FRUTALES 564', '4364247', 'D27', 'ALBERTO RODRIGUEZ'),
('PR09', 'DIPROPOR', 'AV. DEL AIRE 901', '4742046', 'D24', 'ROBERTO RONCEROS'),
('PR10', 'MIURA', 'AV. LA PAZ 257', '4459710', 'D06', 'JORGE VASQUEZ'),
('PR11', 'PRAXIS', 'AV. JOSE GALVEZ 1820 - 1844', '4703944', 'D10', 'ERICKA ZEGARRA'),
('PR12', 'SUMIGRAF', 'AV. MANCO CAPAC 754', '3320343', 'D13', 'KARINNA PAREDES'),
('PR13', 'LIMMSA', 'PROLG. HUAYLAS 670', '2546995', 'D08', 'LAURA ORTEGA'),
('PR14', 'VENINSA', 'AV. TEJADA 338', '2473832', 'D07', 'MELISA RAMOS'),
('PR15', 'CROSLAND', 'AV. ARGENTINA 3206 - 3250', '4515272', 'D17', 'JUAN RAMIREZ'),
('PR16', 'PETRAMAS', 'CALLE JOAQUIN MADRID 141 2DO P', NULL, 'D09', 'ROCIO GUERRERO'),
('PR17', 'REAWSE', 'AV. SANTA ROSA 480 ', NULL, 'D19', 'MARIA PEREZ'),
('PR18', 'EDUSA', 'AV. MORALES DUAREZ 1260', '4525536', 'D29', 'PABLO MARTEL'),
('PR19', 'OTTMER', 'URB.PRO INDUSTRIAL MZ B6 LT 16', '5369893', 'D18', 'ANGELA RENDILLA'),
('PR20', 'BARI', 'AV. ARNALDO MARQUEZ 1219', NULL, 'D02', 'VANESA QUINTANA');

-- --------------------------------------------------------

--
-- Table structure for table `vendedor`
--

CREATE TABLE `vendedor` (
  `COD_VEN` char(5) NOT NULL,
  `NOM_VEN` varchar(20) DEFAULT NULL,
  `APE_VEN` varchar(20) DEFAULT NULL,
  `SUE_VEN` decimal(10,2) DEFAULT NULL,
  `FIN_VEN` date DEFAULT NULL,
  `TIP_VEN` varchar(10) DEFAULT NULL,
  `COD_DIS` char(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vendedor`
--

INSERT INTO `vendedor` (`COD_VEN`, `NOM_VEN`, `APE_VEN`, `SUE_VEN`, `FIN_VEN`, `TIP_VEN`, `COD_DIS`) VALUES
('V01', 'JUANA', 'ALVA', 1000.00, '2003-12-07', '1', 'D08'),
('V02', 'JUAN', 'SOTO', 1200.00, '2002-03-10', '2', 'D03'),
('V03', 'CARLOS', 'AREVALO', 1500.00, '1992-10-02', '2', 'D09'),
('V04', 'CESAR', 'OJEDA', 850.00, '1999-11-08', '1', 'D01'),
('V05', 'JULIO', 'VEGA', 1500.00, '1997-05-11', '1', 'D01'),
('V06', 'ANA', 'ORTEGA', 1200.00, '1994-05-11', '1', 'D05'),
('V07', 'JOSE', 'PALACIOS', 2500.00, '1997-02-12', '1', 'D02'),
('V08', 'RUBEN', 'GOMEZ', 1450.00, '1996-08-12', '2', 'D04'),
('V09', 'PATRICIA', 'ARCE', 1800.00, '1997-05-12', '2', 'D04'),
('V10', 'RENATO', 'PEREZ', 1550.00, '1998-08-11', '2', 'D01');

--
-- Triggers `vendedor`
--
DELIMITER $$
CREATE TRIGGER `aud_vendedor_delete` AFTER DELETE ON `vendedor` FOR EACH ROW BEGIN
    INSERT INTO AUDITORIA_CAMBIOS (TABLA_AFECTADA, OPERACION, USUARIO_BD, VALOR_ANTES)
    VALUES ('VENDEDOR', 'DELETE', CURRENT_USER(), CONCAT('COD:', OLD.COD_VEN, ', NOM:', OLD.NOM_VEN));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `aud_vendedor_insert` AFTER INSERT ON `vendedor` FOR EACH ROW BEGIN
    INSERT INTO AUDITORIA_CAMBIOS (TABLA_AFECTADA, OPERACION, USUARIO_BD, VALOR_DESPUES)
    VALUES ('VENDEDOR', 'INSERT', CURRENT_USER(), CONCAT('COD:', NEW.COD_VEN, ', NOM:', NEW.NOM_VEN));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `aud_vendedor_update` AFTER UPDATE ON `vendedor` FOR EACH ROW BEGIN
    INSERT INTO AUDITORIA_CAMBIOS (TABLA_AFECTADA, OPERACION, USUARIO_BD, VALOR_ANTES, VALOR_DESPUES)
    VALUES (
        'VENDEDOR', 'UPDATE', CURRENT_USER(),
        CONCAT('Sueldo:', OLD.SUE_VEN),
        CONCAT('Sueldo:', NEW.SUE_VEN)
    );
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `abastecimiento`
--
ALTER TABLE `abastecimiento`
  ADD PRIMARY KEY (`COD_PRV`,`COD_PRO`),
  ADD KEY `COD_PRO` (`COD_PRO`);

--
-- Indexes for table `auditoria_cambios`
--
ALTER TABLE `auditoria_cambios`
  ADD PRIMARY KEY (`ID_AUDIT`);

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`COD_CLI`),
  ADD KEY `COD_DIS` (`COD_DIS`);

--
-- Indexes for table `detalle_compra`
--
ALTER TABLE `detalle_compra`
  ADD PRIMARY KEY (`NUM_OCO`,`COD_PRO`),
  ADD KEY `COD_PRO` (`COD_PRO`);

--
-- Indexes for table `detalle_factura`
--
ALTER TABLE `detalle_factura`
  ADD PRIMARY KEY (`NUM_FAC`,`COD_PRO`),
  ADD KEY `COD_PRO` (`COD_PRO`);

--
-- Indexes for table `distrito`
--
ALTER TABLE `distrito`
  ADD PRIMARY KEY (`COD_DIS`);

--
-- Indexes for table `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`NUM_FAC`),
  ADD KEY `COD_CLI` (`COD_CLI`),
  ADD KEY `COD_VEN` (`COD_VEN`);

--
-- Indexes for table `orden_compra`
--
ALTER TABLE `orden_compra`
  ADD PRIMARY KEY (`NUM_OCO`),
  ADD KEY `COD_PRV` (`COD_PRV`);

--
-- Indexes for table `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`COD_PRO`);

--
-- Indexes for table `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`COD_PRV`),
  ADD KEY `COD_DIS` (`COD_DIS`);

--
-- Indexes for table `vendedor`
--
ALTER TABLE `vendedor`
  ADD PRIMARY KEY (`COD_VEN`),
  ADD KEY `COD_DIS` (`COD_DIS`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auditoria_cambios`
--
ALTER TABLE `auditoria_cambios`
  MODIFY `ID_AUDIT` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `abastecimiento`
--
ALTER TABLE `abastecimiento`
  ADD CONSTRAINT `abastecimiento_ibfk_1` FOREIGN KEY (`COD_PRV`) REFERENCES `proveedor` (`COD_PRV`),
  ADD CONSTRAINT `abastecimiento_ibfk_2` FOREIGN KEY (`COD_PRO`) REFERENCES `producto` (`COD_PRO`);

--
-- Constraints for table `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`COD_DIS`) REFERENCES `distrito` (`COD_DIS`);

--
-- Constraints for table `detalle_compra`
--
ALTER TABLE `detalle_compra`
  ADD CONSTRAINT `detalle_compra_ibfk_1` FOREIGN KEY (`NUM_OCO`) REFERENCES `orden_compra` (`NUM_OCO`),
  ADD CONSTRAINT `detalle_compra_ibfk_2` FOREIGN KEY (`COD_PRO`) REFERENCES `producto` (`COD_PRO`);

--
-- Constraints for table `detalle_factura`
--
ALTER TABLE `detalle_factura`
  ADD CONSTRAINT `detalle_factura_ibfk_1` FOREIGN KEY (`NUM_FAC`) REFERENCES `factura` (`NUM_FAC`),
  ADD CONSTRAINT `detalle_factura_ibfk_2` FOREIGN KEY (`COD_PRO`) REFERENCES `producto` (`COD_PRO`);

--
-- Constraints for table `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`COD_CLI`) REFERENCES `cliente` (`COD_CLI`),
  ADD CONSTRAINT `factura_ibfk_2` FOREIGN KEY (`COD_VEN`) REFERENCES `vendedor` (`COD_VEN`);

--
-- Constraints for table `orden_compra`
--
ALTER TABLE `orden_compra`
  ADD CONSTRAINT `orden_compra_ibfk_1` FOREIGN KEY (`COD_PRV`) REFERENCES `proveedor` (`COD_PRV`);

--
-- Constraints for table `proveedor`
--
ALTER TABLE `proveedor`
  ADD CONSTRAINT `proveedor_ibfk_1` FOREIGN KEY (`COD_DIS`) REFERENCES `distrito` (`COD_DIS`);

--
-- Constraints for table `vendedor`
--
ALTER TABLE `vendedor`
  ADD CONSTRAINT `vendedor_ibfk_1` FOREIGN KEY (`COD_DIS`) REFERENCES `distrito` (`COD_DIS`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
