library(lubridate)

elecPwrConsumption <- read.table("household_power_consumption.txt", 
                                 header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?")

elecPwrConsumption$Date <- dmy(elecPwrConsumption$Date)
elecPwrConsumptionFeb <- subset(elecPwrConsumption, 
                                Date == "2007-02-01" | Date == "2007-02-02")
rm(elecPwrConsumption)
elecPwrConsumptionFeb$Global_active_power <- as.numeric(elecPwrConsumptionFeb$Global_active_power)

png(file = "plot1.png", width = 480, height = 480, units = "px")
hist(elecPwrConsumptionFeb$Global_active_power, col = "red", 
     xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
