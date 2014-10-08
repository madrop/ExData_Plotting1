#Prerequisites - copy these files to working directory
#1. household_power_consumption.txt
#2. load_data.R 


plot4 <- function() {
  #load data
  source("load_data.R")
  data <- load_data()
  
  #sort according to Date
  data <- data[order(data$Date, data$Time),]
  
  
  
  #-----------
  png(filename = "plot4.png", width = 480, height = 480)
  
  #make grid
  par(mfrow = c(2,2))
  
  #make plots - by rows
  #plot at 1st row, 1st column------------
   
  #draw plot type=line, with no y-axis label and no x-axis ticks
  plot(data$Global_active_power, type="l", ylab="", xlab="",xaxt="n")
  
  #annotate y-axis name
  title(ylab =  "Global Active Power")
  
  #annotate x-axis ticks
  #dataset is sorted according to date and time
  #each day has 1440 records --- so Thursday will start at 0, Friday at 1441
  axis(   side=1, at=c(0,1441,2881), labels=c("Thu","Fri","Sat")   )
  
  
  #plot at 1st row, 2st column------------
  plot(data$Voltage, type="l", ylab="", xlab="",xaxt="n")
  title(ylab =  "Voltage", xlab="datetime")
  axis(   side=1, at=c(0,1441,2881), labels=c("Thu","Fri","Sat")   )
  
  
  #plot at 2nd row, 1st column-----------
  #same as plot3
  #draw plot margins, y axis, no x axis
  plot(data$Sub_metering_1, type="n", ylab="",xlab="", xaxt="n")
  
  #draw lines
  points(data$Sub_metering_1, type="l")
  points(data$Sub_metering_2, type="l", col="red")
  points(data$Sub_metering_3, type="l", col="blue")
  
  title(ylab =  "Energy sub metering")
  axis(   side=1, at=c(0,1441,2881), labels=c("Thu","Fri","Sat")   )
  legend("topright", lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
  
  #plot at 2nd row, 2nd column---------------------
  plot(data$Global_reactive_power, type="l", xlab="",xaxt="n")
  title(xlab="datetime")
  axis(   side=1, at=c(0,1441,2881), labels=c("Thu","Fri","Sat")   )
  
  
  #------------
  dev.off()
}



