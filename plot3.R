source('fetch_data.R')

png(filename='plot3.png')
with(energy_data, plot(
    DateTime,
    Sub_metering_1,
    type = 'l',
    xlab = '',
    ylab = 'Energy sub metering'
))
lines(energy_data$DateTime, energy_data$Sub_metering_2, col='red')
lines(energy_data$DateTime, energy_data$Sub_metering_3, col='blue')
legend(
    'topright',
    c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
    lty = 1,
    col = c('black', 'red', 'blue')
)
dev.off()
