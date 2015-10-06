##Dr. Melissa M. Sovak
#Course Project 1
#Exploratory Data Analysis

#set working directory

setwd("/Users/lt_sovak/Dropbox/Coursera/DS Course 4")

#Read in the file

data<-read.csv("./Course Project 1/household_power_consumption.txt", sep=";", na.strings="?", nrows=207529, check.names=FALSE, stringsAsFactors=FALSE, header=TRUE, comment.char="", quote='\"')

#Format dates
data$Date<-as.Date(data$Date, format="%d/%m/%Y")

#subset data to only include 2007-02-01 and 2007-02-02
data<-subset(data, subset=(Date >= "2007-02-01" & Date <="2007-02-02"))

#Convert dates
datetime<-paste(as.Date(data$Date), data$Time)
data$Datetime<-as.POSIXct(datetime)

#Create plot 2 and save to png file
png("./Course Project 1/plot2.png", width=480, height=480)

plot(data$Global_active_power~data$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()


