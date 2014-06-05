#read in dataset
#the file "household_power_consumption.txt" should be in the working directory.
mydata=read.table("household_power_consumption.txt",sep=";",header=TRUE)

#take out data from dates 2007-02-01 and 2007-02-02
subdata=mydata[which(mydata$Date=="1/2/2007"|mydata$Date=="2/2/2007"),]

#prepare the time variable
t= strptime(paste(subdata$Date,subdata$Time),"%d/%m/%Y %H:%M:%S")

#check and remove the record whose Sub_metering_1 value is missing
indc=which(subdata$Sub_metering_1=="?")
if(length(indc)!=0)
{t1=t[-indc]
 y1=subdata$Sub_metering_1[-indc]
}else {t1=t
 y1=subdata$Sub_metering_1
}

#check and remove the record whose Sub_metering_2 value is missing
indc=which(subdata$Sub_metering_2=="?")
if(length(indc)!=0)
{t2=t[-indc]
 y2=subdata$Sub_metering_2[-indc]
}else {t2=t
 y2=subdata$Sub_metering_2
}

#check and remove the record whose Sub_metering_3 value is missing
indc=which(subdata$Sub_metering_3=="?")
if(length(indc)!=0)
{t3=t[-indc]
 y3=subdata$Sub_metering_3[-indc]
}else {t3=t
 y3=subdata$Sub_metering_3
}


#format the Sub_metering_1, Sub_metering_2, Sub_metering_3 as numeric numbers
y1=as.numeric(as.character(y1))
y2=as.numeric(as.character(y2))
y3=as.numeric(as.character(y3))

#plot the figure of Energy sub metering vs time and save it as a PNG file.
png(filename = "plot3.png", width = 480, height = 480)
plot(t1,y1,type="l",xlab="",ylab="Energy sub metering")
lines(t2,y2,col="red")
lines(t3,y3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)
dev.off()




