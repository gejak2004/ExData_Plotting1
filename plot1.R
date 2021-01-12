
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
png(filename="plot1.png", width=480, height=480, unit='px')

hist(mdf$Global_active_power, 
     col='red',
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")

dev.off()


