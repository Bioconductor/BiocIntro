install.packages("tidyverse")
library(tidyverse)
search()
pi
pi = "apple"
pi
base::pi
rm(pi)
pi
mtcars
class(mtcars)
dim(mtcars)
rownames(mtcars)
colnames(mtcars)
mtcars
as_tibble(mtcars)
rownames_to_column(mtcars)
as_tibble(mtcars)
library(magrittr)
mtcars
as_tibble(rownames_to_column(mtcars))
tmp1 = rownames_to_column(mtcars)
as_tibble(tmp1)
mtcars.as.data.frame.with.rownames.as.column = rownames_to_column(mtcars)
as_tibble(rownames_to_column(mtcars))
mtcars %>% rownames_to_column() %>% as_tibble()
mt_cars <- mtcars %>% rownames_to_column() %>% as_tibble()
mt_cars
brfss = read_csv("~/extdata/BRFSS-subset.csv")
brfss
brfss %>% summary()
brfss
brfss %>% summarize(n = n())
brfss %>% summarize(n = n(), Age=mean(Age, na.rm=TRUE))
brfss
## library(tidyverse)
## brfss = read_csv("~/extdata/BRFSS-subset.csv")
brfss %>% group_by(Sex, Year)
brfss %>% group_by(Sex, Year) %>% summarize(n=n(), Age=mean(Age, na.rm=TRUE))
brfss %>% group_by(Sex, Year) %>% summarize(n=n(), Age=mean(Age, na.rm=TRUE), Height = mean(Height, na.rm=TRUE))
brfss %>% group_by(Sex, Year) %>% summarize(n=n(), Age=mean(Age, na.rm=TRUE), Height = mean(Height, na.rm=TRUE), Weight(mean(Weight, na.rm=TRUE)))
brfss %>% group_by(Sex, Year) %>% summarize(n=n(), Age=mean(Age, na.rm=TRUE), Height = mean(Height, na.rm=TRUE), Weight = mean(Weight, na.rm=TRUE)))
brfss %>% group_by(Sex, Year) %>% summarize(n=n(), Age=mean(Age, na.rm=TRUE), Height = mean(Height, na.rm=TRUE), Weight = mean(Weight, na.rm=TRUE))
brfss
brfss %>% filter(Sex == "Male", Year == 1990)
brfss %>% filter(Weight > 200)
brfss %>% select(Age, Weight, Height)
brfss
brfss %>% mutate(Sex = factor(Sex), Year = factor(Year))
brfss %>% mutate(Sex = factor(Sex), Year = factor(Year)) %>% summary()
brfss %>% mutate(Sex = factor(Sex), Year = factor(Year)) %>% summary()
tidy = brfss %>% mutate(Sex = factor(Sex), Year = factor(Year)) %>% summary()
tidy
tidy = brfss %>% mutate(Sex = factor(Sex), Year = factor(Year))
tidy
brfss = read_csv("~/extdata/BRFSS-subset.csv")
cols = cols(
Age = col_integer(),
Weight = col_double(),
Sex = col_factor(c("Female", "Male")),
Height = col_double(),
Year = col_factor(c("1990", "2010"))
)
cols
col_types = cols(
Age = col_integer(),
Weight = col_double(),
Sex = col_factor(c("Female", "Male")),
Height = col_double(),
Year = col_factor(c("1990", "2010"))
)
brfss = read_csv("~/extdata/BRFSS-subset.csv", col_types = col_types)
brfss
brfss %>% summary()
brfss
search()
ggplot(brfss, aes(x=Age, y=Weight))
ggplot(brfss, aes(x=Age, y=Weight)) + geom_point()
ggplot(brfss, aes(x=Age, y=log(Weight)) + geom_point()
ggplot(brfss, aes(x=Age, y=log(Weight))) + geom_point()
ggplot(brfss, aes(x=Age, y=log(Weight))) + geom_point() + geom_smooth()
ggplot(brfss, aes(x=Age, y=log(Weight))) + geom_boxplot()
ggplot(brfss, aes(x=Sex, y=log(Weight))) + geom_boxplot()
ggplot(brfss, aes(x=Sex, y=log(Weight))) + facet_grid(Year ~ Sex ) + geom_boxplot()
ggplot(brfss, aes(x=Sex, y=log(Weight))) + facet_grid(Year) + geom_boxplot()
ggplot(brfss, aes(x=Sex, y=log(Weight))) + facet_grid( ~ Year) + geom_boxplot()
ggplot(brfss, aes(x=Sex, y=log(Weight))) + facet_grid( ~ Sex) + geom_boxplot()
ggplot(brfss, aes(x=Year, y=log(Weight))) + facet_grid( ~ Sex) + geom_boxplot()
ggplot(brfss, aes(x=Year, y=log(Weight))) + facet_grid( ~ Sex) + geom_violin()
ggplot(brfss, aes(x=Year, y=log(Weight))) + facet_grid( ~ Sex) + geom_violin() + geom_boxplot()
ggplot(brfss, aes(x=Year, y=log(Weight))) + facet_grid( ~ Sex) + geom_boxplot() + geom_violin()
savehistory("~/history-day-1.R")
