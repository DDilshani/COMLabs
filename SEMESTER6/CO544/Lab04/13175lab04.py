import pandas as pd
import numpy as np
import sklearn as skl
from sklearn.linear_model import LogisticRegression
from sklearn.linear_model import LinearRegression
from sklearn.model_selection import train_test_split
import unittest

class PredicAngles:

	def __init__(self, pathToCSV1, pathToCSV2):
		# Load the data from csv file
		self.angle_df = pd.read_csv(pathToCSV1, names = ['angle1', 'angle2', 'angle3'])
		self.channel_df = pd.read_csv(pathToCSV2, names = ['channel1', 'channel2', 'channel3', 'channel4', 'channel5'])
		self.data = None

	def mergeDataFrames(self):
		# Merge to one data frame
		self.data = pd.merge(self.channel_df, self.angle_df, left_index = True, right_index = True)


	def buildLinearRegressionModel(self):

		# Defining X and Y
		X = self.data[['channel1', 'channel2', 'channel3', 'channel4', 'channel5']]
		Y = self.data['angle1']

		# Split data into tst data and train data
		X_train, X_val, Y_train, Y_val = train_test_split(X, Y, test_size = 0.33)

		# Train the splitted train data
		lin_reg = LinearRegression()
		lin_reg.fit(X_train, Y_train)

		# Predict for values
		Y_proba_lin = lin_reg.predict(X_val)

		# Get accuracy for the model
		lin_reg_accuracy = skl.metrics.accuracy_score(np.rint(Y_val), np.rint(Y_proba_lin))
	
		return lin_reg_accuracy


class PredictAnglesTest(unittest.TestCase):

	def setUp(self):
		self.model_test = PredicAngles('lab04ExerciseAngles.csv', 'lab04ExerciseChannels.csv')

	def test_init(self):
		actual = self.model_test
		expected = not None

		self.assertTrue(actual, expected)

	def test_mergeDataFrames(self):
		self.model_test.mergeDataFrames()
		
		actual =  self.model_test.data.empty
		expected = False
		
		self.assertEquals(actual, expected)

	def test_mergeSize_mergeDataFrames(self):
		self.model_test.mergeDataFrames()
		
		actual =  self.model_test.data.shape[1]
		expected = 8
		
		self.assertEquals(actual, expected)


if __name__ == '__main__':

	# Create the model
	model = PredicAngles('lab04ExerciseAngles.csv', 'lab04ExerciseChannels.csv')
 
	# Merge to one data frame
	model.mergeDataFrames()

	# build the reggression model
	accuracy = model.buildLinearRegressionModel();

	print "Accuracy for Linear Regression Model: ", accuracy

	unittest.main()

"""
3) 	Linear Regression is used for the model building. 
 	This is because, it is required to predict angles and they are continuous values. 
 	The output of Linear Regression gives continous numerical values whereas, 
 	Logistic Regression gives discrete boolean values.

4) 	All channels are selectedas features as there is no data given about the connection between angles and channels.
 	Angle 1 is selected for predicting.

5) 	Accuracy of the model is very low as the correlation between the angles and channels are very low. 
	Also as splitting the data is done at random the accuracy can be low as several predictiuon is done only once. 

"""