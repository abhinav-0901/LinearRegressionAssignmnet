#Impoting Dataset

x_train=read.csv("Linear_X_Train.csv")
y_train=read.csv("Linear_Y_Train.csv")
x_test=read.csv("Linear_X_Test.csv")
datasets=cbind(x_train,y_train)

#Formulate The Model

regressor=lm(formula = y ~ x, data = datasets )
summary(regressor)

#predict for the test set

y_pred=predict(regressor, newdata = x_test)

test_set=cbind(x_test, y_pred)

#visualize the regressor

library(ggplot2)

ggplot()+
  geom_point(aes(x=datasets$x, y= datasets$y), colour='red')+
  geom_line(aes(x=datasets$x, y= predict(regressor, newdata = datasets)), colour='blue')+
  ggtitle("Score v/s Time")+
  xlab("x")+
  ylab("y")

ggplot()+
  geom_point(aes(x=test_set$x, y= test_set$y), colour='red')+
  geom_line(aes(x=datasets$x, y= predict(regressor, newdata = datasets)), colour='blue')+
  ggtitle("Score v/s Time")+
  xlab("x")+
  ylab("y")

