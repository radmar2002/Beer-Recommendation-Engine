shinyServer(function(input, output) {
  
  output$myWebGL <- renderWebGL({  
                                    br <- get.beer()
                                    plotBeerRecom(data1,br, input$nrRecommended)  
                                    })        
        

  get.beer <- reactive({
          switch(input$dist,
                 "1" = input$beer1,
                 "2" = input$beer2,
                 "3" = input$beer3,
                 "4" = input$beer4,
                 "5" = input$beer5,
                 "7" = input$beer7,
                 "8" = input$beer8,
                 "9" = input$beer9,
                 "11" = input$beer11)
  })
  

  output$recomm_beers <- renderTable({ 
                                    br <- get.beer()
                                    tbl <- recommendAnotherBeer(data1,br, input$nrRecommended)
                                    tbl$abv <- as.character(round(tbl$abv,1))
                                    tbl <- tbl[,c(3,6:8)]
                                    names(tbl) <- c("Label","Style","ABV","Description")
                                    tbl                    
                                })
    
  output$main_beer<- renderTable({
                                br <- get.beer()
                                tbl <- data1[which(data1$name == br),]
                                tbl$abv <- as.character(round(tbl$abv,1))
                                tbl <- tbl[,c(3,6:8)]
                                names(tbl) <- c("Label","Style","ABV","Description")
                                tbl
                               })

  
})