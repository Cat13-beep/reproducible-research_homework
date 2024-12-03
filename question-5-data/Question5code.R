#downloading packages for question
library(ggplot2)
library(tidyverse)
library(palmerpenguins)
library(here)
library(janitor)

#Import the data and explore it to find out about columns and rows
Cui_etal2014 <- read_csv("question-5-data/Cui_etal2014.csv")
#33 rows and 13 columns

#Need to clean data before performing analysis with it/ gaps in names are a problem
Virusdataraw <- Cui_etal2014 
Virus_clean <- Virusdataraw %>%
select(-starts_with("Delta")) %>%
clean_names()
colnames(Virus_clean)
summary(Virus_clean)

#Transforming the different variables (virus volume and genome length)

logged_volume<-log(Virus_clean$virion_volume_nm_nm_nm)
logged_genomesize<-log(Virus_clean$genome_length_kb)

#Linear regression with the transformed variables

virusRegression <- lm(log(virion_volume_nm_nm_nm) ~ log(genome_length_kb), data= Virus_clean)
summary(virusRegression)
 

#Code to reproduce the graph shown in README.md, plotting the clean data, changing axis to be the same names as the graph I am copying and adding a line of best fit with a confidence interval


ggplot(Virus_clean, 
aes(x = log(genome_length_kb), y = log(virion_volume_nm_nm_nm))) + geom_point() + 
xlab("log[Genome length (kb)]") + ylab("log[Virion volume (nm³)]") + theme_minimal() +
geom_smooth(method=lm, se=TRUE)

#saving the packages used here 
sink(file = "package-versions.txt")
sessionInfo()
sink()
