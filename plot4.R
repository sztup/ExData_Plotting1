#read data
mytable<-read.table(unz("exdata-data-household_power_consumption.zip","household_power_consumption.txt"), sep=";", header=T,na.strings = "?")
#change date format
mytable$datetime<-strptime(paste(mytable$Date,mytable$Time), "%d/%m/%Y %H:%M:%S")
mytable$Date<-as.Date(mytable$Date, "%d/%m/%Y")
#subset data
mytable<-subset(mytable,Date==as.Date("2007-02-01") | Date==as.Date("2007-02-02"))
#plot
png(filename="plot4.png")
par(mfrow=c(2,2))
with(mytable,plot(datetime,Global_active_power,type="l",ylab="Global Active Power",xlab=""))
with(mytable,plot(datetime,Voltage,type="l",ylab="Voltage"))
with(mytable,plot(datetime,Sub_metering_1,type="n",ylab="Energy sub metering",xlab=""))
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"),bty = "n")
with(mytable,lines(datetime,Sub_metering_1, ylab="Energy sub metering",xlab="",col="black"))
with(mytable,lines(datetime,Sub_metering_2, ylab="Energy sub metering",xlab="",col="red"))
with(mytable,lines(datetime,Sub_metering_3, ylab="Energy sub metering",xlab="",col="blue"))
with(mytable,plot(datetime,Global_reactive_power,type="l"))
dev.off()