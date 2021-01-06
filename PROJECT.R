# get Libraries needed
library('tidyverse')
library('dplyr')
library('plyr')
library('readr')
library('ggplot2')
library('readr')



# load files into R 
advertiser3 <- read_csv(file = '/Users/seanneary/Desktop/dataset/advertiser.csv')
head(advertiser3)

campaigns3 <- read_csv(file = '/Users/seanneary/Desktop/dataset/campaigns.csv')
head(campaigns3)

clicks3 <- read_csv(file = '/Users/seanneary/Desktop/dataset/clicks.csv')
head(clicks3)

conversions3 <- read_csv(file = '/Users/seanneary/Desktop/dataset/conversions.csv')
head(conversions3)

impressions3 <- read_csv(file = '/Users/seanneary/Desktop/dataset/impressions.csv')
head(conversions3)


# get them ready so they can be joined together

Count_clicks <- clicks3 %>% count('campaign_id')
View(Count_clicks)
colnames(Count_clicks) <- c('campaign_id', 'clicks')

Count_conversions <- conversions3 %>% count('campaign_id')
View(Count_conversions)
colnames(Count_conversions) <- c('campaign_id', 'conversions')

Count_impressions <- impressions3 %>% count('campaign_id')
View(Count_impressions)
colnames(Count_impressions) <- c('campaign_id', 'impressions')



# join them together 
advert <- inner_join(advertiser3, campaigns3, by = c('ID' = 'advertiser_id'))
colnames(advert) <- c('advertiser_id', 'company', 'campaign_id', 'campaign','budget')

advert <- left_join(advert, Count_impressions, by =c('campaign_id'))
advert <- left_join(advert, Count_clicks, by =c('campaign_id'))
advert <- left_join(advert, Count_conversions, by =c('campaign_id'))
View(advert)




#change NA values to 0 

advert[is.na(advert)] <- 0


#Analysis

#barplot for impressions,clickes,conversions
barplot(height=advert$impressions, names=advert$campaign, col="#69b3a2")
barplot(height=advert$clicks, names=advert$campaign, col="#69b3a2")
barplot(height=advert$conversions, names=advert$campaign, col="#69b3a2")

#the barchart but shown in numbers
Total_interactions_of_each_stage <- c(sum(advert$impressions),sum(advert$clicks),sum(advert$conversions))

what_percent_saw_ad_clicked <- (Total_interactions_of_each_stage[2]/Total_interactions_of_each_stage[1])*100
what_percent_clicked_and_conversion <- (Total_interactions_of_each_stage[3]/Total_interactions_of_each_stage[2])*100
what_percent_saw_conversion <- (Total_interactions_of_each_stage[3]/Total_interactions_of_each_stage[1])*100

#linear regression
ad.lm <- lm(conversions~., data=interactions_data)
summary(ad.lm)
rse=summary(ad.lm)$sigma
mean(interactions_data$conversions) 
rse/mean(interactions_data$conversions) 
rsq=summary(ad.lm)$r.sq
rsq 
#The predictors explain almost 100 % of the variance in conversions

Coef1=summary(ad.lm)$coefficients #Coefficient matrix
Coef1
#Examining the p-values associated with each predictor’s t-statistic, the p-values  are low.However clicks is lower suggesting that if people click on the product they are more likely to buy it than if they dont click on it.



#barchart with impressions,clicks & conversions on the same graph
interactions_data <- advert %>% select(impressions,clicks,conversions)
col <- c(colnames(interactions_data))

barplot(Total_interactions_of_each_stage,names.arg=col,xlab="Type",ylab="number of interacrions",col="blue",
                   main="Success of ads",border="red")

#pie chart 
cols <- c("grey90","grey50","black","grey30","white","grey70","grey50")
percentlabels<- round(100*ICC/sum(ICC), 1)
pielabels<- paste(percentlabels, "%", sep="")
pie(Total_interactions_of_each_stage, main="percentage of interactions", col=cols, labels=pielabels, cex=0.8)
legend("topright", col, cex=0.8, fill=cols)

