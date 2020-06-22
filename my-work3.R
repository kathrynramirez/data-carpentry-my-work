#===========================================================================#
# my-work3.R

#===========================================================================#


#intro to R

# challenge: intro to R
# Using this vector of heights in inches, create a new vector, heights_no_na,
# with the NAs removed.
# heights <- c(63, 69, 60, 65, NA, 68, 61, 70, 61, 59, 64, 69, 63, 63, NA, 72, 
# 65, 64, 70, 63, 65)

heights <- c(63, 69, 60, 65, NA, 68, 61, 70, 61, 59, 64, 69, 63, 63, NA, 72, 65, 64, 70, 63, 65)
heights_no_na <- na.omit(heights)
median(heights)
median(heights_no_na)
median(heights, na.rm = TRUE)
heights_above_67 <- heights_no_na[heights_no_na > 67]
length(heights_above_67)


#===========================================================================#


# starting with data

# data already dowloaded via: download.file(url = "https://ndownloader.figshare.com/files/2292169",
# destfile = "data_raw/portal_data_joined.csv")


practicedata <- read.csv("./data_raw/portal_data_joined.csv")

head(practicedata, 3)
# record_id month day year plot_id species_id sex hindfoot_length weight   genus  species   taxa
# 1         1     7  16 1977       2         NL   M              32     NA Neotoma albigula Rodent
# 2        72     8  19 1977       2         NL   M              31     NA Neotoma albigula Rodent
# 3       224     9  13 1977       2         NL                  NA     NA Neotoma albigula Rodent
# plot_type
# 1   Control
# 2   Control
# 3   Control


tail(practicedata, 3)
# record_id month day year plot_id species_id sex hindfoot_length weight       genus  species   taxa
# 34784     27792     5   2 1998       7         PL   F              20      8  Peromyscus leucopus Rodent
# 34785     28806    11  21 1998       7         PX                  NA     NA Chaetodipus      sp. Rodent
# 34786     30986     7   1 2000       7         PX                  NA     NA Chaetodipus      sp. Rodent
# plot_type
# 34784 Rodent Exclosure
# 34785 Rodent Exclosure
# 34786 Rodent Exclosure

# dim(surveys) - returns a vector with the number of rows in the first element, 
# and the number of columns as the second element (the dimensions of the object)
dim(practicedata)
# [1] 34786    13

# nrow(surveys) - returns the number of rows
nrow(practicedata)
# [1] 34786
# ncol(surveys) - returns the number of columns
ncol(practicedata)
# [1] 13

# names(surveys) - returns the column names (synonym of colnames() for data.frame objects)
names(practicedata)
# [1] "record_id"       "month"           "day"             "year"            "plot_id"        
# [6] "species_id"      "sex"             "hindfoot_length" "weight"          "genus"          
# [11] "species"         "taxa"            "plot_type"    

# rownames(surveys) - returns the row names
rownames(practicedata)
# max info

# str(surveys) - structure of the object and information about the class, 
# length and content of each column
str(practicedata)
#'data.frame':	34786 obs. of  13 variables:
# record_id      : int  1 72 224 266 349 363 435 506 588 661 ...
# month          : int  7 8 9 10 11 11 12 1 2 3 ...
# day            : int  16 19 13 16 12 12 10 8 18 11 ...
# year           : int  1977 1977 1977 1977 1977 1977 1977 1978 1978 1978 ...
# plot_id        : int  2 2 2 2 2 2 2 2 2 2 ...
# species_id     : chr  "NL" "NL" "NL" "NL" ...
# sex            : chr  "M" "M" "" "" ...
# hindfoot_length: int  32 31 NA NA NA NA NA NA NA NA ...
# weight         : int  NA NA NA NA NA NA NA NA 218 NA ...
# genus          : chr  "Neotoma" "Neotoma" "Neotoma" "Neotoma" ...
# species        : chr  "albigula" "albigula" "albigula" "albigula" ...
# taxa           : chr  "Rodent" "Rodent" "Rodent" "Rodent" ...
# plot_type      : chr  "Control" "Control" "Control" "Control" ...

# summary(surveys) - summary statistics for each column
summary(practicedata)
# record_id         month             day            year         plot_id       species_id       
# Min.   :    1   Min.   : 1.000   Min.   : 1.0   Min.   :1977   Min.   : 1.00   Length:34786      
# 1st Qu.: 8964   1st Qu.: 4.000   1st Qu.: 9.0   1st Qu.:1984   1st Qu.: 5.00   Class :character  
# Median :17762   Median : 6.000   Median :16.0   Median :1990   Median :11.00   Mode  :character  
# Mean   :17804   Mean   : 6.474   Mean   :16.1   Mean   :1990   Mean   :11.34                     
# 3rd Qu.:26655   3rd Qu.:10.000   3rd Qu.:23.0   3rd Qu.:1997   3rd Qu.:17.00                     
# Max.   :35548   Max.   :12.000   Max.   :31.0   Max.   :2002   Max.   :24.00                     

# sex            hindfoot_length     weight          genus             species         
# Length:34786       Min.   : 2.00   Min.   :  4.00   Length:34786       Length:34786      
# Class :character   1st Qu.:21.00   1st Qu.: 20.00   Class :character   Class :character  
# Mode  :character   Median :32.00   Median : 37.00   Mode  :character   Mode  :character  
# Mean   :29.29   Mean   : 42.67                                        
# 3rd Qu.:36.00   3rd Qu.: 48.00                                        
# Max.   :70.00   Max.   :280.00                                        
# NA's   :3348    NA's   :2503                                          
# taxa            plot_type        
# Length:34786       Length:34786      
# Class :character   Class :character  
# Mode  :character   Mode  :character 


# challenge: starting with data
# Based on the output of str(surveys), can you answer the following questions?

# 1. What is the class of the object surveys?
#     data.frame
# 2. How many rows and how many columns are in this object?
#     34,786 rows and 13 columns
# 3. How many species have been recorded during these surveys?
#     48 species (??????)


# challenge: starting with data

# Create a data.frame (surveys_200) containing only the data in row 
# 200 of the surveys dataset
practicedata_200 <- practicedata[200, ]

