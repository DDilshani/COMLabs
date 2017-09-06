import numpy as np 
from sklearn import datasets
import pandas as pd
from sklearn.naive_bayes import GaussianNB
from sklearn.naive_bayes import MultinomialNB
from sklearn import neighbors
from sklearn import svm
from sklearn.model_selection import train_test_split 
from sklearn.model_selection import cross_val_score
from sklearn.metrics import confusion_matrix
from sklearn import tree

class AnimalTypePrediction:

	def __init__(self, data, target):
		self.X = data
		self.Y = target

	def getTrainingSetAccuracy(self, clf):
		clf.fit(self.X, self.Y)
		print "\nTraining Accuracy : ", clf.score(X, Y)

	def getTrainTestSplitAccuracy(self, clf, test_size):
		X_train, X_test, Y_train, Y_test = train_test_split(self.X, self.Y, test_size = test_size, random_state = 0)
		clf.fit(X_train, Y_train)
		print '\nTest Accuracy : ', clf.score(X_test, Y_test)

	def getCrossValidationAccuracy(self, clf, fold):
		scores = cross_val_score(clf, X, Y, cv = fold)
		print '\n10CV Accuracy : %0.2f (+/- %0.2f)' % (scores.mean(), scores.std()*2)

	def getConfusionMatrix(self, clf, test_size):
		X_train, X_test, Y_train, Y_test = train_test_split(self.X, self.Y, test_size = test_size, random_state = 0)
		clf.fit(X_train, Y_train)
		Y_pred = clf.fit(X_train, Y_train).predict(X_test)
		print '\nConfusion Matrix : '
		print confusion_matrix(Y_test, Y_pred)		







if __name__ == "__main__":
    # Read CSV and load zoo data set
	zooData = pd.read_csv('zooData.csv')

	# Exercise 1
	print zooData.head()

	# if sum(zooData.isnull().values.ravel()) != 0:
	zooData = zooData.fillna(zooData.mean())

	X = map(list, zooData[zooData.columns.difference(['animalName', 'type'])].values)
	# print X
	Y = zooData.type.T.tolist()
	# print Y

	model = AnimalTypePrediction(X, Y)

	# Exercise 2
	# --------------
	clf_DTC = tree.DecisionTreeClassifier()
	model.getTrainingSetAccuracy(clf_DTC)
	model.getTrainTestSplitAccuracy(clf_DTC, 0.333)
	model.getCrossValidationAccuracy(clf_DTC, 10)

	# Exercise 3
	# -------------
	print '\n----------------------------Gaussian Naive Bayes------------------------------\n'
	clf = GaussianNB()
	model.getConfusionMatrix(clf, 0.333)

	print '\n----------------------------Multinomonal Naive Bayes------------------------------\n'
	clf = MultinomialNB()
	model.getConfusionMatrix(clf, 0.333)

	print '\n----------------------------Nearest Neighbor------------------------------\n'
	clf = neighbors.KNeighborsClassifier(n_neighbors = 1)
	model.getConfusionMatrix(clf, 0.333)

	print '\n----------------------------Support Vector Machine------------------------------\n'
	clf = svm.SVC(kernel = 'linear', C = 1, gamma = 1).fit(X, Y)
	model.getConfusionMatrix(clf, 0.333)

	print '\n----------------------------Decision Tree Classifier------------------------------\n'
	model.getConfusionMatrix(clf_DTC, 0.333)