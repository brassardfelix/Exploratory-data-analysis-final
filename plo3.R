type.emissions<-summarise(group_by(filter(NEI, fips == "24510"), year,type), Emissions=sum(Emissions))

plot3 <- ggplot(type.emissions, aes(x=factor(year), y=Emissions, fill=type,label = round(Emissions,2))) +
  +     geom_bar(stat="identity") +
  +     #geom_bar(position = 'dodge')+
  +     facet_grid(. ~ type) +
  +     xlab("year") +
  +     ylab(expression("total PM"[2.5]*" emission in tons")) +
  +     ggtitle(expression("PM"[2.5]*paste(" emissions in Baltimore ",
  +     "City by various source types", sep="")))
plot3