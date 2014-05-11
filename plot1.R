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
#plot plot1 and save as plot1.png
png(file = "ExData_Plotting1/figure/plot1.png", width = 480, height = 480, units = "px", bg = "transparent")
hist(power$Global_active_power, breaks=25, col="red", xlab="Global Active Power(kilowatts)", main="Global Active Power")
dev.off()