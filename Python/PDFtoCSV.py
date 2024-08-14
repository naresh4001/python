import os
import glob
import shutil
import tabula

# Define the directory containing PDF files
pdf_directory = 'Files/'

# Define the directory to move processed PDFs to
archive_directory = 'archive/'

# Get the current working directory
path = os.getcwd()

# Print current directory
print("Current directory:", path)

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
        # Define the output CSV file name
        csv_file = os.path.splitext(pdf_file)[0] + f"_table_{i + 1}.csv"
        
        # Convert the table to a CSV file
        df.to_csv(os.path.join(path, csv_file), index=False)
        
        # Print the DataFrame (optional)
        print("DataFrame extracted from:", pdf_file)
        print(df)
        
    # Move the processed PDF file to the archive directory
    dst = os.path.join(path, archive_directory, os.path.basename(pdf_file))
    shutil.move(src, dst)
