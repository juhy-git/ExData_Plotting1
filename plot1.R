hpc <- read.csv("./data/hpc.csv")
hpc$DateTime <- strptime(hpc$DateTime, "%Y-%m-%d %H:%M:%S")

png("plot1.png", width = 480, height = 480)
hist(hpc$Global_active_power,
     col = "red",
     xlab="Global active power (kilowatts)",
     main = "Global active power")
dev.off()