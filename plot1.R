#  Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission from all sources 
# for each of the years 1999, 2002, 2005, and 2008.



#Setting working directory
setwd("C:/Users/User/exploratory_data_analysis_project2")


# Load the data sets from working directory
NEI <- readRDS("summarySCC_PM25.rds")             #PM2.5 Emissions Data
SCC <- readRDS("Source_Classification_Code.rds")  #Source Classification Code

# Sampling
NEI_sampling <- NEI[sample(nrow(NEI), size=2000, replace=F), ]

# Aggregate
Emissions <- aggregate(NEI[, 'Emissions'], by=list(NEI$year), FUN=sum)
Emissions$PM <- round(Emissions[,2]/1000,2)



# plotting the graph
png(filename='plot1.png')

barplot(Emissions$PM, names.arg=Emissions$Group.1, 
        main=expression ('Total Emission of PM'[2.5]*' in various years'),
        xlab='Year', ylab=expression(paste('PM', ''[2.5], ' in Kilo-tons')))
dev.off()