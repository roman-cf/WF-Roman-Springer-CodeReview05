-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 25. Dez 2019 um 19:53
-- Server-Version: 10.4.10-MariaDB
-- PHP-Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cr5_roman_springer_carrental`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `car`
--

CREATE TABLE `car` (
  `id` int(11) NOT NULL,
  `type_id` int(11) DEFAULT NULL,
  `licenseplate` varchar(8) DEFAULT NULL,
  `model` varchar(16) DEFAULT NULL,
  `km` float DEFAULT NULL,
  `service_int` int(11) DEFAULT NULL,
  `price_km` int(11) DEFAULT NULL,
  `price_day` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `car`
--

INSERT INTO `car` (`id`, `type_id`, `licenseplate`, `model`, `km`, `service_int`, `price_km`, `price_day`) VALUES
(1, 1, 'W-948472', 'Smart', 18789, 12, 25, 2500),
(2, 5, 'W-494932', 'Sprinter', 23.94, 12, 60, 6000),
(3, 2, 'W-498398', 'BMW X3', 45.983, 12, 35, 3500),
(4, 3, 'W-97354K', 'nissan', 54876, 12, 29, 2900);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `car_type`
--

CREATE TABLE `car_type` (
  `id` int(11) NOT NULL,
  `type_name` varchar(16) DEFAULT NULL,
  `licence_group` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `car_type`
--

INSERT INTO `car_type` (`id`, `type_name`, `licence_group`) VALUES
(1, 'Kleinwagen', 'B'),
(2, 'Mittelklasse', 'B'),
(3, 'Kombi', 'B'),
(4, 'Van', 'B'),
(5, 'Transporter', 'B'),
(6, 'Transporter XL', 'C');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customer`
--

