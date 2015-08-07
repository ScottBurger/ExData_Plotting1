this.dir <- dirname(parent.frame(2)$ofile)
setwd(this.dir)

data <- read.table("household_power_consumption.txt", 
                   sep=";", 
                   header=T, 
                   na.strings = "?")

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

subset <- subset(data, data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02"))

#plot1
png("plot1.png", height=480, width=480)

hist(as.numeric(subset$Global_active_power), xlab = "Global active power (Kilowatts)", ylab="Frequency", main="Global Active Power", col="red")

dev.off()