

mdf = read.table('household_power_consumption.txt',
                 header = TRUE,
                 sep = ";",
                 na.strings=c("?", "NA", ""),
                 stringsAsFactors=FALSE)

# convenient for plotting
mdf$datetime <- as.POSIXct(paste(mdf$Date, mdf$Time),
                           format="%d/%m/%Y %H:%M:%S" )


# restricting data to days of our interest               
mdf <- subset(mdf, Date == "1/2/2007" | Date == "2/2/2007")               

# plotting 
png(filename="plot3.png", width=480, height=480, unit='px')

plot(mdf$datetime, mdf$Sub_metering_1, type='n', 
     xlab="", ylab='Energy sub metering')

lines(mdf$datetime, mdf$Sub_metering_1)
lines(mdf$datetime, mdf$Sub_metering_2, col='red')
lines(mdf$datetime, mdf$Sub_metering_3, col='blue')
legend('topright', lwd=2, col=c('black', 'red', 'blue'),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()