CREATE TABLE `customer` (
  `ID` int(11) NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  `company` varchar(128) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(16) DEFAULT NULL,
  `zip` int(11) DEFAULT NULL,
  `city` varchar(128) DEFAULT NULL,
  `country` varchar(3) DEFAULT NULL,
  `firstname` varchar(128) DEFAULT NULL,
  `mail` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `customer`
--

INSERT INTO `customer` (`ID`, `name`, `company`, `address`, `phone`, `zip`, `city`, `country`, `firstname`, `mail`) VALUES
(1, 'Thomas Rauner', 'Code Factory', 'Kettenbrückengasse 23', '+4212345678', 1050, 'Wien', 'AUT', NULL, NULL),
(2, 'Max Muster', 'Siemens', 'Siemensstrasse 99', '+43123456789', 1000, 'Wien', 'AUT', NULL, NULL),
(3, 'Michael Dentaner', '', 'Ostermayergasse 56', '+431987654321', 1150, 'Wien', 'AUT', NULL, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `drvlcns`
--

CREATE TABLE `drvlcns` (
  `ID` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `typeA` char(4) DEFAULT NULL,
  `typeB` char(4) DEFAULT NULL,
  `typeC` char(4) DEFAULT NULL,
  `typeE` char(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `drvlcns`
--

INSERT INTO `drvlcns` (`ID`, `customer_id`, `typeA`, `typeB`, `typeC`, `typeE`) VALUES
(1, 3, 'A', 'B', 'C', ''),
(2, 2, '', 'B', 'C', ''),
(3, 1, '', 'B', '', '');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `invoice`
--

CREATE TABLE `invoice` (
  `ID` int(11) NOT NULL,
  `invoicenumber` int(11) DEFAULT NULL,
  `rental_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `payed` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `invoice`
--

INSERT INTO `invoice` (`ID`, `invoicenumber`, `rental_id`, `customer_id`, `payed`) VALUES
(1, 6890, 2, 1, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `rental`
--

CREATE TABLE `rental` (
  `ID` int(11) NOT NULL,
  `picupDate` datetime DEFAULT NULL,
  `returnDate` datetime DEFAULT NULL,
  `car_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `driver_id` int(11) DEFAULT NULL,
  `picup_station_id` int(11) DEFAULT NULL,
  `return_station_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `rental`
--

INSERT INTO `rental` (`ID`, `picupDate`, `returnDate`, `car_id`, `customer_id`, `driver_id`, `picup_station_id`, `return_station_id`) VALUES
(1, '2019-12-20 00:00:00', NULL, 4, 3, 1, 1, NULL),
(2, '2019-12-20 00:00:00', '2019-12-21 00:00:00', 2, 1, 2, 2, 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `reservation`
--

CREATE TABLE `reservation` (
  `ID` int(11) NOT NULL,
  `starttime` datetime DEFAULT NULL,
  `endtime` datetime DEFAULT NULL,
  `car_type_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `station_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `reservation`
--

INSERT INTO `reservation` (`ID`, `starttime`, `endtime`, `car_type_id`, `customer_id`, `station_id`) VALUES
(1, '2019-12-20 00:00:00', '2019-12-30 00:00:00', 3, 3, 1),
(3, '2019-12-20 00:00:00', '2019-12-29 00:00:00', 2, 1, 2),
(4, '2019-12-22 00:00:00', '2019-12-29 00:00:00', 2, 2, 2),
(5, '2019-12-27 00:00:00', '2019-12-29 00:00:00', 6, 1, 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `station`
--

CREATE TABLE `station` (
  `ID` int(11) NOT NULL,
  `address` varchar(128) DEFAULT NULL,
  `phone` varchar(16) DEFAULT NULL,
  `zip` int(11) DEFAULT NULL,
  `parkingspace` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `station`
--

INSERT INTO `station` (`ID`, `address`, `phone`, `zip`, `parkingspace`) VALUES
(1, 'Handelskai 239', '+431463743898', 1110, 20),
(2, 'Karlsplatz 1', '+431494938739', 1050, 10);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type_id` (`type_id`);

--
-- Indizes für die Tabelle `car_type`
--
ALTER TABLE `car_type`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `drvlcns`
--
ALTER TABLE `drvlcns`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indizes für die Tabelle `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `rental_id` (`rental_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indizes für die Tabelle `rental`
--
ALTER TABLE `rental`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `car_id` (`car_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `driver_id` (`driver_id`),
  ADD KEY `picup_station_id` (`picup_station_id`),
  ADD KEY `return_station_id` (`return_station_id`);

--
-- Indizes für die Tabelle `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `car_type_id` (`car_type_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `station_id` (`station_id`);

--
-- Indizes für die Tabelle `station`
--
ALTER TABLE `station`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `car`
--
ALTER TABLE `car`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `car_type`
--
ALTER TABLE `car_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `customer`
--
ALTER TABLE `customer`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `drvlcns`
--
ALTER TABLE `drvlcns`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `invoice`
--
ALTER TABLE `invoice`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `rental`
--
ALTER TABLE `rental`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `reservation`
--
ALTER TABLE `reservation`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `station`
--
ALTER TABLE `station`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `car`
--
ALTER TABLE `car`
  ADD CONSTRAINT `car_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `car_type` (`id`);

--
-- Constraints der Tabelle `drvlcns`
--
ALTER TABLE `drvlcns`
  ADD CONSTRAINT `drvlcns_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`ID`);

--
-- Constraints der Tabelle `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`rental_id`) REFERENCES `rental` (`ID`),
  ADD CONSTRAINT `invoice_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`ID`);

--
-- Constraints der Tabelle `rental`
--
ALTER TABLE `rental`
  ADD CONSTRAINT `rental_ibfk_1` FOREIGN KEY (`car_id`) REFERENCES `car` (`id`),
  ADD CONSTRAINT `rental_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`ID`),
  ADD CONSTRAINT `rental_ibfk_4` FOREIGN KEY (`picup_station_id`) REFERENCES `station` (`ID`),
  ADD CONSTRAINT `rental_ibfk_5` FOREIGN KEY (`return_station_id`) REFERENCES `station` (`ID`);

--
-- Constraints der Tabelle `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`car_type_id`) REFERENCES `car_type` (`id`),
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`ID`),
  ADD CONSTRAINT `reservation_ibfk_3` FOREIGN KEY (`station_id`) REFERENCES `station` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
