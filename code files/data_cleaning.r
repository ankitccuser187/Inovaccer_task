
data <- read.csv("C:/Users/ankitccuser/Downloads/Data.csv")
#coloumn names for easy referencing
colnames(data)<-c("A1","A2","A3","A4","A5","A6","A7","A8","A9",
                  "A10","A11","A12","A13","A14","A15","A16")

source('~/Rstudio Scripts/credit score/credit_analysis/missing_value.R')

#missing value management 
  
  for(j in 2:15){
    
    freq_element<-mising_value(data[,j])
    
   for(i in 1:nrow(data)){
     
     if(data[i,j]=="?")
       data[i,j] =freq_element
   }
}

#renaming the data frame
data_t<-data


#coearcing data into cateogarical format
data_t[,1]<-as.factor(data_t[,1])
data_t[,4]<-as.factor(data_t[,4])
data_t[,5]<-as.factor(data_t[,5])
data_t[,6]<-as.factor(data_t[,6])
data_t[,7]<-as.factor(data_t[,7])
data_t[,9]<-as.factor(data_t[,9])
data_t[,10]<-as.factor(data_t[,10])
data_t[,12]<-as.factor(data_t[,12])
data_t[,13]<-as.factor(data_t[,13])
data_t[,16]<-as.factor(data_t[,16])

#coercing data into numerical format
data_t[,2]<-as.numeric(data_t[,2])
data_t[,3]<-as.numeric(data_t[,3])
data_t[,8]<-as.numeric(data_t[,8])
data_t[,11]<-as.numeric(data_t[,11])
data_t[,14]<-as.numeric(data_t[,14])
data_t[,15]<-as.numeric(data_t[,15])



#convert the dataframe into matrix so cateograical variable 
#get discrete numeric values which will be easy for algorithm
data_t<-data.matrix(data_t)


#now conver the matrix back to the dataframe
data_t<-data.frame(data_t)

#normalizing the continous varriable to scale them down
data_t[,2]<-(data_t[,2]-min(data_t[,2]))/(max(data_t[,2])-min(data_t[,2]))
data_t[,3]<-(data_t[,3]-min(data_t[,3]))/(max(data_t[,3])-min(data_t[,3]))
data_t[,8]<-(data_t[,8]-min(data_t[,8]))/(max(data_t[,8])-min(data_t[,8]))
data_t[,11]<-(data_t[,11]-min(data_t[,11]))/(max(data_t[,11])-min(data_t[,11]))
data_t[,14]<-(data_t[,14]-min(data_t[,14]))/(max(data_t[,14])-min(data_t[,14]))
data_t[,15]<-(data_t[,15]-min(data_t[,15]))/(max(data_t[,15])-min(data_t[,15]))







#sample indexes,spliting the dataset
indexes = sample(1:nrow(data_t), size=0.6*nrow(data_t))
train<-data_t[indexes,]
test<-data_t[-indexes,]