# coco cola data 

Coco_Cola_data <- advert %>% filter(company == 'Coco Cola')
Coco_Cola_numbers <- c(sum(Coco_Cola_data$impressions),sum(Coco_Cola_data$clicks),sum(Coco_Cola_data$conversions))

barplot(Coco_Cola_numbers,names.arg=col,xlab="Type",ylab="number of interacrions",col="blue",
              main="Success of ads for Coco Cola",border="red")

coco_cola_what_percent_saw_ad_clicked <- (Coco_Cola_numbers[2]/Coco_Cola_numbers[1])*100
coco_cola_what_percent_clicked_and_conversion <- (Coco_Cola_numbers[3]/Coco_Cola_numbers[2])*100
coco_cola_what_percent_saw_conversion <- (Coco_Cola_numbers[3]/Coco_Cola_numbers[1])*100




#Lever Brows data


Lever_Brows_data <- advert %>% filter(company == 'Lever Brows')
Lever_Brows_numbers <- c(sum(Lever_Brows_data$impressions),sum(Lever_Brows_data$clicks),sum(Lever_Brows_data$conversions))

barplot(Lever_Brows_numbers,names.arg=col,xlab="Type",ylab="number of interacrions",col="blue",
        main="Success of ads for Lever Brows",border="red")

Lever_Brows_what_percent_saw_ad_clicked <- (Lever_Brows_numbers[2]/Lever_Brows_numbers[1])*100
Lever_Brows_what_percent_clicked_and_conversion <- (Lever_Brows_numbers[3]/Lever_Brows_numbers[2])*100
Lever_Brows_what_percent_saw_conversion <- (Lever_Brows_numbers[3]/Lever_Brows_numbers[1])*100

#Nintendo

Ninetendo_data <- advert %>% filter(company == 'Ninetendo')
Ninetendo_numbers <- c(sum(Ninetendo_data$impressions),sum(Ninetendo_data$clicks),sum(Ninetendo_data$conversions))

barplot(Ninetendo_numbers,names.arg=col,xlab="Type",ylab="number of interacrions",col="blue",
        main="Success of ads for Ninetendo",border="red")

Ninetendo_what_percent_saw_ad_clicked <- (Ninetendo_numbers[2]/Ninetendo_numbers[1])*100
Ninetendo_what_percent_clicked_and_conversion <- (Ninetendo_numbers[3]/Ninetendo_numbers[2])*100
Ninetendo_what_percent_saw_conversion <- (Ninetendo_numbers[3]/Ninetendo_numbers[1])*100

#Summary

saw_ad_clicked <- data.frame(coco_cola_what_percent_saw_ad_clicked,Lever_Brows_what_percent_saw_ad_clicked,Ninetendo_what_percent_saw_ad_clicked)
colnames(saw_ad_clicked) <- c('Coco cola', 'Lever Brows','Ninetendo')
colnames(saw_ad_clicked)[max.col(saw_ad_clicked, ties.method = "first")]
max(saw_ad_clicked)


click_conversion <- data.frame(coco_cola_what_percent_clicked_and_conversion ,Lever_Brows_what_percent_clicked_and_conversion,Ninetendo_what_percent_clicked_and_conversion)
colnames(click_conversion) <- c('Coco cola', 'Lever Brows','Ninetendo')
colnames(click_conversion)[max.col(click_conversion, ties.method = "first")]
max(click_conversion)


saw_conversion <- data.frame(coco_cola_what_percent_saw_conversion ,Lever_Brows_what_percent_saw_conversion,Ninetendo_what_percent_saw_conversion)
colnames(saw_conversion) <- c('Coco cola', 'Lever Brows','Ninetendo')
colnames(saw_conversion)[max.col(saw_conversion, ties.method = "first")]
max(saw_conversion)
