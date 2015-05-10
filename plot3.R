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
png(filename = "plot3.png",width = 480, height = 480)
plot(DT.sub$Date,DT.sub$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")

lines(DT.sub$Date,DT.sub$Sub_metering_1,col="black")
lines(DT.sub$Date,DT.sub$Sub_metering_2,col="red")
lines(DT.sub$Date,DT.sub$Sub_metering_3,col="blue")

legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lwd=1, col=c("black", "red", "blue"))

dev.off()

cat("File plot3.png saved")

#Output to display
plot(DT.sub$Date,DT.sub$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")

lines(DT.sub$Date,DT.sub$Sub_metering_1,col="black")
lines(DT.sub$Date,DT.sub$Sub_metering_2,col="red")
lines(DT.sub$Date,DT.sub$Sub_metering_3,col="blue")

legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lwd=1, col=c("black", "red", "blue"))

