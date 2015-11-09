# "household_power_consumption2.txt" file contains only the rows for 01/02/2007 and 02/02/2007. My computer was not powerful enough to read the initial file

#read the file
file<-read.table("household_power_consumption2.txt",header=TRUE,sep=";")

# convert the columns' values into the right format
file$Date<-as.Date(file$Date, format="%d/%m/%Y")
file$Time<-strptime(file$Time,format="%H:%M:%S")
file$Time<-format(file$Time, "%H:%M:%S")

# plot the graphs
par(col="black")
plot((as.POSIXct(paste(file$Date, file$Time))),file$Sub_metering_1,ylab="Energy sub metering",type="l",xlab="")
plot((as.POSIXct(paste(file$Date, file$Time))),file$Sub_metering_2,ylab="Energy sub metering",type="l",xlab="")
plot((as.POSIXct(paste(file$Date, file$Time))),file$Sub_metering_3,ylab="Energy sub metering",type="l",xlab="")

# display the graphs with the right colors
lines((as.POSIXct(paste(file$Date, file$Time))),file$Sub_metering_1,ylab="Energy sub metering",type="l",xlab="")
par(col="red")
lines((as.POSIXct(paste(file$Date, file$Time))),file$Sub_metering_2,ylab="Energy sub metering",type="l",xlab="")
par(col="blue")
lines((as.POSIXct(paste(file$Date, file$Time))),file$Sub_metering_3,ylab="Energy sub metering",type="l",xlab="")
par(col="black")

# add a legend
legend("topright",pch=4,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
