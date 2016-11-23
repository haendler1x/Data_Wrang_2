#add missing points of embarkation
titanic$embarked <- as.character(titanic$embarked)
for(i in 1:nrow(titanic)){
  if (identical(titanic$embarked[i], "") == TRUE){
    titanic$embarked[i] <- "S"
  }else{
    titanic$embarked[i] <- titanic$embarked[i]
  }
}

#replace missing ages with mean age
mean_age <- mean(titanic$age, na.rm = TRUE)
titanic$age <- as.numeric(titanic$age)
for(i in 1:nrow(titanic)){
  if (is.na(titanic$age[i]) == TRUE){
    titanic$age[i] <- mean_age
  }else{
    titanic$age[i] <- titanic$age[i]
  }
}

#life boat: fill missing values with NA
titanic$boat <- as.character(titanic$boat)
for(i in 1:nrow(titanic)){
  if (identical(titanic$boat[i], "") == TRUE){
    titanic$boat[i] <- NA
  }else{
    titanic$boat[i] <- titanic$boat[i]
  }
}

#Cabin: add dummy columns and values to show if the passenger had a cabin number assigned 
#new column: has_cabin_number

titanic$cabin <- as.character(titanic$cabin)
for(i in 1:nrow(titanic)){
  if (identical(titanic$cabin[i], "") == TRUE){
    titanic$cabin[i] <- NA
  }else{
    titanic$cabin[i] <- titanic$cabin[i]
  }
}


titanic$has_cabin_number <- c()
 for(i in 1:nrow(titanic)){
   if (is.na(titanic$cabin[i]) == TRUE){
     titanic$has_cabin_number[i] <- "0"
   }else{
     titanic$has_cabin_number[i] <- "1"
   }
 }
 
#write output to csv
write.csv(titanic, file = "titanic_clean.csv")


