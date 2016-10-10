## Dealing with missing values

## 1. Find missing values and fill them with value, S
embarked <- titanic_original$embarked
i <- 1
while(i <= 1310){
  if(embarked[i] == "") {
    embarked[i] <- "S"
  }
  i <- i + 1
}

## 2. Calculate mean of Age column and use that value to populate the missing values
age <- titanic_original$age
j <- 1
while(j <= 1310) {
  if(is.na(age[j]) == TRUE) {
    age[j] <- round(mean(titanic_original$age, na.rm = TRUE))
  }
  j <- j + 1
}

## 3. Fill empty slots in boat variable with 'None'
boat <- titanic_original$boat
k <- 1
while(k <= 1310) {
  if(boat[k] == "") {
    boat[k] <- NA
  }
  k <- k + 1
}

## 4. Create variable has_cabin_number that has a value of 1 if there is a cabin number for passenger and 0 if there isn't. 
has_cabin_number <- 1:1310
l <- 1
while(l <= 1310) {
  if(titanic_original$cabin[l] == "") {
    has_cabin_number[l] <- 0
  }
  else{has_cabin_number[l] <- 1}
  l <- l + 1
}

## Assign edited version of data frame to titanic_refine
titanic_clean <- titanic_original
titanic_clean$embarked <- embarked
titanic_clean$age <- age
titanic_clean$boat <- boat
titanic_clean <- titanic_clean %>%
  mutate(has_cabin_number)
  
