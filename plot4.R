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

png("plot4.png", height=480, width=480)
par(mfrow = c(2,2))

#topleft
dates_pow <- cbind(dates,subset2$Global_active_power)
dates_pow[,1] <- as.POSIXct(dates_pow[,1])
plot(dates_pow[,1], dates_pow[,2], type="l", xlab="", ylab="Global Active Power")

#topright
dates_vol <- cbind(dates,subset2$Voltage)
dates_vol[,1] <- as.POSIXct(dates_vol[,1])
plot(dates_vol[,1], dates_vol[,2], type="l", xlab="datetime", ylab="Voltage")

#bottomleft
dates_sub <- cbind(dates, subset2$Sub_metering_1,subset2$Sub_metering_2,subset2$Sub_metering_3 )
dates_sub[,1] <- as.POSIXct(dates_sub[,1])
plot(dates_sub[,1], dates_sub[,2], type="l", xlab="", ylab="Energy sub metering")
lines(dates_sub[,1], dates_sub[,3], col="red")
lines(dates_sub[,1], dates_sub[,4], col="blue")
legend("topright", pch="-", col=c("black","red","blue"), legend=c("Sub_meeting_1","Sub_meeting_2","Sub_meeting_3"))



#bottomright
dates_reac <- cbind(dates,subset2$Global_reactive_power)
dates_reac[,1] <- as.POSIXct(dates_reac[,1])
plot(dates_reac[,1], dates_reac[,2], type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
