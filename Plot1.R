##Plot 1 solution

if (!file.exists("data.zip"))

data <- read.csv("household_power_consumption.txt", ##read datafile
                 skip=66637,
                 nrows=2880,
                 na.strings = "?",
                 header=F,
                 sep=";")
names(data) <- names(read.csv("household_power_consumption.txt", nrows=1,sep=";"))
data$Date <- as.Date(data$Date, format="%d/%m/%y")
data$Time <- strptime(data$Time, format="%H:%M:%S")

png(filename="Plot1.png", width=480, height=480) ##Create pngfile
hist(data$Global_active_power, 
     col="#ff2500", 
     xlab="Global Active Power (kilowatts)", 
     main="Global Active Power")
dev.off()