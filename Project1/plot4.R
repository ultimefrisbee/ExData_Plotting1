#Read in Electric Consumption Data from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
data <- read.table("../../datasets/household_power_consumption.txt", sep=";", col.names=c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2","Sub_metering_3"),skip=66637,nrows=2880, na.strings="?",colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric","numeric", "numeric","numeric"))
#Clean Date Time
cleanDateTime<-strptime(paste(data$Date, data$Time),"%d/%m/%Y %H:%M:%S")

win.graph()
par(mfrow= c(2,2))
#Plot Global Active Power
plot(cleanDateTime,data$Global_active_power, type="l", ylab="Global Active Power",xlab="")

#Plot Volatge
plot(cleanDateTime,data$Voltage, type="l", ylab="Voltage",xlab="datetime")

# Plot Submeters
plot(cleanDateTime,data$Sub_metering_1,"n", ylab="Energy sub metering", xlab="")
# Kitchen
points(cleanDateTime,data$Sub_metering_1, type="l")
# Laundry
points(cleanDateTime,data$Sub_metering_2, type="l", col="red")
# Heating / AC
points(cleanDateTime,data$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), pch= "_", cex=.5,col=c("black","red","blue"))

#Global_reactive Power
plot(cleanDateTime,data$Global_reactive_power, type="l",ylab="Global_reactive_power",xlab="datetime")

# Save as 480x480 png
dev.copy(png,file="plot4.png")
dev.off()