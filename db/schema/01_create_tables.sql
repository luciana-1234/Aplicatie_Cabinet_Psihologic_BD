-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 25, 2026 at 04:35 PM
-- Server version: 10.11.19-MariaDB
-- PHP Version: 8.5.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cabinet_psihologie`
--

-- --------------------------------------------------------

--
-- Table structure for table `aplicari_teste`
--

CREATE TABLE `aplicari_teste` (
  `id_aplicare` int(11) NOT NULL,
  `id_pacient` int(11) NOT NULL,
  `id_test` int(11) NOT NULL,
  `scor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `aplicari_teste`
--

INSERT INTO `aplicari_teste` (`id_aplicare`, `id_pacient`, `id_test`, `scor`) VALUES
(4, 1, 2, 14),
(5, 1, 3, 26),
(6, 2, 1, 18);

-- --------------------------------------------------------

--
-- Table structure for table `pacienti`
--

CREATE TABLE `pacienti` (
  `id_pacient` int(11) NOT NULL,
  `nume` varchar(60) NOT NULL,
  `prenume` varchar(60) NOT NULL,
  `data_nasterii` date NOT NULL,
  `gen` enum('Feminin','Masculin') NOT NULL,
  `telefon` varchar(20) NOT NULL,
  `email` varchar(120) DEFAULT NULL,
  `data_inregistrare` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pacienti`
--

INSERT INTO `pacienti` (`id_pacient`, `nume`, `prenume`, `data_nasterii`, `gen`, `telefon`, `email`, `data_inregistrare`) VALUES
(1, 'Pop', 'Alina', '1995-04-12', 'Feminin', '0722000111', 'pop.alina@example.com', '2026-09-10'),
(2, 'Gherghe', 'Karla', '1990-09-23', 'Feminin', '0722000222', 'karla.gherghe@example.com', '2026-09-15'),
(3, 'Berinde', 'Lucas', '1988-12-03', 'Masculin', '0722000333', 'lucas.berinde@example.com', '2026-10-01'),
(4, 'Deac', 'Iozefina', '2001-06-19', 'Feminin', '0722000444', 'iozefina.deac@example.com', '2026-10-05');

-- --------------------------------------------------------

--
-- Table structure for table `plati`
--

CREATE TABLE `plati` (
  `id_plata` int(11) NOT NULL,
  `id_programare` int(11) NOT NULL,
  `suma_achitata` decimal(10,2) NOT NULL,
  `data_plata` datetime NOT NULL,
  `metoda_plata` enum('Card','Numerar','Transfer') NOT NULL DEFAULT 'Card',
  `status_plata` enum('Achitat','Partial','Rambursat') NOT NULL DEFAULT 'Achitat'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `plati`
--

INSERT INTO `plati` (`id_plata`, `id_programare`, `suma_achitata`, `data_plata`, `metoda_plata`, `status_plata`) VALUES
(1, 1, 280.00, '2026-10-12 11:05:00', 'Card', 'Achitat'),
(2, 2, 220.00, '2026-10-19 10:55:00', 'Card', 'Achitat'),
(3, 3, 110.00, '2026-10-20 12:55:00', 'Numerar', 'Partial');

-- --------------------------------------------------------

--
-- Table structure for table `programari`
--

CREATE TABLE `programari` (
  `id_programare` int(11) NOT NULL,
  `id_pacient` int(11) NOT NULL,
  `id_psiholog` int(11) NOT NULL,
  `id_serviciu` int(11) NOT NULL,
  `data_creare_programare` datetime NOT NULL,
  `data_ora_sedinta` datetime NOT NULL,
  `status` enum('Programata','Confirmata','Finalizata','Anulata') NOT NULL DEFAULT 'Programata',
  `motiv_anulare` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `programari`
--

INSERT INTO `programari` (`id_programare`, `id_pacient`, `id_psiholog`, `id_serviciu`, `data_creare_programare`, `data_ora_sedinta`, `status`, `motiv_anulare`) VALUES
(1, 1, 1, 2, '2026-10-08 09:30:00', '2026-10-12 10:00:00', 'Finalizata', NULL),
(2, 1, 1, 1, '2026-10-12 11:00:00', '2026-10-19 10:00:00', 'Finalizata', NULL),
(3, 2, 1, 1, '2026-10-14 14:00:00', '2026-10-20 12:00:00', 'Finalizata', NULL),
(4, 3, 3, 3, '2026-10-15 16:20:00', '2026-10-22 15:00:00', 'Anulata', 'Reprogramare solicitata de pacient din motive medicale'),
(5, 4, 2, 4, '2026-10-21 10:15:00', '2026-11-28 14:00:00', 'Confirmata', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `progres_pacient`
--

CREATE TABLE `progres_pacient` (
  `id_progres` int(11) NOT NULL,
  `id_programare` int(11) NOT NULL,
  `data_evaluare` date NOT NULL,
  `nivel_evolutie` enum('Stationar','Progres usor','Progres moderat','Progres semnificativ','Regres') NOT NULL DEFAULT 'Progres usor',
  `observatii_sedinta` text NOT NULL,
  `obiective_urmatoare` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `progres_pacient`
--

INSERT INTO `progres_pacient` (`id_progres`, `id_programare`, `data_evaluare`, `nivel_evolutie`, `observatii_sedinta`, `obiective_urmatoare`) VALUES
(1, 1, '2026-10-12', 'Stationar', 'Evaluare initiala completa; identificat nivel moderat de anxietate sociala.', 'Completarea jurnalului de ganduri automate'),
(2, 2, '2026-10-19', 'Progres usor', 'Pacienta recunoaste mai rapid tiparele de catastrofare.', 'Aplicarea tehnicilor de respiratie diafragmatica zilnic'),
(3, 3, '2026-10-20', 'Progres moderat', 'Reducere semnificativa a atacurilor de panica pe parcursul saptamanii.', 'Expunere graduala in situatii sociale');

-- --------------------------------------------------------

--
-- Table structure for table `psihologi`
--

CREATE TABLE `psihologi` (
  `id_psiholog` int(11) NOT NULL,
  `nume` varchar(60) NOT NULL,
  `prenume` varchar(60) NOT NULL,
  `telefon` varchar(20) NOT NULL,
  `email` varchar(120) NOT NULL,
  `activ` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `psihologi`
--

INSERT INTO `psihologi` (`id_psiholog`, `nume`, `prenume`, `telefon`, `email`, `activ`) VALUES
(1, 'Marinescu', 'Elena', '0721100200', 'elena.marinescu@cabinet.ro', 1),
(2, 'Dumitrescu', 'Andrei', '0721300400', 'andrei.dumitrescu@cabinet.ro', 1),
(3, 'Stan', 'Ioana', '0721500600', 'ioana.stan@cabinet.ro', 1);

-- --------------------------------------------------------

--
-- Table structure for table `psihologi_specializari`
--

CREATE TABLE `psihologi_specializari` (
  `id_psiholog` int(11) NOT NULL,
  `id_specializare` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `psihologi_specializari`
--

INSERT INTO `psihologi_specializari` (`id_psiholog`, `id_specializare`) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 2),
(3, 4);

-- --------------------------------------------------------

--
-- Table structure for table `servicii_terapie`
--

CREATE TABLE `servicii_terapie` (
  `id_serviciu` int(11) NOT NULL,
  `denumire` varchar(120) NOT NULL,
  `durata_minute` int(11) NOT NULL DEFAULT 50,
  `tarif` decimal(10,2) NOT NULL,
  `tip_sedinta` enum('Individual','Cuplu','Familie','Evaluare') NOT NULL DEFAULT 'Individual'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `servicii_terapie`
--

INSERT INTO `servicii_terapie` (`id_serviciu`, `denumire`, `durata_minute`, `tarif`, `tip_sedinta`) VALUES
(1, 'Sedinta psihoterapie individuala', 50, 220.00, 'Individual'),
(2, 'Evaluare psihologica initiala', 60, 280.00, 'Evaluare'),
(3, 'Terapie de cuplu', 80, 350.00, 'Cuplu'),
(4, 'Consiliere vocationala', 50, 200.00, 'Individual');

-- --------------------------------------------------------

--
-- Table structure for table `specializari`
--

CREATE TABLE `specializari` (
  `id_specializare` int(11) NOT NULL,
  `denumire` varchar(120) NOT NULL,
  `descriere` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `specializari`
--

INSERT INTO `specializari` (`id_specializare`, `denumire`, `descriere`) VALUES
(1, 'Psihoterapie cognitiv-comportamentala', 'Interventii structurate pentru anxietate, stres si gandire disfunctionala'),
(2, 'Psihologie clinica', 'Evaluare psihologica si psihodiagnostic clinic'),
(3, 'Consiliere vocationala', 'Orientare in cariera si adaptare profesionala'),
(4, 'Psihoterapie sistemica de cuplu si familie', 'Interventii pentru dinamica relationala si comunicare in familie');

-- --------------------------------------------------------

--
-- Table structure for table `teste_psihologice`
--

CREATE TABLE `teste_psihologice` (
  `id_test` int(11) NOT NULL,
  `denumire_test` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teste_psihologice`
--

INSERT INTO `teste_psihologice` (`id_test`, `denumire_test`) VALUES
(1, 'Inventarul de Depresie Beck II'),
(2, 'Scala de Anxietate Generalizata'),
(3, 'Scala Stresului Perceput');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aplicari_teste`
--
ALTER TABLE `aplicari_teste`
  ADD PRIMARY KEY (`id_aplicare`),
  ADD KEY `fk_ap_test` (`id_test`),
  ADD KEY `fk_ap_pacient` (`id_pacient`);

--
-- Indexes for table `pacienti`
--
ALTER TABLE `pacienti`
  ADD PRIMARY KEY (`id_pacient`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `plati`
--
ALTER TABLE `plati`
  ADD PRIMARY KEY (`id_plata`),
  ADD KEY `fk_plati_programare` (`id_programare`);

--
-- Indexes for table `programari`
--
ALTER TABLE `programari`
  ADD PRIMARY KEY (`id_programare`),
  ADD KEY `fk_prog_pacient` (`id_pacient`),
  ADD KEY `fk_prog_psiholog` (`id_psiholog`),
  ADD KEY `fk_prog_serviciu` (`id_serviciu`);

--
-- Indexes for table `progres_pacient`
--
ALTER TABLE `progres_pacient`
  ADD PRIMARY KEY (`id_progres`),
  ADD UNIQUE KEY `id_programare` (`id_programare`);

--
-- Indexes for table `psihologi`
--
ALTER TABLE `psihologi`
  ADD PRIMARY KEY (`id_psiholog`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `psihologi_specializari`
--
ALTER TABLE `psihologi_specializari`
  ADD PRIMARY KEY (`id_psiholog`,`id_specializare`),
  ADD KEY `fk_ps_specializare` (`id_specializare`);

--
-- Indexes for table `servicii_terapie`
--
ALTER TABLE `servicii_terapie`
  ADD PRIMARY KEY (`id_serviciu`),
  ADD UNIQUE KEY `denumire` (`denumire`);

--
-- Indexes for table `specializari`
--
ALTER TABLE `specializari`
  ADD PRIMARY KEY (`id_specializare`),
  ADD UNIQUE KEY `denumire` (`denumire`);

--
-- Indexes for table `teste_psihologice`
--
ALTER TABLE `teste_psihologice`
  ADD PRIMARY KEY (`id_test`),
  ADD UNIQUE KEY `denumire_test` (`denumire_test`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aplicari_teste`
--
ALTER TABLE `aplicari_teste`
  MODIFY `id_aplicare` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pacienti`
--
ALTER TABLE `pacienti`
  MODIFY `id_pacient` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `plati`
--
ALTER TABLE `plati`
  MODIFY `id_plata` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `programari`
--
ALTER TABLE `programari`
  MODIFY `id_programare` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `progres_pacient`
--
ALTER TABLE `progres_pacient`
  MODIFY `id_progres` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `psihologi`
--
ALTER TABLE `psihologi`
  MODIFY `id_psiholog` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `servicii_terapie`
--
ALTER TABLE `servicii_terapie`
  MODIFY `id_serviciu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `specializari`
--
ALTER TABLE `specializari`
  MODIFY `id_specializare` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `teste_psihologice`
--
ALTER TABLE `teste_psihologice`
  MODIFY `id_test` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `aplicari_teste`
--
ALTER TABLE `aplicari_teste`
  ADD CONSTRAINT `fk_ap_pacient` FOREIGN KEY (`id_pacient`) REFERENCES `pacienti` (`id_pacient`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_ap_test` FOREIGN KEY (`id_test`) REFERENCES `teste_psihologice` (`id_test`);

--
-- Constraints for table `plati`
--
ALTER TABLE `plati`
  ADD CONSTRAINT `fk_plati_programare` FOREIGN KEY (`id_programare`) REFERENCES `programari` (`id_programare`);

--
-- Constraints for table `programari`
--
ALTER TABLE `programari`
  ADD CONSTRAINT `fk_prog_pacient` FOREIGN KEY (`id_pacient`) REFERENCES `pacienti` (`id_pacient`),
  ADD CONSTRAINT `fk_prog_psiholog` FOREIGN KEY (`id_psiholog`) REFERENCES `psihologi` (`id_psiholog`),
  ADD CONSTRAINT `fk_prog_serviciu` FOREIGN KEY (`id_serviciu`) REFERENCES `servicii_terapie` (`id_serviciu`);

--
-- Constraints for table `progres_pacient`
--
ALTER TABLE `progres_pacient`
  ADD CONSTRAINT `fk_progres_programare` FOREIGN KEY (`id_programare`) REFERENCES `programari` (`id_programare`) ON DELETE CASCADE;

--
-- Constraints for table `psihologi_specializari`
--
ALTER TABLE `psihologi_specializari`
  ADD CONSTRAINT `fk_ps_psiholog` FOREIGN KEY (`id_psiholog`) REFERENCES `psihologi` (`id_psiholog`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_ps_specializare` FOREIGN KEY (`id_specializare`) REFERENCES `specializari` (`id_specializare`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

