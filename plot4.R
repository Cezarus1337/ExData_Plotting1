#real frankenstein i swear guys

par(mfrow = c(2, 2))

epc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
epc2 <- epc[epc$Date %in% c("1/2/2007","2/2/2007") ,]


datetime <- strptime(paste(epc2$Date, epc2$Time, sep =" "), "%d/%m/%Y %H:%M:%S") 
gap <- as.numeric(epc2$Global_active_power)

sub1 <- as.numeric(epc2$Sub_metering_1)
sub2 <- as.numeric(epc2$Sub_metering_2)
sub3 <- as.numeric(epc2$Sub_metering_3)

grp <- as.numeric(epc2$Global_reactive_power)
volt <- as.numeric(epc2$Voltage)

plot(datetime, gap, type="l", xlab="", ylab="Global Active Power")
plot(datetime, volt, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, sub1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, sub2, type="l", col="red")
lines(datetime, sub3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"))
plot(datetime, grp, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.copy(png, file = "plot4.png")
dev.off()
