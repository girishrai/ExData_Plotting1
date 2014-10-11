plot1 <- function () {
  ## read the household power consumption data
  pwrd <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings="?")
  ## convert Date column to R Date class
  pwrd$Date <- as.Date(pwrd$Date, format="%d/%m/%Y")
  ## subset the power data for the needed dates
  ss <- subset(pwrd, pwrd$Date==as.Date("2007-02-01") | pwrd$Date==as.Date("2007-02-02"))
  ## plot histogram in plot1.png file
  png("plot1.png")
  hist(ss$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
  dev.off()
}