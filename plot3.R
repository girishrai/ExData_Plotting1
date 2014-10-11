plot3 <- function () {
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
  ## plot in plot3.png file
  png("plot3.png")
  plot(ss$Date_Time, ss$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(ss$Date_Time, ss$Sub_metering_2, type="l", col="red")
  lines(ss$Date_Time, ss$Sub_metering_3, type="l", col="blue")
  legend(x="topright", 
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
         col = c("black", "red", "blue"), ## for colors
         lty=c(1, 1, 1))   ## specify line types
  dev.off()
}