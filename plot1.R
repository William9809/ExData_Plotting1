plot1 <- function() {
    
# read data using sql commands to select required information only

    library(sqldf)
    DF <- read.csv.sql("household_power_consumption.txt",sep=";",stringsAsFactors = FALSE,sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'")
    closeAllConnections()

# plot the first graph to plot1.png and then close the png file
# graphics.off command used to close file as dev.off leaves in locked state

    png(filename = "plot1.png",width = 480, height = 480, units = "px")

    par(mar=c(4,4,4,4),oma=c(1,1,1,0))
    hist(DF$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power")

    graphics.off()
    
}