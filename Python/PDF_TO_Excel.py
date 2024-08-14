import os
import glob
import shutil
import tabula

from tabula.io import read_pdf
import pandas as pd

#Define the directory containing PDF files
pdf_directory = 'C:/FromOLDLapTop/ToP/Pichu/pdf/'

# Define the directory to move processed PDFs to
archive_directory = 'C:/FromOLDLapTop/ToP/Pichu/archive/'

csv_directory = 'C:/FromOLDLapTop/ToP/Pichu/csv/'

excel_directory = 'C:/FromOLDLapTop/ToP/Pichu/excel/'

# Get the current working directory
path = os.getcwd()

# Print current directory
print("Current directory:", path)

# Get a list of PDF files in the specified directory
pdf_files = glob.glob(os.path.join(pdf_directory, '*.pdf'))

# Print the list of PDF files found
print("PDF files found:", pdf_files)
df_new=pd.DataFrame(columns=[0,1,2,3,4,5,6,7,8])
#df_new=pd.DataFrame(columns=['Profile','Identification Details','Summary of Open Credit Facilities','Summary Of Closed  Written Off Credit Facilities','Dishonored Cheque Details - for Insufficient funds in the last 3 years','Inquiry Details','Relationship Details','Employment Details','Contact Details'])
j=0


# Iterate over each PDF file
for pdf_file in pdf_files:
    # Get the source path of the PDF file
    src = os.path.join(path, pdf_file)
    
    # Read tables from the PDF file
    tables = read_pdf(src, pages='1,3', java_options="-Dfile.encoding=UTF8")
    
    # Iterate over each table found in the PDF
    for i, df in enumerate(tables):
        # Define the output CSV file name
        #csv_file = os.path.splitext(pdf_file)[0] + f"_table_{i + 1}.csv"
        
        csv_file = csv_directory + f"_table_{i + 1}.csv"
        
        # Convert the table to a CSV file
        #df.to_csv(os.path.join(path, csv_file), index=False)
        tests=df.to_csv(lineterminator="\n")
        
        # Print the DataFrame (optional)
        #print("DataFrame extracted from:", pdf_file)
        #print(df)
        #print(csv_file)
        print("-------------------------------------------------------------------")
        print(tests)
        df_new.loc[j,i]=tests
    # Move the processed PDF file to the archive directory
    dst = os.path.join(path, archive_directory, os.path.basename(pdf_file))
    shutil.move(src, dst)
    j=j+1
df_new.to_excel(excel_directory + "FinalList.xlsx")

var = input("PDF extraction completed: ")
print("You entered: " + var)