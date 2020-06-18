install.packages(c("tidyverse", "RSQLite"))
dir.create("data_raw")
dir.create("fig")
dir.create("data")
download.file(url="https://ndownloader.figshare.com/files/2292169",
              destfile = "data_raw/portal_data_joined.csv")
surveys <- read.csv("data_raw/portal_data_joined.csv")
head(surveys)
View(surveys)
str(surveys)
surveys_200 <- surveys[200, ]
n_rows <- nrow(surveys)
surveys_last <- surveys[n_rows, ]
surveys_middle <- surveys[n_rows / 2, ]
surveys_head <- surveys[-(7:n_rows), ]
sex <- factor(c("male", "female", "female", "male"))
levels(sex)
nlevels(sex)
sex # current order
sex <- factor(sex, levels = c("male", "female"))
sex # after re-ordering
as.character(sex)
year_fct <- factor(c(1990, 1983, 1977, 1998, 1990))
as.numeric(levels(year_fct))[year_fct]
plot(surveys$sex)
