## Exploratory Data Analysis
## Project 1 - Plot 1


##  Note:  To run this R script, the data file for the assignment (titled "household_power_consumption.txt") must be
##  unzipped and saved in your R working directory.

## Read the data file into R
household_power_data <- read.table ("household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?", stringsAsFactors = FALSE)

## Set Date data in the proper format
household_power_data$Date <- as.Date(household_power_data$Date, format="%d/%m/%Y")

## Subset the data to only look at the dates of 2/1/2007 and 2/2/2007
plot_data <- subset(household_power_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Plot the histogram for Plot 1
hist(plot_data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Save graph to a png file
dev.copy(png, file="plot1.png")
dev.off()

