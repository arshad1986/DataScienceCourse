library(ggplot2)
library(reshape2)
MEANBASE = 14.0 
setwd("~/Desktop/MOOC//Coursera/UIUC-Data Mining/Data Visualization/Programming Assignments/")
north <- read.table("./Programming Assignment Data - GISTEMP Original/Northern Hemisphere-mean monthly, seasonal, and annual means.txt",skip = 8,na.strings = "****",fill = TRUE, blank.lines.skip = TRUE, ,stringsAsFactors = FALSE)
south <- read.table("./Programming Assignment Data - GISTEMP Original/Southern Hemisphere-mean monthly, seasonal, and annual means,.txt",skip = 8,na.strings = "****",fill = TRUE, blank.lines.skip = TRUE, stringsAsFactors = FALSE)
myNorth <- north[,c(1,14)]
myNorth <- myNorth[myNorth$V1!="Year"&myNorth$V1!="Divide"&myNorth$V1!="Multiply",]
names(myNorth) <- c("Year", "AnnMeanNorth")
myNorth$AnnMeanNorth <- 0.01*as.numeric(myNorth$AnnMeanNorth) + MEANBASE


mySouth <- south[,c(1,14)]
mySouth <- mySouth[mySouth$V1!="Year"&mySouth$V1!="Divide"&mySouth$V1!="Multiply",]
names(mySouth) <- c("Year", "AnnMeanSouth")
mySouth$AnnMeanSouth <- 0.01*as.numeric(mySouth$AnnMeanSouth) + MEANBASE


# Merge the North and South hemisphere data
myData <- merge(mySouth, myNorth)

# Plot 1: Scatter Plot
myData1 <- melt(myData, id.vars="Year")

g1 <- ggplot(myData1, aes(x = Year, y = value))
g1 <- (g1 + geom_point(aes(color=variable))
        + theme(axis.text.x = element_text(angle = 45, hjust = 1), plot.title = element_text(vjust = 1))
        + scale_colour_hue(name="",breaks=c("AnnMeanSouth","AnnMeanNorth"), labels=c("South Hemisphere", "North Hemisphere"))
        + xlab("Year") + ylab("Mean Annual Temperature") 
        + ggtitle("Mean Annual Temperature of the North and South Hemisphere\n(1880-2015)") 
        + theme(legend.position= "top"))
print(g1)
## Warning: Removed 2 rows containing missing values (geom_point).


# Plot 2: Line Plot
myData2 <- transform(myData1, Year=as.numeric(Year))
g2 <- ggplot(myData2, aes(x = Year, y = value))
g2 <- (g2 + geom_line(aes(color = variable))
        + geom_point(aes(color = variable))
        + theme(axis.text.x = element_text(angle = 45, hjust = 1), plot.title = element_text(vjust = 1))
        + scale_colour_hue(name="",breaks=c("AnnMeanSouth","AnnMeanNorth"), labels=c("South Hemisphere", "North Hemisphere"))
        + xlab("Year") + ylab("Mean Annual Temperature in Celsius degree")
        + ggtitle("Mean Annual Temperature of the North and South Hemisphere\n(1880-2015)") 
        + scale_x_continuous(breaks=seq(1880,2015,5))
        + theme(legend.position= "top"))
print(g2)