# Notice how nrow() gave you the number of rows in a data.frame?
# Use that number to pull out just that last row in the data frame.
# Compare that with what you see as the last row using tail() to 
# make sure it’s meeting expectations.
# Pull out that last row using nrow() instead of the row number.
# Create a new data frame (surveys_last) from that last row.
n_rows <- nrow(practicedata)
practicedata_last <- practicedata[n_rows, ]

# Use nrow() to extract the row that is in the middle of the data frame. 
# Store the content of this row in an object named surveys_middle.
practicedata_middle <- practicedata[n_rows / 2, ]

# Combine nrow() with the - notation above to reproduce the behavior of 
# head(surveys), keeping just the first through 6th rows of the surveys dataset.
practicedata_head <- practicedata[-(7:n_rows), ]


#===========================================================================#


# factors...


# Factors represent categorical data. They are stored as integers associated 
# with labels and they can be ordered or unordered. While factors look 
# (and often behave) like character vectors, they are actually treated as 
# integer vectors by R.

# Once created, factors can only contain a pre-defined set of values, known 
# as levels. By default, R always sorts levels in alphabetical order. 
# For instance, if you have a factor with 2 levels: 

sex <- factor(c("male", "female", "female", "male"))

# R will assign 1 to the level "female" and 2 to the level "male"
# (because f comes before m, even though the first element in this vector 
# is "male"). You can see this by using the function levels() and you can 
# find the number of levels using nlevels():

levels(sex)
# [1] "female" "male"
nlevels(sex)
# [1] 2


# re-order levels

sex #current order
# [1] male   female female male  
# Levels: female male

sex <- factor(sex, levels = c("male", "female"))
sex #after re-ordering
# [1] male   female female male  
# Levels: male female



# converting factors
# as.character(x) converts a factor to a character vector
as.character(sex)
#[1] "male"   "female" "female" "male"

# In some cases, you may have to convert factors where the levels appear 
# as numbers (such as concentration levels or years) to a numeric vector.
# For instance, in one part of your analysis the years might need to be 
# encoded as factors (e.g., comparing average weights across years) but 
# in another part of your analysis they may need to be stored as numeric 
# values (e.g., doing math operations on the years). This conversion from 
# factor to numeric is a little trickier. The as.numeric() function returns 
# the index values of the factor, not its levels, so it will result in an 
# entirely new (and unwanted in this case) set of numbers. One method to 
# avoid this is to convert factors to characters, and then to numbers.

# Another method is to use the levels() function. Compare:

year_fct <- factor(c(1990, 1983, 1977, 1998, 1990))
as.numeric(year_fct) # wrong, there is no warning
# [1] 3 2 1 4 3
as.numeric(as.character(year_fct)) # works
# [1] 1990 1983 1977 1998 1990
as.numeric(levels(year_fct))[year_fct] # recommended
# [1] 1990 1983 1977 1998 199

plot(as.factor(practicedata$sex))
# Error in plot.new() : figure margins too large
# googled error
par("mar")
# [1] 5.1 4.1 4.1 2.1
par(mar=c(1,1,1,1))

# bar plot of the number of females and males captured during the experiment:  
plot(as.factor(practicedata$sex))
# worked since sex was renamed as a factor and not a character

sex <- factor(practicedata$sex)
head(sex)
# [1] M M        
# Levels:  F M
levels(sex)
# [1] ""  "F" "M"
levels(sex)[1] <- "undetermined"
levels(sex)
# [1] "undetermined" "F"            "M"
head(sex)
# [1] M            M            undetermined undetermined
# [5] undetermined undetermined
# Levels: undetermined F M


#challenge: Rename “F” and “M” to “female” and “male” respectively.
#Now that we have renamed the factor level to “undetermined”, 
#can you recreate the barplot such that “undetermined” is last (after “male”)?

levels(sex)[2:3] <- c("female", "male")
sex <- factor(sex, levels = c("female", "male", "undetermined"))
# attempted and did not get a plot 
par("mar")
par(mar=c(1,1,1,1))
plot(sex)
# plot does not match desired plot
levels(sex)
str(sex)
# COME BACK HERE: FIND OUT WHY PLOT LOOKS LIKE THAT

#===========================================================================#

# stringsAsFactors=FALSE

# In most cases, it is preferable to set stringsAsFactors = FALSE 
# when importing data and to convert as a factor only the columns that 
# require this data type.

# compare the difference between our data read as 'factor' vs 'character'
practicedata <- read.csv("data_raw/portal_data_joined.csv", stringsAsFactors = FALSE)
str(practicedata)
# 'data.frame':	34786 obs. of  13 variables:
#  $ record_id      : int  1 72 224 266 349 363 435 506 588 661 ...
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

practicedata <- read.csv("data_raw/portal_data_joined.csv", stringsAsFactors = TRUE)
str(practicedata)
# 'data.frame':	34786 obs. of  13 variables:
#  $ record_id      : int  1 72 224 266 349 363 435 506 588 661 ...
# $ month          : int  7 8 9 10 11 11 12 1 2 3 ...
# $ day            : int  16 19 13 16 12 12 10 8 18 11 ...
# $ year           : int  1977 1977 1977 1977 1977 1977 1977 1978 1978 1978 ...
# $ plot_id        : int  2 2 2 2 2 2 2 2 2 2 ...
# $ species_id     : Factor w/ 48 levels "AB","AH","AS",..: 16 16 16 16 16 16 16 16 16 16 ...
# $ sex            : Factor w/ 3 levels "","F","M": 3 3 1 1 1 1 1 1 3 1 ...
# $ hindfoot_length: int  32 31 NA NA NA NA NA NA NA NA ...
# $ weight         : int  NA NA NA NA NA NA NA NA 218 NA ...
# $ genus          : Factor w/ 26 levels "Ammodramus","Ammospermophilus",..: 13 13 13 13 13 13 13 13 13 13 ...
# $ species        : Factor w/ 40 levels "albigula","audubonii",..: 1 1 1 1 1 1 1 1 1 1 ...
# $ taxa           : Factor w/ 4 levels "Bird","Rabbit",..: 4 4 4 4 4 4 4 4 4 4 ...
# $ plot_type      : Factor w/ 5 levels "Control","Long-term Krat Exclosure",..: 1 1 1 1 1 1 1 1 1 1 ...

