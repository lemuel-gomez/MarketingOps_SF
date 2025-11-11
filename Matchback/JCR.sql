SELECT DISTINCT REPLACE(KeyCode,'_H',''),Priority
FROM     LP_JCR2501_MailFile
WHERE    (COALESCE(isMailed,0)=1 or COALESCE(isholdout,0)=1 ) and Priority>0 
ORDER BY REPLACE(KeyCode,'_H',''),Priority;

COPY INTO @INTERNAL_JC/Matchback/AgilOne_DMM_Mail_20251107.csv.gz
FROM
(
    SELECT DISTINCT
		 '2025-03-11' AS "AttributionStartDate"
		,'30' AS "AttributionWindow"
		,'March Spring 2025 Mailer' AS "CampaignName"
		,'JCR2501' AS "SourceCampaignNumber"
		,'directMail' AS "DispatchType"
		,'2025' AS "DispatchSubType"
		,'March Spring 2025 Mailer' AS "DispatchName"
		,KeyCode AS "SourceDispatchNumber"
		,'' AS "MessageContent"
		,KeyCode AS "MessageSubject"
		,CASE REPLACE(KeyCode,'_H','')
            WHEN 'GOLD' THEN 'Gold Passport Members'
            WHEN 'CAT' THEN 'Catalog Request Customers'
            END AS "MessageName"
		,'' AS "MessageVariant"
		,KeyCode AS "SourceMessageNumber"
		,NULL AS "Cost"
    FROM     LP_JCR2501_MailFile
    WHERE    (COALESCE(isMailed,0)=1 or COALESCE(isholdout,0)=1 ) and Priority>0 
    ORDER BY KeyCode
)
HEADER = TRUE
SINGLE = TRUE
OVERWRITE = TRUE
MAX_FILE_SIZE = 2000000000
FILE_FORMAT = (FIELD_OPTIONALLY_ENCLOSED_BY = '"' NULL_IF=(''))
;
--2

COPY INTO @INTERNAL_JC/Matchback/AgilOne_DMM_Mailing_20251107.csv.gz
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
		,'2025-03-11' AS "InHomeDate"
		,'' AS "SourceAddressNumber"
		,SourceCustomerNumber AS "SourceCustomerNumber"
		,KeyCode AS "SourceMessageNumber"
		,NULL AS "c_deletedflag"
    FROM    LP_JCR2501_MailFile
    WHERE  (COALESCE(isMailed,0) = 1 OR COALESCE(isholdout,0) = 1) 
    AND Priority>0 
    ORDER BY KeyCode
)
HEADER = TRUE
SINGLE = TRUE
OVERWRITE = TRUE
MAX_FILE_SIZE = 2000000000
FILE_FORMAT = (FIELD_OPTIONALLY_ENCLOSED_BY = '"' NULL_IF=(''))
;
--464189
    