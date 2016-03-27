#How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?


library(ggplot2)

sum_ssc<- readRDS("summarySCC_PM25.rds")


Co <- readRDS("Source_Classification_Code.rds")

Merged<- merge(sum_ssc, Co, by="SCC")

fps <- sum_ssc[sum_ssc$fips=="24510" & sum_ssc$type=="ON-ROAD",  ]

aggrY <- aggregate(Emissions ~ year, fps, sum)



png("plot5.png", width=840, height=480)
g <- ggplot(aggrY, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from motor vehicle (type = ON-ROAD) in Baltimore City, Maryland (fips = "24510") from 1999 to 2008')
print(g)
dev.off()