# all characters turned into factors 

# convert the column 'plot_type" into a factor
practicedata$plot_type <- factor(practicedata$plot_type)

# challenge: We have seen how data frames are created when using read.csv(),
# but they can also be created by hand with the data.frame() function.
# There are a few mistakes in this hand-crafted data.frame. 
# Can you spot and fix them? Don’t hesitate to experiment!

# animal_data <- data.frame(
#  animal = c(dog, cat, sea cucumber, sea urchin),
#  feel = c("furry", "squishy", "spiny"),
#  weight = c(45, 8 1.1, 0.8)
#)

animal_data <- data.frame(animal = c("dog", "cat", "seacucumber", "seaurchin"),feel = c("furry","furry", "squishy", "spiny"), weight = c(45, 8, 1.1, 0.8))

# Can you predict the class for each of the columns in the following example? 
# Check your guesses using str(country_climate):
#   Are they what you expected? Why? Why not?
#  What would have been different if we had added stringsAsFactors = FALSE 
#   when creating the data frame?
#  What would you need to change to ensure that each column had the accurate 
#   data type?

# country_climate <- data.frame(
#  country = c("Canada", "Panama", "South Africa", "Australia"),
#  climate = c("cold", "hot", "temperate", "hot/temperate"),
#  temperature = c(10, 30, 18, "15"),
#  northern_hemisphere = c(TRUE, TRUE, FALSE, "FALSE"),
#  has_kangaroo = c(FALSE, FALSE, FALSE, 1)
#)

country_climate <- data.frame(country = c("Canada", "Panama", "South Africa", "Australia"), climate = c("cold", "hot", "temperate", "hot/temperate"), temperature = c(10, 30, 18, 15), northern_hemisphere = c(TRUE, TRUE, FALSE, FALSE),has_kangaroo = c(FALSE, FALSE, FALSE, TRUE))
str(country_climate)
# country : character
# climate : character
# temperature : numeric 
# northern hemisphere : logical
# has_kanganroo : logical
# these make sense 
# all of the characters would become factors 

# dates 

str(practicedata)
# install from CRAN
install.packages("tidyverse")
Yes
library(tidyverse)
install.packages("RSQLite")

library("lubridate")
# ymd() takes a vector representing year, month, and day, 
# and converts it to a Date vector. Date is a class of data recognized by 
# R as being a date and can be manipulated as such. The argument that the 
# function requires is flexible, but, as a best practice, is a character 
# vector formatted as “YYYY-MM-DD”.

my_date <- ymd(paste("2015", "1", "1", sep = "-"))
str(my_date)
# Date[1:1], format: "2015-01-01"

