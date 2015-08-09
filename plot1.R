# Read in the file.
# The file hpc-feb2007 was created from the original file 
# household_power_consumption.txt by
# extracting only the data for 1st and 2nd February 2007
# The file hpc-feb2007 is available in the git repository for reference
#
t <- read.csv2("../../hpc-feb2007", sep=";", dec=".", na.strings = c("?"))

png(filename="plot1.png", width = 480, height = 480, units = "px")

hist(t$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
