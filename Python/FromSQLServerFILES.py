import pyodbc 

try:
    print("\nEneter Student ID : \n")
    a=input()
    b=''
    x=0
    #print(a.upper())
    if (a.upper()=='ALL'):
        b='select FileID,FileName from dbo.Files order by 1 desc'    
    else:
        b='select FileID,FileName from dbo.Files order by 1 desc'

    #print("----------")	

    conn = pyodbc.connect('DSN=POOJITHA;UID=poojitha;PWD=Poojitha$9')
    #conn = pyodbc.connect('DRIVER={Devart ODBC Driver for SQL Server};Server=132.148.185.6;Database=poojithamssql;User ID=poojitha;Password=Poojitha$9')

    #conn = pyodbc.connect('DRIVER={Devart ODBC Driver for SQL Server};Server=myserver;Database=mydatabase;Port=myport;User ID=myuserid;Password=mypassword')

    #print("----------")	

    cursor = conn.cursor()


    cursor.execute(b)

    for row in cursor:
        x=x+1
        print(row)

    if (x==0):
        print("\n No Student details found : \n")
    else:
        print("\n Find Student details above : \n")


    print(x)
except:
    print("error")

a=input()
print("\n Eneter Student ID : \n")
