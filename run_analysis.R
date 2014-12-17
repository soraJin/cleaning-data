#tranform all the txt files to matlab files
#library(R.matlab)
test= data.frame(readMat("X_test.mat"))
train=data.frame(readMat("x_train.mat"))
type=read.table("features.txt")
type=as.character(type$V2)
#subtrain the columns in test and train which contains mean or std
trainsub= train[,c(grep("mean|std",type,value=FALSE))]
testsub= test[,c(grep("mean|std",type,value=FALSE))]

#replace the columns in trainsub and testsub to typesub
typesub=type[grep("mean|std", type, value=FALSE)]
colnames(trainsub)[1:79] = typesub
colnames(testsub)[1:79] = typesub

#read y files and combind x and y files
ytest=as.data.frame(read.table("ytest.txt"))
ytrain=as.data.frame(read.table("y_train.txt "))
testmer=cbind(ytest,testsub)
trainmer=cbind(ytrain,trainsub)

#get the mean of each column
for (i in 1:6)
{
  a[i]= testmer[c(grep("i",testmer$V1,value=FALSE)),]
b[i] = trainmer[c(grep("i",trainmer$V1,value=FALSE)),]
ab[i]=merge(a,b,all=TRUE)
meanab[i]=lapply(ab[i],mean)
}
meantotal=cbind(meanab[3],meanab[2],meanab[3],meanab[4],meanab[5],meanab[6])

number=c(rep(1,79),rep(2,79),rep(3,79),rep(4,79),rep(5,79),rep(6,79))
result= c(meantotal[2:80,1],meantotal[2:80,2],meantotal[2:80,3],meantotal[2:80,4],meantotal[2:80,5],meantotal[2:80,6])
df<- cbind(number,activity,result)

#save df table
#write.table(df,file="G:/datascience/3. cleaningdata/project/tidydata.txt", row.names=FALSE)

