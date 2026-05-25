DECLARE
    CLientName STRING;
    TableName STRING;
BEGIN
    CALL system$wait(10);
    
    ClientName := (SELECT TABLE_SCHEMA FROM PUBLIC.CURRENTTABLE);
    TableName := (SELECT TABLE_NAME FROM PUBLIC.CURRENTTABLE);        
    
    EXECUTE IMMEDIATE '
    CREATE OR REPLACE TABLE PUBLIC.CURRENTFILENAMES AS
    SELECT FileName,ROW_NUMBER() OVER(ORDER BY FileName) AS FileNumber
    FROM (
        SELECT DISTINCT FileName
        FROM ' || ClientName || '.' || TableName || '
        WHERE isMailed = 1 OR isHoldOut = 1
        ) AS MF'
    ;

    LET Result ResultSet := (SELECT * FROM PUBLIC.CURRENTFILENAMES ORDER BY FileNumber ASC);

    RETURN TABLE(Result);
END;