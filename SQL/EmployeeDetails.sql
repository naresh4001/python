
-- databasename

use poojithamssql


------------------------------------------------------------------------------

-- create table 

create table EmployeeDetails(
SNO  int IDENTITY(1000,1)  ,
EmployeeID int primary key,
EmployeeName varchar(50),
EmpAddress varchar(250),
EmailID varchar(50),
PhoneNO varchar(20)
)


------------------------------------------------------------------------------------------

--insert
create PROCEDURE InsertEmployeeDetails
    @EmployeeIDs int,
    @EmployeeName varchar(50),
    @EmpAddress varchar(250),
    @EmailID varchar(50),
    @PhoneNO varchar(20)
	
AS
BEGIN
    INSERT INTO EmployeeDetails (EmployeeID, EmployeeName, EmpAddress, EmailID, PhoneNO)
    VALUES (@EmployeeIDs, @EmployeeName, @EmpAddress, @EmailID, @PhoneNO);
END;

--insert execution

EXEC InsertEmployeeDetails 785, 'Lucy Kaze', '256 Road St','lucyk@gmail.com','175-789-9072';

--------------------------------------------------------------------------

--update by SNO 
alter PROCEDURE UpdateEmployeeDetailsBySNO   
	@EmployeeIDs int,
    @EmployeeName varchar(50),
    @EmpAddress varchar(250),
    @EmailID varchar(50),
    @PhoneNO varchar(20)
AS
BEGIN
	Update EmployeeDetails Set EmployeeID = @EmployeeIDs, EmployeeName=@EmployeeName, EmpAddress=@EmpAddress,EmailID=@EmailID,PhoneNO=@PhoneNO WHERE EmployeeID = @EmployeeIDs;
END;

--update execution

EXEC   UpdateEmployeeDetailsBySNO   785 , 'Lucy Kaze test', '256 Road St 91 74','lucyk@gmail.com','175-789-9072' 

-----------------------------------------------------------------------

-- Show all the fields

create PROCEDURE ShowEmployeeDetails
AS
BEGIN
    select SNO,EmployeeID, EmployeeName, EmpAddress, EmailID, PhoneNO
    from EmployeeDetails
END;

--  Show all the fields execution

exec ShowEmployeeDetails;


-------------------------------------------------------

-- delete based on EmployeeID

create PROCEDURE DeleteEmployeeDetails
@EmployeeIDs int
AS
BEGIN
    delete from EmployeeDetails where EmployeeID=@EmployeeIDs
    
END;

-- delete based on EmployeeID execution

exec DeleteEmployeeDetails 785;

----------------------------------------------------------

-- show by EmployeeID

create PROCEDURE ShowEmployeeDetailsbyEmployeeID
@EmployeeIDs int
AS
BEGIN

	select SNO,EmployeeID, EmployeeName, EmpAddress, EmailID, PhoneNO
    from EmployeeDetails where EmployeeID=@EmployeeIDs
    
END;

-- show by EmployeeID execution

exec ShowEmployeeDetailsbyEmployeeID 6;

-------------------------------------------------------------

select * from EmployeeDetails order by 1
