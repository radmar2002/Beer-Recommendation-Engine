---
output: html_document
---
Beer Recommendation Engine - A Toy Application
=======================================
This application is a _micro_ recommendation engine for beers. 

The application recommends you a set of beers based on your selection for a favorite beer. 

__Use the application:__

- select from left panel your favorite type of beer

- select your favorite label

__As outcome:__

- you can interact in RGL chart (drag, rotate, etc); you can see the cluster of similar beers with your favorite one. This way you can learn more about similar beers, categories and beer styles.

- the second tab presents the characteristics of similar beers with your favorite one (ABV, Description, etc).

__Behind the Scenes:__

The horse-work function of the application, saved in global.R file, find the similar beer with the preferred selected one in two steps:

__Step 1.__ based on categorical and quantitative characteristics: category, style, ABV

__Step 2.__ based on semantic label similarity (it is used the default: Optimal String Alignment)

The application slider allows user to select the number of similar beer labels to be retrieved for the 'beer investigation' :p

The data used for the application is from [Open Beer Database](http://openbeerdb.com/)