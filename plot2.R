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

png(file = "plot2.png", width = 480, height = 480, units = "px")
plot(elecPwrConsumptionFeb$DateTime, elecPwrConsumptionFeb$Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
