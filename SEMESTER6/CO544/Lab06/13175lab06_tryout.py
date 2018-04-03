import numpy as np 
from sklearn import datasets
from sklearn.naive_bayes import GaussianNB
from sklearn.naive_bayes import MultinomialNB
from sklearn import neighbors
from sklearn import svm
from sklearn.model_selection import train_test_split 
from sklearn.model_selection import cross_val_score
from sklearn.metrics import confusion_matrix
from sklearn.metrics import classification_report

iris = datasets.load_iris()
X = iris.data
Y = iris.target

# Gaussian Naive Bayes
print '\n----------------------------Gaussian Naive Bayes------------------------------\n'
clf = GaussianNB()
clf.fit(X, Y)
print "\nTraining Accuracy : ", clf.score(X, Y)

#  Spit data into train and test
X_train, X_test, Y_train, Y_test = train_test_split(X, Y, test_size = 0.333, random_state = 0)
clf.fit(X_train, Y_train)
print '\nTest Accuracy : ', clf.score(X_test, Y_test)

# Cross Validation
scores = cross_val_score(clf, X, Y, cv = 10)
print '\nCross validation scores: '
print scores
print '\n10CV Accuracy : %0.2f (+/- %0.2f)' % (scores.mean(), scores.std()*2)

#  Confusion Matrix
Y_pred = clf.fit(X_train, Y_train).predict(X_test)
print '\nConfusion Matrix : '
print confusion_matrix(Y_test, Y_pred)

# Precision recall details
target_names = ['setosa', 'versicolor', 'virginica']
print '\nPrecision Recall : '
print classification_report(Y_test, Y_pred, target_names = target_names)

# Multinominal Naive Bayes
print '\n----------------------------Multinomonal Naive Bayes------------------------------\n'
clf = MultinomialNB()
clf.fit(X, Y)
print '\nTraining Accuracy : ', clf.score(X, Y)

#  Spit data into train and test
X_train, X_test, Y_train, Y_test = train_test_split(X, Y, test_size = 0.333, random_state = 0)
clf.fit(X_train, Y_train)
print '\nTest Accuracy : ', clf.score(X_test, Y_test)

# Cross Validation
scores = cross_val_score(clf, X, Y, cv = 10)
print '\nCross validation scores : '
print scores
print '\n10CV Accuracy: %0.2f (+/- %0.2f)' % (scores.mean(), scores.std()*2)

#  Confusion Matrix
Y_pred = clf.fit(X_train, Y_train).predict(X_test)
print '\nConfusion Matrix : '
print confusion_matrix(Y_test, Y_pred)

# Precision recall details
print '\nPrecision Recall: '
target_names = ['setosa', 'versicolor', 'virginica']
print classification_report(Y_test, Y_pred, target_names = target_names)

# Nearest Neighbor
print '\n----------------------------Nearest Neighbor------------------------------\n'
clf = neighbors.KNeighborsClassifier(n_neighbors = 1)
clf.fit(X, Y)
print '\nTraining Accuracy: ', clf.score(X, Y)

#  Spit data into train and test
X_train, X_test, Y_train, Y_test = train_test_split(X, Y, test_size = 0.333, random_state = 0)
clf.fit(X_train, Y_train)
print '\nTest Accuracy: ', clf.score(X_test, Y_test)

# Cross Validation
scores = cross_val_score(clf, X, Y, cv = 10)
print '\nCross validation scores : '
print scores
print '\n10CV Accuracy: %0.2f (+/- %0.2f)' % (scores.mean(), scores.std()*2)

#  Confusion Matrix
Y_pred = clf.fit(X_train, Y_train).predict(X_test)
print confusion_matrix(Y_test, Y_pred)

#  Confusion Matrix
Y_pred = clf.fit(X_train, Y_train).predict(X_test)
print '\nConfusion Matrix : '
print confusion_matrix(Y_test, Y_pred)

# Precision recall details
target_names = ['setosa', 'versicolor', 'virginica']
print '\nPrecision Recall: '
print classification_report(Y_test, Y_pred, target_names = target_names)

# Support Vector Machine
print '\n----------------------------Support Vector Machine------------------------------\n'
clf = svm.SVC(kernel = 'linear', C = 1, gamma = 1).fit(X, Y)
clf.fit(X, Y)
print '\nTraining Accuracy : ', clf.score(X, Y)

#  Spit data into train and test
X_train, X_test, Y_train, Y_test = train_test_split(X, Y, test_size = 0.333, random_state = 0)
clf.fit(X_train, Y_train)
print '\nTest Accuracy: ', clf.score(X_test, Y_test)

# Cross Validation
scores = cross_val_score(clf, X, Y, cv = 10)
print '\nCross validation scores : '
print scores
print '\n10CV Accuracy: %0.2f (+/- %0.2f)' % (scores.mean(), scores.std()*2)

#  Confusion Matrix
Y_pred = clf.fit(X_train, Y_train).predict(X_test)
print '\nConfusion Matrix : '
print confusion_matrix(Y_test, Y_pred)

# Precision recall details
target_names = ['setosa', 'versicolor', 'virginica']
print '\nPrecision Recall: '
print classification_report(Y_test, Y_pred, target_names = target_names)