import pyodbc 
import datetime




try:


    StudentID = input("Enter StudentID: ")
    StudentName = input("Enter StudentName: ")
    STAddress = input("Enter STAddress: ")
    EmailID = input("Enter EmailID: ")
    PhoneNO = input("Enter PhoneNO: ")
    DateOfBirth = input("Enter DateOfBirth: ")


    conn = pyodbc.connect('DSN=HASIT;UID=poojitha;PWD=Poojitha$9')
   
    cursor = conn.cursor()
    cursor.execute("insert into StudentDetails(StudentID,StudentName,STAddress,EmailID,PhoneNO,DateOfBirth)  values (?, ?, ?, ?, ?, ?)", int(StudentID), StudentName,STAddress,EmailID,PhoneNO,DateOfBirth)
    conn.commit()

    now = datetime.datetime.now()
    print("New student created : " + now.strftime("%Y-%m-%d %H:%M:%S"))
    
except pyodbc.Error as e:
    print(f"Database error: {e}")

a=input()
print("\n Done : \n")
