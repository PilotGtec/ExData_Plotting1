# Fetch data
source("GetData.R")

# Open graphics device
png(filename="plot1.png", width=480, height=480, units = "px")

hist(dat$Global_active_power, col="red", 
     xlab="Global Active Power (kilowatts)", 
     ylab="Frequency", 
     main="")
# rug(dat$Global_active_power)

# Close device
dev.off() 