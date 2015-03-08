## load data from working directory
data<-read.csv("household_power_consumption.txt", sep=";", na.strings = "?", stringsAsFactors=FALSE)

## convert date
datetime<-strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
data<-cbind(data, datetime)
data$Date<-as.Date(data$Date, "%d/%m/%Y")

## subquery data
data<-subset(data, data$Date >= as.Date("01/02/2007", "%d/%m/%Y") & data$Date <= as.Date("02/02/2007", "%d/%m/%Y"))

## save graph to disk
png("plot2.png", width=480, height=480)
opar=par(ps=12)
plot(data$datetime , data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
