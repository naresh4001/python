

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