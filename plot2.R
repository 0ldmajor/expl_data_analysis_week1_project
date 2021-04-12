df <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
df$Date <- as.Date(df$Date, "%d/%m/%Y")
df <- df[df$Date == "2007-02-01" | df$Date == "2007-02-02", ]
df$datetime <- strptime(paste(df$Date, df$Time), "%Y-%m-%d %H:%M:%S")
df$Global_active_power <- as.numeric(df$Global_active_power)
png(file = "plot2.png")
with(df, plot(datetime, Global_active_power, 
              type = "l",
              xlab = "",
              ylab = "Global Active Power (kilowatts)")
     )
dev.off()