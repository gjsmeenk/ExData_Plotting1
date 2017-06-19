## reading the data, columns are seperated by ";", na.values are "?"
power_cons <- read.csv("./data/household_power_consumption.txt", sep = ";", na.strings=c("?"))
##converting column Date and Time
power_cons$Date <- as.Date(power_cons$Date, "%d/%m/%Y")
power_cons$Time <- strptime(paste(power_cons$Date, power_cons$Time), "%Y-%m-%d %H:%M:%S")

## subsetting the data on 1st and 2nd of February
d1 <- as.Date("2007-02-01")
d2 <- as.Date("2007-02-02")
power_cons_sub <- subset(power_cons, power_cons$Date %in% d1:d2)


## writing to a file called plot3.png
png(filename = "./Plot3.png")
## changing display settings to English
Sys.setlocale("LC_TIME", "English")
## constructing a graph of sub_metering over time
with(power_cons_sub, plot(Time, Sub_metering_1, type = "n", pch = NA_integer_, 
                          xlab = NA_character_, ylab = "Energy sub metering"))
with(power_cons_sub, points(Time, Sub_metering_1, pch = NA_integer_, type = "o", lwd = 1))
with(power_cons_sub, points(Time, Sub_metering_2, pch = NA_integer_, type = "o", lwd = 1, col = "red"))
with(power_cons_sub, points(Time, Sub_metering_3, pch = NA_integer_, type = "o", lwd = 1, col = "blue"))
legend("topright", lty = "solid", col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
## back to screen-mode
dev.off()