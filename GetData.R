### Here is where we process the raw data, saving the processed
###   data to an rds file for later use.
### Here we fix the classes for the Date and Time and add a
###   DateTime column.
processData <- function(fname, rdsFile){
  datos <- read.table(fname, sep=";", header=TRUE, na.strings="?", 
                      colClasses = c("character","character","numeric", "numeric",
                                     "numeric","numeric","numeric", "numeric",
                                     "numeric"))
  datos$DateTime <- strptime(paste(datos$Date, datos$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
  datos$Date <- as.Date(datos$Date,"%d/%m/%Y" )
  start <- as.Date("2007-02-01")
  end <- as.Date("2007-02-02")
  dat <- datos[ (datos$Date == start) | (datos$Date == end), ]
  saveRDS(dat,file=rdsFile)
  dat
}

### This downloads the raw data if does not exist yet.
### If it exists (or after downloading), the raw data is then processed.
downloadData <- function(fname, rdsFile){
  if(!file.exists(fname)){
    fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(fileUrl, destfile="raw_data_household_power_consumption.zip", method="curl")
    unzip("raw_data_household_power_consumption.zip")
  }
  dat <- processData(fname, rdsFile)
  dat
}

### This function looks for the rdsFile.
### The rdsFile is a processed file for this specific proj.
getData <- function(){
  fname <- "household_power_consumption.txt"
  rdsFile <- "processedPowerData.rds"
  if(!file.exists(rdsFile)){
    dat <- downloadData(fname, rdsFile)
  }
  else{
    dat <- readRDS(rdsFile)
  }
  dat
}

### Main "Body" of the source file
### dat should containt 2880 obs of 10 variables
### The 10th variable is called DateTime
dat <- getData()
dat
