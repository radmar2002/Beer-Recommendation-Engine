Beer-Recommendation-Engine ( Toy App )
==========================
This application is a 'micro' recommendation engine for beers. 
The application recommends you a set of beers based on your selection for a favorite beer. 
Use the application:
- select from left panel your favorite type of beer
- select your favorite label
As outcome:
- you can interact in RGL chart (drag, rotate, etc); you can see the cluster of similar beers with your favorite one. This way you can learn more about similar beers, categories and beer styles.
- the second tab presents the characteristics of similar beers with your favorite one (ABV, Description, etc).
Behind the Scenes:
The horse-work function of the application, saved in global.R file, find the similar beer with the preferred selected one in two steps:
Step 1. based on categorical and quantitative characteristics: category, style, ABV
Step 2. based on semantic label similarity (it is used the default: Optimal String Alignment)
The application slider allows user to select the number of similar beer labels to be retrieved for the 'beer investigation' :p