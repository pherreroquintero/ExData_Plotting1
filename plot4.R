#Loading and subsetting data
data <- read.table(file = "../household_power_consumption.txt",na.strings = "?",sep = ";",header = TRUE,colClasses = c("character","character",rep("numeric",7)),stringsAsFactors = FALSE)
data <- mutate(data,Date = as.Date(data$Date,"%d/%m/%Y"))
dataFeb <- subset(data,data$Date >= "2007-02-01" & data$Date <= "2007-02-02")


#create the png dev
png(filename = "plot4.png",width = 480, height = 480)

#set the room for the four plots
par(mfrow=c(2,2))



### Drawing the plots

##1 Plot
#Create the empty plot
with(dataFeb,plot(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S")
                  ,Global_active_power,type = "n",xlab = ""
                  ,ylab="Global Active Power (Kilowatts)"))
#Draw the global active power line
with(dataFeb,lines(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S")
                   ,Global_active_power))


##2 Plot
with(dataFeb,plot(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S")
                  ,Voltage,type = "n",xlab = "datetime"
                  ,ylab="Voltage"))
#Draw the global active power line
with(dataFeb,lines(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S")
                   ,Voltage))

## 3 Plot 
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


## 4 Plot 
with(dataFeb,plot(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S")
                  ,Global_reactive_power,type = "n",xlab = "datetime"
                  ,ylab="Global_Reactive_Power"))
#Draw the global active power line
with(dataFeb,lines(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S")
                   ,Global_reactive_power))

#close the png dev
dev.off()