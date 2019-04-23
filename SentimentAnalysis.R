# load in the libraries we'll need
library(tidyverse)
install.packages("tidytext")
library(tidytext)
library(glue)
library(stringr)

# get a list of the files in the input directory
files <- list.files("../input")

# stick together the path to the file & 1st file name
fileName <- glue("../input/", files[1], sep = "")
# get rid of any sneaky trailing spaces
fileName <- trimws(fileName)

# read in the new file
fileText <- glue(read_file(fileName))
# remove any dollar signs (they're special characters in R)
fileText <- gsub("\\$", "", fileText) 

# tokenize
tokens <- data_frame(text = fileText)%>% unnest_tokens(word, text)

