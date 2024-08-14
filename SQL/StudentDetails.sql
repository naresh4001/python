
use poojithamssql

create table StudentDetails(
SNO  int IDENTITY(5000,1)  ,
StudentID int primary key,
StudentName varchar(50),
STAddress varchar(250),
EmailID varchar(50),
PhoneNO varchar(20)
)

select FileID,FileName from dbo.Files order by 1 desc

select * from StudentDetails order by 1

insert into StudentDetails(StudentID,StudentName,STAddress,EmailID,PhoneNO,DateOfBirth) values (6,'Poojitha Nuthalapati','Wakra,Qatar','poojitha060905@gmail.com','0097466269078',getDate())


insert into StudentDetails(StudentID,StudentName,STAddress,EmailID,PhoneNO,DateOfBirth) values (7001,'Poojitha Nuthalapati','Wakra,Qatar','poojitha060905@gmail.com','0097466269078','2005-09-06')

insert into StudentDetails(StudentID,StudentName,STAddress,EmailID,PhoneNO) values (3,'Hasit Nuthalapati','Wakra,Qatar','hasitkarthikeyanuthalapati@gmail.com','0097466143656')

EXEC InsertStudentDetails @StudentID = 4, @StudentName = 'John Doe', @STAddress = '123 Main St', @EmailID = 'johndoe@example.com', @PhoneNO = '123-456-7890';


EXEC InsertStudentDetails 5, 'John Doe', '123 Main St','johndoe@example.com','123-456-7890';

--delete from StudentDetails where SNO=5002



select * from StudentDetails where EmailID like '%gmail.com'


EXEC SelectAllStudentDetails;





EXEC InsertStudentDetailsNew 6, 'John Doe', '123 Main St','johndoe@example.com','123-456-7890',GetDate();
EXEC SelectAllStudentDetails;
EXEC DeleteStudentDetails 5;
EXEC SelectStudentDetailsByID 4;

--insert
alter PROCEDURE InsertStudentDetails
    @StudentIDs int,
    @StudentName varchar(50),
    @STAddress varchar(250),
    @EmailID varchar(50),
    @PhoneNO varchar(20),
	@DOB Varchar(30)
AS
BEGIN
    INSERT INTO StudentDetails (StudentID, StudentName, STAddress, EmailID, PhoneNO,DateOfBirth)
    VALUES (@StudentIDs, @StudentName, @STAddress, @EmailID, @PhoneNO,@DOB);
END;


--select all
alter PROCEDURE SelectAllStudentDetails
AS
BEGIN
    SELECT SNO, StudentID, StudentName, STAddress, EmailID, PhoneNO,DateOfBirth
    FROM StudentDetails;
END;


--Delete 
CREATE PROCEDURE DeleteStudentDetails
    @StudentID int
AS
BEGIN
    DELETE FROM StudentDetails
    WHERE StudentID = @StudentID;
END;

--select by student id
CREATE PROCEDURE SelectStudentDetailsByID
    @StudentID int
AS
BEGIN
    SELECT SNO, StudentID, StudentName, STAddress, EmailID, PhoneNO
    FROM StudentDetails
    WHERE StudentID = @StudentID;
END;


ALTER TABLE StudentDetails
ADD DateOfBirth DATE;

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
	Update StudentDetails Set StudentID = @StudentIDs, StudentName=@StudentName, STAddress=@STAddress,EmailID=@EmailID,PhoneNO=@PhoneNO,DateOfBirth=@DOB WHERE  StudentID = @StudentIDs;
END;


