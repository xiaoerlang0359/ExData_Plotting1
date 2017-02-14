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
sub1<-finalpower$Sub_metering_1
sub2<-finalpower$Sub_metering_2
sub3<-finalpower$Sub_metering_3
gpower<-finalpower$Global_active_power
voltage<-finalpower$Voltage
rpower<-finalpower$Global_reactive_power
par(mfrow=c(2,2),mar=c(4,4,1,1),oma=c(3,0,2,0),cex.axis=0.7,cex.lab=0.6)
plot(time,gpower,ylab="Global Active Power (kilowatts)",xlab="",type="l",)
plot(time,voltage,ylab="Voltage",xlab="datetime",type="l")
plot(time,sub1,col="black",type="l",ylab="Energy Sub metering",xlab="")
lines(time,sub2,col="red",type="l")
lines(time,sub3,col="blue",type="l")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),lty=1,cex=0.3);
plot(time,rpower,ylab="Global reactive power",xlab="datetime",type="l")
dev.copy(png,file="plot4.png")
dev.off()
