
library(maps)

load("data/Dunkin.Rda")
dir.create("graph/", showWarnings = FALSE)


png('graph/plot.png')

map('state', region = c('mass' , 'rhode island', "con", "new Hamp", "vermont", "maine"))



points(data_dd$long, data_dd$lat, pch=19, cex=.5, col="red")
dev.off()

