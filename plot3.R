# Fetch data
source("GetData.R")

# Open graphics device
png(filename="plot3.png", width=480, height=480, units = "px")

plot(dat$DateTime, dat$Sub_metering_1, col="black", type="l", xlab="", ylab="Energy sub metering")
lines(dat$DateTime, dat$Sub_metering_2, col="red", type="l")
lines(dat$DateTime, dat$Sub_metering_3, col="blue", type="l")
legend("topright", lty=1, lwd=1, col=c("black","blue","red"), 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Close device
dev.off() 