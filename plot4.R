hpc <- read.csv("./data/hpc.csv")
hpc$DateTime <- strptime(hpc$DateTime, "%Y-%m-%d %H:%M:%S")

attach(hpc)
hpc <- hpc[order(DateTime),]
detach(hpc)

Sys.setlocale("LC_TIME", "C")

png("plot4.png", width = 480, height = 480)
par(mar = c(4,4,2,2))
par(mfrow = c(2, 2))

# Plot 1
plot(hpc$DateTime, hpc$Global_active_power,
     type = "s",
     xlab="", ylab="Global active power (kilowatts)",
     main = "")

# Plot 2
plot(hpc$DateTime, hpc$Voltage,
     type = "s",
     xlab="datatime", ylab="Voltage",
     main = "")

# Plot 3
plot(hpc$DateTime, hpc$Sub_metering_1,
     type = "s",
     xlab="", ylab="Energy sub metering",
     main = "")

lines(hpc$DateTime, hpc$Sub_metering_2, col = "red")
lines(hpc$DateTime, hpc$Sub_metering_3, col = "blue")

legend("topright",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_2"),
       lty=c(1,1,1), cex=0.9, bty = "n",
       col=c("black", "blue","red"))

# Plot 4
plot(hpc$DateTime, hpc$Global_reactive_power,
     type = "s",
     xlab="datatime", ylab="Global_reactive_power",
     main = "")

dev.off()