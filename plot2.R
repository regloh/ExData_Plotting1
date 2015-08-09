# Read in the file.
# The file hpc-feb2007 was created from the original file 
# household_power_consumption.txt by
# extracting only the data for 1st and 2nd February 2007
# The file hpc-feb2007 is available in the git repository for reference
#
t <- read.csv2("../../hpc-feb2007", sep=";", dec=".", na.strings = c("?"))

png(filename="plot2.png", width = 480, height = 480, units = "px")

# Converting data and time colum to POSIXct and creating
# a combined dataset out of the original one and the new column

dt2 <- paste(t$Date, t$Time)

dt<-as.POSIXct(dt2, tz="UTC", "%d/%m/%Y %H:%M:%S")

dd<-cbind (as.data.frame(dt), t)


# Creating the plot without drawing it. The labels for x-axis have been suppressed
plot(dd$dt, dd$Global_active_power, type="l", xlab="", ylab= "Global Active Power (kilowatts)", xaxt="n")

# drawing the lines
# lines(dd$dt, dd$Global_active_power)

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

# drawing the x-axis labels
axis(side=1, at=c(atDay1, atDay2,atDay3), labels=c(labDay1, labDay2, labDay3))

dev.off()