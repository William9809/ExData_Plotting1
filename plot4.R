plot4 <- function() {
    
# read data using sql commands to select required information only

    library(sqldf)
    DF <- read.csv.sql("household_power_consumption.txt",sep=";",stringsAsFactors = FALSE,sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'")
    closeAllConnections()

# set up date / time variable
    
    DF$DateTime<-strptime(paste(DF$Date,DF$Time),"%d/%m/%Y %H:%M:%S")

    
# open the png file and set global graphics parameters
    
    png(filename = "plot4.png",width = 480, height = 480, units = "px")

    par(mfrow=c(2,2),oma=c(0,1,0,0))
    
# plot the 1st graph

    plot(x = DF$DateTime,y=DF$Global_active_power,type="l",xlab="",ylab="Global Active Power")
        
# plot the 2nd graph
    
    plot(x = DF$DateTime,y=DF$Voltage,type="l",xlab="datetime",ylab="Voltage")

# plot the 3rd graph

    plot(x = DF$DateTime,y = DF$Sub_metering_1,col="black",type="l",xlab="",ylab="Energy sub metering")
    lines(x = DF$DateTime,y = DF$Sub_metering_2,col="red",type="l")
    lines(x = DF$DateTime,y = DF$Sub_metering_3,col="blue",type="l")
    legend("topright",col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,bty="n")

# plot the 4th graph
        
    plot(x = DF$DateTime,y=DF$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
    
# graphics.off command used to close file as dev.off leaves in locked state  
    
    graphics.off()
    
}