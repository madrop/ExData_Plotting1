#load data for project 1 - Exploratory data analysis
#ATTENTION - column "Time" is a Posix date object -- but use its time component only


load_data <- function(){
  data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                     na.strings = "?", nrows = 2100000, skip = 0)
  
  #convert the Date and Time variables to Date/Time classes 
  data$Date <- as.Date(data$Date, format="%d/%m/%Y")
  data$Time <- strptime(data$Time, format="%H:%M:%S")

  
  #We will only be using data from the dates 2007-02-01 and 2007-02-02  
  from <- as.Date("2007-02-01")
  to <- as.Date("2007-02-02")
  
  data_selected <- data[ from <= data$Date & data$Date <= to, ]
  
  #return value
  data_selected
}






