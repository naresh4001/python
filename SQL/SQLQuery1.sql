


use poojithamssql;

select top 100 FileID,FileName from dbo.Files order by 1 desc

select top 100 * from SalaryFiles

select top 100 * from dbo.ConfigParameters


CREATE TABLE dbo.ConfigParameters (
    ParameterID INT PRIMARY KEY IDENTITY,
    ParameterName NVARCHAR(255) UNIQUE,
    ParameterValue NVARCHAR(MAX)
);


CREATE TABLE dbo.Files (
    FileID INT PRIMARY KEY IDENTITY,
    FileName NVARCHAR(255),
    FileData VARBINARY(MAX)
);


ParameterID	ParameterName	ParameterValue
1	EmailFrom	nuthalapatinareshbabu@gmail.com
2	EmailAlert	poojitha060905@gmail.com


CREATE PROCEDURE dbo.InsertConfigParameter
    @ParameterName NVARCHAR(50),
    @ParameterValue NVARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    -- Check if the parameter already exists
    IF EXISTS (
        SELECT 1
        FROM ConfigParameters
        WHERE  ParameterName = @ParameterName
    )
    BEGIN
        -- Update the existing parameter
        UPDATE ConfigParameters
        SET ParameterValue = @ParameterValue
        WHERE  ParameterName = @ParameterName
    END
    ELSE
    BEGIN
        -- Insert a new parameter
        INSERT INTO ConfigParameters (ParameterName, ParameterValue)
        VALUES (@ParameterName, @ParameterValue)
    END
END
