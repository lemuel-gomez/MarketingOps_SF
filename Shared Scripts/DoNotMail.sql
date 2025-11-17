--DNM

SELECT * FROM JCREW.LP_EXT_DONOTMAIL ORDER BY LIneID DESC LIMIT 100;

SELECT MAX(LIneID) FROM JCREW.LP_EXT_DONOTMAIL;
--223649

INSERT INTO JCREW.LP_EXT_DONOTMAIL
SELECT 'N/A', 'Amarah','Baluch','2820 Charter Dr','Apt 214','Troy','MI','48083','','','',223631,'Manually inserted','2025-11-17' UNION ALL
SELECT 'N/A', 'Irene','Sanpietro','5415 S Dorchester Ave','Apt 2A','Chicago','IL','60615','','','',223632,'Manually inserted','2025-11-17' UNION ALL
SELECT 'N/A', 'Amarah','Baluch','150 E Fayette St','Apt 404','Syracuse','NY','13202','','','',223633,'Manually inserted','2025-11-17' UNION ALL
SELECT 'N/A', 'Amanda','Louie','1705 Dock St','Unit 429','Tacoma','WA','98402','','','',223634,'Manually inserted','2025-11-17' UNION ALL
SELECT 'N/A', 'Amarah','Baluch','2820 Charter Dr Apt 214','','Troy','MI','48083','','','',223635,'Manually inserted','2025-11-17' UNION ALL
SELECT 'N/A', 'Irene','Sanpietro','5415 S Dorchester Ave Apt 2A','','Chicago','IL','60615','','','',223636,'Manually inserted','2025-11-17' UNION ALL
SELECT 'N/A', 'Amarah','Baluch','150 E Fayette St Apt 404','','Syracuse','NY','13202','','','',223637,'Manually inserted','2025-11-17' UNION ALL
SELECT 'N/A', 'Amanda','Louie','1705 Dock St Unit 429','','Tacoma','WA','98402','','','',223638,'Manually inserted','2025-11-17' UNION ALL
SELECT 'N/A', 'Vanessa','White','2704 Cool Lilac Ave','','Henderson','NV','89052-3835','','','',223639,'Manually inserted','2025-11-17' UNION ALL
SELECT 'N/A', 'Chad','Coyne','107 Colonial Dr','','Loveland','OH','45140','','','',223640,'Manually inserted','2025-11-17' UNION ALL
SELECT 'N/A', 'Nino','Marchionda','709 Cherry Tree Way','','Cranberry Township','PA','16066','','','',223641,'Manually inserted','2025-11-17' UNION ALL
SELECT 'N/A', 'Taylor','Gilliam','335 Skyridge Dr','','Sandy Springs','GA','30350','','','',223642,'Manually inserted','2025-11-17' UNION ALL
SELECT 'N/A', 'Samantha','Verzi','2766 Kingdom ave','','Melbourne','FL','32934','','','',223643,'Manually inserted','2025-11-17' UNION ALL
SELECT 'N/A', 'Jeff','Brauer','331 Mad Meadows Rd','','Warren','VT','5674','','','',223644,'Manually inserted','2025-11-17' UNION ALL
SELECT 'N/A', 'Laura','Wilson','2205 Stanely Ave','','Fort Worth','TX','76110','','','',223645,'Manually inserted','2025-11-17' UNION ALL
SELECT 'N/A', 'Irene','Sanpietro','6322 84 Pl','','Middle Village','NY','11379','','','',223646,'Manually inserted','2025-11-17' UNION ALL
SELECT 'N/A', 'Virginia ','Calderon','1902 Robinson Close','','Moosic','PA','18507','','','',223647,'Manually inserted','2025-11-17' UNION ALL
SELECT 'N/A', 'Margaret','Minogue','440 Pacing Way','','Westbury','NY','11590','','','',223648,'Manually inserted','2025-11-17' UNION ALL
SELECT 'N/A', 'Erin','Hadwiger','5824 S Louisville Ave','','Tulsa','OK','74135','','','',223649,'Manually inserted','2025-11-17'
ORDER BY 12
;

SELECT * FROM JCREW.LP_INT_AdditionalAddressSuppression ORDER BY LineID DESC LIMIT 100;
--428

DELETE FROM JCREW.LP_INT_AdditionalAddressSuppression WHERE LINEID IN (
SELECT LineID
FROM JCREW.LP_INT_AdditionalAddressSuppression
GROUP BY LineID
HAVING COUNT(*) > 1);

INSERT INTO JCREW.LP_INT_AdditionalAddressSuppression
SELECT 410,'2820 Charter Dr','Apt 214','Troy','MI','48083','Manually inserted','2025-11-17',0 UNION ALL
SELECT 411,'5415 S Dorchester Ave','Apt 2A','Chicago','IL','60615','Manually inserted','2025-11-17',0 UNION ALL
SELECT 412,'150 E Fayette St','Apt 404','Syracuse','NY','13202','Manually inserted','2025-11-17',0 UNION ALL
SELECT 413,'1705 Dock St','Unit 429','Tacoma','WA','98402','Manually inserted','2025-11-17',0 UNION ALL
SELECT 414,'2820 Charter Dr Apt 214','','Troy','MI','48083','Manually inserted','2025-11-17',0 UNION ALL
SELECT 415,'5415 S Dorchester Ave Apt 2A','','Chicago','IL','60615','Manually inserted','2025-11-17',0 UNION ALL
SELECT 416,'150 E Fayette St Apt 404','','Syracuse','NY','13202','Manually inserted','2025-11-17',0 UNION ALL
SELECT 417,'1705 Dock St Unit 429','','Tacoma','WA','98402','Manually inserted','2025-11-17',0 UNION ALL
SELECT 418,'2704 Cool Lilac Ave','','Henderson','NV','89052-3835','Manually inserted','2025-11-17',0 UNION ALL
SELECT 419,'107 Colonial Dr','','Loveland','OH','45140','Manually inserted','2025-11-17',0 UNION ALL
SELECT 420,'709 Cherry Tree Way','','Cranberry Township','PA','16066','Manually inserted','2025-11-17',0 UNION ALL
SELECT 421,'335 Skyridge Dr','','Sandy Springs','GA','30350','Manually inserted','2025-11-17',0 UNION ALL
SELECT 422,'2766 Kingdom ave','','Melbourne','FL','32934','Manually inserted','2025-11-17',0 UNION ALL
SELECT 423,'331 Mad Meadows Rd','','Warren','VT','5674','Manually inserted','2025-11-17',0 UNION ALL
SELECT 424,'2205 Stanely Ave','','Fort Worth','TX','76110','Manually inserted','2025-11-17',0 UNION ALL
SELECT 425,'6322 84 Pl','','Middle Village','NY','11379','Manually inserted','2025-11-17',0 UNION ALL
SELECT 426,'1902 Robinson Close','','Moosic','PA','18507','Manually inserted','2025-11-17',0 UNION ALL
SELECT 427,'440 Pacing Way','','Westbury','NY','11590','Manually inserted','2025-11-17',0 UNION ALL
SELECT 428,'5824 S Louisville Ave','','Tulsa','OK','74135','Manually inserted','2025-11-17',0;