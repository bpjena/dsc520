# Assignment: Week 3 - Execrise 5: 2014 American Community Survey
# Name: Jena, Binay
# Date: 2020-09-20

## Check your current working directory using `getwd()`
getwd()

## List the contents of the working directory with the `dir()` function
dir()

## If the current directory does not contain the `data` directory, set the
## working directory to project root folder (the folder should contain the `data` directory
## Use `setwd()` if needed
setwd("/Users/binayprasannajena/Documents/GitHub/dsc520/")

## Load the csv file `person_df1` using `read.csv`
## Examine the structure of `survey_df` using `str()`
survey_df <- read.csv(file='data/acs-14-1yr-s0201.csv',stringsAsFactors = TRUE)
survey_df[1:8]

## Exercise 5: Question 2
## Please provide the output from the following functions: str(); nrow(); ncol()
str(survey_df)
nrow(survey_df)
ncol(survey_df)

## Exercise 5: Question 3
## Create a Histogram of the HSDegree variable using the ggplot2 package
library(ggplot2)
theme_set(theme_minimal())

## Create a histogram of the `HSDegree` variable using `geom_histogram()`
nOfBins <- 20
ggplot(survey_df, aes(HSDegree))  + xlim(c(60,100)) +  geom_histogram(bins = nOfBins) + ggtitle('County with HSDegree') + xlab('% Age of Population with HSDegree') + ylab('Number of Counties')

## Normal Curve
ggplot(survey_df, aes(HSDegree)) + xlim(c(60,100)) + geom_histogram(aes(y = ..density..), bins=nOfBins, colour = "blue") + stat_function(fun = dnorm, args = list(mean = mean(survey_df$HSDegree), sd = sd(survey_df$HSDegree))) + ggtitle('Normal Curve with %Age of Population with HSDegree in counties') + xlab('% Age of Population with HSDegree')

## Normal Distribution - to check Mean and Median
summary(survey_df)

## Histogram with Normal Curve(Changing Density Scale to Number of Counties)
n_obs = sum(!is.na(survey_df$HSDegree))
ggplot(survey_df, aes(HSDegree)) + xlim(c(60,100)) + geom_histogram(bins = nOfBins)+ ggtitle('County with HSDegree') + xlab('% Age of Population with HSDegree') + ylab('Number of Counties') + stat_function(fun = function(x) dnorm(x, mean = mean(survey_df$HSDegree), sd = sd(survey_df$HSDegree)) * (40/nOfBins) * n_obs)

## Density Plot
ggplot(survey_df, aes(HSDegree)) + geom_density(aes(HSDegree), colour="blue") + xlim(c(60,100)) + ggtitle('County with HSDegree') + xlab('% Age of Population with HSDegree') + ylab('Density of Counties')

## Exercise 5: Question 5
## Probability Plot / QQ Plot & qqplot line
ggplot(survey_df, aes(sample = HSDegree)) + geom_qq(col='blue') + geom_qq_line(col='red') + ggtitle("Probability - QQ Plot for HSDegree")

## Exercise 5: Question 7
## stat.desc() Function
install.packages("pastecs")
library(pastecs)
stat.desc(cbind(survey_df$HSDegree), basic = FALSE, norm = TRUE)