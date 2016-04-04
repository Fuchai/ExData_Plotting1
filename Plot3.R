library(data.table)
library(dplyr)
library(lubridate)

# read file
power<-fread(input = "household_power_consumption.txt",sep = ';',na.strings = '?')
powertwodays<-filter(power,Date=="1/2/2007"|Date=="2/2/2007")
powertwodays<-powertwodays[complete.cases(powertwodays),]
powertwodays<-mutate(powertwodays,DateTime=dmy_hms(paste(powertwodays[,Date],powertwodays[,Time])))

# sub-metering plot 3
png("plot3.png")
plot(powertwodays$Sub_metering_1~powertwodays$DateTime,ylab="Energy sub metering",xlab="",type='l')
lines(powertwodays$Sub_metering_2~powertwodays$DateTime,ylab="Energy sub metering",xlab="",type='l',col="red")
lines(powertwodays$Sub_metering_3~powertwodays$DateTime,ylab="Energy sub metering",xlab="",type='l',col="blue")
legend("topright",lty = 1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()