

# Compare emissions from motor vehicle sources in Baltimore City with emissions from motor 
# vehicle sources in Los Angeles County, California (fips == "06037"). 
# Which city has seen greater changes over time in motor vehicle emissions?

library(ggplot2)

sum_ssc<- readRDS("summarySCC_PM25.rds")


Co <- readRDS("Source_Classification_Code.rds")

Merged<- merge(sum_ssc, Co, by="SCC")



fps <- sum_ssc[(sum_ssc$fips=="24510"|sum_ssc$fips=="06037") & sum_ssc$type=="ON-ROAD",  ]

aggrYFps <- aggregate(Emissions ~ year + fips, fps, sum)
aggrYFps$fips[aggrYFps$fips=="24510"] <- "Baltimore, MD"
aggrYFps$fips[aggrYFps$fips=="06037"] <- "Los Angeles, CA"

png("plot6.png", width=1040, height=480)
g <- ggplot(aggrYFps, aes(factor(year), Emissions))
g <- g + facet_grid(. ~ fips)
g <- g + geom_bar(stat="identity")  +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from motor vehicle (type=ON-ROAD) in Baltimore City, MD (fips = "24510") vs Los Angeles, CA (fips = "06037")  1999-2008')
print(g)
dev.off()