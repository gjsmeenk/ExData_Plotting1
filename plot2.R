## reading the data, columns are seperated by ";", na.values are "?"
power_cons <- read.csv("./data/household_power_consumption.txt", sep = ";", na.strings=c("?"))
##converting column Date and Time
power_cons$Date <- as.Date(power_cons$Date, "%d/%m/%Y")
power_cons$Time <- strptime(paste(power_cons$Date, power_cons$Time), "%Y-%m-%d %H:%M:%S")

## subsetting the data on 1st and 2nd of February
d1 <- as.Date("2007-02-01")
d2 <- as.Date("2007-02-02")
power_cons_sub <- subset(power_cons, power_cons$Date %in% d1:d2)


## writing to a file called plot2.png
png(filename = "./Plot2.png")
## changing display settings to English
Sys.setlocale("LC_TIME", "English")
## constructing graph of Global active power over time
with(power_cons_sub, plot(Time, Global_active_power, type = "o", pch = NA_integer_, 
                          xlab = NA_character_, ylab = "Global Active Power (kilowatts)"))
## back to screen-mode
dev.off()