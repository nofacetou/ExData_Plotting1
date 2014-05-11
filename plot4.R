#some environment setting
setwd("D:/Document/My Copy/Copy/Portable Python 2.7.3.2/App/Scripts/exdata-002")
#unzip the file if the file is not there
unzip("household_power_consumption.zip", overwrite=FALSE)
#read the data
power<-read.csv("household_power_consumption.txt", header=FALSE, sep=";", skip=66637, nrows=2880)
head <- read.csv("household_power_consumption.txt", header=FALSE, sep=";", nrows=1)
names(head)<- NULL
colnames(power)<- unlist(c(head))
power$Time = strptime(paste(power$Date,power$Time), "%d/%m/%Y %H:%M:%S")
power$Date = as.Date(power$Date, "%d/%m/%Y")
#plot plot4 and save as plot4.png
png(file = "ExData_Plotting1/figure/plot4.png", width = 480, height = 480, units = "px", bg = "transparent")
par(mfrow=c(2,2))
plot(power$Time,power$Global_active_power, type = "l", ylab="Global Active Power", xlab="")
plot(power$Time,power$Voltage, type = "l", ylab="Voltage", xlab="datatime")
plot(power$Time,power$Sub_metering_1, type = "l", ylab="Energy Sub Metering", xlab="")
lines(power$Time,power$Sub_metering_2, col="red")
lines(power$Time,power$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=c(1,1,1))
plot(power$Time,power$Global_reactive_power, type = "l", ylab="Global_reactive_power", xlab="datatime")
dev.off()