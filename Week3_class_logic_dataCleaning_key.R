# Quack 2020
# Week 3 - Logic and Data Cleaning
# Elena Leib

#### Check/Set your working directory ####
# Make sure you are where you want to be.

# I always open my script from my working directory so it automatically sets the wd in RStudio.


#### Set options ####
# Set your stringAsFactors option to false!
# I always do this at the top of all of my scripts.
options(stringsAsFactors=FALSE)




#### Logic ####

## Equals and not equals ##
# Let's see what R outputs for the following examples:
4 + 5 == 9
# Returns TRUE

4 + 5 == 10
# Returns FALSE

# Remember, both TRUE and FALSE are booleans. Booleans are a categorical data type with only two options: TRUE and FALSE.
# Booleans are the datatype of logic in all programming langauges!

4 + 5 = 9
# Errors! = is an assignment operator

4 + 5 != 10
# TRUE

4 + 5 != 9
# FALSE

# You can also test equality of strings and vectors
"hello" == "hello"
"hello" == "hella"
"hello" != "world"

## Greater than and less than ##
15 > 5
15 >= 5
15 >=15
15 >= 15
2 <= 4
2 < 2
2 < 3
2 <= 2

# You can also test great than and less than for strings
"a" > "b"
"hello" < "world"
"hello" < "hella"
"Hello" <= "hello"
"hello" < "hello"
"aa" < "ab"

## %in% operator ##

grade <- 3

grade == 3 | grade == 5 | grade == 7
grade %in% c(3, 5, 7)

# Try it again for grade <- 4 and grade <- 5

# The vector could also be a variable
possibleGrades <- c(3, 5, 7)
grade %in% possibleGrades
# This gives you more flexibility!

## And, or ##
# Let's test what was in the logic table in the slides
# And
TRUE & TRUE
TRUE & FALSE
FALSE & TRUE
FALSE & FALSE

# Or
TRUE | TRUE
TRUE | FALSE
FALSE | TRUE
FALSE | FALSE

x = 1
y = 2

x + y == 3 | x * y == 3
x + y == 3 & x * y == 3

x = 2
x + y == 4 | x * y == 4
x + y == 4 & x * y == 4


## If/else ##
# Predict what these will print, then run the code:
donutsSold <-  25
if (donutsSold > 20) {
  print('You sold a lot!')
} else {
  print('Not enough for today')  
}

# Try it again with donutsSold <- 20 and 5, what happens?


# Assign grade a value that will make this code snippet print "even" at the end.
# Then assign a value that will make it print "odd"

possibleGrades <- c(1, 3, 5, 7, 9, 11)
if (grade %in% possibleGrades) {
  gradeType <- "odd"
} else {
  gradeType <- "even"
}
print(gradeType)



## Operators are vectorized! ##
x <- 1:4
y <- 6:9

t <- x + 5
z <- x + y

x > 2

x >= 2

y == 8

x == 8

x > 1 & x < 4

x != 3 | x <= 2

x != 3 & x <= 2

bool <- x > 2
# bool is a logical vector!

#### Subsetting vectors and data frames ####

## Using logical operators inside bracket notation ##
# We can use logic and bracket notation to select/subset the elements from a vector that we want.

# We have the vector y <- 6:9. What if I only want the numbers in x that are greater than 7?
y[y > 7]

# Let's break this down to see what we are doing.
elementsToKeep <- y > 7 # Returns a logical vector
newY <- y[elementsToKeep]


## Checking for missing values ##
# Let's take a practical example of subsetting
is.na(5)
is.na(NA)
is.na(x)
is.na(c(5, 7, NA, 9, 6))
!is.na(c(5, 7, NA, 9, 6))


# Here is a more practical example.
age <- c(5, 10, NA, 6, 9, NA, 8)
is.na(age)
!is.na(age) # We want to keep the values that are NOT NA
age[!is.na(age)]

# Now let's do this for the whole data frame!
subjid <- 1:7
age <- c(5, 10, NA, 6, 9, NA, 8)
gender <- c("m", "m", "f", "m","other", "f", NA)
bilingual <- rep(c(0, 1), length.out = length(subjid))

df <- data.frame(subjid, age, gender, bilingual)
df$gender <- factor(df$gender)
df$bilingual <- factor(df$bilingual)
df

# Let's check out our data frame
View(df)
str(df)
summary(df)

# Now, let's get rid of those NAs!

# To check for and get rid of NAs (and the row that has that NA) for one column of data:
(df.noAgeNA <- df[!is.na(df$age),])
# But this makes us look for NAs only in the age column. And sometimes you might want to do that!
# Example, you only want to eliminate people missing data ina  certain column, but they can have NAs for other things.

# To omit ALL rows that have ANY NAs:
(df.clean <- na.omit(df))


#### Now, let's learn more about our data ####

# Let's look at all the data for subject 4
df.clean[4,] #... doesn't work anymore! Got data for subject 5!
df.clean[3,] # ok, but not the best, better yet, select when subjid == 4
df.clean[df.clean$subjid == 4,]

# How old is subject 5?
df.clean$age[df.clean$subjid == 5]

# Get only participants who are older than 6
df.clean[df.clean$age > 6,]
# This is the subset of the data with participants older than 6


# Subset only the subjects that are bilingual
df.clean[df.clean$bilingual == 1,]

# Subset only the subjects who are older than 6 AND bilingual
df.clean[df.clean$age > 6 & df.clean$bilingual == 1,]
# Only gives us one person!

#### Subset function ####
# We can also use the subset function to do this same thing.

df.old <- subset(df.clean, age > 6)

# Can also select a certain set of columns if you don't want all of them
df.old_colChange <- subset(df.clean, age > 6, select=c("subjid", "age"))
