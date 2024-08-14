import pyodbc 
import os
import glob
import shutil
import tabula

from tabula.io import read_pdf
import pandas as pd

try:
    print("\nEneter Student ID : \n")
    a=input()
    b=''
    x=0
  
    if (a.upper()=='ALL'):
        b='select * from StudentDetails order by 1'    
    else:
        b='select * from StudentDetails where StudentID='+ a

  	

    conn = pyodbc.connect('DSN=HASIT;UID=poojitha;PWD=Poojitha$9')


    cursor = conn.cursor()


    cursor.execute(b)
 
    rows = cursor.fetchall()
    columns = [column[0] for column in cursor.description]
    df_new = pd.DataFrame.from_records(rows, columns=columns)
    print(df_new)

    for row in cursor:
        x=x+1
        print(row)


    if (x==0):
        print("\n No Student details found : \n")
    else:
        print("\n Find Student details above : \n")


    print(x , " student(s)")

    df_new.to_excel("Students.xlsx")

except:
    print("error")

a=input()
print("\n Eneter Student ID : \n")
