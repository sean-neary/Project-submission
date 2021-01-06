# Project-submission
Project 2

# Import,Tidy,Clean & analysis of Advert data

Name: Sean Neary
ID:C18733079

## Description

This program takes a dataset imports it, tidys it, cleans it and then goes on to analyse it.


## Import

* The very first thing you will need to do is dowload the librarys at the top of the page

* After this you will need to import your data. Start by downloading all files individually. 

* look on line 13 of the code and follow the instructions below

For your data change advitiser3 to whatever you want to call that file then after file= put the path to the file you want to upload. Then the head function shows you the first few rows to make sure it imported correctly. Do this for all your files 

Next you have to put them in a format where they can be joined I did this starting line 31. change Count_clicks to whatever you like. then link in the file you just imported in my code it is clicks3. Then count the colum you want to in mine it is 'campaign_id'. Finally change the column names to whatever suits.


Next you need to join the tables together. Look at line 46, where you see advert that is the name of the df so make sure you name it something appropriate. Use inner_join then put two files you want to join and what you want to join them by. in my code I linked advertiser3 and campaigns3 by ID and advertiser_id respectivly.Finally set the colum names to what you want.

Once you have joined the main two files join the rest using left_join.

The final step of the import is to change all the NA values to 0 to make it easier to analyse. I did this on line 59 just change advert to whatever you named your df.



## The Analysis

The first thing I did was a bar chart for each interaction so I could visualise the data. This is on line 64 if you want to do this change advert(dollersign)impressions to
your_df(dollersign)column_you_want_to_analyse then change the names to your_df(dollersign)name_column_you_want_to_analyse. 

An image of one of my bar charts is here:

[bar chart for impressions](https://imgur.com/a/hXl215r)

Then make a seperate table of just the sum of the numbers from the table like I did on line 68. just sub in your main df and then the columns you want to sum and name it whatever you want.

After this I wanted to see what persentage of people saw the add and then clicked on it the calculation for this you can see on line 70. Sub in your table you just made on line 68 and then [1/2/3] whichever one you want to work out. IN my code 41% of people clicked the ad meaning 60% of people didnt click it.

Next repeat the process for people who clicked then conversion then people who saw the ad and went on to convert. for my data I found that 57% of people who clicked on the ad followed throuh to conversion and 24% saw the and and went all the way to conversion. This is the base for my later calculations where I look at each company individually.

Next I wanted to do some linear regression on the data.I wanted to have a look at the relationship between conversion and the other data. F-test indicates clear evidence of a relationship between the data. on line 74 but your data in ad it will show a table the table I got is below:

[table for ad.lm](https://imgur.com/a/m3sQakv)

Next find the RSE. here you can use the exact code I used to analyse your data.I found that the RSE was 0.3 which isn't the best but could be worse.The mean RSE was 1.6 which again wsnt the best but could be worse.Next the noisy/signal=.19 which means that the percentage error wrt mean is roughly 19 % which isnt too bad. Next find the RSQ The predictors explain 98% of the variance in conversions. Going onto the coefficent matrix examining the p-values associated with each predictor’s t-statistic, the p-values  are low.However clicks is lower suggesting that if people click on the product they are more likely to buy it than if they dont click on it.


Then I went on to look at the success of all the ads. This time I made a bar chart with all the variables on. Fist you will have to create a table where it is just the numbers for what you are looking to analyse I did this on line 99 then make another table with the interactions data colum names like a did on line 100. Next it is time to make the barchart. I did this on line 102. Then sub in the table you made earlir just after you did the first barcharts then change the labels for the graph as you see fit mine is here:


[barchart with all data on](https://imgur.com/a/DVmCU1O)


Next I wanted to make a pie chart so that starts on line 106. You can keep it the same until line 109 here you have to change the table and fill at the end of line 110. Doing this produced the pie chart below. This pie chart shows the breakdown of the people who clicked saw and converted. Mine shows very clearly the dropoff off the people who saw and didnt click and the people who went all the way and converted. This backs up my workings out from earlier. Even though it counted people twice if the saw then clicked they would be in both portions of the chart its a clear visualisation of the dropoff.


[pie chart](https://imgur.com/a/iWaBlSO)


After this I wanted to look at the companies and see which one was the most successful with thier advertisement. For this I had to make two new tables. The first being all the data from coco cola then condence that down to just the numbers in that table. The code is pretty self explanitry its just using the tables you made earlier to make two new ones. Then I made a bar chart for it to visialise it which is below.


[barchart for Coco Cola](https://imgur.com/a/0wpu9iZ)


This provided a visualisation to see the data but I wanted numbers to talk about so I repeated the precess for all the data I did at the start but this time used this data. I found that 36% of people who saw the ad clicked it which is which is lower than the average of 41%, 50% of people who clicked went on to convert which is lower than the average but this means 18% of people who saw thw ad went on to conver which is lower than the average. I did this for Lever Brows and Ninetendo too.


I then made a summary where I looked at them all and found the highest value and the results are as follows: 

Highest saw to click rate : Lever Brows with 70%
Highest click to conversion rate: Ninetendo with 75%
highest saw to conversion rate: Lever Brows with 30%

Therefore looking at the data Lever Brows adverts were the most successful however the sample size is not great enough to confirm this for sure if I were going to investigate this further I would like more data.



