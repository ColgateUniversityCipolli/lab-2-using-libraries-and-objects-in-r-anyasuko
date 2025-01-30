#task 1 step 1
install.packages("stringr")
library(stringr)

#task 1 step 2
(all.directories <- list.dirs(path="Music", recursive=TRUE))

#task 1 step 3
(num.slashes <- str_count(all.directories, "/"))
(album.directories <- all.directories[num.slashes==2])

#task 1 step 3
#for (i in 1:length(album.directories)){
i=1
  #Find the command required to list all the files in a specific directory and use it to find all files in the current album subdirectory.
  (files.in.directory <- list.files(album.directories[i]))
  #Use the str count() function to count the number of times .WAV occurs in each file. Use this count to subset all .WAV files from the current album subdirectory from the vector of all files in step (a).
  (num.WAV.occurences <- str_count(files.in.directory, ".wav"))
  all.subdirectories <- #????????????????????????????????????????????????
  #Create an empty vector called code.to.process. We will fill this by completing the following for each track in the current album subdirectory.
  code.to.process <- c()
  for (j in 1:length(all.subdirectories)){
    #Create an object containing the track file location using the paste() function to paste the current album subdirectory and the current track title together. Add a quotation mark to the beginning and end, and make sure you are careful about spaces.
  }
#}