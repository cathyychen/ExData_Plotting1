#read in dataset
#the file "household_power_consumption.txt" should be in the working directory.
mydata=read.table("household_power_consumption.txt",sep=";",header=TRUE)

#take out data from dates 2007-02-01 and 2007-02-02
subdata=mydata[which(mydata$Date=="1/2/2007"|mydata$Date=="2/2/2007"),]

#check and remove the record whose Global_active_power value is missing
indc=which(subdata$Global_active_power=="?")
if(length(indc)!=0)
{y1=subdata$Global_active_power[-indc]
}else { y1=subdata$Global_active_power
}

#format the Global active power as numeric numbers
y1=as.numeric(as.character(y1))


#plot the histogram of global active power vs time and save it as a PNG file.
png(filename = "plot1.png", width = 480, height = 480)
hist(y1,main="Global Active Power",col="red",xlab="Global Active Power(kilowatts)",
ylab="Frequency")
dev.off()

