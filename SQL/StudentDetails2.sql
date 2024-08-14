

--insert
CREATE PROCEDURE InsertStudentDetailsNew
    @StudentIDs int,
    @StudentName varchar(50),
    @STAddress varchar(250),
    @EmailID varchar(50),
    @PhoneNO varchar(20)
AS
BEGIN
    INSERT INTO StudentDetails (StudentID, StudentName, STAddress, EmailID, PhoneNO)  
	VALUES (@StudentIDs, @StudentName, @STAddress, @EmailID, @PhoneNO);
END;



insert into StudentDetails(StudentID,StudentName,STAddress,EmailID,PhoneNO) values (1,'Poojitha Nuthalapati','Wakra,Qatar','poojitha060905@gmail.com','0097466269078')




--update by SNO 
Create PROCEDURE UpdateStudentDetailsBySNO
    @SNO int,
	@StudentIDs int,
    @StudentName varchar,
    @STAddress varchar,
    @EmailID varchar,
    @PhoneNO varchar,
	@DOB Varchar
AS
BEGIN
    --SELECT SNO, StudentID, StudentName, STAddress, EmailID, PhoneNO
    --FROM StudentDetails
    

	Update StudentDetails Set StudentID = @StudentIDs, StudentName=@StudentName, STAddress=@STAddress,EmailID=@EmailID,PhoneNO=@PhoneNO,DateOfBirth=@DOB WHERE  SNO = @SNO;
END;

