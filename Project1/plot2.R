#Read in Electric Consumption Data from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
data <- read.table("../../datasets/household_power_consumption.txt", sep=";", col.names=c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2","Sub_metering_3"),skip=66637,nrows=2880, na.strings="?",colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric","numeric", "numeric","numeric"))
#Clean Date Time
cleanDateTime<-strptime(paste(data$Date, data$Time),"%d/%m/%Y %H:%M:%S")
win.graph()
#Plot Active power
plot(cleanDateTime,data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)",xlab="")
# Save as 480x480 png
dev.copy(png,file="plot2.png")
dev.off()