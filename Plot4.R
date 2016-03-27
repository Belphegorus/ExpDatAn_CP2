#Plot 4

# Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?



library(ggplot2)

sum_ssc<- readRDS("summarySCC_PM25.rds")


Co <- readRDS("Source_Classification_Code.rds")

Merged<- merge(sum_ssc, Co, by="SCC")


Match <- grepl("coal", Merged$Short.Name, ignore.case=TRUE)
Matches <- Merged[Match, ]

aggrY<- aggregate(Emissions ~ year, Matches, sum)



png("plot4.png", width=640, height=480)
g <- ggplot(aggrY, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from coal sources from 1999 to 2008')
print(g)
dev.off()