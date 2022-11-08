library(dplyr)
data <- read.table('household_power_consumption.txt', sep = ';', header = TRUE, na.strings = '?')
data$datetime <- as.POSIXct(paste(data$Date, data$Time), format = '%d/%m/%Y %H:%M:%S')
twodays <- filter(data, between(datetime, as.POSIXct('2007-02-01 00:00:00'), as.POSIXct('2007-02-02 23:59:59')))

dev.new(width = 480, height = 480, unit = 'px')
par(bg = 'white')

with(twodays, plot(datetime, Sub_metering_1, type = 'l', ylab = 'Energy sub metering', xlab = ''))
with(twodays, points(datetime, Sub_metering_2, type = 'l', col = 'red'))
with(twodays, points(datetime, Sub_metering_3, type = 'l', col = 'blue'))

legend("topright", col = c("black", "red", 'blue'), legend = c("Sub_metering_1", "Sub_metering_2", 'Sub_metering_3'), lty = 1)

dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()

