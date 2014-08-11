#66638:02-01-2007
#69518:02-02-2007

PowerData<-read.table("./household_power_consumption.txt", header=FALSE, sep=";", 
                      col.names= c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
                      skip=66637, nrows=69518-66638)
PowerData$DT<-strptime(paste(PowerData$Date, PowerData$Time), "%d/%m/%Y %H:%M:%S")

#plot2
library(datasets)
par(mfrow=c(1,1), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(PowerData, plot(DT, Global_active_power, type="l", xlab="", ylab="Global Active Power(kilowatts)"))
dev.copy(png, file = "plot2.png", width=480, height=480, units="px") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!
