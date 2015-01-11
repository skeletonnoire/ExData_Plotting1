# The first step is to read the household power consumption data, and identify column types.
data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", 
                 colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings="?")

# Then we need to subset the data to only use the given period
data_subset <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"), ]

data_subset$DateTime = strptime(paste(data_subset$Date,data_subset$Time),
                                format="%d/%m/%Y %H:%M:%S")

colnames(data_subset)
# Plot 4
## Start png
png(filename = "plot4.png",  width = 480, height = 480, units = "px", bg = "transparent")




## For this we need to make 4 plots in a 2x2 matrix
par(mfrow=c(2,2))
#Plot 1
plot(data_subset$DateTime,data_subset$Global_active_power,ylab="Global Active Power",xlab="",type="l")
#Plot 2
plot(data_subset$DateTime,data_subset$Voltage,xlab="datetime",ylab="Voltage",type="l")
#Plot 3
plot(data_subset$DateTime,
     data_subset$Sub_metering_1,
     type="l",
     xlab="",
     ylab="Energy sub metering")
lines(data_subset$DateTime,
      data_subset$Sub_metering_2,
      type="l",
      col="red")
lines(data_subset$DateTime,
      data_subset$Sub_metering_3,
      type="l",
      col="blue")

legend(x="topright",
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),lwd=2,
       col=c("black","red","blue"))
#Plot 4
plot(data_subset$DateTime,data_subset$Global_reactive_power,xlab='datetime',ylab='Global_reactive_power',type='l')
## End png and save the figure
dev.off()