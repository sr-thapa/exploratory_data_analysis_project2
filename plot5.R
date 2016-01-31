#How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

#Setting working directory
setwd("C:/Users/User/exploratory_data_analysis_project2")
library(ggplot2) #load ggplot library

# Load the data sets from working directory
NEI <- readRDS("summarySCC_PM25.rds")             #PM2.5 Emissions Data
SCC <- readRDS("Source_Classification_Code.rds")  #Source Classification Code
NEI$year <- factor(NEI$year, levels=c('1999', '2002', '2005', '2008'))

# Baltimore City, Maryland == fips
MD.onroad <- subset(NEI, fips == 24510 & type == 'ON-ROAD')

# Aggregate
MD.df <- aggregate(MD.onroad[, 'Emissions'], by=list(MD.onroad$year), sum)
colnames(MD.df) <- c('year', 'Emissions')

# plotting the graph
png('plot5.png')


ggplot(data=MD.df, aes(x=year, y=Emissions)) + geom_bar(aes(fill=year)) + guides(fill=F) + 
  ggtitle('Total Emissions of Motor Vehicle Sources in Baltimore City, Maryland') + 
  ylab(expression('PM'[2.5])) + xlab('Year') + theme(legend.position='none') + 
  geom_text(aes(label=round(Emissions,0), size=1, hjust=0.5, vjust=2))

dev.off()