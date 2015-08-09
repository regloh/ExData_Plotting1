# Read in the file.
# The file hpc-feb2007 was created from the original file 
# household_power_consumption.txt by
# extracting only the data for 1st and 2nd February 2007
# The file hpc-feb2007 is available in the git repository for reference
#
t <- read.csv2("hpc-feb2007", sep=";", dec=".", na.strings = c("?"))

png(filename="plot4.png", width = 480, height = 480, units = "px")

# Converting data and time colum to POSIXct and creating
# a combined dataset out of the original one and the new column

dt2 <- paste(t$Date, t$Time)

dt<-as.POSIXct(dt2, tz="UTC", "%d/%m/%Y %H:%M:%S")

dd<-cbind (as.data.frame(dt), t)

# Some preparation for x-axis labels
day1="2007-02-01 00:00:00"
day2="2007-02-02 00:00:00"
day3="2007-02-03 00:00:00"
atDay1=as.integer( as.POSIXct( day1, tz="UTC" ))
atDay2=as.integer( as.POSIXct( day2, tz="UTC" ))
atDay3=as.integer( as.POSIXct( day3, tz="UTC" ))
labDay1=strftime(day1, "%a", usetz=FALSE)
labDay2=strftime(day2, "%a", usetz=FALSE)
labDay3=strftime(day3, "%a", usetz=FALSE)


par(mfrow = c(2, 2), mar= c(4, 4, 3, 1) + 0.1)
with(dd, {
  # first plot
  plot(dt, Global_active_power, type="l", xlab="", ylab="Global Active Power", xaxt="n")
  axis(side=1, at=c(atDay1, atDay2,atDay3), labels=c(labDay1, labDay2, labDay3))
  
  # second plot
  plot(dt, Voltage, type="l", xlab="\n\ndatetime", ylab="Voltage", xaxt="n")
  axis(side=1, at=c(atDay1, atDay2,atDay3), labels=c(labDay1, labDay2, labDay3))
  
  # third plot
  plot(dt, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", xaxt="n")
  lines(dt, Sub_metering_2, col="red")
  lines(dt, Sub_metering_3, col="blue")
  # drawing the x-axis labels
  axis(side=1, at=c(atDay1, atDay2,atDay3), labels=c(labDay1, labDay2, labDay3))
  # drawing legend
  legend("topright", lwd = 2, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  # fourth plot
  plot(dt, Global_reactive_power, type="l", xlab="\n\ndatetime", ylab="Global_reactive_power", xaxt="n")
  axis(side=1, at=c(atDay1, atDay2,atDay3), labels=c(labDay1, labDay2, labDay3))
  
})

dev.off()