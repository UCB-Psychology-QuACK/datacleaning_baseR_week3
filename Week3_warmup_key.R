# QuACK 2020 
# Week 3 - Logic and Data Cleaning
# Warm-up
# Authors: Willa & Elena

options(stringsAsFactors=FALSE)

#### Group practice ####
# the goal is for you guys to work together to figure out some info about this dataset. 
# try to get all the info from R (ie. don't open the csv file in excel).
########################

#### 1.  Set your directory ####

# i. What is your current working directory?
getwd()

# ii. Set your wd to the folder with the data and R script (if it isn't already the current wd)
setwd('~/Desktop/') # Or wherever you have it!
# setwd('~/Desktop/Week3/') # another example



#### 2. Load your data ####
# Data adapted from Allison Horst and her Palmer Penguins
# https://github.com/allisonhorst/palmerpenguins
# Load in penguin.csv
penguins <- read.csv("penguin.csv")


#### 3. Get some general info about the dataframe ####
# You can use any commands to get this info. Try to use R commands, don't just open up the dataframe and look. That said, feel free to look at the data frame and in the global environment to confirm the output of the R commands and your understanding.

# i. How many columns are there? 
ncol(penguins) # ** preferred way!
length(penguins)

# ii. What are the column names
colnames(penguins)

# iii. How many rows?
nrow(penguins)

# iv. What are the datatypes in this dataframe? 
str(penguins)

# v. Are there any that would be better as factors? Change them!
penguins$species <- factor(penguins$species) # Makes levels in alphabetical order
penguins$species <- factor(penguins$species, levels = c("Gentoo", "Adelie", "Chinstrap"))
levels(penguins$species)
levels(penguins$sex)


# Can also do this for island, sex, and year
penguins$island <- as.factor(penguins$island)
penguins$sex <- as.factor(penguins$sex)
penguins$year <- as.factor(penguins$year)


# Now check out str(penguins) again.
# Notice that the columns that are factors show counts of the number of rows with data for each level! This is useful information (it is making a table for you). It can also help you decide what columns you want to make strings versus keep as their original data type (e.g., having a count of the penguin ids wouldn't be helpful, and other numbers need to be continuous)

# vi. What are a few other ways you can inspect your data without using R commands? Explain as many as you can think of.
# 1. You can look at the object in the Global Environment in the upper right frame. The number of observations is the number of rows. The number of variables is the number of columns. If you click the arrow button, it will show you all the columns, their names, and data types. 

# 2. Click on the object in the Global Environment, and it will open up a window showing you the data frame as you would see it in excel.

# 3. Type View(penguins) in the console, and it will show you the same.

# While these ways are good for checking what you've done and that your data frame looks like how you want it to, they don't give you descriptive information about your columns or tell you quantitatively how many missing values there are.


#### 4. Learn more about each column ####

# i. Type a command to get descriptive stats (e.g., mean, median, sd) for each column
summary(penguins)

# ii. Do any columns have missing values (i.e., NAs)? If so, which ones and how many NAs in each column?
# We can use summary() to see which columns have missing values and which ones.
summary(penguins)

#### Challenge: Create a new column called cuteness.rating. Use what you learned last time to give them all a 10! ####
penguins$cuteness.rating <- 10
View(penguins)

