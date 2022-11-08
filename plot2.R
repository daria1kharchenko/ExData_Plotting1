library(dplyr)
data <- read.table('household_power_consumption.txt', sep = ';', header = TRUE, na.strings = '?')
data$datetime <- as.POSIXct(paste(data$Date, data$Time), format = '%d/%m/%Y %H:%M:%S')
twodays <- filter(data, between(datetime, as.POSIXct('2007-02-01 00:00:00'), as.POSIXct('2007-02-02 23:59:59')))

dev.new(width = 480, height = 480, unit = 'px')
par(bg = 'white')

with(twodays, plot(datetime, Global_active_power, type = 'l', ylab = 'Global Active Power (kilowatts)', xlab = ''))

dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()

