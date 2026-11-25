--
-- Dumping data for table `aplicari_teste`
--

INSERT INTO `aplicari_teste` (`id_aplicare`, `id_pacient`, `id_test`, `scor`) VALUES
(4, 1, 2, 14),
(5, 1, 3, 26),
(6, 2, 1, 18);

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
-- Dumping data for table `progres_pacient`
--

INSERT INTO `progres_pacient` (`id_progres`, `id_programare`, `data_evaluare`, `nivel_evolutie`, `observatii_sedinta`, `obiective_urmatoare`) VALUES
(1, 1, '2026-10-12', 'Stationar', 'Evaluare initiala completa; identificat nivel moderat de anxietate sociala.', 'Completarea jurnalului de ganduri automate'),
(2, 2, '2026-10-19', 'Progres usor', 'Pacienta recunoaste mai rapid tiparele de catastrofare.', 'Aplicarea tehnicilor de respiratie diafragmatica zilnic'),
(3, 3, '2026-10-20', 'Progres moderat', 'Reducere semnificativa a atacurilor de panica pe parcursul saptamanii.', 'Expunere graduala in situatii sociale');

-- --------------------------------------------------------
--
-- Dumping data for table `psihologi`
--

INSERT INTO `psihologi` (`id_psiholog`, `nume`, `prenume`, `telefon`, `email`, `activ`) VALUES
(1, 'Marinescu', 'Elena', '0721100200', 'elena.marinescu@cabinet.ro', 1),
(2, 'Dumitrescu', 'Andrei', '0721300400', 'andrei.dumitrescu@cabinet.ro', 1),
(3, 'Stan', 'Ioana', '0721500600', 'ioana.stan@cabinet.ro', 1);

-- --------------------------------------------------------
INSERT INTO `psihologi_specializari` (`id_psiholog`, `id_specializare`) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 2),
(3, 4);

-- --------------------------------------------------------
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
-- Dumping data for table `specializari`
--

INSERT INTO `specializari` (`id_specializare`, `denumire`, `descriere`) VALUES
(1, 'Psihoterapie cognitiv-comportamentala', 'Interventii structurate pentru anxietate, stres si gandire disfunctionala'),
(2, 'Psihologie clinica', 'Evaluare psihologica si psihodiagnostic clinic'),
(3, 'Consiliere vocationala', 'Orientare in cariera si adaptare profesionala'),
(4, 'Psihoterapie sistemica de cuplu si familie', 'Interventii pentru dinamica relationala si comunicare in familie');

-- --------------------------------------------------------

--
-- Dumping data for table `teste_psihologice`
--

INSERT INTO `teste_psihologice` (`id_test`, `denumire_test`) VALUES
(1, 'Inventarul de Depresie Beck II'),
(2, 'Scala de Anxietate Generalizata'),
(3, 'Scala Stresului Perceput');
