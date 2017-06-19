## reading the data, columns are seperated by ";", na.values are "?"
power_cons <- read.csv("./data/household_power_consumption.txt", sep = ";", na.strings=c("?"))
##converting column Date and Time
power_cons$Date <- as.Date(power_cons$Date, "%d/%m/%Y")
##power_cons$Time <- strptime(power_cons$Time)

## subsetting the data on 1st and 2nd of February
d1 <- as.Date("2007-02-01")
d2 <- as.Date("2007-02-02")
power_cons_sub <- subset(power_cons, power_cons$Date %in% d1:d2)


## writing to a file called plot1.png
png(filename = "./Plot1.png")
## constructing a histogram of Global_active_power
hist(power_cons_sub$Global_active_power, main = "Global Active Power", col="red", xlab = "Global Active Power (kilowatts)")
## back to screen-mode
dev.off()