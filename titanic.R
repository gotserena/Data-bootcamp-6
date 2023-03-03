
library(tidyverse)
library(titanic)
data('titanic_train')
head(titanic_train)

glimpse(titanic_train)

titanic_train=na.omit(titanic_train)
titanic_train$Sex=if_else(titanic_train$Sex=="male",0,1)

set.seed(103)
n=nrow(titanic_train)
id=sample(1:n,size=n*0.7)
train_data=titanic_train[id,]
test_data=titanic_train[-id,]

model=glm(Survived~Pclass+Age+Sex,data=train_data,family = 'binomial')
summary(model)

train_data$prob_Survived=predict(model,type ='response')
train_data$pred_Survived = if_else(train_data$prob_Survived >= 0.5,1,0)

test_data$prob_Survived=predict(model,newdata = test_data,type = 'response')
test_data$pred_Survived=if_else(test_data$prob_Survived>=0.5,1,0)

train_confusion=table(train_data$pred_Survived,train_data$Survived,dnn = c('predicted','actual'))
train_acc = (train_confusion[1,1] + train_confusion[2,2]) / sum(train_confusion)
train_prec = train_confusion[2,2] / (train_confusion[2,1] +train_confusion[2,2])
train_rcall = train_confusion[2,2] / (train_confusion[1,2] +train_confusion[2,2])
train_f1 = 2 * ( (train_prec*train_rcall)/(train_prec+train_rcall) )

test_confusion=table(test_data$pred_Survived,test_data$Survived,dnn =c('predicted','actual') )
test_acc = (test_confusion[1,1] + test_confusion[2,2]) / sum(test_confusion)
test_prec = test_confusion[2,2] / (test_confusion[2,1] +test_confusion[2,2])
test_rcall = test_confusion[2,2] / (test_confusion[1,2] +test_confusion[2,2])
test_f1 = 2 * ( (test_prec*test_rcall)/(test_prec+test_rcall) )

cat('train model',"\nAccracy:",train_acc,'\nPrecision',train_prec,'\nRecall',train_rcall,'\nF1 Score',train_f1)
cat('test model',"\nAccracy:",test_acc,'\nPrecision',test_prec,'\nRecall',test_rcall,'\nF1 Score',test_f1)
