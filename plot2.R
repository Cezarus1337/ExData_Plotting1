epc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
epc2 <- epc[epc$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(epc2$Date, epc2$Time, sep =" "), "%d/%m/%Y %H:%M:%S") 
gap <- as.numeric(epc2$Global_active_power)

# my system language is Russian
plot(datetime, gap, type ="l", xlab ="", ylab ="Global Active Power (kilowatts)")
dev.copy(png, file = "plot2.png")
dev.off()

#code for 2nd plot