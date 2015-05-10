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

DT.sub=DT.sub[,3:8]  
DT.sub=data.frame(Date=dates,DT.sub)

#Output to png file
png(filename = "plot2.png",width = 480, height = 480)
plot(DT.sub$Date,DT.sub$Global_active_power,type="n",xlab="",ylab="Global Active Power (kilowatts)")
lines(DT.sub$Date,DT.sub$Global_active_power)
dev.off()

cat("File plot2.png saved")

#Output to display
plot(DT.sub$Date,DT.sub$Global_active_power,type="n",xlab="",ylab="Global Active Power (kilowatts)")
lines(DT.sub$Date,DT.sub$Global_active_power)
