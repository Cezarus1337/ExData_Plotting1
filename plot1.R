epc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
epc2 <- epc[, -(1:2)]
hist(as.numeric(epc2[, 1]), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png")
dev.off()

#code for 1st plot. Some troubles w/ frequency, really don't know how to fix.
#if you have any ideas, please let me know in the comments.