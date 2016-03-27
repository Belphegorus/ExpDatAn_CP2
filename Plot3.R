#Plot 3
# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999 2008 for Baltimore City? 
# Which have seen increases in emissions from 1999 2008? 
# Use the ggplot2 plotting system to make a plot answer this question.


library(ggplot2)

sum_ssc<- readRDS("summarySCC_PM25.rds")


Co <- readRDS("Source_Classification_Code.rds")


# 24510 is Baltimore, see plot2.R
fps  <- sum_ssc[sum_ssc$fips=="24510", ]

aggrY <- aggregate(Emissions ~ year + type, fps, sum)



png("plot3.png", width=640, height=480)
g <- ggplot(aggrY, aes(year, Emissions, color = type))
g <- g + geom_line() +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions in Baltimore City, Maryland (fips == "24510") from 1999 to 2008')
print(g)
dev.off()