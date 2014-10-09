# Fetch data
source("GetData.R")

# Open graphics device
png(filename="plot2.png", width=480, height=480, units = "px")

plot(dat$DateTime, dat$Global_active_power, 
     type="l", xlab="", ylab="Global Active Power (kilowatts)")

# Close device
dev.off() 