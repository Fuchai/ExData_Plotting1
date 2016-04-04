library(data.table)
library(dplyr)
library(lubridate)

# read file
power<-fread(input = "household_power_consumption.txt",sep = ';',na.strings = '?')
powertwodays<-filter(power,Date=="1/2/2007"|Date=="2/2/2007")
powertwodays<-powertwodays[complete.cases(powertwodays),]

# time-series plot 2
png("plot2.png")
powertwodays<-mutate(powertwodays,DateTime=dmy_hms(paste(powertwodays[,Date],powertwodays[,Time])))
plot(powertwodays$DateTime,powertwodays$Global_active_power,type="l",
     ylab="Global Active Power (kilowatts)",xlab="")
dev.off()