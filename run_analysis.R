# setwd("d:/WorkDir-R/Coursera/Cleaning data project")

library(reshape2)

dataDir <- "./data"

# load data 

# train data
xtrain <- read.table(paste(sep = "", dataDir, "/UCI HAR Dataset/train/X_train.txt"))
ytrain <- read.table(paste(sep = "", dataDir, "/UCI HAR Dataset/train/Y_train.txt"))
strain <- read.table(paste(sep = "", dataDir, "/UCI HAR Dataset/train/subject_train.txt"))

# test data
xtest <- read.table(paste(sep = "", dataDir, "/UCI HAR Dataset/test/X_test.txt"))
ytest <- read.table(paste(sep = "", dataDir, "/UCI HAR Dataset/test/Y_test.txt"))
stest <- read.table(paste(sep = "", dataDir, "/UCI HAR Dataset/test/subject_test.txt"))


# merge {train, test} data
xdata <- rbind(xtrain, xtest)
ydata <- rbind(ytrain, ytest)
sdata <- rbind(strain, stest)

# feature info
feature <- read.table(paste(sep = "", dataDir, "/UCI HAR Dataset/features.txt"))

# activity labels
actlabel <- read.table(paste(sep = "", dataDir, "/UCI HAR Dataset/activity_labels.txt"))
actlabel[,2] <- as.character(actlabel[,2])

# extract feature cols & names named 'mean, std'
selectedCols <- grep("-(mean|std).*", as.character(feature[,2]))
selectedColNames <- feature[selectedCols, 2]
selectedColNames <- gsub("-mean", "Mean", selectedColNames)
selectedColNames <- gsub("-std", "Std", selectedColNames)
selectedColNames <- gsub("[-()]", "", selectedColNames)

# extract data by cols & using descriptive name
xdata <- xdata[selectedCols]
allData <- cbind(sdata, ydata, xdata)
colnames(allData) <- c("Subject", "Activity", selectedColNames)

allData$Activity <- factor(allData$Activity, levels = actlabel[,1], labels = actlabel[,2])
allData$Subject <- as.factor(allData$Subject)

# generate tidy data set
meltedData <- melt(allData, id = c("Subject", "Activity"))
tidyData <- dcast(meltedData, Subject + Activity ~ variable, mean)

write.table(tidyData, "./tidy_dataset.txt", row.names = FALSE, quote = FALSE)
