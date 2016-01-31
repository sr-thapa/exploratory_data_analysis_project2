##Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
##Use the base plotting system to make a plot answering this question.


#Setting working directory
setwd("C:/Users/User/exploratory_data_analysis_project2")


# Load the data sets from working directory
NEI <- readRDS("summarySCC_PM25.rds")             #PM2.5 Emissions Data
SCC <- readRDS("Source_Classification_Code.rds")  #Source Classification Code

# Sampling
NEI_sampling <- NEI[sample(nrow(NEI), size=5000, replace=F), ]

# Subsetting data and appending two years in one data frame
MD <- subset(NEI, fips=='24510')


# plotting the graph
png(filename='plot2.png')

barplot(tapply(X=MD$Emissions, INDEX=MD$year, FUN=sum), 
        main='Total PM Emission in Baltimore City, MD', 
        xlab='Years', ylab=expression('PM'[2.5]*'Emission'))

dev.off()



