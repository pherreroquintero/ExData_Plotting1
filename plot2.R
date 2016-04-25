#Loading and subsetting data
data <- read.table(file = "../household_power_consumption.txt",na.strings = "?"
                   ,sep = ";",header = TRUE
                   ,colClasses = c("character","character",rep("numeric",7))
                   ,stringsAsFactors = FALSE)
data <- mutate(data,Date = as.Date(data$Date,"%d/%m/%Y"))
dataFeb <- subset(data,data$Date >= "2007-02-01" & data$Date <= "2007-02-02")

#create the png dev
png(filename = "plot2.png",width = 480, height = 480)

###draw the plot
#Create the empty plot
with(dataFeb,plot(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S")
                  ,Global_active_power,type = "n",xlab = ""
                  ,ylab="Global Active Power (Kilowatts)"))
#Draw the global active power line
with(dataFeb,lines(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S")
                   ,Global_active_power))

#close png dev
dev.off()