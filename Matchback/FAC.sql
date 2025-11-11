--FAC2413 Spring Mailer – in home 11/01/2024 for 45 days attribution window. 

SELECT DISTINCT LEFT(KeyCode,11)
FROM LP_FAC2413_MailFile
WHERE (COALESCE(isMailed,0) = 1 OR COALESCE(isholdout,0) = 1) AND Priority > 0 
ORDER BY LEFT(KeyCode,11);

COPY INTO @INTERNAL_JC/Matchback/AgilOne_DMM_Mail_20241128.csv.gz
FROM
(
SELECT DISTINCT
		 '2024-11-01' AS "AttributionStartDate"
		,'45' AS "AttributionWindow"
		,'Factory Holiday Catalog' AS "CampaignName"
		,'FAC2413' AS "SourceCampaignNumber"
		,'directMail' AS "DispatchType"
		,'2024' AS "DispatchSubType"
		,'Factory Holiday Catalog' AS "DispatchName"
		,KeyCode AS "SourceDispatchNumber"
		,'' AS "MessageContent"
		,KeyCode AS "MessageSubject"
		,CASE LEFT(KeyCode,11) 
            WHEN 'FACHOL24_01' THEN 'J.Crew Cred Card holders that have shopped Factory or Factory AND J.Crew'
            WHEN 'FACHOL24_02' THEN 'Omni shoppers that spent $75+ in L24M'
            WHEN 'FACHOL24_03' THEN 'Instore only shoppers that spent $75+ in L24M'
            WHEN 'FACHOL24_04' THEN 'Online shoppers that spent $75+ in L24M'
            END AS "MessageName"
		,'' AS "MessageVariant"
		,KeyCode AS "SourceMessageNumber"
		,NULL AS "Cost"
FROM JCREW.LP_FAC2413_MailFile
WHERE (COALESCE(isMailed,0) = 1 OR COALESCE(isholdout,0) = 1) AND Priority > 0 
ORDER BY KeyCode
)
HEADER = TRUE
SINGLE = TRUE
OVERWRITE = TRUE
MAX_FILE_SIZE = 2000000000
FILE_FORMAT = (FIELD_OPTIONALLY_ENCLOSED_BY = '"' NULL_IF=(''))
;

COPY INTO @INTERNAL_JC/Matchback/AgilOne_DMM_Mailing_20241128.csv.gz
FROM
(
SELECT  
		 FIRST_C AS "FirstName"
		,LAST_C AS "LastName"
		,STREET_C AS "Address1"
		,STREET2_C AS "Address2"
		,CITY_C AS "City"
		,STATE_C AS "State"
		,ZIP_C AS "ZipCode"
		,'US' AS "Country"
		,Email AS "Email"
		,'2024-11-01' AS "InHomeDate"
		,'' AS "SourceAddressNumber"
		,SourceCustomerNumber AS "SourceCustomerNumber"
		,KeyCode AS "SourceMessageNumber"
		,NULL AS "c_deletedflag"
		--Select Count(1)
FROM    LP_FAC2413_MailFile
WHERE (COALESCE(isMailed,0) = 1 OR COALESCE(isholdout,0) = 1) AND Priority > 0 
ORDER BY KeyCode
)
HEADER = TRUE
SINGLE = TRUE
OVERWRITE = TRUE
MAX_FILE_SIZE = 2000000000
FILE_FORMAT = (FIELD_OPTIONALLY_ENCLOSED_BY = '"' NULL_IF=(''))
;
