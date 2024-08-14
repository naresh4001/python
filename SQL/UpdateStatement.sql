use poojithamssql


--update by SNO 
alter PROCEDURE UpdateStudentDetailsBySNO
    @SNO int,
	@StudentIDs int,
    @StudentName varchar(50),
    @STAddress varchar(250),
    @EmailID varchar(50),
    @PhoneNO varchar(20),
	@DOB Varchar(30)
AS
BEGIN
	Update StudentDetails Set StudentID = @StudentIDs, StudentName=@StudentName, STAddress=@STAddress,EmailID=@EmailID,PhoneNO=@PhoneNO, DateOfBirth=@DOB 	WHERE  SNO = @SNO;
END;


select * from StudentDetails order by 1 desc

exec UpdateStudentDetailsBySNO 5008, 2152 , 'Sujana Pemmasani', 'Ezdan 9 Wakra', 'sujananaresh@gmail.com', '0097433861875','1980-05-15'