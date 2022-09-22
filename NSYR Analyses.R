library(tidyverse) 
library(expss) #val_lab and num_lab 
library(car) #zap_labels ... NEED BOTH!!!!
library(haven) #zap_labels ... NEED BOTH!!!! 
library(ltm) #Cronbach's Alpha 
library(jtools) #summ and export_summs 
library(gtsummary) #Summary Table for Multinom 
library(gt) 
library(sjPlot)

#You will need to download all four waves of the National Study of Youth and Religion
#They can be downloaded from the ARDA (www.thearda.com) 

#Read in all teh files once you have them all
nsyr1 <- read_dta("~/Desktop/Data/NSYR/NSYR w1/nsyr w1.dta")
nsyr2 <- read_dta("~/Desktop/Data/NSYR/NSYR w2/nsyr w2.dta")
nsyr3 <- read_dta("~/Desktop/Data/NSYR/NSYR w3/nsyr w3.dta")
nsyr4 <- read_dta("~/Desktop/Data/NSYR/NSYR w4/nsyr w4.dta")

#Combine the datasets into one 
nsyr12 <- full_join(nsyr1, nsyr2, by= "ids") 
nsyr34 <- full_join(nsyr3, nsyr4, by = "ids") 
nsyr_full <- full_join(nsyr12, nsyr34, by = "ids") 

#Simple cross-tab to make sure it worked (stated gnder at wave 1 x stated gender at w4) 
table(nsyr_full$teensex, nsyr_full$GENDER_W4)

