#66638:02-01-2007
#69518:02-02-2007
if(!file.exists("household_power_consumption.TXT"))
{
  url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  filename<-"household_power_consumption.zip"
  download.file(url,filename)
  unzip(filename)
}

PowerData<-read.table("./household_power_consumption.txt", header=FALSE, sep=";", 
                      col.names= c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
                      skip=66637, nrows=69518-66638)
PowerData$DT<-strptime(paste(PowerData$Date, PowerData$Time), "%d/%m/%Y %H:%M:%S")

#plot3
library(datasets)
png(file = "plot3.png", width=480, height=480, units="px")
par(mfrow=c(1,1), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(PowerData, plot(DT, Sub_metering_1, type="l" ,col="black", xlab="", ylab="Energy sub metering"))
with(PowerData, lines(DT, Sub_metering_2, type="l",col="red"))
with(PowerData, lines(DT, Sub_metering_3, type="l",col="blue"))
legend("topright", lty=1, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
dev.off() ## Don't forget to close the PNG device!
