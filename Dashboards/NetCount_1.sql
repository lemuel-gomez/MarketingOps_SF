CALL PUBLIC.LP_RPT_JOBSUMMARY();

CALL PUBLIC.LP_RPT_NetCount();

CALL PUBLIC.LP_RPT_OutputSummary();

CALL PUBLIC.LP_RPT_Obscene();

CALL PUBLIC.LP_RPT_AddressCount();

CALL PUBLIC.LP_RPT_Interaction();

SELECT * FROM tmpContactDuplicate;

CALL PUBLIC.LP_RPT_OutputPivot();

CALL PUBLIC.LP_RPT_BadDataDetails();

UPDATE CurrentTable SET Table_Schema = :clientname, Table_name = :tablename;