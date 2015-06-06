setwd("your directory") 

##The decompress data must be on your working directory for the script to be able to run

data <- read.csv("household_power_consumption.txt",sep= ";", skip = 66636, nrows=2880, na.strings= "?")

##Reads only the data from the dates 2007-02-01 and 2007-02-02

header <- read.csv("household_power_consumption.txt",sep= ";", nrows=1)

##Reads the headers of the data

names(data) <- names(header)

##Names the data's headers already provide

png("plot1.png", width=504, height=504)

##Opens the png device and determinates the size of the png file you want to get

hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

##It provides a frecuency histogram for the Global Active Power, measured in kilowatts. 

dev.off()

##Closes the png device