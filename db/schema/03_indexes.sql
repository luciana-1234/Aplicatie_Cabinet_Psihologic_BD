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
