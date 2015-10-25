library(plyr)
library(ggplot2)

# getwd()
# setwd("/home/annett/Documents/iseõppimine/exGraphs/project2")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

aggregate.data <- with(NEI, aggregate(Emissions, by = list(year), sum))
plot(aggregate.data, type = "o", ylab = expression("Total Emissions, PM"[2.5]), 
     xlab = "Year", main = "Total Emissions in the United States")
polygon(aggregate.data, col = "green", border = "blue")

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
