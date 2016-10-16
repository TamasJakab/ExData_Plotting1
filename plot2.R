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
png(filename = "plot2.png", width = 480, height = 480)
plot(feb$Global_active_power~feb$Datetime, type="l",ylab="Global Active Power (kilowatts)", xlab="")
dev.off()  