--DNM

SELECT * FROM JCREW.LP_EXT_DONOTMAIL ORDER BY LIneID DESC LIMIT 10;

SELECT MAX(LIneID) FROM JCREW.LP_EXT_DONOTMAIL;
--223630

INSERT INTO JCREW.LP_EXT_DONOTMAIL
SELECT 'N/A', 'Jose','Castro','1757 NE 4th Ave ','','Fort Lauderdale','FL','33305','','','',223630,'Manually inserted','2025-11-10'
ORDER BY 12
;

SELECT * FROM JCREW.LP_INT_AdditionalAddressSuppression ORDER BY LineID DESC LIMIT 10;
--409

DELETE FROM JCREW.LP_INT_AdditionalAddressSuppression WHERE LINEID IN (
SELECT LineID
FROM JCREW.LP_INT_AdditionalAddressSuppression
GROUP BY LineID
HAVING COUNT(*) > 1);

INSERT INTO JCREW.LP_INT_AdditionalAddressSuppression
SELECT 409,'1757 NE 4th Ave ','','Fort Lauderdale','FL','33305','Manually inserted','2025-11-10',0;