
Data <- read.csv("C:/Users/ankitccuser/Downloads/Data.csv")
#coloumn names for easy referencing
colnames(Data)<-c("A1","A2","A3","A4","A5","A6","A7","A8","A9",
                  "A10","A11","A12","A13","A14","A15","A16")

#convert the datarae into matrix
data_t<-data.matrix(Data)

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



#replace the missing values with most frequent column values
for(i in 1:nrow(data_t)){
  
  for(j in 1:15)
    
    if(data_t[i,j]==1)
      data_t[i,j]<-mean(data_t[,j])
}

data_t<-data.frame(data_t)

#normalizing the continous varriable to scale them down
data_t[,2]<-(data_t[,2]-min(data_t[,2]))/(max(data_t[,2])-min(data_t[,2]))
data_t[,3]<-(data_t[,3]-min(data_t[,3]))/(max(data_t[,3])-min(data_t[,3]))
data_t[,8]<-(data_t[,8]-min(data_t[,8]))/(max(data_t[,8])-min(data_t[,8]))
data_t[,11]<-(data_t[,11]-min(data_t[,11]))/(max(data_t[,11])-min(data_t[,11]))
data_t[,14]<-(data_t[,14]-min(data_t[,14]))/(max(data_t[,14])-min(data_t[,14]))
data_t[,15]<-(data_t[,15]-min(data_t[,15]))/(max(data_t[,15])-min(data_t[,15]))

#replacing the target values with conventinal notations
for(i in 1:nrow(data_t)){
  if(data_t$A16[i]==1)
    data_t$A16[i]<-0
}

for(i in 1:nrow(data_t)){
  if(data_t$A16[i]==2)
    data_t$A16[i]<-1
}

#normalizing the continious varriables

#sample indexes,spliting the dataset
indexes = sample(1:nrow(data_t), size=0.6*nrow(data_t))
train<-data_t[indexes,]
test<-data_t[-indexes,]