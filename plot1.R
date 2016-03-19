source('fetch_data.R')

png(filename='plot1.png')
with(energy_data, hist(
    Global_active_power,
    xlab = 'Global active power (kilowatts)',
    col = 'red',
    main = 'Global active power'
))
dev.off()
