plot2 <- function () {
  ## read the household power consumption data
  pwrd <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings="?")
  ## convert Date to R Date class
  pwrd$Date <- as.Date(pwrd$Date, format="%d/%m/%Y")
  ## create date time character strings by pasting Date and Time columns
  dt_charstr <- paste(as.character(pwrd$Date), pwrd$Time)
  ## convert date time character string to posix date time class
  dt_posix <- as.POSIXct(dt_charstr,format="%Y-%m-%d %H:%M:%S", tz="")
  ## append posix date time to power data
  pwrd$Date_Time <- dt_posix
  ## subset the power data for the needed dates
  ss <- subset(pwrd, pwrd$Date==as.Date("2007-02-01") | pwrd$Date==as.Date("2007-02-02"))
  ## plot in plot2.png file
  png("plot2.png")
  plot(ss$Date_Time, ss$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  dev.off()
}