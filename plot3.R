plot3 <- function() {
    
# read data using sql commands to select required information only

    library(sqldf)
    DF <- read.csv.sql("household_power_consumption.txt",sep=";",stringsAsFactors = FALSE,sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'")
    closeAllConnections()

# set up date / time variable
    
    DF$DateTime<-strptime(paste(DF$Date,DF$Time),"%d/%m/%Y %H:%M:%S")
    
# plot the first graph to the png and then close the png file
# graphics.off command used to close file as dev.off leaves in locked state

    png(filename = "plot3.png",width = 480, height = 480, units = "px")

    par(mar=c(4,4,4,4),oma=c(1,1,1,0))
    plot(x = DF$DateTime,y = DF$Sub_metering_1,col="black",type="l",xlab="",ylab="Energy sub metering")
    lines(x = DF$DateTime,y = DF$Sub_metering_2,col="red",type="l")
    lines(x = DF$DateTime,y = DF$Sub_metering_3,col="blue",type="l")
    legend("topright",col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1)
    
    graphics.off()
    
}