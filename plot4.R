#
# This script reads in data and generates plots as described in "Exploratory " course.
#

# set the working directoy, where the data file is located in
setwd("data");

## get the data
# read in all data 
xx <- read.csv("household_power_consumption.txt", na.strings="?", sep=";");
# filter two days needed
power <- subset(xx, xx$Date == "1/2/2007" | xx$Date == "2/2/2007");
# clean memory
rm(xx)

# transfer date and time strings to proper date and time classes
power$Date <- as.Date(power$Date, format="%d/%m/%Y");
power$Time <- paste(power$Date, power$Time);
power$Time <-  strptime(power$Time, format="%Y-%m-%d %H:%M:%S");


## plot
# generate a png file to be used as plotting device
png(filename = "plot4.png");

# first set the 2x2 plot setting
par(mfrow=c(2, 2));
  
# same as plot2
plot(power$Time, power$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "");
# quite similar
plot(power$Time, power$Voltage, type = "l", ylab = "Voltage", xlab = "datetime");


# same as plot 3
plot(power$Time, power$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "");
lines(power$Time, power$Sub_metering_2, col="red")
lines(power$Time, power$Sub_metering_3, col="blue");
legend("topright",  c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), col = c("black", "red", "blue"), lty=1, bty="Y", border = "black")

# new one
plot(power$Time, power$Global_reactive_power, type = "l", ylab = "Global Reactive Power (kilowatts)", xlab = "datetime");


# close the device, so that png file is stored
dev.off();