# Fetch data
source("GetData.R")

# Open graphics device
png(filename="plot4.png", width=480, height=480, units = "px")

par(mfrow=c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
plot(dat$DateTime, dat$Global_active_power, 
     type="l", xlab="", ylab="Global Active Power")
plot(dat$DateTime, dat$Voltage, 
     type="l", xlab="datetime", ylab="Voltage")
plot(dat$DateTime, dat$Sub_metering_1, col="black", type="l", xlab="", ylab="Energy sub metering")
lines(dat$DateTime, dat$Sub_metering_2, col="red", type="l")
lines(dat$DateTime, dat$Sub_metering_3, col="blue", type="l")
legend("topright", lty=1, lwd=1, col=c("black","blue","red"), 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(dat$DateTime, dat$Global_reactive_power, 
     type="l", xlab="datetime")

# Close device
dev.off() 