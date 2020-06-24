
# lubridate.R


library(lubridate)

ddfm <- read.csv("./data/ddfm.csv")
head(ddfm)
ddfm[ ,1:6]
ddfm <- ddfm[ ,1:6]
head(ddfm)

ddfm$Date <- as.Date(mdy(ddfm$Date))
head(ddfm)
