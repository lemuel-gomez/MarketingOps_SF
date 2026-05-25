DECLARE
    FileNumber STRING;
BEGIN
    CALL system$wait(15);
    
    FileNumber := (SELECT FileName FROM PUBLIC.CURRENTTABLE);
    
    EXECUTE IMMEDIATE '
    CREATE OR REPLACE TEMPORARY TABLE tmpFileName AS
    SELECT FileName FROM PUBLIC.CURRENTFILENAMES WHERE FileNumber = ' || FileNumber || '
    ';

    LET Result ResultSet := (SELECT * FROM tmpFileName);

    RETURN TABLE(Result);
END;