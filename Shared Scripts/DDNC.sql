----------------------------------------------------------------
----- DDNC -----------------------------------------------------
----------------------------------------------------------------

TRUNCATE TABLE PUBLIC.LP_LK_DDNC_RAW;

--Load DDNC file from Website to LP_LK_DDNC_RAW

CALL PUBLIC.LP_LK_DDNC_LoadAZ();

SELECT * FROM LP_LK_DDNC
LIMIT 100;