# The URL of the zipped data file
fileUrl<-"http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

# The file to unzip 
fileName<-"household_power_consumption.txt"

temp <- tempfile()
download.file(fileUrl,temp)
DT <- read.table(unz(temp, fileName),sep=";",header=TRUE,na.strings=c("?"))

# Remove the temp file
unlink(temp)

# Subsetting
DT.sub = subset(DT,as.Date(Date,"%d/%m/%Y")>='2007-02-01' & as.Date(Date,"%d/%m/%Y")<='2007-02-02')

dates<-strptime(paste(DT.sub$Date," ",DT.sub$Time), "%d/%m/%Y %H:%M:%S")

DT.sub=DT.sub[,3:9]  
DT.sub=data.frame(Date=dates,DT.sub)

#Output to png file
png(filename = "plot4.png",width = 480, height = 480)

#Save the mfrow parameter
mfrow<-par("mfrow")

par(mfrow=c(2,2))

#Plot A - Global Active Power
plot(DT.sub$Date,DT.sub$Global_active_power,type="n",xlab="",ylab="Global Active Power")
lines(DT.sub$Date,DT.sub$Global_active_power,col="black")

#Plot B - Global Active Power
plot(DT.sub$Date,DT.sub$Voltage,type="n",xlab="datetime",ylab="Voltage")
lines(DT.sub$Date,DT.sub$Voltage,col="black")

#Plot C - Energy sub metering
plot(DT.sub$Date,DT.sub$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
lines(DT.sub$Date,DT.sub$Sub_metering_1,col="black")
lines(DT.sub$Date,DT.sub$Sub_metering_2,col="red")
lines(DT.sub$Date,DT.sub$Sub_metering_3,col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lwd=1, col=c("black", "red", "blue"),bty = "n")

#Plot D - Global Reactive Power
plot(DT.sub$Date,DT.sub$Global_reactive_power,type="n",xlab="datetime",ylab="Global_reactive_power")
lines(DT.sub$Date,DT.sub$Global_reactive_power,col="black")

dev.off()

cat("File plot4.png saved")

#Output to display
par(mfrow=c(2,2))

#Plot A - Global Active Power
plot(DT.sub$Date,DT.sub$Global_active_power,type="n",xlab="",ylab="Global Active Power")
lines(DT.sub$Date,DT.sub$Global_active_power,col="black")

#Plot B - Global Active Power
plot(DT.sub$Date,DT.sub$Voltage,type="n",xlab="datetime",ylab="Voltage")
lines(DT.sub$Date,DT.sub$Voltage,col="black")

#Plot C - Energy sub metering
plot(DT.sub$Date,DT.sub$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
lines(DT.sub$Date,DT.sub$Sub_metering_1,col="black")
lines(DT.sub$Date,DT.sub$Sub_metering_2,col="red")
lines(DT.sub$Date,DT.sub$Sub_metering_3,col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lwd=1, col=c("black", "red", "blue"),bty = "n")

#Plot D - Global Reactive Power
plot(DT.sub$Date,DT.sub$Global_reactive_power,type="n",xlab="datetime",ylab="Global_reactive_power")
lines(DT.sub$Date,DT.sub$Global_reactive_power,col="black")

#Restore the mfrow parameter
par(mfrow=mfrow)
