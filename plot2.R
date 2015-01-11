# The first step is to read the household power consumption data, and identify column types.
data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", 
                 colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings="?")

# Then we need to subset the data to only use the given period
data_subset <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"), ]

data_subset$DateTime = strptime(paste(data_subset$Date,data_subset$Time),
                         format="%d/%m/%Y %H:%M:%S")



# Plot 2
## Start png
png(filename = "plot2.png",  width = 480, height = 480)
## Create the histogram
plot(data_subset$DateTime,
     data_subset$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")

## End png and save the figure
dev.off()