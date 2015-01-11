
# The first step is to read the household power consumption data, and identify column types.
data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", 
                   colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings="?")

# Then we need to subset the data to only use the given period
data_subset <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"), ]


# Then we need to subset the data to only use the given period


# Plot 1
## Start png
png(filename = "plot1.png", col="red",  width = 480, height = 480, units = "px", bg = "transparent")
## Create the histogram
hist(
        data_subset$Global_active_power, 
        breaks=12, 
        col="red", 
        main="Global Active Power", 
        xlab="Global Active Power (kilowatts)")
## End png and save the figure
dev.off()