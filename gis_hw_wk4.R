library(tidyverse)
library(here)
library(sf)
library(countrycode)

#Identifying the local path in which the data is located
csv_path <- "data/HDR21-22_Composite_indices_complete_time_series.csv"
shp_path <- "data/World_Countries_(Generalized)/World_Countries__Generalized_.shp"

#Reading in the csv file
df <- read_csv(here(csv_path), na = "")

#Identfiying the columns to be used in analysis
df1 <- df %>%
  select(c("iso3", "country", "hdi_2010", "hdi_2019"))

#Calcualting the difference between 2010 and 2019
df2 <- df1 %>%
  mutate("difference"= hdi_2019 - hdi_2010)

#Reading in the shapefile
shape <- read_sf(shp_path)

#Convert country codes to be in same format using countrycode package
#Documentation: https://www.rdocumentation.org/packages/countrycode/versions/1.4.0/topics/countrycode
df3 <- df2 %>%
  mutate(iso2 = countrycode(`iso3`, "iso3c", "iso2c"))

#Merging the shapefule and the csv together
df_m <- shape %>%
  left_join(., 
            df3,
            by = c("ISO" = "iso2"))





