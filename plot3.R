#Prerequisites - copy these files to working directory
#1. household_power_consumption.txt
#2. load_data.R 


plot3 <- function() {
  #load data
  source("load_data.R")
  data <- load_data()
  
  #sort according to Date
  data <- data[order(data$Date, data$Time),]
  
  
  #make plot----------------------
  png(filename = "plot3.png", width = 480, height = 480)
  
  #draw plot margins, y axis, no x axis
  plot(data$Sub_metering_1, type="n", ylab="",xlab="", xaxt="n")
  
  #draw lines
  points(data$Sub_metering_1, type="l")
  points(data$Sub_metering_2, type="l", col="red")
  points(data$Sub_metering_3, type="l", col="blue")
  
  
  #annotate y-axis name
  title(ylab =  "Energy sub metering")
  
  #annotate x-axis ticks
  #dataset is sorted according to date and time
  #each day has 1440 records --- so Thursday will start at 0, Friday at 1441
  axis(   side=1, at=c(0,1441,2881), labels=c("Thu","Fri","Sat")   )
  
  legend("topright", lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
  
  dev.off()
}




