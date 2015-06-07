hpc <- read.csv("./data/hpc.csv")
hpc$DateTime <- strptime(hpc$DateTime, "%Y-%m-%d %H:%M:%S")

attach(hpc)
hpc <- hpc[order(DateTime),]
detach(hpc)

Sys.setlocale("LC_TIME", "C")

png("plot3.png", width = 480, height = 480)
plot(hpc$DateTime, hpc$Sub_metering_1,
     type = "s",
     xlab="", ylab="Energy sub metering",
     main = "")

lines(hpc$DateTime, hpc$Sub_metering_2, col = "red")
lines(hpc$DateTime, hpc$Sub_metering_3, col = "blue")

legend("topright",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_2"),
       lty=c(1,1,1), cex=0.9, 
       col=c("black", "blue","red"))

dev.off()