rm(list=ls())
library("shiny")
library("shinyRGL")
library(stringdist)
library(igraph)
library(rgl)
require (class)

data1 <<- read.csv("~/data/BeersForApplicationMain.csv")

## Find k nearest neighbors of X[n, ] in the data frame
## or matrix X, utilizing function knn1 k-times.
nearest <- function (X, n, k=3){
        N <- nrow(X)
        # inds contains the indices of nearest neighbors
        inds <- c(n); i <- 0
        while (i < k) {
                # use knn1 for one index...
                j <- as.integer(knn(X [-inds, ], X[n, ], 1:(N-length(inds))))
                # ...and change to true index of neighbor
                inds <- c(inds, setdiff(1:N, inds)[j])
                i <- i+1
        }
        # return nearest neighbor indices (without n, of course)
        return(inds[-1])
} 


recommendAnotherBeer<-function(df,targetBeer,nrOfBeers = 3){
        
        M <- df[,c('name','cat_id','style_id','abv')]
        target <- as.numeric(row.names(M[which(M$name == targetBeer),]))        
        largeSimilarSet<-nearest(M[,-1],target,k=66)   ##k the most simmilar users with case proposed
        
        namesLargeSet <- df[largeSimilarSet,c("name")]
        namesLargeSet <- as.character(namesLargeSet)
        namesLargeSet <- c(targetBeer,namesLargeSet)
        
        D <- stringdistmatrix(namesLargeSet, namesLargeSet)
        D <- as.data.frame(D)
        
        colnames(D) <- namesLargeSet
        nearBeers<-nearest(D,1,k=nrOfBeers)   ##k the most simmilar users with case proposed 
        lst <- colnames(D[,nearBeers])
        
        dd <- df[which(df$name %in% lst),]
        dd <- rbind(df[which(df$name==targetBeer),],dd)
        
        return(dd)        
}


plotBeerRecom <- function(dtf,br, nrRecom = 12){
        data2 <- recommendAnotherBeer(dtf,br, nrRecom)
        data3 <- data2[,c("style_id_II", "name")]
        data3$style_id_II <- paste("Style: ",data3$style_id_II,sep="")
        data3$name <- paste("Beer: ", data3$name, sep="")
        
        netw<-data3  # select from input file only column of interest
        netlist<-graph.data.frame(netw, directed=TRUE)   
        
        ##### -------------- Formating the Ventrices of the graph-------------- 
        V(netlist)$label<- V(netlist)$name
        V(netlist)[-1+grep("Style:", V(netlist)$label, ignore.case = TRUE)]$color<-"red"                  ### use RegEx to find if
        V(netlist)[-1+grep("Beer:", V(netlist)$label, ignore.case = TRUE)]$color<-"cornflowerblue"
        V(netlist)[-1+grep("Style:", V(netlist)$label, ignore.case = TRUE)]$size<-10
        V(netlist)[-1+grep("Beer:", V(netlist)$label, ignore.case = TRUE)]$size<-6
        
        ##### -------------- Formating the Edges of the graph--------------
        E(netlist)$size<-0.5
        E(netlist)$color<-"grey"
        E(netlist)$lbl<-paste(data3$name, data3$abv, sep="")     
        #### Here starts the graphical interface...darg, drop, or scrol inside for interactivity
        co <- layout.fruchterman.reingold(netlist, dim=3)      ### set the layout tipe of the graph
        rglplot(netlist, vertex.label.color="dark blue", edge.arrow.size=1, layout=co)

}

l1 <- as.character(data1[which(data1$cat_id==1),c("name")])
l2 <- as.character(data1[which(data1$cat_id==2),c("name")])
l3 <- as.character(data1[which(data1$cat_id==3),c("name")])
l4 <- as.character(data1[which(data1$cat_id==4),c("name")])
l5 <- as.character(data1[which(data1$cat_id==5),c("name")])
l7 <- as.character(data1[which(data1$cat_id==7),c("name")])
l8 <- as.character(data1[which(data1$cat_id==8),c("name")])
l9 <- as.character(data1[which(data1$cat_id==9),c("name")])
l11 <- as.character(data1[which(data1$cat_id==11),c("name")])


