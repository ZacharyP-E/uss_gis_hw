library(tidyverse)
library(readxl)
library(here)

#Identifying the local path in which the excel data is located
xl_path = "data/HDR21-22_Statistical_Annex_GII_Table.xlsx"

sheet_x <- excel_sheets(here(xl_path))[1] #Identifying the sheet in which the data is housed. 
df <- read_excel(here(xl_path), sheet = sheet_x, skip=7) #Reading in the excel data from the appropriate sheet.

print("hello")