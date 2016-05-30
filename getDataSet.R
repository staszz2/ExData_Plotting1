#variables
workFolder <- "temp"
dataDir <- paste(getwd(),workFolder, sep="/")

dataSet <- loadDataSet()

#download and unzip file into a temp folder
prepareFiles <- function()
{
  #prepare temp folders
  unlink(dataDir, recursive=TRUE) #delete inconsiderably!
  dataURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  dir.create(dataDir, showWarnings = TRUE, recursive = FALSE)
  
  #download and unzip
  dataFile <- paste(workFolder,basename(dataURL),sep="/")
  if(!file.exists(dataFile)) # why would it tho
  {
    download.file(dataURL,dataFile)
  }
  unzip(dataFile, list = FALSE, overwrite = TRUE,exdir=workFolder)
}

#read unzipped folder for files and build porject dataset
loadDataSet <- function()
{
  files <- list.files(workFolder, recursive=TRUE)
  dataFile <- files[grepl(".txt$", files)]
  filePath<-paste(dataDir,dataFile,sep="/")
  dataSetAll <- read.table(filePath,header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
  #locale does not matter, format is d/m/yyyy
  dataSet <- dataSetAll[dataSetAll$Date %in% c("1/2/2007","2/2/2007") ,]
  print(paste("Loaded observations: ", length(dataSet),""))
  dataSet
}


			




