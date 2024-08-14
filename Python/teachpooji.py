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

print("         ")
print("-------------Nuthalapati Poojitha first program----------------")

first_name = input("First: ")
second_name = input("Second: ")

course = first_name.capitalize()

prize = second_name.capitalize()

sum= str(course) + " " + str(prize)
print(sum)

# Print current directory
#print("Current directory:", path)


print("-------------Finished----------------")

def full_pyramid(n):
    for i in range(1, n + 1):
        # Print leading spaces
        for j in range(n - i):
            print(" ", end="")
        
        # Print asterisks for the current row
        for k in range(1, 2*i):
            print("*", end="")
        print()

lines = input("Enter the number: ")

full_pyramid(int(lines))


m_name = input("---------")