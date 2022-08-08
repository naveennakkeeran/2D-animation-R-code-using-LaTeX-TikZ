# 2D-animation-R-code-using-LaTeX-TikZ

- 👋 Hi, I (Naveen Nakkeeran) developed this code for one of my Duke of Edinburgh Silver medal activities

- First check the rendered 2D animated file with the audio SharkDive.mp4 

- Codes are written using R and LaTeX syntax

- All the contents (shark drawn using LaTeX TikZ, Mac system generated text-to-voice audio using "say" command, pdf frames generated using LaTeX is first converted to png files with pdftools & av libraries in R, timing for the animation is calculated from the system generate audio through tuneR library in R

- In the current form it is MAC OS dependent as it uses system command "say" to generate audio and 'kate' voice used. Change to the voice can be made from line 101 voice <- c('kate','karen','lee','daniel')

- HOME_14-03-2021.R, items_TikZ_code.R, preamble.tex and SharkDive.Rmd are the 4 files that are needed to compile and execute in RStudio

- Download and save all the 4 files in one folder

- In line 11 (rootdir <- "/Users/eng745/Naks/Naveen/Duke of Edinburgh/Coding/source codes/RStudio/07_14-03-2021") of the main R source code HOME_14-03-2021.R the user has to change the root directory name to the one they save the source code HOME_14-03-2021.R and execute through RStudio

- Execute source code HOME_14-03-2021.R through RStudio to generate the frames (pdf and png files), audio (*.aiff and *.wav files) and finally SharkDive.mp4 animated video file
