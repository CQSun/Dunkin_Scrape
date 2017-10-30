# Dunkin Scrape


What we have here is a way to run an entire analysis off of each file. If you consider:

`makefile.R`

This file calls up numerous other R scripts in order to accomplish the task of knitting a paper. Each of these scripts does something unique and finally the last part of `makefile.R` is to knit the paper together. 

In order to see how data was scraped, feel free to view the file `data_download.html`. 