# Create a character vector from the year, month, and day columns of surveys 
# using paste():
paste(practicedata$year, practicedata$month, practicedata$day, sep = "-")
# [1] "1977-7-16"  "1977-8-19"  "1977-9-13"  "1977-10-16" "1977-11-12" "1977-11-12" "1977-12-10"
# [8] "1978-1-8"   "1978-2-18"  "1978-3-11"  "1978-4-8"   "1978-5-6"   "1978-6-9"   "1978-8-5"  
# [15] "1978-9-4"   "1978-10-8"  "1978-11-5"  "1979-4-29"  "1979-5-30"  "1979-7-4"   "1979-10-25"
# [22] "1979-11-17" "1980-1-16"  "1980-3-9"   "1980-5-18"  "1980-5-18"  "1981-7-8"   "1981-10-1" 
# [29] "1981-11-23" "1982-1-1"   "1982-1-25"  "1982-2-24"  "1982-3-29"  "1982-3-29"  "1982-5-22" 
# [36] "1982-6-28"  "1982-6-28"  "1982-6-28"  "1982-7-25"  "1982-8-16"  "1982-8-16"  "1983-6-18" 
# [43] "1983-8-16"  "1983-9-11"  "1983-9-11"  "1983-9-11"  "1983-10-16" "1983-10-16" "1983-11-13"
# [50] "1983-11-13" "1983-12-9"  "1984-4-10"  "1984-5-13"  "1984-5-28"  "1984-7-4"   "1984-8-26" 
# [57] "1984-9-30"  "1984-10-21" "1985-7-24"  "1985-7-24"  "1985-7-24"  "1985-8-20"  "1985-10-13"
# [64] "1985-10-13" "1985-12-8"  "1986-3-9"   "1986-5-11"  "1986-5-11"  "1986-6-5"   "1986-6-5"  
# [71] "1986-7-4"   "1986-9-7"   "1986-9-7"   "1986-9-7"   "1986-10-5"  "1987-2-1"   "1987-3-2"  
# [78] "1987-4-6"   "1987-4-26"  "1987-4-26"  "1987-4-26"  "1987-5-28"  "1987-5-28"  "1987-7-1"  
# [85] "1987-7-1"   "1987-7-26"  "1987-8-26"  "1987-8-26"  "1987-9-27"  "1987-9-27"  "1987-9-27" 
# [92] "1987-10-25" "1987-10-25" "1987-11-22" "1988-1-24"  "1988-6-12"  "1988-7-15"  "1988-8-10" 
# [99] "1988-8-10"  "1988-9-12"  "1988-10-9"  "1988-12-14" "1989-3-13"  "1989-7-30"  "1990-2-25" 
# [106] "1990-9-25"  "1990-10-16" "1990-12-15" "1991-2-16"  "1991-3-13"  "1991-4-21"  "1991-5-13" 
# [113] "1991-5-13"  "1991-7-12"  "1991-8-7"   "1991-9-9"   "1991-11-13" "1992-5-30"  "1992-7-3"  
# [120] "1992-9-26"  "1992-10-18" "1993-7-14"  "1993-9-16"  "1993-9-16"  "1993-10-15" "1993-11-13"
# [127] "1993-11-13" "1993-12-14" "1994-4-10"  "1994-5-18"  "1995-6-7"   "1995-9-23"  "1995-10-28"
# [134] "1995-12-2"  "1996-10-12" "1996-11-16" "1996-11-16" "1997-3-15"  "1997-5-10"  "1997-6-9"  
# [141] "1997-7-29"  "1997-9-27"  "1997-9-27"  "1997-10-25" "1997-12-28" "1998-3-29"  "1998-5-2"  
# [148] "1998-5-28"  "1998-5-28"  "1998-5-28"  "1998-6-27"  "1998-6-27"  "1998-8-22"  "1998-9-20" 
# [155] "1998-9-20"  "1998-10-24" "1998-12-22" "1999-1-16"  "1999-3-14"  "1999-4-17"  "1999-5-15" 
# [162] "1999-9-11"  "1999-10-9"  "1999-11-6"  "1999-12-5"  "1999-12-5"  "2000-1-8"   "2000-1-8"  
# [169] "2000-1-8"   "2000-2-5"   "2000-2-5"   "2000-2-5"   "2000-3-4"   "2000-6-3"   "2000-11-25"
# [176] "2000-11-25" "2000-12-22" "2001-1-21"  "2001-1-21"  "2001-3-24"  "2001-4-21"  "2001-5-26" 
# [183] "2001-6-25"  "2001-8-25"  "2001-10-13" "2001-11-17" "2001-11-17" "2001-12-15" "2001-12-15"
# [190] "2002-1-12"  "2002-2-9"   "2002-3-13"  "2002-3-13"  "2002-4-17"  "2002-4-17"  "2002-5-15" 
# [197] "2002-6-15"  "2002-10-5"  "2002-11-9"  "2002-12-7"  "2002-12-29" "1977-7-16"  "1977-9-13" 
# [204] "1977-9-13"  "1977-10-16" "1977-10-16" "1977-10-16" "1977-10-16" "1977-10-16" "1977-11-12"
# [211] "1977-11-12" "1977-11-12" "1977-11-12" "1977-12-10" "1977-12-10" "1977-12-10" "1977-12-10"
# [218] "1977-12-10" "1978-1-8"   "1978-1-8"   "1978-1-8"   "1978-1-8"   "1978-1-8"   "1978-1-8"  
# [225] "1978-1-8"   "1978-1-8"   "1978-1-8"   "1978-2-18"  "1978-2-18"  "1978-2-18"  "1978-2-18" 
# [232] "1978-3-11"  "1978-3-11"  "1978-4-8"   "1978-4-8"   "1978-4-8"   "1978-4-8"   "1978-5-6"  
# [239] "1978-5-6"   "1978-5-6"   "1978-5-19"  "1978-5-19"  "1978-5-19"  "1978-6-9"   "1978-7-7"  
# [246] "1978-7-7"   "1978-8-5"   "1978-8-5"   "1978-9-4"   "1978-9-4"   "1978-9-4"   "1978-10-8" 
# [253] "1978-10-8"  "1978-11-5"  "1978-11-5"  "1978-12-3"  "1978-12-3"  "1978-12-3"  "1978-12-3" 
# [260] "1978-12-3"  "1979-1-29"  "1979-1-29"  "1979-2-25"  "1979-2-25"  "1979-3-31"  "1979-3-31" 
# [267] "1979-3-31"  "1979-4-29"  "1979-5-30"  "1979-5-30"  "1979-5-30"  "1979-8-23"  "1979-9-23" 
# [274] "1979-9-23"  "1979-10-25" "1979-10-25" "1979-11-17" "1979-11-17" "1980-1-16"  "1980-1-16" 
# [281] "1980-1-16"  "1980-1-16"  "1980-1-16"  "1980-2-25"  "1980-2-25"  "1980-2-25"  "1980-3-9"  
# [288] "1980-3-9"   "1980-3-9"   "1980-3-9"   "1980-3-9"   "1980-3-9"   "1980-3-9"   "1980-3-9"  
# [295] "1980-3-9"   "1980-3-9"   "1980-3-9"   "1980-3-9"   "1980-3-9"   "1980-3-9"   "1980-3-9"  
# [302] "1980-3-22"  "1980-3-22"  "1980-4-18"  "1980-4-18"  "1980-4-18"  "1980-5-18"  "1980-5-18" 
# [309] "1980-6-2"   "1980-6-2"   "1980-6-23"  "1980-6-23"  "1980-7-22"  "1980-8-14"  "1980-9-8"  
# [316] "1980-10-12" "1980-11-9"  "1980-11-9"  "1980-11-9"  "1980-12-15" "1980-12-15" "1980-12-15"
# [323] "1980-12-15" "1980-12-15" "1980-12-15" "1981-1-12"  "1981-1-12"  "1981-1-12"  "1981-1-12" 
# [330] "1981-2-1"   "1981-2-1"   "1981-2-1"   "1981-2-1"   "1981-2-1"   "1981-2-1"   "1981-3-9"  
# [337] "1981-3-9"   "1981-3-9"   "1981-3-9"   "1981-3-9"   "1981-4-6"   "1981-4-6"   "1981-4-6"  
# [344] "1981-4-6"   "1981-4-6"   "1981-4-6"   "1981-4-6"   "1981-4-6"   "1981-4-6"   "1981-4-6"  
# [351] "1981-4-6"   "1981-4-6"   "1981-5-4"   "1981-5-4"   "1981-6-4"   "1981-6-4"   "1981-7-8"  
# [358] "1981-7-30"  "1981-7-30"  "1981-10-26" "1981-11-23" "1981-11-23" "1982-1-1"   "1982-1-25" 
# [365] "1982-2-24"  "1982-6-28"  "1982-7-25"  "1982-8-16"  "1982-8-16"  "1982-8-16"  "1982-9-18" 
# [372] "1982-9-18"  "1982-9-18"  "1982-9-18"  "1982-9-18"  "1982-10-24" "1982-10-24" "1982-10-24"
# [379] "1982-10-24" "1982-10-24" "1982-10-24" "1982-10-24" "1982-10-24" "1982-11-22" "1982-11-22"
# [386] "1983-1-13"  "1983-1-13"  "1983-2-27"  "1983-2-27"  "1983-3-15"  "1983-3-15"  "1983-4-17" 
# [393] "1983-4-17"  "1983-4-17"  "1983-5-15"  "1983-5-15"  "1983-5-15"  "1983-7-17"  "1983-8-16" 
# [400] "1983-9-11"  "1983-9-11"  "1983-9-11"  "1983-10-16" "1983-11-13" "1983-11-13" "1983-12-9" 
# [407] "1984-2-5"   "1984-3-13"  "1984-3-13"  "1984-4-10"  "1984-5-13"  "1984-5-13"  "1984-5-13" 
# [414] "1984-5-13"  "1984-5-28"  "1984-8-1"   "1984-9-30"  "1984-10-21" "1984-12-31" "1984-12-31"
# [421] "1985-1-20"  "1985-1-20"  "1985-1-20"  "1985-1-20"  "1985-1-20"  "1985-2-17"  "1985-2-17" 
# [428] "1985-2-17"  "1985-2-17"  "1985-2-17"  "1985-2-17"  "1985-2-17"  "1985-3-17"  "1985-3-17" 
# [435] "1985-3-17"  "1985-4-21"  "1985-4-21"  "1985-4-21"  "1985-4-21"  "1985-4-21"  "1985-4-21" 
# [442] "1985-4-21"  "1985-5-24"  "1985-5-24"  "1985-5-24"  "1985-5-24"  "1985-5-24"  "1985-6-16" 
# [449] "1985-6-16"  "1985-6-16"  "1985-6-16"  "1985-7-24"  "1985-7-24"  "1985-7-24"  "1985-7-24" 
# [456] "1985-7-24"  "1985-7-24"  "1985-8-20"  "1985-8-20"  "1985-8-20"  "1985-9-22"  "1985-9-22" 
# [463] "1985-9-22"  "1985-10-13" "1985-10-13" "1985-10-13" "1985-11-17" "1985-11-17" "1985-11-17"
# [470] "1985-11-17" "1985-11-17" "1985-12-8"  "1985-12-8"  "1985-12-8"  "1985-12-8"  "1985-12-8" 
# [477] "1985-12-8"  "1985-12-8"  "1986-3-9"   "1986-3-9"   "1986-3-9"   "1986-3-9"   "1986-3-9"  
# [484] "1986-3-9"   "1986-4-13"  "1986-4-13"  "1986-4-13"  "1986-4-13"  "1986-4-13"  "1986-5-11" 
# [491] "1986-5-11"  "1986-5-11"  "1986-5-11"  "1986-6-5"   "1986-6-5"   "1986-6-5"   "1986-6-5"  
# [498] "1986-7-4"   "1986-7-4"   "1986-7-4"   "1986-8-10"  "1986-8-10"  "1986-8-10"  "1986-8-10" 
# [505] "1986-9-7"   "1986-9-7"   "1986-10-5"  "1986-11-16" "1986-11-16" "1986-11-16" "1986-12-15"
# [512] "1986-12-15" "1986-12-15" "1987-2-1"   "1987-2-1"   "1987-3-2"   "1987-3-2"   "1987-3-2"  
# [519] "1987-3-2"   "1987-3-2"   "1987-4-6"   "1987-4-6"   "1987-4-6"   "1987-4-26"  "1987-5-28" 
# [526] "1987-5-28"  "1987-7-1"   "1987-7-1"   "1987-7-26"  "1987-7-26"  "1987-7-26"  "1987-8-26" 
# [533] "1987-9-27"  "1987-10-25" "1987-11-22" "1987-11-22" "1987-11-22" "1988-1-24"  "1988-1-24" 
# [540] "1988-1-24"  "1988-2-22"  "1988-2-22"  "1988-2-22"  "1988-2-22"  "1988-2-22"  "1988-3-21" 
# [547] "1988-3-21"  "1988-3-21"  "1988-4-19"  "1988-5-15"  "1988-5-15"  "1988-6-12"  "1988-7-15" 
# [554] "1988-8-9"   "1988-8-10"  "1988-8-10"  "1988-9-12"  "1988-10-9"  "1989-7-4"   "1989-7-30" 
# [561] "1990-3-30"  "1990-3-30"  "1990-3-30"  "1990-10-16" "1990-10-16" "1990-11-10" "1990-12-15"
# [568] "1991-1-11"  "1991-1-11"  "1991-5-13"  "1991-6-13"  "1991-7-12"  "1991-12-7"  "1991-12-7" 
# [575] "1992-1-8"   "1992-3-7"   "1992-4-4"   "1993-5-22"  "1993-10-15" "1993-11-13" "1993-11-13"
# [582] "1993-12-14" "1993-12-14" "1993-12-14" "1994-2-1"   "1994-2-20"  "1994-3-11"  "1994-3-11" 
# [589] "1994-3-11"  "1994-4-10"  "1994-4-10"  "1994-5-18"  "1994-5-18"  "1994-8-17"  "1994-9-6"  
# [596] "1994-10-12" "1994-11-1"  "1994-12-4"  "1995-1-11"  "1995-2-4"   "1995-2-4"   "1995-3-4"  
# [603] "1995-3-4"   "1995-4-1"   "1995-4-29"  "1995-6-27"  "1995-6-27"  "1995-7-20"  "1995-8-26" 
# [610] "1995-8-26"  "1995-9-23"  "1995-10-28" "1995-10-28" "1995-10-28" "1995-10-28" "1995-10-28"
# [617] "1995-12-2"  "1995-12-2"  "1995-12-2"  "1995-12-2"  "1995-12-2"  "1995-12-21" "1995-12-21"
# [624] "1995-12-21" "1995-12-21" "1995-12-21" "1995-12-21" "1995-12-21" "1996-1-27"  "1996-1-27" 
# [631] "1996-1-27"  "1996-1-27"  "1996-1-27"  "1996-1-27"  "1996-2-24"  "1996-2-24"  "1996-2-24" 
# [638] "1996-2-24"  "1996-2-24"  "1996-2-24"  "1996-3-23"  "1996-3-23"  "1996-3-23"  "1996-3-23" 
# [645] "1996-3-23"  "1996-4-14"  "1996-4-14"  "1996-4-14"  "1996-4-14"  "1996-5-23"  "1996-5-23" 
# [652] "1996-5-23"  "1996-5-23"  "1996-5-23"  "1996-5-23"  "1996-5-23"  "1996-6-13"  "1996-6-13" 
# [659] "1996-7-20"  "1996-8-14"  "1996-8-14"  "1996-9-21"  "1996-9-21"  "1996-9-21"  "1996-9-21" 
# [666] "1996-10-12" "1996-10-12" "1996-10-12" "1996-10-12" "1996-11-16" "1996-11-16" "1996-11-16"
# [673] "1996-12-18" "1996-12-18" "1997-2-8"   "1997-2-8"   "1997-2-8"   "1997-3-15"  "1997-3-15" 
# [680] "1997-3-15"  "1997-3-15"  "1997-3-15"  "1997-3-15"  "1997-3-15"  "1997-3-15"  "1997-3-15" 
# [687] "1997-4-12"  "1997-4-12"  "1997-5-10"  "1997-6-9"   "1997-7-9"   "1997-7-29"  "1997-9-27" 
# [694] "1997-10-25" "1997-11-22" "1997-11-22" "1997-12-28" "1998-1-31"  "1998-1-31"  "1998-3-1"  
# [701] "1998-3-1"   "1998-3-29"  "1998-3-29"  "1998-3-29"  "1998-3-29"  "1998-3-29"  "1998-5-2"  
# [708] "1998-5-2"   "1998-5-2"   "1998-5-2"   "1998-5-28"  "1998-5-28"  "1998-5-28"  "1998-5-28" 
# [715] "1998-6-27"  "1998-6-27"  "1998-6-27"  "1998-7-18"  "1998-7-18"  "1998-8-22"  "1998-9-20" 
# [722] "1998-9-20"  "1998-9-20"  "1998-10-24" "1998-10-24" "1998-11-21" "1998-11-21" "1998-12-22"
# [729] "1998-12-22" "1999-1-16"  "1999-1-16"  "1999-2-20"  "1999-3-14"  "1999-3-14"  "1999-4-17" 
# [736] "1999-4-17"  "1999-5-15"  "1999-6-12"  "2000-8-25"  "2000-9-30"  "2000-11-25" "2000-12-22"
# [743] "2001-1-21"  "2001-3-3"   "2001-3-24"  "2001-3-24"  "2001-3-24"  "2001-3-24"  "2001-4-21" 
# [750] "2001-4-21"  "2001-8-25"  "2001-8-25"  "2001-9-22"  "2001-9-22"  "2001-9-22"  "2001-9-22" 
# [757] "2001-10-13" "2001-10-13" "2001-10-13" "2001-11-17" "2001-11-17" "2001-12-15" "2001-12-15"
# [764] "2002-1-12"  "2002-1-12"  "2002-2-9"   "2002-3-13"  "2002-3-13"  "2002-3-13"  "2002-4-17" 
# [771] "2002-4-17"  "2002-5-15"  "2002-6-15"  "2002-7-13"  "2002-9-8"   "2002-11-9"  "2002-11-9" 
# [778] "2002-12-7"  "2002-12-29" "1977-8-19"  "1977-12-10" "1978-1-8"   "1978-2-18"  "1978-3-11" 
# [785] "1978-3-11"  "1978-5-6"   "1978-6-9"   "1978-10-8"  "1979-9-23"  "1979-11-17" "1980-3-9"  
# [792] "1980-4-18"  "1980-4-18"  "1981-4-6"   "1982-8-16"  "1982-9-18"  "1982-11-22" "1983-4-17" 
# [799] "1993-8-19"  "1996-5-23"  "1977-7-16"  "1977-9-13"  "1977-10-16" "1978-1-8"   "1978-2-18" 
# [806] "1978-3-11"  "1978-3-11"  "1978-9-4"   "1978-9-4"   "1978-11-5"  "1979-1-29"  "1980-2-25" 
# [813] "1980-2-25"  "1981-11-23" "1981-11-23" "1981-11-23" "1982-1-1"   "1982-1-1"   "1982-1-1"  
# [820] "1982-1-1"   "1982-1-25"  "1982-1-25"  "1982-1-25"  "1982-2-24"  "1982-2-24"  "1982-2-24" 
# [827] "1982-2-24"  "1982-3-29"  "1982-3-29"  "1982-7-25"  "1982-8-16"  "1982-11-22" "1983-1-13" 
# [834] "1983-2-27"  "1983-2-27"  "1983-3-15"  "1983-4-17"  "1984-9-29"  "1984-12-31" "1984-12-31"
# [841] "1985-2-17"  "1985-2-17"  "1985-11-17" "1985-11-17" "1985-12-8"  "1986-3-9"   "1986-10-5" 
# [848] "1987-2-1"   "1987-2-1"   "1987-3-2"   "1987-4-6"   "1987-4-26"  "1987-7-1"   "1987-7-26" 
# [855] "1987-7-26"  "1987-8-26"  "1987-8-26"  "1987-9-27"  "1987-10-25" "1987-11-22" "1987-11-22"
# [862] "1987-11-22" "1987-11-22" "1988-1-24"  "1988-1-24"  "1988-1-24"  "1988-1-24"  "1988-2-22" 
# [869] "1988-3-21"  "1988-4-19"  "1988-4-19"  "1988-5-15"  "1988-6-12"  "1988-6-12"  "1988-8-10" 
# [876] "1988-8-10"  "1988-8-10"  "1988-11-6"  "1988-11-6"  "1988-11-6"  "1988-11-6"  "1988-12-14"
# [883] "1989-1-11"  "1989-3-13"  "1989-3-13"  "1989-4-1"   "1989-10-7"  "1989-11-5"  "1989-11-5" 
# [890] "1989-12-5"  "1989-12-5"  "1990-1-7"   "1990-1-30"  "1991-9-9"   "1991-12-7"  "1991-12-7" 
# [897] "1991-12-7"  "1992-1-8"   "1992-1-8"   "1992-2-6"   "1992-2-6"   "1992-2-6"   "1992-2-6"  
# [904] "1992-3-7"   "1992-3-7"   "1992-4-4"   "1992-9-26"  "1993-1-24"  "1996-1-27"  "1996-1-27" 
# [911] "1996-2-24"  "1996-2-24"  "1996-2-24"  "1996-2-24"  "1996-3-23"  "1996-3-23"  "1996-3-23" 
# [918] "1996-3-23"  "1996-4-14"  "1996-4-14"  "1996-4-14"  "1996-5-23"  "1996-5-23"  "1996-11-16"
# [925] "1996-11-16" "1997-2-8"   "1997-3-15"  "1997-3-15"  "1997-4-12"  "1997-6-9"   "1997-11-22"
# [932] "1999-1-16"  "2000-11-25" "2001-10-13" "2001-11-17" "2001-11-17" "2001-12-15" "2001-12-15"
# [939] "2002-1-12"  "2002-2-9"   "2002-5-15"  "2002-5-15"  "2002-6-15"  "2002-7-13"  "2002-12-7" 
# [946] "2002-12-7"  "1977-9-13"  "1977-10-16" "1978-2-18"  "1978-3-11"  "1978-4-8"   "1978-4-8"  
# [953] "1978-5-6"   "1978-5-19"  "1978-5-19"  "1978-6-9"   "1978-8-5"   "1978-9-4"   "1978-10-8" 
# [960] "1979-3-31"  "1979-7-25"  "1980-5-24"  "1980-5-24"  "1980-5-24"  "1980-6-2"   "1980-6-23" 
# [967] "1980-10-12" "1980-11-9"  "1980-11-9"  "1980-12-15" "1981-1-12"  "1981-2-1"   "1981-2-1"  
# [974] "1981-3-9"   "1981-3-9"   "1981-3-9"   "1981-3-9"   "1981-3-9"   "1981-4-6"   "1981-4-6"  
# [981] "1981-4-6"   "1981-4-6"   "1981-4-6"   "1981-4-6"   "1981-4-6"   "1981-4-6"   "1981-4-6"  
# [988] "1981-4-6"   "1981-5-4"   "1981-5-4"   "1981-6-4"   "1981-6-4"   "1981-7-8"   "1981-10-1" 
# [995] "1981-10-26" "1981-11-23" "1981-11-23" "1982-1-1"   "1982-1-1"   "1982-1-25" 
# [ reached getOption("max.print") -- omitted 33786 entries ] 

