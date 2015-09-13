mytable<-read.table("household_power_consumption.txt", sep=";", header=T,na.strings = "?")
mytable$datetime<-strptime(paste(mytable$Date,mytable$Time), "%d/%m/%Y %H:%M:%S")
mytable$Date<-as.Date(mytable$Date, "%d/%m/%Y")
mytable<-subset(mytable,Date==as.Date("2007-02-01") | Date==as.Date("2007-02-02"))
png(filename="plot1.png")
with(mytable,hist(Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency", col="red"))
dev.off()