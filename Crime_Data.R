  library(readr)

# Read and view data
  Crime_data <- read_csv("~/Documents/Dataset_Explanation/ChicagoCrime_Data/Crime_data.csv")
  View(Crime_data)

# structure and summary statistics of data
  str(Crime_data)
  summary(Crime_data)

# maximum value of ID variable
  max(Crime_data$ID)

# minimum vale of the variable beat
  min(Crime_data$Beat)  

# total number of observation of any value of LocationDescription
  table(mvt$LocationDescription)  

# format of the date can be found out by :
  Crime_data$Date[1]

# converts the variable "Date" into a Date object in R
  DateConvert = as.Date(strptime(Crime_data$Date, "%m/%d/%y %H:%M"))
  summary(DateConvert)

# creates two new variables in our data frame, Month and Weekday
  Crime_data$Month = months(DateConvert)
  Crime_data$Weekday = weekdays(DateConvert)

# replace the old Date variable with DateConvert
  Crime_data$Date = DateConvert

# find out which month has minimum theft 
  table(Crime_data$Month)

# find out which day has maximum theft
  table(Crime_data$Weekday)

# finf out which month has largest number of motor vehicles theft
  table(Crime_data$Arrest,Crime_data$Month)  

# Plot histogram with breaks and analyse the trend of crime over the years
  hist(Crime_data$Date, breaks=100)

# Plot boxplot to show more arrests were made in the first half of the time period
  boxplot(Crime_data$Date ~ Crime_data$Arrest)

# fraction of motor vehicle thefts in 2001 for which an arrest was made is thus 2152/(2152+18517)
  table(Crime_data$Arrest, Crime_data$Year)

# locations with the largest number of motor vehicle thefts
  sort(table(Crime_data$LocationDescription))  

# total number of observation in top 5 
  Top5 = subset(Crime_data, LocationDescription=="STREET" | LocationDescription=="PARKING LOT/GARAGE(NON.RESID.)" | LocationDescription=="ALLEY" | LocationDescription=="GAS STATION" | LocationDescription=="DRIVEWAY - RESIDENTIAL")
  str(Top5)
  # It can also be done using the below command : 
  # TopLocations = c("STREET", "PARKING LOT/GARAGE(NON.RESID.)", "ALLEY", "GAS STATION", "DRIVEWAY - RESIDENTIAL")
  # Top5 = subset(mvt, LocationDescription %in% TopLocations)

# make LocationDescription nicer to read (now it will only has 5 values)
  Top5$LocationDescription = factor(Top5$LocationDescription)
  str(Top5)

# compute the fraction of motor vehicle thefts that resulted in arrests at each location
  table(Top5$LocationDescription, Top5$Arrest) 

# day of the week on which the most motor vehicle thefts at gas stations happen
# day of the week on which the fewest motor vehicle thefts in residential driveways happen
  table(Top5$LocationDescription, Top5$Weekday)  







   






