baltemissions.onroad<-NEI[(NEI$fips=="24510") & (NEI$type=="ON-ROAD"),]
baltemissions.onroad <- summarise(group_by(baltemissions.onroad, year), Emissions=sum(Emissions))
plot5 <- ggplot(baltemissions.onroad, aes(x= factor(year), y= Emissions, fill= year, label= round(Emissions, 2)))+
  + geom_bar(stat = "identity")+
  + xlab("year")+
  + ylab(expression("total PM"[2.5]*" emissions in kilotons"))+
  + ggtitle("Emissions from coal motor vehicles sources in Baltimore")+
  + geom_label(aes(fill = year),colour = "white", fontface = "bold")
plot5