CREATE OR REPLACE TABLE JCREW.LP_JCR2504_IQ
(
Priority INT,MastercustomerID VARCHAR,SourceCustomerNumber VARCHAR,Email VARCHAR,EmailStatus VARCHAR,FirstName VARCHAR,MiddleName VARCHAR,LastName VARCHAR,Address1 VARCHAR,Address2 VARCHAR,Suite VARCHAR,City VARCHAR,State VARCHAR,ZipCode VARCHAR,ZipEXT VARCHAR,Country VARCHAR,AddressCertified VARCHAR,C_SuspectFlag VARCHAR,c_CrossBrandFlag VARCHAR,c_primaryphysicalstorejc VARCHAR,c_primaryphysicalstorefa VARCHAR,c_loyaltyflag VARCHAR,c_returnratefa VARCHAR,c_returnratejc VARCHAR,c_plccapplicationstatus VARCHAR,c_plccclosedate VARCHAR,c_plccflag VARCHAR,c_plccsignupchannel VARCHAR,c_plccsignupdate VARCHAR,c_plccsignupstore VARCHAR,c_plccstatus VARCHAR,c_totalrevenue12fm VARCHAR,c_totalrevenuefa12fm VARCHAR,c_totalrevenuejc12fm VARCHAR,c_loyaltyid VARCHAR,c_loyaltyjcccpoints VARCHAR,c_clvrevenue1yearfa VARCHAR,c_clvrevenue1yearjc VARCHAR,TransactionCount_L12M VARCHAR,L12M_JCrew_Only_TransactionCount VARCHAR,L12M_JCrew_Online_Only_TransactionCount VARCHAR,SaleRevenue_L12M VARCHAR,L12M_JCrew_Only_Spend VARCHAR,L12M_JCrew_Only_Margin VARCHAR,L12M_JCrew_Online_Only_Spend VARCHAR,L12M_percent_of_Spend_Online VARCHAR,L12M_percent_of_Spend_Online_MOD VARCHAR,L12M_Start VARCHAR,L12M_End VARCHAR,c_lasttransactiondatejc VARCHAR,SourceID VARCHAR,ExecutionDate VARCHAR,IQ_DataSet VARCHAR
);

UPDATE PUBLIC.LP_S3_CREDENTIALS
SET isActive = 2
    ,FileName = 'LP_JCR2504_IQ'
    ,DestinationTable = 'LP_JCR2504_IQ'
WHERE ConfigID = 21;

SELECT * FROM PUBLIC.LP_S3_CREDENTIALS
WHERE isActive = 2;

CALL PUBLIC.LP_IMPORT_S3FILES_BYDEMAND();
--CALL PUBLIC.LP_IMPORT_S3FILES_BYDEMAND_VALIDATION();

SELECT COUNT(*) FROM JCREW.LP_JCR2504_IQ;
--339475

SELECT * FROM JCREW.LP_EXT_EmployeeSeedList_FA WHERE UseFlag = '1' ORDER BY "First Name";

UPDATE LP_EXT_EmployeeSeedList_FA SET UseFlag = 0 WHERE "First Name" NOT IN ('Anna','Alvaro','Kevin','Nadia','Frits');

--DROP TABLE LP_JCR2504_MailFile;

CALL JCREW.LP_01_MAILFILE_JCR2504('No','JCR2504');

SELECT Priority,COUNT(*)
FROM JCREW.LP_JCR2504_MailFile
GROUP BY Priority
ORDER BY Priority;

SELECT Priority,COUNT(*)
FROM JCREW.LP_JCR2504_MailFile
WHERE c_plccflag = 'Y'
AND Priority > 0
GROUP BY Priority
ORDER BY Priority;

SELECT COUNT(*) FROM JCREW.LP_JCR2504_MailFile;

