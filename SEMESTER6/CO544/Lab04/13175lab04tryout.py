from sklearn import datasets
from sklearn.linear_model import LogisticRegression
from sklearn.linear_model import LinearRegression
from sklearn.model_selection import train_test_split
import numpy as np

iris = datasets.load_iris()
# print iris

X = iris.data[:, 3:]		#X = iris["data"][:,3:]
#print X
X = np.reshape(X, (-1, 1)) 
# print X

y = iris.target
# print y

# Y = []					
# for i in range(len(y)):
# 	if y[i] == 2:
# 		Y.append(1)
# 	else:
# 		Y.append(0)

Y = (iris["target"] == 2).astype(np.int)
# print Y

X_train, X_val, Y_train, Y_val = train_test_split(X, Y, test_size = 0.2)

# Logistic Regression Model
# -----------------------------
log_reg = LogisticRegression()
log_reg.fit(X_train, Y_train)
Y_proba = log_reg.predict(X_val)
print '----------------------------------Logistic Regression Model--------------------------------------\n'
print 'Original Y values: ', Y_val
print 'Predicted Y values: ', Y_proba
print '\n'

# Linear Regression Model
# ---------------------------------
lin_reg = LinearRegression()
lin_reg.fit(X_train, Y_train)
Y_proba_lin = lin_reg.predict(X_val)
print '------------------------------------Linear Regression Model--------------------------------------\n'
print 'Original Y values: ', Y_val
print 'Predicted Y values: ', Y_proba_lin
print '\n'