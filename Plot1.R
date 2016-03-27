#Plot 1.
# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission from all sources 
# for each of the years 1999, 2002, 2005, and 2008.

 
sum_ssc<- readRDS("summarySCC_PM25.rds")


Co <- readRDS("Source_Classification_Code.rds")

aggrY <- aggregate(Emissions ~ year, sum_ssc, sum)

png('plot1.png')
barplot(height=aggrY$Emissions, names.arg=aggrY$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' emissions at various years'))
dev.off()
