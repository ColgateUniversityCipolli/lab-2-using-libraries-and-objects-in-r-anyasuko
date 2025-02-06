#LAB 3
###################################################
# Lab Coding task: Compile Data from Essentia
###################################################
#step 0
install.packages("stringr")
library(stringr)

install.packages("jsonlite")
library(jsonlite)

######step 1
#step 1 part 1
current.filename <- "The Front Bottoms-Talon of the Hawk-Au Revoir (Adios).json"
artist <- str_split(current.filename, "-")[[1]][1]
track <-str_split(current.filename, "-")[[1]][2]
filename <-str_sub(str_split(current.filename, "-")[[1]][3],,-6)

#step 1 part 2



