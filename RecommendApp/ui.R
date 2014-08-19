library(shiny)

shinyUI(fluidPage(
        
        includeCSS("styles.css"),
        
         pageWithSidebar(                

  headerPanel("Beer Recommendation Engine"),
  sidebarPanel(

    wellPanel(
            selectInput("dist", h4(p(strong("Choose Beer Cathegory"))),
                       c("British Ale"="1",
                         "Irish Ale"="2",
                         "North American Ale"="3",
                         "German Ale"="4",
                         "Belgian and French Ale"="5",
                         "German Lager"="7",
                         "North American Lager"="8",
                         "Other Lager"="9",
                         "Other Style"="11")),
            
            conditionalPanel(condition = "input.dist=='1'",
                             selectInput("beer1", h4(p(strong("Choose Beer Label"))),
                                         l1)
            ),
            conditionalPanel(condition = "input.dist=='2'",
                             selectInput("beer2", h4(p(strong("Choose Beer Label"))),
                                         l2)
            ),
            conditionalPanel(condition = "input.dist=='3'",
                             selectInput("beer3", h4(p(strong("Choose Beer Label"))),
                                         l3)
            ),
            conditionalPanel(condition = "input.dist=='4'",
                             selectInput("beer4", h4(p(strong("Choose Beer Label"))),
                                         l4)
            ),
            conditionalPanel(condition = "input.dist=='5'",
                             selectInput("beer5", h4(p(strong("Choose Beer Label"))),
                                         l5)
            ),
            conditionalPanel(condition = "input.dist=='7'",
                             selectInput("beer7", h4(p(strong("Choose Beer Label"))),
                                         l7)
            ),
            conditionalPanel(condition = "input.dist=='8'",
                             selectInput("beer8", h4(p(strong("Choose Beer Label"))),
                                         l8)
            ),
            conditionalPanel(condition = "input.dist=='9'",
                             selectInput("beer9", h4(p(strong("Choose Beer Label"))),
                                         l9)
            ),
            conditionalPanel(condition = "input.dist=='11'",
                             selectInput("beer11", h4(p(strong("Choose Beer Label"))),
                                         l11)
            ),
            
            sliderInput('nrRecommended', 'Number of recommendations', 12, step =1,
                         min = 3, max = 15)
            
              )   #----------WellPanel
               ),  #---------------sidebarPanel
  
  mainPanel(
                
       h4(p(strong("Recommendations"))),
       
           tabsetPanel(
             tabPanel(strong("Recommended Beer Cluster"), 
                      webGLOutput("myWebGL", width = "80%", height = "600px"),
                      tableOutput("main_beer")),
             tabPanel(strong("Proposed Beers Description"), tableOutput("recomm_beers")),
             tabPanel(strong("Help - How to use the app?"),  includeHTML("help.html"))
             
           ) #-------------tabsetPanel
           )  ##-----------mainPanel close
  )))



