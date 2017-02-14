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
plot(time,sub1,col="black",type="l",ylab="Energy Sub metering",xlab="")
lines(time,sub2,col="red",type="l")
lines(time,sub3,col="blue",type="l")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),lty=1,cex=0.7);
dev.copy(png,file="plot3.png")
dev.off()
