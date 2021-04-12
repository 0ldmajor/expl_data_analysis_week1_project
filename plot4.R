df <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
df$Date <- as.Date(df$Date, "%d/%m/%Y")
df <- df[df$Date == "2007-02-01" | df$Date == "2007-02-02", ]
df$datetime <- strptime(paste(df$Date, df$Time), "%Y-%m-%d %H:%M:%S")

df$Global_active_power <- as.numeric(df$Global_active_power)
df$Voltage <- as.numeric(df$Voltage)
df$Sub_metering_1 <- as.numeric(df$Sub_metering_1)
df$Sub_metering_2 <- as.numeric(df$Sub_metering_2)
df$Global_reactive_power <- as.numeric(df$Global_reactive_power)
png(file = "plot4.png")
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), cex = 0.7)

with(df, plot(datetime, Global_active_power, 
              type = "l",
              xlab = "",
              ylab = "Global Active Power")
     )

with(df, plot(datetime, Voltage, 
              type = "l",
              xlab = "datetime",
              ylab = "Voltage")
     )

with(df, plot(datetime, Sub_metering_1, 
              type = "l",
              xlab = "",
              ylab = "Energy sub metering")
     )
with(df, lines(datetime, Sub_metering_2, 
               type = "l",
               col = "red")
     )
with(df, lines(datetime, Sub_metering_3, 
               type = "l",
               col = "blue")
     )
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = 1,
       cex = 0.8,
       bty = "n"
       )

with(df, plot(datetime, Global_reactive_power, 
              type = "l",
              xlab = "datetime",
              ylab = "Global_reactive_power"
              )
     )

dev.off()