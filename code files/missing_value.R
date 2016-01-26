mising_value<-function(data){

#calculate frequenty of each element    
trt<-data.frame(table(data))

#remove missing values from vector
trt<-trt[trt[,1]!="?",]

#identify most frequent element
most_freq<-trt[trt[,2]==max(trt[,2]),]

return(most_freq[1,1])
  
}