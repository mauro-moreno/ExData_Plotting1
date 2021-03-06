setwd('./')

# Check if dataset was already downloaded.
if (file.exists('data.zip') == FALSE) {
    # URL of the dataset for downloading.
    url_file <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
    download.file(url_file, 'data.zip', 'curl')
}

# Check if dataset was already unziped.
if (file.exists('household_power_consumption.txt') == FALSE) {
    unzip('data.zip')
}

# Check if dataset is set
if (exists('energy_data') == FALSE) {
    if (exists('dataset') == FALSE) {
        setClass('AsDate')
        setAs(
            'character',
            'AsDate',
            function(from) as.Date(from, format='%d/%m/%Y')
        )
        dataset <- read.csv(
            'household_power_consumption.txt',
            sep = ';',
            na.strings = '?',
            colClasses = c('AsDate', 'character', rep('numeric', 7))
        )
    }
    
    energy_data <- subset(
        dataset,
        Date == as.Date('2007-02-01') | Date == as.Date('2007-02-02')
    )
    energy_data$DateTime = strptime(
        paste(as.character(energy_data$Date), energy_data$Time),
        format = "%Y-%m-%d %H:%M:%S"
    )
    
    rm(dataset)
}
