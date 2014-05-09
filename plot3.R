# plot3.R

setwd("D:/Users/FRAENG/Documents/2 Projects/2014 Data Analysis/ExploratoryDataAnalysis/Project1/ExData_Plotting1")
# NOTE: when reading in data, always a smart choice to set stringsasFactors = FALSE to avoid factors 
power_cons_data = read.table("household_power_consumption.txt", header=TRUE, sep = ';',  stringsAsFactors=FALSE)
power_cons_data = subset(power_cons_data, power_cons_data$Date == "1/2/2007" | power_cons_data$Date =="2/2/2007")
# how to subset by multiple conditions 
# my.data.frame <- subset(data , V1 > 2 | V2 < 4) # VERSION 1
# my.data.frame <- data[(data$V1 > 2) | (data$V2 < 4), ] # VERSION 2 
power_cons_data1 <- power_cons_data
# very import: format below describes current format, not future format 
# power_cons_data1$Date <- as.Date(power_cons_data1$Date, format = "%d/%m/%Y") # format describes CURRENT format 
#power_cons_data1$Time <- strptime(power_cons_data1$Time, format = "%H:%M:%S") # works but adds today's date  

# join date and time into new field & converts 
power_cons_data1$weekDay <- strptime(paste(power_cons_data1$Date, power_cons_data1$Time), format='%d/%m/%Y %H:%M:%S')


# PLOT 3:
power_cons_data1$Sub_metering_1 <- as.numeric(power_cons_data1$Sub_metering_1)
power_cons_data1$Sub_metering_2 <- as.numeric(power_cons_data1$Sub_metering_2)) 
power_cons_data1$Sub_metering_3 <- as.numeric(power_cons_data1$Sub_metering_3)

png(bg = "white", filename = "plot3.png", width = 480, height = 480)
plot(power_cons_data1$weekDay,power_cons_data1$Sub_metering_1, type="l", xlab="", ylab="Energy Sub Metering")  
# R: to overlay multiple plots, use points or lines function 
lines(power_cons_data1$weekDay,power_cons_data1$Sub_metering_2, type="l", col="red") 
points(power_cons_data1$weekDay,power_cons_data1$Sub_metering_3, type="l", col="blue") 
legend("topright",cex=0.7, lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()