#read data
mytable<-read.table(unz("exdata-data-household_power_consumption.zip","household_power_consumption.txt"), sep=";", header=T,na.strings = "?")
#change date format
mytable$datetime<-strptime(paste(mytable$Date,mytable$Time), "%d/%m/%Y %H:%M:%S")
mytable$Date<-as.Date(mytable$Date, "%d/%m/%Y")
#subset data
mytable<-subset(mytable,Date==as.Date("2007-02-01") | Date==as.Date("2007-02-02"))
#plot
png(filename="plot2.png")
with(mytable,plot(datetime,Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=""))
dev.off()
