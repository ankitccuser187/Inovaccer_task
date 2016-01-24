#this code file is to run the classification using SVM
#loading required packages
library(e1071)
library(graphics)
library(ggplot2)
library(caret)
library(ROCR)

#transfer the control to data cleaning script for data loading and preprocessing
source('~/Rstudio Scripts/credit score/credit_analysis/data_cleaning.r')

#generating linear formulla


svmfit<-svm(A16~.,data = train,kernel="linear",
            type="C-classification")

print(svmfit)

result<-predict(svmfit,test[,1:15])

test<-cbind(test,result)

#visualize the confussion matrix
print(confusionMatrix(test[,17],test[,16],dnn = c("prediction","reference")))

