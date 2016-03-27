#plot 2
# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
# Use the base plotting system to make a plot answering this question.


sum_ssc<- readRDS("summarySCC_PM25.rds")


Co <- readRDS("Source_Classification_Code.rds")

fps  <- sum_ssc[sum_ssc$fips=="24510", ]

aggrY <- aggregate(Emissions ~ year, fps, sum)

png('plot2.png')
barplot(height=aggrY$Emissions, names.arg=aggrY$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' in the Baltimore City, MD emissions at various years'))
dev.off()
