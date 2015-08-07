this.dir <- dirname(parent.frame(2)$ofile)
setwd(this.dir)

data <- read.table("household_power_consumption.txt", 
                   sep=";", 
                   header=T, 
                   na.strings = "?")

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

subset <- subset(data, data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02"))


subset2 <- subset(data, data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02"))

dates <- as.data.frame(paste(subset2$Date, subset2$Time, sep=" "))

dates_sub <- cbind(dates, subset2$Sub_metering_1,subset2$Sub_metering_2,subset2$Sub_metering_3 )

dates_sub[,1] <- as.POSIXct(dates_sub[,1])

png("plot3.png", height=480, width=480)

plot(dates_sub[,1], dates_sub[,2], type="l", xlab="", ylab="Energy sub metering")
lines(dates_sub[,1], dates_sub[,3], col="red")
lines(dates_sub[,1], dates_sub[,4], col="blue")
legend("topright", pch="-", col=c("black","red","blue"), legend=c("Sub_meeting_1","Sub_meeting_2","Sub_meeting_3"))

dev.off()