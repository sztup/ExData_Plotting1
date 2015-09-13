#read data
mytable<-read.table(unz("exdata-data-household_power_consumption.zip","household_power_consumption.txt"), sep=";", header=T,na.strings = "?")
#change date format
mytable$datetime<-strptime(paste(mytable$Date,mytable$Time), "%d/%m/%Y %H:%M:%S")
mytable$Date<-as.Date(mytable$Date, "%d/%m/%Y")
#subset data
mytable<-subset(mytable,Date==as.Date("2007-02-01") | Date==as.Date("2007-02-02"))
#plot
png(filename="plot1.png")
with(mytable,hist(Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency", col="red"))
dev.off()