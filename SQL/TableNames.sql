
use poojithamssql

SELECT table_name
FROM INFORMATION_SCHEMA.TABLES
WHERE table_type = 'BASE TABLE'

SELECT name
FROM sys.tables

SELECT name
FROM sysobjects
WHERE xtype = 'U'

SELECT name
FROM sys.objects
WHERE type_desc = 'USER_TABLE'

SELECT *
FROM INFORMATION_SCHEMA.TABLES
WHERE table_type = 'BASE TABLE'

select * from SalaryFiles