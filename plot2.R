## Getting whole dataset 
data_all <- read.csv("./data/household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"') 
data_all$Date <- as.Date(data_all$Date, format="%d/%m/%Y") 

## Subsetting the data 
data <- subset(data_all, subset=(Date >= "2007-02-01" & Date <= "2007-02-02")) 
rm(data_all) 

## Converting dates 
datetime <- paste(as.Date(data$Date), data$Time) 
data$Datetime <- as.POSIXct(datetime) 

## Creating Plot 2 
plot(data$Global_active_power~data$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="") 

## Saving to png file 
dev.copy(png, file="plot2.png", height=480, width=480) 
dev.off() 