ymd(paste(practicedata$year, practicedata$month, practicedata$day, sep = "-"))
# Warning message:
#  129 failed to parse. 

practicedata$date <- ymd(paste(practicedata$year, practicedata$month, practicedata$day, sep = "-"))
# Warning message:
#  129 failed to parse. 
str(practicedata) # notice the new column with date
# 'data.frame':	34786 obs. of  14 variables:
#   $ record_id      : int  1 72 224 266 349 363 435 506 588 661 ...
# $ month          : int  7 8 9 10 11 11 12 1 2 3 ...
# $ day            : int  16 19 13 16 12 12 10 8 18 11 ...
# $ year           : int  1977 1977 1977 1977 1977 1977 1977 1978 1978 1978 ...
# $ plot_id        : int  2 2 2 2 2 2 2 2 2 2 ...
# $ species_id     : Factor w/ 48 levels "AB","AH","AS",..: 16 16 16 16 16 16 16 16 16 16 ...
# $ sex            : Factor w/ 3 levels "","F","M": 3 3 1 1 1 1 1 1 3 1 ...
# $ hindfoot_length: int  32 31 NA NA NA NA NA NA NA NA ...
# $ weight         : int  NA NA NA NA NA NA NA NA 218 NA ...
# $ genus          : Factor w/ 26 levels "Ammodramus","Ammospermophilus",..: 13 13 13 13 13 13 13 13 13 13 ...
# $ species        : Factor w/ 40 levels "albigula","audubonii",..: 1 1 1 1 1 1 1 1 1 1 ...
# $ taxa           : Factor w/ 4 levels "Bird","Rabbit",..: 4 4 4 4 4 4 4 4 4 4 ...
# $ plot_type      : Factor w/ 5 levels "Control","Long-term Krat Exclosure",..: 1 1 1 1 1 1 1 1 1 1 ...
# $ date           : Date, format: "1977-07-16" "1977-08-19" "1977-09-13" ...

