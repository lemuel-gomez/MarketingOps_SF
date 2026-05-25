SELECT DISTINCT REPLACE(KeyCode,'_H',''),Priority
FROM     LP_JCR2504_MailFile
WHERE    (COALESCE(isMailed,0)=1 or COALESCE(isholdout,0)=1 ) and Priority>0 
ORDER BY REPLACE(KeyCode,'_H',''),Priority;

COPY INTO @INTERNAL_JC/Matchback/AgilOne_DMM_Mail_20250926.csv.gz
FROM
(
    SELECT DISTINCT
		 '2025-12-01' AS "AttributionStartDate"
		,'45' AS "AttributionWindow"
		,'Top Customer Gift 2025' AS "CampaignName"
		,'JCR2504' AS "SourceCampaignNumber"
		,'directMail' AS "DispatchType"
		,'2025' AS "DispatchSubType"
		,'Top Customer Gift 2025' AS "DispatchName"
		,CONCAT(KeyCode,'2025') AS "SourceDispatchNumber"
		,'' AS "MessageContent"
		,CONCAT(KeyCode,'2025') AS "MessageSubject"
		,CASE REPLACE(KeyCode,'_H','')
            WHEN 'REACT' THEN 'Reactivation Customers'
            WHEN 'TOP' THEN 'Gold Passport Members'
            END AS "MessageName"
		,'' AS "MessageVariant"
		,CONCAT(KeyCode,'2025') AS "SourceMessageNumber"
		,NULL AS "Cost"
    FROM     LP_JCR2504_MailFile
    WHERE    (COALESCE(isMailed,0)=1 or COALESCE(isholdout,0)=1 ) and Priority>0 
    ORDER BY CONCAT(KeyCode,'2025')
)
HEADER = TRUE
SINGLE = TRUE
OVERWRITE = TRUE
MAX_FILE_SIZE = 2000000000
FILE_FORMAT = (FIELD_OPTIONALLY_ENCLOSED_BY = '"' NULL_IF=(''))
;
--1

COPY INTO @INTERNAL_JC/Matchback/AgilOne_DMM_Mailing_20260413.csv.gz
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
		,'2025-12-01' AS "InHomeDate"
		,'' AS "SourceAddressNumber"
		,SourceCustomerNumber AS "SourceCustomerNumber"
		,CONCAT(KeyCode,'2025') AS "SourceMessageNumber"
		,NULL AS "c_deletedflag"
    FROM    LP_JCR2504_MailFile
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
--15000
    