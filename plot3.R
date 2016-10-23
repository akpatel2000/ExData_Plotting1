library(lubridate)

elecPwrConsumption <- read.table("household_power_consumption.txt", 
                                 header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?")


elecPwrConsumption$Date <- dmy(elecPwrConsumption$Date)
elecPwrConsumptionFeb <- subset(elecPwrConsumption, 
                                Date == "2007-02-01" | Date == "2007-02-02")

elecPwrConsumptionFeb$DateTime <- paste(elecPwrConsumptionFeb$Date, elecPwrConsumptionFeb$Time)
elecPwrConsumptionFeb$DateTime <- ymd_hms(elecPwrConsumptionFeb$DateTime)


rm(elecPwrConsumption)
elecPwrConsumptionFeb$Global_active_power <- as.numeric(elecPwrConsumptionFeb$Global_active_power)

png(file = "plot3.png", width = 480, height = 480, units = "px")
plot(elecPwrConsumptionFeb$DateTime, elecPwrConsumptionFeb$Sub_metering_1, type = "l", 
                          xlab = "", ylab = "Energy by sub metering")
lines(elecPwrConsumptionFeb$DateTime, elecPwrConsumptionFeb$Sub_metering_2, type = "l", col="red")
lines(elecPwrConsumptionFeb$DateTime, elecPwrConsumptionFeb$Sub_metering_3, type = "l", col="blue")
legend("topright", lty = 1,col=c("black", "red", "blue"), legend=c("sub meter 1","sub meter 2", "sub meter 3"))
dev.off()
