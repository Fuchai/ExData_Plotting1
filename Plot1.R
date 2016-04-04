library(data.table)
library(dplyr)
library(lubridate)

# read file
power<-fread(input = "household_power_consumption.txt",sep = ';',na.strings = '?')
powertwodays<-filter(power,Date=="1/2/2007"|Date=="2/2/2007")
powertwodays<-powertwodays[complete.cases(powertwodays),]

# boxplot 1
png("plot1.png",width = 480, height=480)
hist(powertwodays$Global_active_power,main="Global Active Power",ylab = "Frequency",
     xlab = "Global Active Power (kilowatts)",col = "red")
dev.off()