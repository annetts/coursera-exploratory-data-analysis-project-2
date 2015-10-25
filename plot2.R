library(plyr)
library(ggplot2)

# setwd("/home/annett/Documents/iseõppimine/exGraphs/project2")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI.24510 <- NEI[which(NEI$fips == "24510"), ]
aggregate.24510 <- with(NEI.24510, aggregate(Emissions, by = list(year), sum))
colnames(aggregate.24510) <- c("year", "Emissions")
plot(aggregate.24510, type = "o", ylab = expression("Total Emissions, PM"[2.5]), 
     xlab = "Year", main = "Total Emissions for Baltimore County", xlim = c(1999, 2008))

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
