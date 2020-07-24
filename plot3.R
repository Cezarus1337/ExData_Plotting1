#same as plot2 + cleaning (a.k.a. doing numeric)
epc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
epc2 <- epc[epc$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(epc2$Date, epc2$Time, sep =" "), "%d/%m/%Y %H:%M:%S") 
gap <- as.numeric(epc2$Global_active_power)

sub1 <- as.numeric(epc2$Sub_metering_1)
sub2 <- as.numeric(epc2$Sub_metering_2)
sub3 <- as.numeric(epc2$Sub_metering_3)

plot(datetime, sub1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, sub2, type="l", col="red")
lines(datetime, sub3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))


# my system language is Russian
dev.copy(png, file = "plot3.png")
dev.off()

#for 3rd plot