link <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

temp <- tempfile()
download.file(link, temp)
data <- read.table(unz(temp, "household_power_consumption.txt"),header = T, sep = ";")
unlink(temp)

feb <- data[data$Date == "2/1/2007" | data$Date == "2/2/2007",]
rm(data)

#converting data to numeric values
for(i in 3:9){
      feb[,i] <- as.numeric(feb[,i])      
}


feb$Date <- as.Date(feb$Date, format="%m/%d/%Y")
datetime <- paste(as.Date(feb$Date), feb$Time)
feb$Datetime <- as.POSIXct(datetime)

#plot
png(filename = "plot3.png", width = 480, height = 480)
with(feb, 
     {plot(Sub_metering_1~Datetime, type="l",ylab="Energy sub metering", xlab="", ylim = c(0,30))
      lines(Sub_metering_2~Datetime,col='Red')
      lines(Sub_metering_3~Datetime,col='Blue')
     })

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off() 