summary(practicedata$date)
# Min.      1st Qu.       Median         Mean      3rd Qu.         Max.                NA's 
# "1977-07-16" "1984-03-12" "1990-07-22" "1990-12-15" "1997-07-29" "2002-12-31"        "129" 

# Something went wrong: some dates have missing values. Let’s investigate where
# they are coming from.

# We can use the functions we saw previously to deal with missing data to 
# identify the rows in our data frame that are failing. 
# If we combine them with what we learned about subsetting data frames earlier, 
# we can extract the columns “year,”month“,”day" from the records that have NA 
# in our new column date. We will also use head() so we don’t clutter the output:
missing_dates <- practicedata[is.na(practicedata$date), c("year", "month", "day")]

head(missing_dates)
# year month day
# 3144 2000     9  31
# 3817 2000     4  31
# 3818 2000     4  31
# 3819 2000     4  31
# 3820 2000     4  31
# 3856 2000     9  31

#===========================================================================#

# Manipulating and analyzing data with dplyr

# load the tidyverse packages, incl. dplyr
library("tidyverse")

practicedata <- read_csv("data_raw/portal_data_joined.csv")
# Parsed with column specification:
#  cols(
#    record_id = col_double(),
#    month = col_double(),
#    day = col_double(),
#    year = col_double(),
#    plot_id = col_double(),
#    species_id = col_character(),
#    sex = col_character(),
#    hindfoot_length = col_double(),
#    weight = col_double(),
#    genus = col_character(),
#    species = col_character(),
#    taxa = col_character(),
#    plot_type = col_character()
#  )

