library(dplyr)
data <- read.table('household_power_consumption.txt', sep = ';', header = TRUE, na.strings = '?')
data$datetime <- as.POSIXct(paste(data$Date, data$Time), format = '%d/%m/%Y %H:%M:%S')
twodays <- filter(data, between(datetime, as.POSIXct('2007-02-01 00:00:00'), as.POSIXct('2007-02-02 23:59:59')))

dev.new(width = 480, height = 480, unit = 'px')
par(bg = 'white')
par(mfrow = c(2, 2))
with(twodays, plot(datetime, Global_active_power, type = 'l', ylab = 'Global Active Power (kilowatts)', xlab = ''))

with(twodays, plot(datetime, Voltage, type = 'l', ylab = 'Voltage', xlab = ''))

with(twodays, plot(datetime, Sub_metering_1, type = 'l', ylab = 'Energy sub metering', xlab = ''))
with(twodays, points(datetime, Sub_metering_2, type = 'l', col = 'red'))
with(twodays, points(datetime, Sub_metering_3, type = 'l', col = 'blue'))
legend("topright", col = c("black", "red", 'blue'), legend = c("Sub_metering_1", "Sub_metering_2", 'Sub_metering_3'), lty = 1, cex = 0.75, bty = 'n', xjust = 0)

with(twodays, plot(datetime, Global_reactive_power, type = 'l', ylab = 'Global reactive power', xlab = ''))

dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()

