#Loading and subsetting data
data <- read.table(file = "../household_power_consumption.txt",na.strings = "?",sep = ";",header = TRUE,colClasses = c("character","character",rep("numeric",7)),stringsAsFactors = FALSE)
data <- mutate(data,Date = as.Date(data$Date,"%d/%m/%Y"))
dataFeb <- subset(data,data$Date >= "2007-02-01" & data$Date <= "2007-02-02")

#create the png dev
png(filename = "plot1.png",width = 480, height = 480)

#draw the plot
with(dataFeb,hist(Global_active_power,col = "red",xlab = "Global Active Power (kilowatts)",main = "Global Active Power"))

#close the png dev
dev.off()