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

#making the first histogram

png(filename = "plot1.png", width = 480, height = 480)
with(feb, hist(Global_active_power, main = "Global Active Power", col = "red",xlab = "Global Active Power (kilowatts)"))
dev.off()     


