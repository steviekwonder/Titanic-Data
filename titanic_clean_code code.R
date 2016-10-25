## Dealing with missing values

titanic_original <- read.csv("~/Desktop/GRE Vocab Data Analytics/titanic_original.csv")

## 1. Find missing values and fill them with value, S
embarked <- titanic_original$embarked
embarked[embarked == ""] <- "S"

## 2. Calculate mean of Age column and use that value to populate the missing values
age <- titanic_original$age
age[is.na(age) == TRUE] <- round(mean(titanic_original$age, na.rm = TRUE))


## 3. Fill empty slots in boat variable with 'None'
boat <- titanic_original$boat
boat[boat == ""] <- NA

## 4. Create variable has_cabin_number that has a value of 1 if there is a cabin number for passenger and 0 if there isn't. 

has_cabin_number <- titanic_original$cabin
has_cabin_number <- sub("[ABCDEFGHIJKLMNOPQRSTUVWXYZ].*[[:digit:]]+", 1, has_cabin_number)
has_cabin_number <- sub("[ABCDEFGHIJKLMNOPQRSTUVWXYZ]", 1, has_cabin_number)
has_cabin_number[has_cabin_number != 1] <- 0

## Assign edited version of data frame to titanic_refine
titanic_clean <- titanic_original
titanic_clean$embarked <- embarked
titanic_clean$age <- age
titanic_clean$boat <- boat
titanic_clean <- titanic_clean %>%
  mutate(has_cabin_number)
  
