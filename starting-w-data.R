# starting-w-data.R

### download data to machine memory
download.file(url="https://ndownloader.figshare.com/files/2292169",
              destfile = "data_raw/portal_data_joined.csv")

### load data into a csv file
surveys <- read.csv("data_raw/portal_data_joined.csv")

head(surveys)
# record_id month day year plot_id species_id sex hindfoot_length weight   genus  species   taxa plot_type
# 1         1     7  16 1977       2         NL   M              32     NA Neotoma albigula Rodent   Control
# 2        72     8  19 1977       2         NL   M              31     NA Neotoma albigula Rodent   Control
# 3       224     9  13 1977       2         NL                  NA     NA Neotoma albigula Rodent   Control
# 4       266    10  16 1977       2         NL                  NA     NA Neotoma albigula Rodent   Control
# 5       349    11  12 1977       2         NL                  NA     NA Neotoma albigula Rodent   Control
# 6       363    11  12 1977       2         NL                  NA     NA Neotoma albigula Rodent   Control

View(surveys)

### Inspecting data frame objects
str(surveys)
# 'data.frame':	34786 obs. of  13 variables:
# $ record_id      : int  1 72 224 266 349 363 435 506 588 661 ...
# $ month          : int  7 8 9 10 11 11 12 1 2 3 ...
# $ day            : int  16 19 13 16 12 12 10 8 18 11 ...
# $ year           : int  1977 1977 1977 1977 1977 1977 1977 1978 1978 1978 ...
# $ plot_id        : int  2 2 2 2 2 2 2 2 2 2 ...
# $ species_id     : chr  "NL" "NL" "NL" "NL" ...
# $ sex            : chr  "M" "M" "" "" ...
# $ hindfoot_length: int  32 31 NA NA NA NA NA NA NA NA ...
# $ weight         : int  NA NA NA NA NA NA NA NA 218 NA ...
# $ genus          : chr  "Neotoma" "Neotoma" "Neotoma" "Neotoma" ...
# $ species        : chr  "albigula" "albigula" "albigula" "albigula" ...
# $ taxa           : chr  "Rodent" "Rodent" "Rodent" "Rodent" ...
# $ plot_type      : chr  "Control" "Control" "Control" "Control" ...

dim(surveys)
# [1] 34786    13
nrow(surveys)
# [1] 34786

### Skipping forward, factors
sex <- factor(c("male", "female", "female", "male"))
sex
# [1] male   female female male  
# Levels: female male

### ordering the levels
sex <- factor(sex, levels = c("male", "female"))
sex # after re-ordering


year_fct <- factor(c(1990, 1983, 1977, 1998, 1990))
as.numeric(year_fct)               # Wrong! And there is no warning...
as.numeric(as.character(year_fct)) # Works...
as.numeric(levels(year_fct))[year_fct]    # The recommended way.

## bar plot of the number of females and males captured during the experiment:
plot(surveys$sex)
# Error in plot.window(...) : need finite 'ylim' values
# In addition: Warning messages:
# 1: In xy.coords(x, y, xlabel, ylabel, log) : NAs introduced by coercion
# 2: In min(x) : no non-missing arguments to min; returning Inf
# 3: In max(x) : no non-missing arguments to max; returning -Inf

# Because this is a character and not a factor?

unique(surveys$sex)
# [1] "M" ""  "F"
surveys$sex <- factor(surveys$sex)
levels(surveys$sex)

surveys$sex <- factor(surveys$sex, levels = c(""))
# [1] ""  "F" "M"

plot(surveys$sex)
sex <- surveys$sex
head(sex)
levels(sex)
levels(sex)[1] <- "undetermined"
levels(sex)
head(sex)
levels(sex)[2:3] <- c("female", "male")
sex <- factor(sex, levels = c("female", "male", "undetermined"))
                
plot(sex)              


surveys <- read.csv("data_raw/portal_data_joined.csv", stringsAsFactors = TRUE)              
str(surveys)
surveys <- read.csv("data_raw/portal_data_joined.csv", stringsAsFactors = FALSE)
str(surveys)

str(surveys)
library(lubridate)
my_date <- ymd("215-01-01")
str(my_date)
install.packages(c("tidyverse", "RSQLite"))
library(lubridate)
my_date <- ymd("2015-01-01")
str(my_date)
# sep indicates the character to use to separate each componenet
my_date <- ymd(paste("2015", "1", "1", sep = "-"))
str(my_date)
paste(surveys$year, surveys$month, surveys$day, sep = "-")
ymd(paste(surveys$year, surveys$month, surveys$day, sep = "-"))

surveys$date <- ymd(paste(surveys$year, surveys$month, surveys$day, sep = "-"))
summary(surveys$date)
missing_dates <- surveys[is.na(surveys$date), c("year", "month", "day")]
head(missing_dates)
## load the tidyverse packages, incl. dplyr
library(tidyverse)
surveys <- read_csv("data_raw/portal_data_joined.csv")
## inspect the data

str(surveys)
## preview the data
View(surveys)
select(surveys, plot_id, species_id, weight)
select(surveys, -record_id, -species_id)
filter(surveys, year ==1995)
surveys2 <- filter(surveys, weight < 5)
surveys_sml <- select(surveys2, species_id, sex, weight)
surveys_sml <- select(filter(surveys, weight < 5), species_id, sex, weight)
surveys %>% 
  filter(weight < 5) %>%
  select(species_id, sex, weight)
surveys %>%
  filter(weight < 5) %>%
  select(species_id, sex, weight)
surveys_sml <- surveys %>%
  filter(weight < 5) %>%
  select(species_id, sex, weight)

surveys_sml
