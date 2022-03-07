library(glmnet)
data = read.csv("feature_data.csv")
library(corrplot)
data.cor <- cor(data)
corrplot(data.cor, method = "ellipse") #多重共线性问题

library(leaps)
sub.fit <- regsubsets(buy ~ ., data = data)# 执行最优子集回归
best.summary <- summary(sub.fit)
#按照模型评价标准找到评价指标
which.min(best.summary$cp)#马洛斯Cp值
which.max(best.summary$adjr2) #调整R2
which.min(best.summary$bic) #贝叶斯信息准则

plot(best.summary$adjr2, type = "l",xlab = "numbers of Features", 
     ylab = "adjr2",main = "adjr2 by Feature Inclusion")

plot(sub.fit, scale = "adjr2",main = "Best Subset Features")
# coef(sub.fit,5)