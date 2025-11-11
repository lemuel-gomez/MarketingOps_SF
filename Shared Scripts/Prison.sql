----------------------------------------------------------------
----- Prison ---------------------------------------------------
----------------------------------------------------------------

DROP TABLE LP_LK_Prison_AZ;

--Load Prison file to LP_LK_Prison_AZ (Create new table)

SELECT * FROM PUBLIC.LP_LK_Prison_AZ;

TRUNCATE TABLE LP_LK_Prison;
INSERT INTO LP_LK_Prison
SELECT facility_name
,COALESCE(CAST(phone AS STRING),FAX)
,address1
,address2
,NULL
,NULL
,city
,state
,LEFT(zip,5)
,CASE WHEN REPLACE(zip,LEFT(Zip,5)||'-','') = zip THEN '' ELSE REPLACE(zip,LEFT(Zip,5)||'-','') END
FROM LP_LK_Prison_AZ;

SELECT * FROM LP_LK_Prison;