COPY INTO @INTERNAL_JC/Accuzip/LP_JCR2504_MailFile.csv.gz
FROM
(
    SELECT LineID,FullName AS First,Address1 AS Address,Address2,City,State AS St,Zip,'US' AS Country
    FROM JCREW.LP_JCR2504_MailFile
    ORDER BY Zip
)
HEADER = TRUE
SINGLE = TRUE
OVERWRITE = TRUE
MAX_FILE_SIZE = 2000000000
FILE_FORMAT = (FIELD_OPTIONALLY_ENCLOSED_BY = '"' NULL_IF=(''))
;
--563284

--DELETE FROM PUBLIC.LP_AZ_GUID WHERE JobID = 'JCR2504';

INSERT INTO PUBLIC.LP_AZ_GUID
SELECT 'JCR2504','25101373-5907-4129-ABE4-C299351AEA5B',CURRENT_TIMESTAMP;

SELECT * FROM PUBLIC.LP_AZ_GUID
WHERE JobID LIKE 'JCR2504%';

--DROP TABLE JCREW.LP_JCR2504_MAILFILE_NCOA;

SELECT COUNT(*) AS Counts,'MailFile' AS TableType FROM JCREW.LP_JCR2504_MAILFILE
UNION ALL
SELECT COUNT(*) AS Counts,'NCOA' AS TableType FROM JCREW.LP_JCR2504_MAILFILE_NCOA;

SELECT * FROM JCREW.LP_JCR2504_MAILFILE_NCOA
LIMIT 5;

UPDATE JCREW.LP_JCR2504_MAILFILE
SET SUPPRESSIONTYPE = 'ADR'
WHERE Priority IN (-4,-2);

UPDATE JCREW.LP_JCR2504_MAILFILE
SET SUPPRESSIONTYPE = 'HH'
WHERE Priority IN (-5);

SELECT Priority,SUPPRESSIONTYPE,DEDUPETYPE,COUNT(*)
FROM JCREW.LP_JCR2504_MAILFILE
GROUP BY Priority,SUPPRESSIONTYPE,DEDUPETYPE
ORDER BY PRIORITY;

CALL PUBLIC.LP_02_AccuzipOutput_JC('JCREW','LP_JCR2504_Mailfile',0);
CALL PUBLIC.LP_05_UPD_DDNC('JCREW','LP_JCR2504_Mailfile');
CALL PUBLIC.LP_06_UPD_Prison('JCREW','LP_JCR2504_Mailfile');
CALL PUBLIC.LP_07_UPD_DMA('JCREW','LP_JCR2504_Mailfile','''Prospects''');
CALL PUBLIC.LP_08_UPD_BADDATA('JCREW','LP_JCR2504_Mailfile');
CALL PUBLIC.LP_09_UPD_OBSCENE('JCREW','LP_JCR2504_Mailfile');
CALL PUBLIC.LP_10_UPD_SUPPRESSION('JCREW','LP_JCR2504_Mailfile');
CALL PUBLIC.LP_11_UPD_DUPLICATE('JCREW','LP_JCR2504_Mailfile');
CALL PUBLIC.LP_12_UPD_Multi('JCREW','LP_JCR2504_Mailfile','500',0);

UPDATE LP_JCR2504_Mailfile
SET isstateSuppress = 1
WHERE STATE_C IN ('AA', 'AE', 'AP', 'AS', 'FM', 'GU', 'MH', 'MP', 'PR', 'PW', 'VI');
-- 2474

ALTER TABLE LP_JCR2504_Mailfile ADD isAddressPOBox INT; 

UPDATE LP_JCR2504_Mailfile MF 
SET isAddressPOBox  =1
    ,isBlacklisted = 1
WHERE LineID IN (
             SELECT LineID
             FROM LP_JCR2301_MailFile
             WHERE STREET_C LIKE '%PO%BOX%'
             AND PRIORITY >0);
--195

--Reset isSelected
UPDATE JCREW.LP_JCR2504_MAILFILE
SET isSelected=0
WHERE isSelected = 1;

