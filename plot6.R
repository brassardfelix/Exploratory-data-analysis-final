balt.emissions<-summarise(group_by(filter(NEI, fips == "24510"& type == 'ON-ROAD'), year), Emissions=sum(Emissions))
angeles.emissions<-summarise(group_by(filter(NEI, fips == "06037"& type == 'ON-ROAD'), year), Emissions=sum(Emissions))
balt.emissions$County <- "Baltimore City, MD"
angeles.emissions$County <- "Los Angeles County, CA"
both.emissions <- rbind(balt.emissions, angeles.emissions)
plot6 <- ggplot(both.emissions, aes(x=factor(year), y=Emissions, fill=County,label = round(Emissions,2))) +
  +     geom_bar(stat="identity") + 
  +     facet_grid(County~., scales="free") +
  +     ylab(expression("total PM"[2.5]*" emissions in tons")) + 
  +     xlab("year") +
  +     ggtitle(expression("Motor vehicle emission variation in Baltimore and Los Angeles in tons"))+
  +     geom_label(aes(fill = County),colour = "white", fontface = "bold")
plot6