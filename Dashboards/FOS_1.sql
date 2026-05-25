UPDATE PUBLIC.CurrentTable
SET Table_Schema = :clientname
    ,Table_Name = :tablename
    ,FileName = :filenumber
    ,VersionCode = :VersionCode
    ,ListType = :ListType
; 