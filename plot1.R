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

#Output to png file
png(filename = "plot1.png",width = 480, height = 480)
hist(DT.sub$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",col=c("red"))
dev.off()

cat("File plot1.png saved")
