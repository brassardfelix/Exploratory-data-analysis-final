NEI <- readRDS("summarySCC_PM25.rds")
dimSCC <- readRDS("Source_Classification_Code.rds")
total.emissions <- summarise(group_by(NEI, year), Emissions=sum(Emissions))
BaltNEI <- subset(NEI, NEI$fips=="24510")
clrs <- c("red", "green", "blue", "yellow")
x1<-barplot(height=total.emissions$Emissions, names.arg=total.emissions$year,
            +             xlab="years", ylab=expression('total PM'[2.5]*' emission in tons'),ylim=c(0,5000),
            +             main=expression('Total PM'[2.5]*' emissions in Baltimore at various years in tons'),col=clrs)
 
## Add text at top of bars
text(x = x1, y = round(total.emissions$Emissions,2), label = round(total.emissions$Emissions,2), pos = 3, cex = 0.8, col = "black")