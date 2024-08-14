import pyodbc 
import os
import glob
import shutil
import tabula
import datetime

from tabula.io import read_pdf
import pandas as pd

try:

    conn = pyodbc.connect('DSN=HASIT;UID=poojitha;PWD=Poojitha$9')
    cursor = conn.cursor()
    cursor.execute('select * from StudentDetails order by 1')
    rows = cursor.fetchall()
    columns = [column[0] for column in cursor.description]
    dfnew = pd.DataFrame.from_records(rows, columns=columns)
    print(dfnew)


    now = datetime.datetime.now()
    STRDATE=now.strftime("%Y%m%d%H%M%S")
    print(" Data fetched at : " + STRDATE)

    dfnew.to_excel(STRDATE+"_Students.xlsx")
    print("\n Data saved : \n")

except:
    print("error")

a=input()
print("\n Data saved : \n")
