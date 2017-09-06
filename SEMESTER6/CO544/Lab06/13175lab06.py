import numpy as np 
from sklearn import datasets
import pandas as pd
from sklearn.naive_bayes import GaussianNB, MultinomialNB, BernoulliNB
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
		print '\n10CV Accuracy : %0.2f (+/- %0.2f)\n' % (scores.mean(), scores.std()*2)

	def getConfusionMatrix(self, clf, test_size):
		X_train, X_test, Y_train, Y_test = train_test_split(self.X, self.Y, test_size = test_size, random_state = 0)
		clf.fit(X_train, Y_train)
		Y_pred = clf.fit(X_train, Y_train).predict(X_test)
		print '\nConfusion Matrix : '
		print confusion_matrix(Y_test, Y_pred)		


if __name__ == "__main__":

    # Read CSV and load zoo data set
	zoo_data = pd.read_csv('zooData.csv')

	# Exercise 1
	print zoo_data.head()

	# if sum(zoo_data.isnull().values.ravel()) != 0:
	zoo_data = zoo_data.fillna(zoo_data.mean())

	# Extract data and target
	X = map(list, zoo_data[zoo_data.columns.difference(['animalName', 'type'])].values)
	Y = zoo_data.type.T.tolist()

	# Create AnimalTypePrediction data model
	model = AnimalTypePrediction(X, Y)

	# Exercise 2
	# --------------
	print '\n----------------------------Decision Tree Classifier------------------------------\n'
	clf_DTC = tree.DecisionTreeClassifier()
	model.getTrainingSetAccuracy(clf_DTC)
	model.getTrainTestSplitAccuracy(clf_DTC, 0.333)
	model.getCrossValidationAccuracy(clf_DTC, 10)

	'''
	Testing option by splitting the data as 2/3 for training and 1/3 for testing 
	gives more realistic future performance.

	This is because for large data sets this option gives better performace as 
	spliting the data and building the model 
	'''

	# Exercise 3
	# -------------
	print '\n----------------------------Confusion Matrix-------------------------------------------------\n'
	print '\n----------------------------Gaussian Naive Bayes-----------------------------------\n'
	clf_GNB = GaussianNB()
	model.getConfusionMatrix(clf_GNB, 0.333)

	print '\n----------------------------Multinomonal Naive Bayes-------------------------------\n'
	clf_MNB = MultinomialNB()
	model.getConfusionMatrix(clf_MNB, 0.333)

	print '\n----------------------------Nearest Neighbor---------------------------------------\n'
	clf_NNC = neighbors.KNeighborsClassifier(n_neighbors = 1)
	model.getConfusionMatrix(clf_NNC, 0.333)

	print '\n----------------------------Support Vector Machine---------------------------------\n'
	clf_SVM = svm.SVC(kernel = 'linear', C = 1, gamma = 1).fit(X, Y)
	model.getConfusionMatrix(clf_SVM, 0.333)

	print '\n----------------------------Decision Tree Classifier------------------------------\n'
	model.getConfusionMatrix(clf_DTC, 0.333)

	# Exercise 4
	# -------------
	print '\n----------------------------10 Fold Cross Validation--------------------------------------\n'
	print '\n----------------------------Gaussian Naive Bayes----------------------------------\n'
	model.getCrossValidationAccuracy(clf_GNB, 10)

	print '\n----------------------------Multinomonal Naive Bayes------------------------------\n'
	model.getCrossValidationAccuracy(clf_MNB, 10)

	print '\n----------------------------Nearest Neighbor--------------------------------------\n'
	model.getCrossValidationAccuracy(clf_NNC, 10)

	print '\n----------------------------Support Vector Machine--------------------------------\n'
	model.getCrossValidationAccuracy(clf_SVM, 10)

	print '\n----------------------------Decision Tree Classifier------------------------------\n'
	model.getCrossValidationAccuracy(clf_DTC, 10)

	# Exercise 5
	# -------------
	print '\n----------------------------Another Algorithm--------------------------------------\n'
	print '\n----------------------------Bernoulli Naive Bayes----------------------------------\n'
	clf_BNB = BernoulliNB()
	model.getTrainingSetAccuracy(clf_BNB)
	model.getCrossValidationAccuracy(clf_GNB, 10)
	model.getTrainTestSplitAccuracy(clf_BNB, 0.333)
	model.getConfusionMatrix(clf_BNB, 0.333)

