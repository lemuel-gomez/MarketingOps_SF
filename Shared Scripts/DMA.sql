----------------------------------------------------------------
----- DMA ------------------------------------------------------
----------------------------------------------------------------

TRUNCATE TABLE MPS_FULL;
TRUNCATE TABLE PUBLIC.LP_LK_DMA;
INSERT INTO PUBLIC.LP_LK_DMA
SELECT LAST_NAME,FIRST_NAME,CARE_OF,ADDRESS,CITY,STATE,ZIP,ZIP4,DECEASED,CATALOG,PRINT_MEDIA,OTHER_MAIL
,LEFT(Zip,5)||SOUNDEX(REGEXP_REPLACE(LAST_NAME,'[^\x00-\x7F]',''))||REPLACE(REGEXP_REPLACE(ADDRESS,'[^\x00-\x7F]',''),' ','')
FROM PUBLIC.MPS_FULL
;

SELECT COUNT(*),'LP_LK_DMA' AS TableName FROM PUBLIC.LP_LK_DMA
UNION ALL
SELECT COUNT(*),'MPS_FULL' AS TableName FROM PUBLIC.MPS_FULL;