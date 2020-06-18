#============================================================================#
# my-practice.R
#
#============================================================================#


ddfm <- read.csv("./data/ddfm.csv")

head(ddfm, 3)
# Station       Date Air.min Air.max Degree.days Accumulated.DD X. X..1
# 1 TRNQULTY.A 01/01/2019      29      53        0.00           0.00        
# 2 TRNQULTY.A 01/02/2019      23      58        0.38           0.38        
# 3 TRNQULTY.A 01/03/2019      25      58        0.39           0.76  

tail(ddfm, 3)
# Station       Date Air.min Air.max Degree.days Accumulated.DD X. X..1
# 363 TRNQULTY.A 12/29/2019      38      54           0        4237.89  A    A
# 364 TRNQULTY.A 12/30/2019      39      54           0        4237.89  A    A
# 365 TRNQULTY.A 12/31/2019      39      54           0        4237.89  A    A

