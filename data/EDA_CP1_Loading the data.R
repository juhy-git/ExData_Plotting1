### Data:
### https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
### Just unzip a file into a working directory

### Load the data - subset the dates 2007-02-01 and 2007-02-02

hpc <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
hpc_21 <- subset(hpc, Date == "1/2/2007")
hpc_22 <- subset(hpc, Date == "2/2/2007")
hpc <- rbind(hpc_22, hpc_21)

rm(hpc_21)
rm(hpc_22)


### Fix missing values

hpc$Global_active_power <- as.character(hpc$Global_active_power)
hpc$Global_active_power <- as.numeric(hpc$Global_active_power)

hpc$Global_reactive_power <- as.character(hpc$Global_reactive_power)
hpc$Global_reactive_power <- as.numeric(hpc$Global_reactive_power)

hpc$Voltage <- as.character(hpc$Voltage)
hpc$Voltage <- as.numeric(hpc$Voltage)

hpc$Global_intensity <- as.character(hpc$Global_intensity)
hpc$Global_intensity <- as.numeric(hpc$Global_intensity)

hpc$Sub_metering_1 <- as.character(hpc$Sub_metering_1)
hpc$Sub_metering_1 <- as.numeric(hpc$Sub_metering_1)

hpc$Sub_metering_2 <- as.character(hpc$Sub_metering_2)
hpc$Sub_metering_2 <- as.numeric(hpc$Sub_metering_2)


### Convert the Date and Time variables

library(stringr)
dt <- str_c(hpc$Date, hpc$Time, sep = " ", collapse = NULL)
hpc$DateTime <- strptime(dt, "%d/%m/%Y %H:%M:%S")

hpc$Date <- NULL
hpc$Time <- NULL

rm(dt)

### Save as hpc

write.csv(hpc, "hpc.csv", row.names=FALSE)