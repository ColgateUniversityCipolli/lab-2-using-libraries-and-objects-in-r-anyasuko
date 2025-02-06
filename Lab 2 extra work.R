############################
#Task 1
############################

#task 1 step 1
#install.packages("stringr")
library(stringr)

#task 1 step 2
(all.directories <- list.dirs(path="Music", recursive=TRUE))

#task 1 step 3
(num.slashes <- str_count(all.directories, "/"))
(album.directories <- all.directories[num.slashes==2])

code.to.process <- c()
#task 1 step 3
for (i in 1:length(album.directories)){
  #Find the command required to list all the files in a specific directory and use it to find all files in the current album subdirectory.
  (files.in.directory <- list.files(album.directories[i]))
  #Use the str count() function to count the number of times .WAV occurs in each file. Use this count to subset all .WAV files from the current album subdirectory from the vector of all files in step (a).
  noises.in.file <- files.in.directory[str_count(files.in.directory, ".wav")==1]
  (noises.in.file)
  #Create an empty vector called code.to.process. We will fill this by completing the following for each track in the current album subdirectory.
  for (j in 1:length(noises.in.file)){
    #Create an object containing the track file location using the paste() function to paste the current album subdirectory and the current track title together. Add a quotation mark to the beginning and end, and make sure you are careful about spaces.
    (file <- noises.in.file[j])
    (track.file.location <- paste0('"',album.directories[i],"/",file,'"'))
    #Create an object containing the current track’s filename. Use str sub() to remove the .WAV at the end of the current track. Next, use the naming convention of files to extract just the track name using str split().
    (file.name <- str_sub(file,end=-5))
    track.split <- str_split(file.name,"-", simplify = T)
    (track.name = track.split[3])
    #Create an object containing the desired output file. We would like it to be [artist name]-[album name]-[track name].json.
    (artist.name <- track.split[2])
    album.split <- str_split(album.directories[1],"/", simplify=T)
    (album.name <- album.split[3])
    output.file <- paste0('"',artist.name,"-",album.name,"-",track.name,".json",'"')
    #Use the paste() function to paste "streaming_extractor_music.exe", the track file, and the desired output filename together to create the command line prompt for the current track. Save the result to the code.to.process vector.
    command.line = paste("streaming_extractor_music.exe",track.file.location, output.file)
    (code.to.process <- c(code.to.process,command.line))
    }
}
(code.to.process)
#step 4: Use the writeLines() function to write the code.to.process vector to a.txt file called batfile.txt.
writeLines(code.to.process, "batfile.txt")


###################################
#Task 2- Processing JSON output.         **The Front Bottoms-Talon Of The Hawk-Au Revoir (Adios).json**
###################################
str <- "The Front Bottoms-Talon Of The Hawk-Au Revoir (Adios).json"
#Task 2 step 0: Install jsonlite package for R (Ooms, 2014)
#install.packages("jsonlite")
library(jsonlite)

(code.to.process)
#Task 2 Step 1: Use the str split() function to extract the artist, album, and track from the file name. Note that while you can do this manually for one file, we will want to automate this process for all files later.
(split <- c(str_split(str, "-")))
artist <- split[[1]][1]
album <- split[[1]][2]
track<- str_sub(split[[1]][3], ,-6)

#Task 2 Step 2:  Load the JSON file into R using the fromJSON() function. The resulting object is a very large list.
json.data <- fromJSON("The Front Bottoms-Talon Of The Hawk-Au Revoir (Adios).json")

#Task 2 Step 3: Extract the average loudness, the mean of spectral energy, danceability, bpm (tempo in beats per minute), key key (musical key), key scale (musical mode), length (duration in seconds).
average.loudness <- json.data$lowlevel$average_loudness
mean.spectral.energy <- json.data$lowlevel$spectral_energy[1]
danceability <- json.data$rhythm$danceability
bpm <- json.data$rhythym$bpm
key <- json.data$tonal$key_key
scale <- json.data$tonal$key_scale
length <- json.data$metadata$audio_properties$length
                  



