--DNM

SELECT * FROM JCREW.LP_EXT_DONOTMAIL ORDER BY LIneID DESC LIMIT 100;

SELECT MAX(LIneID) FROM JCREW.LP_EXT_DONOTMAIL;
--223675

INSERT INTO JCREW.LP_EXT_DONOTMAIL
SELECT 'N/A', 'Jared','Cok','9200 Greenwood Ave N','Apt 302','Seattle','WA','32836','','','',223650,'Manually inserted','2025-11-19' UNION ALL
SELECT 'N/A', 'Doug','Heichlinger','4950 Westcroft Blvd','Apt 371','Chantilly','VA','94949','','','',223651,'Manually inserted','2025-11-19' UNION ALL
SELECT 'N/A', 'Kelly','Kirkwood','234 Skillman Ave','Apt 3M','Brooklyn','NY','94109','','','',223652,'Manually inserted','2025-11-19' UNION ALL
SELECT 'N/A', 'Jessi','Earp','715 Rollerton Rd','Apt 406','Charlotte','NC','94114','','','',223653,'Manually inserted','2025-11-19' UNION ALL
SELECT 'N/A', 'Timothy','Carpenter','2560 Polk St','Apt 8','San Francisco','CA','84664','','','',223654,'Manually inserted','2025-11-19' UNION ALL
SELECT 'N/A', 'Jared','Cok','9200 Greenwood Ave N Apt 302','','Seattle','WA','94920','','','',223655,'Manually inserted','2025-11-19' UNION ALL
SELECT 'N/A', 'Doug','Heichlinger','4950 Westcroft Blvd Apt 371','','Chantilly','VA','20151','','','',223656,'Manually inserted','2025-11-19' UNION ALL
SELECT 'N/A', 'Kelly','Kirkwood','234 Skillman Ave Apt 3M','','Brooklyn','NY','1810','','','',223657,'Manually inserted','2025-11-19' UNION ALL
SELECT 'N/A', 'Jessi','Earp','715 Rollerton Rd Apt 406','','Charlotte','NC','48009','','','',223658,'Manually inserted','2025-11-19' UNION ALL
SELECT 'N/A', 'Timothy','Carpenter','2560 Polk St Apt 8','','San Francisco','CA','48302','','','',223659,'Manually inserted','2025-11-19' UNION ALL
SELECT 'N/A', 'Michelle','Estevez','8443 Tangelo Tree Dr','','Orlando','FL','94611','','','',223660,'Manually inserted','2025-11-19' UNION ALL
SELECT 'N/A', 'Timothy','Carpenter','1 Timothy Ct','','Novato','CA','37207','','','',223661,'Manually inserted','2025-11-19' UNION ALL
SELECT 'N/A', 'Timothy','Carpenter','452 Elizabeth St','','San Francisco','CA','1034','','','',223662,'Manually inserted','2025-11-19' UNION ALL
SELECT 'N/A', 'Dave','Lainhart','1001 S 1200 W ','','Mapleton','UT','65804','','','',223663,'Manually inserted','2025-11-19' UNION ALL
SELECT 'N/A', 'Tracy','','15 Madrona Ave','','Belvedere','CA','19067','','','',223664,'Manually inserted','2025-11-19' UNION ALL
SELECT 'N/A', 'Caitlin','Meehan','10 Copley Dr','','Andover','MA','98103','','','',223665,'Manually inserted','2025-11-19' UNION ALL
SELECT 'N/A', 'Camila','Ferreira','636 E Lincoln St','','Birmingham','MI','11211','','','',223666,'Manually inserted','2025-11-19' UNION ALL
SELECT 'N/A', 'Abel','Ferreira','1871 Golf Ridge Dr S','','Bloomfield Hills','MI','47304','','','',223667,'Manually inserted','2025-11-19' UNION ALL
SELECT 'N/A', 'Michelle','Ferreira','55 Diablo Dr','','Oakland','CA','92625','','','',223668,'Manually inserted','2025-11-19' UNION ALL
SELECT 'N/A', 'Sara','Balsom','1103B N 5th St','','Nashville','TN','92056','','','',223669,'Manually inserted','2025-11-19' UNION ALL
SELECT 'N/A', 'Deborah','Phelon','641 Main Rd','','Grainville','MA','28205','','','',223670,'Manually inserted','2025-11-19' UNION ALL
SELECT 'N/A', 'Marty','Davis','5063 S Barnes Ct','','Springfield','MO','','','','',223671,'Manually inserted','2025-11-19' UNION ALL
SELECT 'N/A', 'Kerry','Stuhlmuller','7 Raab Dr','','Yardley','PA','','','','',223672,'Manually inserted','2025-11-19' UNION ALL
SELECT 'N/A', 'Dianna','Lott','3405 W Riverside Ave','','Muncie','IN','','','','',223673,'Manually inserted','2025-11-19' UNION ALL
SELECT 'N/A', 'Nicole','Kane','2630 Point Del Mar','','Corona Del Mar','CA','','','','',223674,'Manually inserted','2025-11-19' UNION ALL
SELECT 'N/A', 'Anatasia','Khabiev','4331 Apache St','','Oceanside','CA','','','','',223675,'Manually inserted','2025-11-19'
ORDER BY 12
;

