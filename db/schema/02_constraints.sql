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
