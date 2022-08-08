# clear the Global Environment as we fetch data through that while rendering Rmd file
rm(list = ls())

# add necessary libraries for creating the video
library(pdftools)
library(av)
library(tuneR)
library(tidyverse)

# The root directory
rootdir <- "/Users/eng745/Naks/Naveen/Duke of Edinburgh/Coding/source codes/RStudio/07_14-03-2021"
setwd(paste0(rootdir))

# test run for generating single frame of the scene starts here
# clear the Global Environment as we fetch data through that while rendering Rmd file
# rm(list = ls())

# topic name string ... to be used in the rest of the code
topic.name <- sprintf("SharkDive")

# animation number ... 
episode <- 5;

# action name ... 
action <- c("Shark 1st Move","Shark 2nd Move","Shark 3rd Move","Shark 4th Move","Shark 5th Move");

# Frame rate for animation ... 100 fps ...
frame_rate <- 60
# animation duration
item_duration <- 1

# # Renedering Rmd file for pdf output, then png conversion & arranging them for video frames
# # Loop through the slides
# for(i in 1:episode) {
#   item <- item_duration*frame_rate
#   # item <- 7
#   # Loop through the items within a slide
#   for (j in 1:item) {
#     # for (j in 20:20) {
#     # calculate shark 1st move
#     obj_name = "shark";
#     if (action[i] == action[1]) {
#       xshift = 4.6 - 1.35*(j-1)/item;
#       yshift = -1.65;
#       rotate = 45;
#     }
#     # calculate shark 2nd move
#     obj_name = "shark";
#     if (action[i] == action[2]) {
#       xshift = (4.6 - 1.35*(item-1)/item) - 1.5*1.35*(j-1)/item;
#       yshift = -1.65 + 1.35*(j-1)/item;
#       rotate = 45 - 45*(j-1)/item;
#     }
#     # calculate shark 3rd move
#     obj_name = "shark";
#     if (action[i] == action[3]) {
#       xshift = ((4.6 - 1.35*(item-1)/item) - 1.5*1.35*(item-1)/item) - 0.75*1.35*(j-1)/item;
#       yshift = (-1.65 + 1.35*(item-1)/item) + 1.0*(j-1)/item;
#       rotate = (45 - 45*(item-1)/item) + 45*(j-1)/item;
#     }
#     # calculate shark 4th move
#     obj_name = "shark";
#     if (action[i] == action[4]) {
#       xshift = (((4.6 - 1.35*(item-1)/item) - 1.5*1.35*(item-1)/item) - 0.75*1.35*(item-1)/item) - 0.75*1.35*(j-1)/item;
#       yshift = ((-1.65 + 1.35*(item-1)/item) + 1.0*(item-1)/item) - 1.0*(j-1)/item;
#       rotate = ((45 - 45*(item-1)/item) + 45*(item-1)/item) + 45*(j-1)/item;
#     }
#     # calculate shark 5th move
#     obj_name = "shark";
#     if (action[i] == action[5]) {
#       xshift = ((((4.6 - 1.35*(item-1)/item) - 1.5*1.35*(item-1)/item) - 0.75*1.35*(item-1)/item) - 0.75*1.35*(item-1)/item) - 0.9*1.35*(j-1)/item;
#       yshift = (((-1.65 + 1.35*(item-1)/item) + 1.0*(item-1)/item) - 1.0*(item-1)/item) - 2.25*(j-1)/item;
#       rotate = ((45 - 45*(item-1)/item) + 45*(item-1)/item) + 45*(item-1)/item;
#     }
#     output.name<-sprintf("%s%03d_%03d.pdf",topic.name,i,j)
#       # arrange the TikZ code by calling 
#       source("items_TikZ_code.R")
#       draw_content <- TikZ_content(action[i],obj_name,xshift,yshift,rotate)
#       # rendering for pdf output
#       rmarkdown::render(sprintf("%s.Rmd",topic.name),params = list(draw_content=draw_content),output_file = output.name)
#       # conversion of pdf to png
#       pdf_convert(output.name, format = "png", pages = NULL, filenames = NULL,dpi = 600, antialias = TRUE, opw = "", upw = "", verbose = TRUE)
#     }
# }
# 
# # empty set of png frames
# png_files <- character()
# 
# # loop through to arrange png frames
# for(i in 1:episode) {
#   # item <- 7
#   # Loop through the items within a slide
#   for (j in 1:item) {
#       png_files1 <- sprintf("%s%03d_%03d_1.png",topic.name,i,j)
#       # one by one png frames are orderly placed
#       png_files <- c(png_files,png_files1)
#   }
# }

# choice of voice, rate and pitch for Say system command to make .aiff audio file from text
voice <- c('kate','karen','lee','daniel')
rate <- '[[rate 150]] '
pitch <- '[[pbas 150]] '

# empty set of audio txt
audio_text.txt <- character()

# audio ... 
# audio <- c("Shark entering","going up","up in the air","getting down","back into water");
audio <- c("Shark entering [[slnc 50]] going up [[slnc 200]] up in the air [[slnc 200]] getting down [[slnc 200]] back into water");

# loop through to audio
# for(i in 1:episode) {
  # rate and pitch added in front of the audio text as parameters that can be through R script (HOME1.R)
  assign(paste0(topic.name,'_audio','.txt'),paste0(rate,pitch,audio))
  # calling system command Say to generate .aiff audio file
  system2("say",args=c(paste0('-v ',voice[2]),paste0('-o ',topic.name,'_audio','.aiff')),input = eval(as.symbol(paste0(topic.name,'_audio','.txt'))))
  # calling sox command to convert .aiff audio file to .wav audio file
  system(paste0('sox ',topic.name,'_audio','.aiff ',topic.name,'_audio','.wav'))
  # one by one png frames are orderly placed
  # assign(paste0('audio_text.txt'), paste0(eval(as.symbol(paste0('audio_text.txt'))),paste0('audio',i,j,'.wav ')))
  # }

# audio text for this item added here
# system(paste0('sox ',as.symbol(audio_text.txt),'audio.wav'))

# av::av_encode_video(png_files, sprintf("%s_%02d.mp4",topic.name,episode),framerate = frame_rate)
  
fn <- sprintf("%s.mp4",topic.name)
# Check its existence
if (file.exists(fn)) 
  # Delete file if it exists
  file.remove(fn)
system(paste0('ffmpeg -i ',sprintf("%s_%02d.mp4",topic.name,episode),' -i  ',sprintf("%s_audio.wav",topic.name),' -c:v copy -c:a aac ',sprintf("%s.mp4",topic.name)))
  
