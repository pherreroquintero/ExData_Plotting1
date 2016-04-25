#Loading and subsetting data
data <- read.table(file = "../household_power_consumption.txt",na.strings = "?",sep = ";",header = TRUE,colClasses = c("character","character",rep("numeric",7)),stringsAsFactors = FALSE)
data <- mutate(data,Date = as.Date(data$Date,"%d/%m/%Y"))
dataFeb <- subset(data,data$Date >= "2007-02-01" & data$Date <= "2007-02-02")

#create the png dev
png(filename = "plot3.png",width = 480, height = 480)

### Drawing the plot

#create the empty plot
with(dataFeb,plot(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S")
                  ,Sub_metering_1,type = "n",xlab = "",ylab="Energy sub metering"))

#Add Sub_metering_1 line
with(dataFeb,lines(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S")
                   ,Sub_metering_1,col="black"))

#Add Sub_metering_2 line
with(dataFeb,lines(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S")
                   ,Sub_metering_2,col="red"))

#Add Sub_metering_3 line
with(dataFeb,lines(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S")
                   ,Sub_metering_3,col="blue"))

#Add the Leyend
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
       ,lty = "solid",col = c("black","red","blue"))

#close the png dev
dev.off()
