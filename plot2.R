source('fetch_data.R')

png(filename='plot2.png')
with(energy_data, plot(
    DateTime,
    Global_active_power,
    type="l",
    xlab = '',
    ylab = 'Global active power (kilowatts)'
))
dev.off()
