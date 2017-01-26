plot2 <- function() {
    
# read data using sql commands to select required information only

    library(sqldf)
    DF <- read.csv.sql("household_power_consumption.txt",sep=";",stringsAsFactors = FALSE,sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'")
    closeAllConnections()

# set up date / time variable
    
    DF$DateTime<-strptime(paste(DF$Date,DF$Time),"%d/%m/%Y %H:%M:%S")
    
# plot the first graph to the png and then close the png file
# graphics.off command used to close file as dev.off leaves in locked state

    png(filename = "plot2.png",width = 480, height = 480, units = "px")

    par(mar=c(4,4,4,4),oma=c(1,1,1,0))
    plot(x = DF$DateTime,y = DF$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

    graphics.off()
    
}