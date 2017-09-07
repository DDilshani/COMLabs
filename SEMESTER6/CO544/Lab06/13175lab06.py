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

	print "\n\nExercise 1: Observe Attributes and Values"
	print "============================================="
	print zoo_data.head()

	# if sum(zoo_data.isnull().values.ravel()) != 0:
	zoo_data = zoo_data.fillna(zoo_data.mean())

	# Extract data and target
	X = map(list, zoo_data[zoo_data.columns.difference(['animalName', 'type'])].values)
	Y = zoo_data.type.T.tolist()

	# Create AnimalTypePrediction data model
	model = AnimalTypePrediction(X, Y)

	print "\n\nExercise 2: Decision Tree Classifier Evaluation"
	print "==================================================="
	clf_DTC = tree.DecisionTreeClassifier()
	model.getTrainingSetAccuracy(clf_DTC)
	model.getTrainTestSplitAccuracy(clf_DTC, 0.333)
	model.getCrossValidationAccuracy(clf_DTC, 10)

	'''
	Testing option by cross validation gives more realistic future performance for this data set.

	This is because considering the accuracies this one is the best. 
	This option is also known to be better for small data sets like this one containing about 100.
	Although training accuracy has the highest value , it is not giving realistic future performance as new future data can be vastly different from training data.
	Train / Test split option is better for very large data sets where in this case it not giving high accuracy as the data set is small. 
	'''

	print "\n\nExercise 3: Confusion Matrix"
	print "================================"
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

	'''
	Confusion Matrix Outputs
	------------------------

	The number of wrong predictions of the classification algorithms:
		Gaussian NB = 3
		Multinominal NB = 3
		Nearest Neighbour = 2
		SVM = 2
		Decision Tree = 1

	Hence, the decision tree classifier predicts more accurately than others. 
	Nearest Neighbour and SVM predicts more accurately than Gaussian and Multinominal Naive Bayes algorithms.  

	'''

	print '\n\nExercise 4: 10 Fold Cross Validation'
	print "========================================"
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

	print "\n\nExercise 5: Evaluaton of Another Algorithm"
	print "=============================================="
	print '\n----------------------------Bernoulli Naive Bayes----------------------------------\n'
	clf_BNB = BernoulliNB()
	model.getTrainingSetAccuracy(clf_BNB)
	model.getTrainTestSplitAccuracy(clf_BNB, 0.333)
	model.getCrossValidationAccuracy(clf_GNB, 10)
	model.getConfusionMatrix(clf_BNB, 0.333)

	'''
	Considering the 10 fold classification option, the Bournoulli Naive Bayes 
	classification has more accuracy tha multinominal Naive Bayes algorithm while 
	it has equivalent accuracy with Gaussian Naive Bayes and Support Vector machine. 
	But it has lower accuracy than Nearest Neighbour classification.  
	'''

	

