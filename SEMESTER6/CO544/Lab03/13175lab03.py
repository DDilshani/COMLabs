import numpy as np
import pandas as pd
import unittest

class DataFrameAnalysis:

	def __init__(self, dataFrame):
		self.dataFrame = dataFrame
		self.size = dataFrame.shape[1]

	def getCovariance(self, X, Y):
		X_mean = X.mean()
		Y_mean = Y.mean()
		covariance = (((X - X_mean) * (Y - Y_mean)).sum()) / (X.count() - 1)
		return covariance

	def getStandardDeviation(self, data):
		data_mean = data.mean()
		variance = self.getCovariance(data, data)
		std = np.sqrt(variance)
		return std

	def getCorrelation(self, X, Y):
		covariance = self.getCovariance(X, Y)
		sd_X = self.getStandardDeviation(X)
		sd_Y = self.getStandardDeviation(Y)
		return covariance / (sd_X * sd_Y)

	def getCovarianceMatrix(self):
		cov_matrix = np.eye(self.size)

		for i in range(self.size):
			for j in range(self.size):
				if i == j:
					cov_matrix[i, j] = self.getCovariance(self.dataFrame.iloc[:, i], self.dataFrame.iloc[:, i])
				else:
					cov_matrix[i, j] = self.getCovariance(self.dataFrame.iloc[:, i], self.dataFrame.iloc[:, j])
					
		return cov_matrix

	def getCorrelationMatrix(self):
		cor_matrix = np.eye(self.size);

		for i in range(self.size):
			for j in range(self.size):
				if i == j:
					cor_matrix[i, j] = self.getCorrelation(self.dataFrame.iloc[:, i], self.dataFrame.iloc[:, i])
				else:
					cor_matrix[i, j] = self.getCorrelation(self.dataFrame.iloc[:, i], self.dataFrame.iloc[:, j])
					
		return cor_matrix

class DataFrameAnalysisTest(unittest.TestCase):

	def setUp(self):
		self.s1 = pd.Series([10.0, 20.0, 30.0, 40.0, 50.0])
		self.s2 = pd.Series([60.0, 70.0, 80.0, 90.0, 100.0])
		self.s3 = pd.Series([120.0, 130.0, 140.0, 150.0, 160.0])

		data = [[10.0, 20.0, 30.0, 40.0, 50.0], [60.0, 70.0, 80.0, 90.0, 100.0], [110.0, 120.0, 130.0, 140.0, 150.0]]

		data_frame = pd.DataFrame(data, index=None)

		self.df = DataFrameAnalysis(data_frame)


	def test_getCovariance(self):
		actual = self.df.getCovariance(self.s1, self.s2)
		expected = 250.0

		self.assertEquals(actual, expected)

	def test_getCorrelation(self):
		cor = self.df.getCorrelation(self.s1, self.s2)
		actual = np.around(cor, decimals = 4)
		expected = np.float64(1.0000)

		self.assertEquals(actual, expected)

	def test_getStandardDeviation(self):
		std = self.df.getStandardDeviation(self.s1)
		actual = np.around(std, decimals = 4)
		expected = np.float64(15.8114)

		self.assertEquals(actual, expected)

	def test_getCovarianceMatrix(self):
		conv_mat = self.df.getCovarianceMatrix()
		actual = np.around(conv_mat, decimals = 4)
		expected = [[2500.0, 2500.0, 2500.0, 2500.0, 2500.0], [2500.0, 2500.0, 2500.0, 2500.0, 2500.0], [2500.0, 2500.0, 2500.0, 2500.0, 2500.0], [2500.0, 2500.0, 2500.0, 2500.0, 2500.0], [2500.0, 2500.0, 2500.0, 2500.0, 2500.0]]

		self.assertFalse((actual - expected).all())

	def test_getCorrelationMatrix(self):
		conv_mat = self.df.getCorrelationMatrix()
		actual = np.around(conv_mat, decimals = 4)
		expected = [[1.0, 1.0, 1.0, 1.0, 1.0], [1.0, 1.0, 1.0, 1.0, 1.0], [1.0, 1.0, 1.0, 1.0, 1.0], [1.0, 1.0, 1.0, 1.0, 1.0], [1.0, 1.0, 1.0, 1.0, 1.0]]

		self.assertFalse((actual - expected).all())





if __name__ == "__main__":

    # Read CSV file
    df = pd.read_csv('lab03Exercise.csv', names = ['channel1', 'channel2', 'channel3', 'channel4', 'channel5'])
    print df

    # Fill missing values
    df = df.fillna(df.mean())
    # print df.shape[1]

    # Creating DataFrame object
    data_frame = DataFrameAnalysis(df)

    # Finding covariance and correlation matrices
    cov_matrix = data_frame.getCovarianceMatrix()
    cor_matrix = data_frame.getCorrelationMatrix()
    
    print '---------- covariance Matrix ----------\n'
    print cov_matrix
    print '\n'

    print '---------- Correlation Matrix ----------\n'
    print cor_matrix
    print '\n'

    unittest.main()


'''
Answers
--------
2) 

3) The given condition does not divide the data set into two classes.

'''
					
				
			


		
