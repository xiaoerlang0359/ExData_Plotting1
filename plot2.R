power<-read.table("household_power_consumption.txt",header=T, sep=";", na.strings="?")
head(finalpower)
power$Date<-as.character(power$Date)
power$Time<-as.character(power$Time)
power$Time<-paste(power$Date,power$Time,sep=" ")
power$Date<-as.Date(power$Date,"%d/%m/%Y")
power$Time<-strptime(power$Time,"%d/%m/%Y %H:%M:%S")
a<-as.Date("1/2/2007","%d/%m/%Y")
b<-as.Date("2/2/2007","%d/%m/%Y")
finalpower<-power[power$Date %in% c(a,b),]
time<-finalpower$Time
gpower<-finalpower$Global_active_power
plot(time,gpower,ylab="Global Active Power (kilowatts)",xlab="",type="l",)
dev.copy(png,file="plot2.png")
dev.off()
