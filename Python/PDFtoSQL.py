import os
import glob
import shutil
import tabula
import pandas as pd
import pyodbc

# Define the SQL Server connection parameters
server = 'your_server_name'
database = 'your_database_name'
username = 'your_username'
password = 'your_password'
driver = '{ODBC Driver 17 for SQL Server}'  # Adjust the driver according to your SQL Server version

# Define the directory containing PDF files
pdf_directory = 'Files/'

# Define the directory to move processed PDFs to
archive_directory = 'archive/'

# Get the current working directory
path = os.getcwd()

# Print current directory
print("Current directory:", path)

# Establish a connection to the SQL Server database
conn = pyodbc.connect(f'DRIVER={driver};SERVER={server};DATABASE={database};UID={username};PWD={password}')

# Get a list of PDF files in the specified directory
pdf_files = glob.glob(os.path.join(pdf_directory, '*.pdf'))

# Print the list of PDF files found
print("PDF files found:", pdf_files)

# Iterate over each PDF file
for pdf_file in pdf_files:
    # Get the source path of the PDF file
    src = os.path.join(path, pdf_file)
    
    # Read tables from the PDF file
    tables = tabula.read_pdf(src, pages='all')
    
    # Iterate over each table found in the PDF
    for i, df in enumerate(tables):
        # Define the table name in SQL Server (adjust as needed)
        table_name = f'table_{i + 1}'
        
        # Insert the DataFrame into the SQL Server table
        df.to_sql(table_name, conn, if_exists='replace', index=False)
        print(f"Inserted data into SQL Server table '{table_name}'")
        
    # Move the processed PDF file to the archive directory
    dst = os.path.join(path, archive_directory, os.path.basename(pdf_file))
    shutil.move(src, dst)

# Close the connection to the SQL Server database
conn.close()
