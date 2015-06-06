setwd("your directory")

##The decompress data must be on your working directory for the script to be able to run

data <- read.csv("household_power_consumption.txt",sep= ";", skip = 66636, nrows=2880, na.strings= "?")

##Reads only the data from the dates 2007-02-01 and 2007-02-02

header <- read.csv("household_power_consumption.txt",sep= ";", nrows=1)

##Reads the headers of the data

names(data) <- names(header)

##Names the data's headers already provide

png("plot4.png", width=504, height=504)

##Opens the png device and determinates the size of the png file you want to get

AX <- as.POSIXlt(paste(as.Date(data$Date, format="%d/%m/%Y"), data$Time, sep=" "))
par(mfcol=c(2,2))

##Combines variables Date and Time and converts them in a POSIxlt format and sets the layout to 2 rows per 2 columns, column wise

plot(AX, data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

##Diagrams a line plot of the Global Active Power usage through out time, and sets it in the first row of the first column

plot(AX, data$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(AX, data$Sub_metering_2, type="l",col="red", ylab="Energy sub metering", xlab="")
lines(AX, data$Sub_metering_3, type="l",col="blue", ylab="Energy sub metering", xlab="")
legend("topright", lty = 1, bty="n", col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

##Diagrams a line plot comparing diferent Sub Metering variables through time, and sets it in the second row of the first column

plot(AX, data$Voltage, type="l", ylab="Voltage", xlab="datetime")

##Diagrams a line plot of the Voltage usage through timeand sets it in the first row of the second column

plot(AX, data$Global_reactive_power, type="l",ylab="Global_reactive_power", xlab="datetime")

##Diagrams a line plot of the Global Reactive Power usage through timeand sets it in the second row of the second column

dev.off()

##Closes the png device