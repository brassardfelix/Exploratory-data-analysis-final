combustion.coal <- grepl("Fuel Comb.*Coal", SCC$EI.Sector)
combustion.coal.sources <- SCC[combustion.coal,]
emissions.coal.combustion <- NEI[(NEI$SCC %in% combustion.coal.sources$SCC), ]
coal.emissions <- summarise(group_by(emissions.coal.combustion, year), Emissions=sum(Emissions))
plot4 <- ggplot(coal.emissions, aes(x= factor(year), y= Emissions/1000, fill= year, label= round(Emissions,2)))+
  + geom_bar(stat = "identity")+
  + xlab("year")+
  + ylab(expression("total PM"[2.5]*" emissions in kilotons"))+
  + ggtitle("Emissions from coal combustion-related sources in kilotons")+
  + geom_label(aes(fill = year),colour = "white", fontface = "bold")
plot4