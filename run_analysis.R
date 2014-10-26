library(dplyr)

# Read test data from file and column bind subject and activity description data
x_test <- read.table("test/X_test.txt", header = FALSE)
subject_test <- read.table("test/subject_test.txt", header = FALSE)
y_test <- read.table("test/y_test.txt", header = FALSE)
test_data <- cbind(x_test, subject_test, y_test)

# Read training data from file and column bind subject and activity description data
x_train <- read.table("train/X_train.txt", header = FALSE)
subject_train <- read.table("train/subject_train.txt", header = FALSE)
y_train <- read.table("train/y_train.txt", header = FALSE)
train_data <- cbind(x_train, subject_train, y_train)

#Merge test and training data
merged_data <- rbind(train_data, test_data)

#Read feature names from file
featurenames <- file("features.txt", "r")
features_raw <- readLines(featurenames)
close(featurenames)

#Features strings cut to correct size (removing numbers at beginning). "Subject" and "Activity" also added
features <- substr(features_raw, sapply(strsplit(features_raw, ''), function(x) which(x == ' ')) + 1, nchar(features_raw))
features <- c(features, "Subject", "Activity")

#feature names added merged_data as column names
colnames(merged_data) <- features

#subset merged_data based on whether they are means or standard deviations
mean_subset <- !grepl("[Mm]ean[Ff]req", features) & (grepl("mean()", features) | grepl("std()",features) | grepl("Subject", features) | grepl("Activity", features))
mean_data <- merged_data[mean_subset]

#Read activity_labels.txt and merge this with data set to create activity desriptions of subjects
activityLabels <- read.table("activity_labels.txt", header = FALSE)
colnames(activityLabels) <- c("Activity", "ActivityDescription")
mean_data <- merge(activityLabels,mean_data,all=TRUE)

#Remove unnecessary punctuation from feature variable names
variable_names <- colnames(mean_data)
colnames(mean_data) <- gsub("\\()|\\-", "", variable_names)

#Use dplyr package to group data frame by Subject and ActivityDescription
mean_data <- tbl_df(mean_data)
mean_grouped <- group_by(mean_data, Subject, ActivityDescription)

#Use summarise_each function from dplyr package to create means
#Create "Tidy Data" set of each combination of Subject and Activity Description. Write to file.
tidy_data <- mean_grouped %>% summarise_each(funs(mean), matches("tB"), matches("tG"), matches("fB"))
write.table(tidy_data, file = "tidy_data_averages.txt", row.names = FALSE)