# You will see the message Parsed with column specification, followed by each column name and 
# its data type. When you execute read_csv on a data file, it looks through the first 1000 rows 
# of each column and guesses the data type for each column as it reads it into R. For example, 
# in this dataset, read_csv reads weight as col_double (a numeric data type), and species as col_character.
# You have the option to specify the data type for a column manually by using the col_types argument in read_csv.

# inspect the data
# str(practicedata)'

# tibble [34,786 × 13] (S3: spec_tbl_df/tbl_df/tbl/data.frame)
#  $ record_id      : num [1:34786] 1 72 224 266 349 363 435 506 588 661 ...
#  $ month          : num [1:34786] 7 8 9 10 11 11 12 1 2 3 ...
#  $ day            : num [1:34786] 16 19 13 16 12 12 10 8 18 11 ...
#  $ year           : num [1:34786] 1977 1977 1977 1977 1977 ...
#  $ plot_id        : num [1:34786] 2 2 2 2 2 2 2 2 2 2 ...
#  $ species_id     : chr [1:34786] "NL" "NL" "NL" "NL" ...
#  $ sex            : chr [1:34786] "M" "M" NA NA ...
#  $ hindfoot_length: num [1:34786] 32 31 NA NA NA NA NA NA NA NA ...
#  $ weight         : num [1:34786] NA NA NA NA NA NA NA NA 218 NA ...
#  $ genus          : chr [1:34786] "Neotoma" "Neotoma" "Neotoma" "Neotoma" ...
#  $ species        : chr [1:34786] "albigula" "albigula" "albigula" "albigula" ...
#  $ taxa           : chr [1:34786] "Rodent" "Rodent" "Rodent" "Rodent" ...
#  $ plot_type      : chr [1:34786] "Control" "Control" "Control" "Control" ...
#  - attr(*, "spec")=
#   .. cols(
#   ..   record_id = col_double(),
#   ..   month = col_double(),
#   ..   day = col_double(),
#   ..   year = col_double(),
#   ..   plot_id = col_double(),
#   ..   species_id = col_character(),
#   ..   sex = col_character(),
#   ..   hindfoot_length = col_double(),
#   ..   weight = col_double(),
#   ..   genus = col_character(),
#   ..   species = col_character(),
#   ..   taxa = col_character(),
#   ..   plot_type = col_character()
#   .. )

