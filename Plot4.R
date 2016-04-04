library(data.table)
library(dplyr)
library(lubridate)

# read file
power<-fread(input = "household_power_consumption.txt",sep = ';',na.strings = '?')
powertwodays<-filter(power,Date=="1/2/2007"|Date=="2/2/2007")
powertwodays<-powertwodays[complete.cases(powertwodays),]
powertwodays<-mutate(powertwodays,DateTime=dmy_hms(paste(powertwodays[,Date],powertwodays[,Time])))

# plot 4
png("plot4.png")
par(mfrow=c(2,2))
# 1
hist(powertwodays$Global_active_power,main="Global Active Power",ylab = "Frequency",
     xlab = "Global Active Power (kilowatts)",col = "red")
# 2
plot(powertwodays$DateTime,powertwodays$Global_active_power,type="l",
     ylab="Global Active Power (kilowatts)",xlab="datetime")
# 3
plot(powertwodays$Sub_metering_1~powertwodays$DateTime,ylab="Energy sub metering",xlab="",type='l')
lines(powertwodays$Sub_metering_2~powertwodays$DateTime,ylab="Energy sub metering",xlab="",type='l',col="red")
lines(powertwodays$Sub_metering_3~powertwodays$DateTime,ylab="Energy sub metering",xlab="",type='l',col="blue")
legend("topright",lty = 1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
# 4
plot(powertwodays$Global_reactive_power~powertwodays$DateTime,xlab="datetime",ylab="Global_reactive_power",type='l')
dev.off()