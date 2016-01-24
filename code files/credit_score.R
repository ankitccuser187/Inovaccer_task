#loading required packages
library(grid)
library(MASS)
library(neuralnet)
library(graphics)
library(ggplot2)
library(caret)


source('~/Rstudio Scripts/credit score/credit_analysis/data_cleaning.r')

#generating linear formulla
n <- names(data_t)
f <- as.formula(paste("A16 ~", paste(n[!n %in% "A16"], collapse = " + ")))



nn<-neuralnet(f,data = train,linear.output = FALSE,err.fct = "ce",
              algorithm = "rprop+",learningrate = 0.3,stepmax =5e6,
              threshold = 0.01,lifesign = "FULL",lifesign.step = 100,hidden = c(4),
              rep = 5)

plot(nn)

#run the model onto test dataset
rn<-compute(nn,covariate =test[,1:15])

rn<-data.frame(rn$net.result)

#output neuron will produce the result in terms of probablity
#convert it into logstic terms
for(i in 1:nrow(rn)){
  if(rn[i,1]>=0.5)
    rn[i,1]<-1
  else
    rn[i,1]<-0
}

test<-cbind(test,rn)

#visualize the confussion matrix
print(confusionMatrix(test[,17],test[,16],dnn = c("prediction","reference")))