# preview the data
view(practicedata)

# Notice that the class of the data is now tbl_df

# This is referred to as a “tibble”. 
# Tibbles tweak some of the behaviors of the data frame objects we introduced in the previous episode. 
# The data structure is very similar to a data frame. For our purposes the only differences are that:
  
# In addition to displaying the data type of each column under its name, 
#  it only prints the first few rows of data and only as many columns as fit on one screen.
#  Columns of class character are never converted into factors.

# dplyr
select(practicedata, plot_id, species_id, weight)
# A tibble: 34,786 x 3
# plot_id species_id weight
# <dbl> <chr>       <dbl>
#   1       2 NL             NA
#   2       2 NL             NA
#   3       2 NL             NA
#   4       2 NL             NA
#   5       2 NL             NA
#   6       2 NL             NA
#   7       2 NL             NA
#   8       2 NL             NA
#   9       2 NL            218
#  10       2 NL             NA
# … with 34,776 more rows

# To select all columns except certain ones, put a “-” in front of the variable to exclude it.

select(practicedata, -record_id, -species_id)
# A tibble: 34,786 x 11
#  month   day  year plot_id sex   hindfoot_length weight genus   species  taxa   plot_type
#  <dbl> <dbl> <dbl>   <dbl> <chr>           <dbl>  <dbl> <chr>   <chr>    <chr>  <chr>    
#   1     7    16  1977       2 M                  32     NA Neotoma albigula Rodent Control  
#   2     8    19  1977       2 M                  31     NA Neotoma albigula Rodent Control  
#   3     9    13  1977       2 NA                 NA     NA Neotoma albigula Rodent Control  
#   4    10    16  1977       2 NA                 NA     NA Neotoma albigula Rodent Control  
#   5    11    12  1977       2 NA                 NA     NA Neotoma albigula Rodent Control  
#   6    11    12  1977       2 NA                 NA     NA Neotoma albigula Rodent Control  
#   7    12    10  1977       2 NA                 NA     NA Neotoma albigula Rodent Control  
#   8     1     8  1978       2 NA                 NA     NA Neotoma albigula Rodent Control  
#   9     2    18  1978       2 M                  NA    218 Neotoma albigula Rodent Control  
#  10     3    11  1978       2 NA                 NA     NA Neotoma albigula Rodent Control  
# … with 34,776 more rows

# This will select all the variables in surveys except record_id and species_id.

# To choose rows based on a specific criterion, use filter():
filter(practicedata, year == 1995)
# A tibble: 1,180 x 13
# record_id month   day  year plot_id species_id sex   hindfoot_length weight genus     species  taxa   plot_type
# <dbl> <dbl> <dbl> <dbl>   <dbl> <chr>      <chr>           <dbl>  <dbl> <chr>     <chr>    <chr>  <chr>    
#  1     22314     6     7  1995       2 NL         M                  34     NA Neotoma   albigula Rodent Control  
#  2     22728     9    23  1995       2 NL         F                  32    165 Neotoma   albigula Rodent Control  
#  3     22899    10    28  1995       2 NL         F                  32    171 Neotoma   albigula Rodent Control  
#  4     23032    12     2  1995       2 NL         F                  33     NA Neotoma   albigula Rodent Control  
#  5     22003     1    11  1995       2 DM         M                  37     41 Dipodomys merriami Rodent Control  
#  6     22042     2     4  1995       2 DM         F                  36     45 Dipodomys merriami Rodent Control  
#  7     22044     2     4  1995       2 DM         M                  37     46 Dipodomys merriami Rodent Control  
#  8     22105     3     4  1995       2 DM         F                  37     49 Dipodomys merriami Rodent Control  
#  9     22109     3     4  1995       2 DM         M                  37     46 Dipodomys merriami Rodent Control  
# 10     22168     4     1  1995       2 DM         M                  36     48 Dipodomys merriami Rodent Control  
# … with 1,170 more rows








