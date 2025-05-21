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

-- --------------------------------------------------------

--
-- Table structure for table `detalle_compra`
--

CREATE TABLE `detalle_compra` (
  `NUM_OCO` char(5) NOT NULL,
  `COD_PRO` char(5) NOT NULL,
  `CAN_DET` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  MODIFY `ID_AUDIT` int(11) NOT NULL AUTO_INCREMENT;

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
