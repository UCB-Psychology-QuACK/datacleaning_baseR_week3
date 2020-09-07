# Quack 2020
# Week 3 - Logic and Data Cleaning
# Elena Leib

#### Check/Set your working directory ####
# Make sure you are where you want to be.

# I always open my script from my working directory so it automatically sets the wd in RStudio.


#### Set options ####
# Set your stringAsFactors option to false!
# I always do this at the top of all of my scripts.





#### Logic ####

## Equals and not equals ##
# Let's see what R outputs for the following examples:
# Class examples


# You can also test equality of strings and vectors


## Greater than and less than ##


# You can also test great than and less than for strings


## %in% operator ##





## And, or ##
# Let's test what was in the logic table in the slides
# And


# Or





## If/else ##
# Predict what this will print, then run the code:
donutsSold <-  25
if (donutsSold > 20) {
  print('You sold a lot!')
} else {
  print('Not enough for today')  
}

# Try it again with donutsSold <- 20 and 5, what happens?


# Assign grade a value that will make this code snippet print "even" at the end.
# Then assign a value that will make it print "odd"

# grade <- ???

possibleGrades <- c(1, 3, 5, 7, 9, 11)
if (grade %in% possibleGrades) {
  gradeType <- "odd"
} else {
  gradeType <- "even"
}
print(gradeType)



## Operators are vectorized! ##


#### Subsetting vectors and data frames ####

## Using logical operators inside bracket notation ##
# We can use logic and bracket notation to select/subset the elements from a vector that we want.

# We have the vector y <- 6:9. What if I only want the numbers in x that are greater than 7?
y <- 6:9
y[y > 7]

# Let's break this down to see what we are doing.



## Checking for missing values ##
# Let's take a practical example of subsetting - removing NAs



# Here is a more practical example.
age <- c(5, 10, NA, 6, 9, NA, 8)


# Now let's do this for the whole data frame!
subjid <- 1:7
age <- c(5, 10, NA, 6, 9, NA, 8)
gender <- c("m", "m", "f", "m","other", "f", NA)
bilingual <- rep(c(0, 1), length.out = length(subjid))

# Make these columns into a data frame, and make gender and bilingual factors


# Let's check out our data frame


# Now, let's get rid of those NAs!

# To check for and get rid of NAs (and the row that has that NA) for one column of data:



# To omit ALL rows that have ANY NAs:



#### Now, let's learn more about our data ####

# Let's look at all the data for subject 4


# How old is subject 5?


# Get only participants who are older than 6


# Subset only the subjects that are bilingual


# Subset only the subjects who are older than 6 AND bilingual


#### Subset function ####
# We can also use the subset function to do this same thing.



# Can also select a certain set of columns if you don't want all of them
