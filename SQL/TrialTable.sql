


use poojithamssql;

select top 100 FileID,FileName from dbo.Files order by 1 desc

select top 100 * from SalaryFiles

select top 100 * from dbo.ConfigParameters


CREATE TABLE dbo.ConfigParameters (
    ParameterID INT PRIMARY KEY IDENTITY,
    ParameterName NVARCHAR(255) UNIQUE,
    ParameterValue NVARCHAR(MAX)
);

