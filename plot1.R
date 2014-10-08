
#Prerequisites - copy these files to working directory
#1. household_power_consumption.txt
#2. load_data.R 


plot1 <- function() {
  #load data
  source("load_data.R")
  data <- load_data()
  
  
  #make plot1
  png(filename = "plot1.png", width = 480, height = 480)
  
  hist(data$Global_active_power, col="red", 
       main="Global Active Power", xlab = "Global Active power (killowatts)")
  
  
  dev.off()
}


