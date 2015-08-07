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

dates_pow <- cbind(dates,subset2$Global_active_power)

dates_pow[,1] <- as.POSIXct(dates_pow[,1])

png("plot2.png", height=480, width=480)

plot(dates_pow[,1], dates_pow[,2], type="l", xlab="", ylab="Global Active Power (Kilowatts)")

dev.off()
