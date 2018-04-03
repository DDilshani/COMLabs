import numpy as np
import csv

class Sn:
	"""Calculation for Sn"""
	def __init__(self, data):
		self.data = data

	def getMean(self):

		"""Calculating mean of each column"""
		return np.mean(self.data, axis=0)

	def getSn(self):
		
		"""Calculating sN of each column"""

		snTemp = []

		rows = len(matrix)
		cols = len(matrix.T)

		meanMatrix = self.getMean()

		for i in range(cols):

			square_sum = np.sum((self.data[:, i] - meanMatrix[i])**2)
			sn = np.sqrt(square_sum/ (rows - 1))
			snTemp.append(sn)

		return snTemp
					

if __name__ == "__main__":
	
	# Read CSV file
	csv_path = "labExercise01.csv"
	reader = csv.reader(open(csv_path, "rb"), delimiter=",")
	readerList = list(reader)
	
	# Convert data into numpy 2D array
	matrix = np.array(readerList).astype(np.float_)
	# print(matrix)

	# Calculate sN
	snObj = Sn(matrix)
	snList = snObj.getSn()
	print 'sN Result : ', snList