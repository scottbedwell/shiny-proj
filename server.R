library(UsingR)
library(ggplot2)
library(caret)
data(father.son)

#with(father.son, plot(fheight,sheight))
qplot(fheight,sheight, data=father.son) + geom_smooth(method = "lm", color = "red")

#modFit <- lm(sheight~.,data=father.son)

modFit <- train(sheight~., data=father.son, method="lm")
summary(modFit)

shinyServer(function(input, output) {
  output$oFatherHeight <- renderPrint({input$fatherHeight})
  output$oSonHeight <- renderPrint({predict(modFit,data.frame(fheight=input$fatherHeight))})
})