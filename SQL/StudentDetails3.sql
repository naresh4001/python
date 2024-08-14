
--sleect by student id
CREATE PROCEDURE SelectStudentDetailsByID
    @StudentID int
AS
BEGIN
    SELECT SNO, StudentID, StudentName, STAddress, EmailID, PhoneNO
    FROM StudentDetails
    WHERE StudentID = @StudentID;
END;


--select all
CREATE PROCEDURE SelectAllStudentDetails
AS
BEGIN
    SELECT SNO, StudentID, StudentName, STAddress, EmailID, PhoneNO
    FROM StudentDetails;
END;

CREATE PROCEDURE SelectStudentDetailsByEmail
    @Email varchar(50)
AS
BEGIN
    SELECT SNO, StudentID, StudentName, STAddress, EmailID, PhoneNO
    FROM StudentDetails
    WHERE EmailID = @Email;
END;

exec SelectStudentDetailsByEmail 'poojitha060905@gmail.com'