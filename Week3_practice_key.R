# QuACK 2020 
# Week 3 - Logic and Data Cleaning
# Practice
# Authors: Willa & Elena

#### Set options ####
# Set your stringAsFactors option to false!
# I always do this at the top of all of my scripts.
options(stringsAsFactors=FALSE)

#### 1. Check/Set your working directory ####
# Make sure you are where you want to be.
setwd("~/Documents/QuACK/Week3") # Or wherever this is for you!

#### 2. Load your data ####
# Load in penguin.csv
penguins <- read.csv('penguin.csv')


#### 3. Check for missing values ####

# i. Are there any missing values? (There are a few ways you can check for this.)
summary(penguins) # Tells you what columns
penguins[is.na(penguins)]


# ii. Remove those penguins!
penguins <- na.omit(penguins)



##### 4. Get to know some of these penguins ##### 

# i. Pull the all available info for penguin p5

p5 <- penguins[4,] #note it moved when we removed NAs
p5 <- penguins[penguins$penguin=='p5', ] # better move

# ii. How much does penguin p18 weigh? 

p18_weight<-penguins$body_mass_g[penguins$penguin=='p18']

# iii. Who is heavier p18 or p38?

p38_weight<-penguins$body_mass_g[penguins$penguin=='p38']

# P18

#### 5. What islands has the most Adelie species ####
table(penguins$species, penguins$island)

#### 6. On average, do Adelie or Gentoo penguins have longer bill length? ####

mean(penguins$bill_length_mm[penguins$species == "Adelie"])
mean(penguins$bill_length_mm[penguins$species == "Gentoo"])

#Gentoo

#### 7. Select all the penguins that weigh more than p18 ####
penguins[penguins$weight > p18_weight,]