library(dplyr)
library(reshape2)
x <- read.csv("train/X_train.txt", sep = "", header = FALSE)
y <- read.csv("train/Y_train.txt", sep = "", header = FALSE)
z <- read.csv("train/subject_train.txt", sep = "", header = FALSE)

variable_names <- read.csv("features.txt", sep = "", header = FALSE)[2]

x2 <- read.csv("test/X_test.txt", sep = "", header = FALSE)
y2 <- read.csv("test/Y_test.txt", sep = "", header = FALSE)
z2 <- read.csv("test/subject_test.txt", sep = "", header = FALSE)

names(x) <- as.character(variable_names[, 1])
names(x2) <- as.character(variable_names[, 1])

y$V1 <- as.factor(y$V1)
y2$V1 <- as.factor(y2$V1)
levels(y$V1) <-  c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")
levels(y2$V1) <-  c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")
names(y) <- c("Activity")
names(y2) <- c("Activity")

x$Activity <- y[, 1]
x2$Activity <- y2[, 1]

x$SubjectNumber <- z[, 1]
x2$SubjectNumber <- z2[, 1]

x$TestOrTrain <- rep(2, 7352)
x2$TestOrTrain <- rep(1, 2947)
x$TestOrTrain <- as.factor(x$TestOrTrain)
x2$TestOrTrain <- as.factor(x2$TestOrTrain)

df <- rbind(x, x2)
levels(df$TestOrTrain) <- c("Test", "Train")

for (i in 561:1)
{
    if (grepl("mean|std|Mean", names(df)[i]) == FALSE)
    {
         df[, i] <- NULL
    }
}

dfMelt <- melt(df, id = names(df)[87:89], measure.vars = names(df)[1:86])
dfData <- dcast(dfMelt, Activity + SubjectNumber ~ variable, mean)
write.table(dfData, file = "tidy.txt", row.name = FALSE)