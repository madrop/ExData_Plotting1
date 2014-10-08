#Prerequisites - copy these files to working directory
#1. household_power_consumption.txt
#2. load_data.R 


plot2 <- function() {
  #load data
  source("load_data.R")
  data <- load_data()
  
  #sort according to Date
  data <- data[order(data$Date, data$Time),]
  
  #-----------------------
  
  #make plot
  png(filename = "plot2.png", width = 480, height = 480)
  
  #draw plot type=line, with no y-axis label and no x-axis ticks
  plot(data$Global_active_power, type="l", ylab="",xlab="",xaxt="n")

  #annotate y-axis name
  title(ylab =  "Global Active Power (killowatts)")

  #annotate x-axis ticks
  #dataset is sorted according to date and time
  #each day has 1440 records --- so Thursday will start at 0, Friday at 1441
  axis(   side=1, at=c(0,1441,2881), labels=c("Thu","Fri","Sat")   )
 
  
  dev.off()
}