SELECT CONCAT(REPEAT('0',5-LEN(Zip)),ZIP)
FROM JCREW.LP_EXT_DONOTMAIL
WHERE LEN(Zip) < 5;

UPDATE JCREW.LP_EXT_DONOTMAIL
SET ZIP = CONCAT(REPEAT('0',5-LEN(Zip)),ZIP)
WHERE LEN(Zip) < 5;
--12056

SELECT * FROM JCREW.LP_INT_AdditionalAddressSuppression ORDER BY LineID DESC LIMIT 100;

SELECT MAX(LIneID) FROM JCREW.LP_INT_AdditionalAddressSuppression;
--454

DELETE FROM JCREW.LP_INT_AdditionalAddressSuppression WHERE LINEID IN (
SELECT LineID
FROM JCREW.LP_INT_AdditionalAddressSuppression
GROUP BY LineID
HAVING COUNT(*) > 1);

INSERT INTO JCREW.LP_INT_AdditionalAddressSuppression
SELECT 429,'9200 Greenwood Ave N','Apt 302','Seattle','WA','32836','Manually inserted','2025-11-19',0 UNION ALL
SELECT 430,'4950 Westcroft Blvd','Apt 371','Chantilly','VA','94949','Manually inserted','2025-11-19',0 UNION ALL
SELECT 431,'234 Skillman Ave','Apt 3M','Brooklyn','NY','94109','Manually inserted','2025-11-19',0 UNION ALL
SELECT 432,'715 Rollerton Rd','Apt 406','Charlotte','NC','94114','Manually inserted','2025-11-19',0 UNION ALL
SELECT 433,'2560 Polk St','Apt 8','San Francisco','CA','84664','Manually inserted','2025-11-19',0 UNION ALL
SELECT 434,'9200 Greenwood Ave N Apt 302','','Seattle','WA','94920','Manually inserted','2025-11-19',0 UNION ALL
SELECT 435,'4950 Westcroft Blvd Apt 371','','Chantilly','VA','20151','Manually inserted','2025-11-19',0 UNION ALL
SELECT 436,'234 Skillman Ave Apt 3M','','Brooklyn','NY','1810','Manually inserted','2025-11-19',0 UNION ALL
SELECT 437,'715 Rollerton Rd Apt 406','','Charlotte','NC','48009','Manually inserted','2025-11-19',0 UNION ALL
SELECT 438,'2560 Polk St Apt 8','','San Francisco','CA','48302','Manually inserted','2025-11-19',0 UNION ALL
SELECT 439,'8443 Tangelo Tree Dr','','Orlando','FL','94611','Manually inserted','2025-11-19',0 UNION ALL
SELECT 440,'1 Timothy Ct','','Novato','CA','37207','Manually inserted','2025-11-19',0 UNION ALL
SELECT 441,'452 Elizabeth St','','San Francisco','CA','1034','Manually inserted','2025-11-19',0 UNION ALL
SELECT 442,'1001 S 1200 W ','','Mapleton','UT','65804','Manually inserted','2025-11-19',0 UNION ALL
SELECT 443,'15 Madrona Ave','','Belvedere','CA','19067','Manually inserted','2025-11-19',0 UNION ALL
SELECT 444,'10 Copley Dr','','Andover','MA','98103','Manually inserted','2025-11-19',0 UNION ALL
SELECT 445,'636 E Lincoln St','','Birmingham','MI','11211','Manually inserted','2025-11-19',0 UNION ALL
SELECT 446,'1871 Golf Ridge Dr S','','Bloomfield Hills','MI','47304','Manually inserted','2025-11-19',0 UNION ALL
SELECT 447,'55 Diablo Dr','','Oakland','CA','92625','Manually inserted','2025-11-19',0 UNION ALL
SELECT 448,'1103B N 5th St','','Nashville','TN','92056','Manually inserted','2025-11-19',0 UNION ALL
SELECT 449,'641 Main Rd','','Grainville','MA','28205','Manually inserted','2025-11-19',0 UNION ALL
SELECT 450,'5063 S Barnes Ct','','Springfield','MO','','Manually inserted','2025-11-19',0 UNION ALL
SELECT 451,'7 Raab Dr','','Yardley','PA','','Manually inserted','2025-11-19',0 UNION ALL
SELECT 452,'3405 W Riverside Ave','','Muncie','IN','','Manually inserted','2025-11-19',0 UNION ALL
SELECT 453,'2630 Point Del Mar','','Corona Del Mar','CA','','Manually inserted','2025-11-19',0 UNION ALL
SELECT 454,'4331 Apache St','','Oceanside','CA','','Manually inserted','2025-11-19',0;

SELECT CONCAT(REPEAT('0',5-LEN(Zip)),ZIP)
FROM JCREW.LP_INT_AdditionalAddressSuppression
WHERE LEN(Zip) < 5;

UPDATE JCREW.LP_INT_AdditionalAddressSuppression
SET ZIP = CONCAT(REPEAT('0',5-LEN(Zip)),ZIP)
WHERE LEN(Zip) < 5;
--22