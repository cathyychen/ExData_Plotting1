#read in dataset
#the file "household_power_consumption.txt" should be in the working directory.
mydata=read.table("household_power_consumption.txt",sep=";",header=TRUE)

#take out data from dates 2007-02-01 and 2007-02-02
subdata=mydata[which(mydata$Date=="1/2/2007"|mydata$Date=="2/2/2007"),]

#prepare the time variable
t= strptime(paste(subdata$Date,subdata$Time),"%d/%m/%Y %H:%M:%S")

#check and remove the record whose Global_active_power value is missing
indc=which(subdata$Global_active_power=="?")
if(length(indc)!=0)
{t1=t[-indc]
 y1=subdata$Global_active_power[-indc]
}else {t1=t
 y1=subdata$Global_active_power
}

#format the Global active power as numeric numbers
y1=as.numeric(as.character(y1))

#plot the figure of global active power vs time and save it as a PNG file.
png(filename = "plot2.png", width = 480, height = 480)
plot(t1,y1,type="l",xlab="",ylab="Global Active Power(kilowatts)")
dev.off()




