hpc <- read.csv("./data/hpc.csv")
hpc$DateTime <- strptime(hpc$DateTime, "%Y-%m-%d %H:%M:%S")

attach(hpc)
hpc <- hpc[order(DateTime),]
detach(hpc)

Sys.setlocale("LC_TIME", "C")

png("plot2.png", width = 480, height = 480)
plot(hpc$DateTime, hpc$Global_active_power,
     type = "s",
     xlab="", ylab="Global active power (kilowatts)",
     main = "")

dev.off()