library(dplyr)

#load file into memory
titanic_data <- tbl_df(read.csv("titanic_original.csv"))

#Replace missing/empty strings with "S"
titanic_data <- titanic_data %>%
  mutate(embarked = replace(embarked, embarked == "", "S"))