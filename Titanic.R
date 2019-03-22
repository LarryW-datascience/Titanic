library(dplyr)
library(tidyr)

#load file into memory
titanic_data <- tbl_df(read.csv("titanic_original.csv"))

#Replace missing/empty strings with "S"
titanic_data <- titanic_data %>%
  mutate(embarked = replace(embarked, embarked == "", "S"))

#Calculate mean of age
mean_age = mean(titanic_data$age, na.rm = TRUE)

#replace missing age values with mean age
#Note:  Would have been possible to use median/mode age
#Also could choose nonsensical values like 999 to show age missing
#If we assume that unavailable ages have nothing to do with actual age
#Using mean age can help us gain additional data for predictive modeling
titanic_data <- titanic_data %>% 
  mutate(age = replace(age, is.na(age), mean_age))