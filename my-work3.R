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



  