UPDATE JCREW.LP_JCR2504_MAILFILE
SET isSelected=1
WHERE (
    COALESCE(isCASSDrop,0)     = 0 
AND COALESCE(isDpvDrop,0)      = 0 
AND COALESCE(isStateSuppress,0) = 0 
AND COALESCE(isANKLink,0)       = 0 
AND COALESCE(isVacant,0)        = 0 
AND COALESCE(isBaddata,0)       = 0 
AND COALESCE(isObscene,0)       = 0 
AND COALESCE(isDDNC,0)          = 0 
AND COALESCE(isPrison,0)        = 0 
AND COALESCE(isHHSuppression,0) = 0 
AND COALESCE(isADRSuppression,0)= 0 
AND COALESCE(isPERSuppression,0)= 0 
AND COALESCE(isHHDuplicate,0)   = 0 
AND COALESCE(isDMASuppress,0)   = 0 
AND COALESCE(isRadiusDrop,0)    = 0
AND COALESCE(isAddressPOBox,0)  = 0
AND Priority >0
);
--43712

UPDATE JCREW.LP_JCR2504_MAILFILE
SET isSelected=1
WHERE Priority = 0;
--5

SELECT Priority,COUNT(*)
FROM LP_JCR2504_MAILFILE
WHERE isSelected = 1
GROUP BY PRIORITY
ORDER BY PRIORITY;

SELECT Priority,COUNT(*)
FROM LP_JCR2504_MailFile
WHERE isSelected = 1 AND c_plccflag = 'Y'
GROUP BY Priority
ORDER BY Priority;

SELECT Priority,COUNT(*)
FROM LP_JCR2504_MailFile
WHERE isSelected = 1 AND COALESCE(c_plccflag,'') = ''
GROUP BY Priority
ORDER BY Priority;

--Final Instructions
UPDATE JCREW.LP_JCR2504_MailFile
SET isMailed = 0
    ,isHoldout = 0
    ,FileName = NULL
WHERE (isMailed = 1 OR isholdout = 1);
--143756

CREATE OR REPLACE TEMPORARY TABLE tmpSelection AS
SELECT LineID,SaleRevenue_L12M,Priority
FROM JCREW.LP_JCR2504_MailFile
WHERE isSelected = 1 AND Priority = 1
ORDER BY CAST(CASE WHEN SaleRevenue_L12M = '' THEN 0 ELSE SaleRevenue_L12M END AS FLOAT) DESC
LIMIT 15000
;

SELECT COUNT(*) FROM tmpSelection;
--15000

ALTER TABLE LP_JCR2504_MailFile ALTER COLUMN KeyCode VARCHAR(32);

UPDATE LP_JCR2504_MailFile AS MF
SET MF.isMailed = 1
    ,MF.FileName = 'JCR2504_Top15k'
    ,MF.KeyCode = 'TOP'
FROM tmpSelection AS M
WHERE MF.LineID = M.LineID;
--15000

/*
UPDATE LP_JCR2504_MailFile
SET isMailed = 1
    ,FileName = 'JCR2504_Top10k'
    ,KeyCode = 'TOPSEEDS'
WHERE isSelected = 1 AND Priority = 0;
--24
*/

SELECT Priority,isMailed,isHoldout,COUNT(*),FileName,KeyCode
FROM JCREW.LP_JCR2504_MailFile
WHERE isMailed = 1
GROUP BY Priority,isMailed,isHoldout,FileName,KeyCode
ORDER BY Priority,isMailed,isHoldout,FileName;

CALL JCREW.LP_ExportOutputFile('LP_JCR2504_MailFile','JCR2504_Top15k');
CALL JCREW.LP_EXPORTOUTPUTFILE_SORTED_SALEREVENUE('LP_JCR2504_MailFile','JCR2504_Top15k');
CALL JCREW.LP_ExportOutputFile_WITH_SaleRevenue('LP_JCR2504_MailFile','JCR2504_Top15k');