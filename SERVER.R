
server <- function(input, output){
  
  
  output$accident_plot<- renderPlot({
 
    ggplot(Accident.Data...Sheet1,aes(x=Accident.Data...Sheet1$Age, color = Accident.Data...Sheet1[[input$types]])) + 
      geom_histogram(bins = input$bins, fill = "white") 
  
  })
  
  output$acc1_plot<- renderPlot({
    library(dplyr)
    Accident.Data...Sheet1 %>% ggplot(aes(x=Accident.Data...Sheet1$Age, fill = Accident.Data...Sheet1[[input$types]])) + geom_density(alpha=0.8, color="black") + ggtitle("Density plot")
    
    
  })
  
  output$acc2_plot<- renderPlot({
    
    library(naivebayes)
    model <- naive_bayes(Accident.Data...Sheet1[[input$types]] ~  Accident.Data...Sheet1[[input$types1]] + Accident.Data...Sheet1[[input$types2]]  , data = Accident.Data...Sheet1)
    model
    plot(model)
  })
  

}