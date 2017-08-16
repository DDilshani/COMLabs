import numpy as np
import pandas as pd
from sklearn import tree
from sklearn.model_selection import train_test_split
import pydotplus
from IPython.display import Image
from PIL import Image as img
import sklearn as skl
import unittest

class CancerPrediction:

    def __init__(self, target, data):
        self.target = target
        self.data = data

    def getTargetValuesToBinary(self, value):
    	# split the data into binary by given value

    	for row in range(self.target.size):
    		if self.target.values[row] > value:
    			self.target.values[row] = 1;
    		else:
    			self.target.values[row] = 0;

    def getDataValuesToBinary(self, column):
    	# split the data into binary by mean value of the column

    	mean =  self.data.values[:, column].mean();

    	for row in range(self.data.values[:, column].size):
    		if self.data.values[:, column][row] > mean:
    			self.data.values[:, column][row] = 1;
    		else:
    			self.data.values[:, column][row] = 0;

    def trainDataSplit(self, fraction):
    	# Split target and data in to train data and test data by given fraction
    	# given fraction is the test size as a fraction

    	self.target_train, self.target_test = train_test_split(self.target, test_size = fraction)
    	self.data_train, self.data_test = train_test_split(self.data, test_size = fraction)


    def dataPredict(self):

		# Constructing decision tree using train data set
		clf = tree.DecisionTreeClassifier()
		clf = clf.fit(self.data_train, self.target_train)

		# Generating png Image
		dot_data = tree.export_graphviz(clf, out_file=None,  
					filled = True, 
					rounded = True, 
					special_characters = True)

		graph = pydotplus.graph_from_dot_data(dot_data)
		Image(graph.create_png())
		graph.write_png("breast-cancer.png")

		# Showing Image
		image = img.open("breast-cancer.png")
		image.show()

		#  Predict values
		predicted_values = clf.predict(self.data_test)

		# Get accuracy
		accuracy = skl.metrics.accuracy_score(self.target_test, predicted_values)

		return accuracy

class CancerPredictionTest(unittest.TestCase):

	def setUp(self):
		data = [[10, 20, 30, 40, 50], [60, 70, 80, 90, 100], [110, 120, 130, 140, 150]]
		data_frame = pd.DataFrame(data, index=None)
		target = data_frame.iloc[:, 0:1]

		self.cancer_test = CancerPrediction(target, data_frame)


	def test_getTargetValuesToBinary(self):
		self.cancer_test.getTargetValuesToBinary(50)

		actual = self.cancer_test.target
		expected = [0, 1, 1]
		expected = pd.DataFrame(expected, index=None)

		self.assertTrue(actual.equals(expected));

	def test_getDataValuesToBinary(self):
		self.cancer_test.getDataValuesToBinary(0)
		self.cancer_test.getDataValuesToBinary(1)
		self.cancer_test.getDataValuesToBinary(2)
		self.cancer_test.getDataValuesToBinary(3)
		self.cancer_test.getDataValuesToBinary(4)

		actual = self.cancer_test.data
		expected = [[0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [1, 1, 1, 1, 1]]
		expected = pd.DataFrame(expected, index=None)

		self.assertTrue(actual.equals(expected))


if __name__ == '__main__':

    # Load the data from csv file
    data = pd.read_csv('breaset-cancer.csv')
    data = data.fillna(data.mean())

    # Set BREASTCANCERPER100TH as the target
    target = data['BREASTCANCERPER100TH']
    del data['BREASTCANCERPER100TH']

    # Remove the COUNTRY data in data set
    del data['COUNTRY']

	# Create CancerDecisionTree object
    cancer = CancerPrediction(target, data)

    # Convert target values to binary using value 20
    cancer.getTargetValuesToBinary(20)

    # Convert data values to binary using mean value
    for column in range(cancer.data.shape[1]):
    	cancer.getDataValuesToBinary(column)

    # Split data into train data and test data as train data gets 2/3 and test data gets 1/3 portion
    cancer.trainDataSplit(0.33);

    # Calculate accuracy
    accuracy = cancer.dataPredict();

    print "Prediction Accuracy for data set: ", accuracy

    unittest.main()




