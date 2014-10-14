## Exploratory Data Analysis
## Project 1 - Plot 3

##  Note:  To run this R script, the data file for the assignment (titled "household_power_consumption.txt") must be
##         unzipped and saved in your R working directory.

## Read the data file into R
household_power_data <- read.table ("household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?", stringsAsFactors = FALSE)

## Set Date data in the proper format
household_power_data$Date <- as.Date(household_power_data$Date, format="%d/%m/%Y")

## Subset the data to only look at the dates of 2/1/2007 and 2/2/2007
plot_data <- subset(household_power_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Converting dates to date and time format.  Create a new column for the datetime data.
datetime <- paste(as.Date(plot_data$Date), plot_data$Time)
plot_data$datetime <- as.POSIXct(datetime)

## Plot a line graph with 3 inputs using the "with" function.
with(plot_data, {plot(Sub_metering_1~datetime, type="l", ylab="Energy sub metering", xlab="")
                 lines(Sub_metering_2~datetime,col='Red') 
                 lines(Sub_metering_3~datetime,col='Blue')
})

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2",
                                                                         "Sub_metering_3"))
## Save the graph to a png file.
##   Note:  I had to use the png function to create the file.  dev.copy did not show the legend correctly.
png(filename="plot3.png")

with(plot_data, {plot(Sub_metering_1~datetime, type="l", ylab="Energy sub metering", xlab="")
                 lines(Sub_metering_2~datetime,col='Red') 
                 lines(Sub_metering_3~datetime,col='Blue')
})

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2",
                                                                         "Sub_metering_3"))
dev.off()

