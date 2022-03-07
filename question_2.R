library(glmnet)
data = read.csv("feature_data.csv")
library(corrplot)
data.cor <- cor(data)
corrplot(data.cor, method = "ellipse") #���ع���������

library(leaps)
sub.fit <- regsubsets(buy ~ ., data = data)# ִ�������Ӽ��ع�
best.summary <- summary(sub.fit)
#����ģ�����۱�׼�ҵ�����ָ��
which.min(best.summary$cp)#����˹Cpֵ
which.max(best.summary$adjr2) #����R2
which.min(best.summary$bic) #��Ҷ˹��Ϣ׼��

plot(best.summary$adjr2, type = "l",xlab = "numbers of Features", 
     ylab = "adjr2",main = "adjr2 by Feature Inclusion")

plot(sub.fit, scale = "adjr2",main = "Best Subset Features")
# coef(sub.fit,5)