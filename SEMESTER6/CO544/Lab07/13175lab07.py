import numpy as np 
import pandas as pd
import matplotlib.pyplot as plt
from sklearn.cluster import KMeans
from sklearn import datasets
from scipy.cluster.hierarchy import dendrogram, linkage

class Cluster:

	def __init__(self, data):
		self.X = data

	# Clustering by K-means algorithm
	def K_Means(self, start_col, end_col):
		z = self.X[:, start_col:end_col]
		# print z
		est = KMeans(n_clusters = 3, random_state = 0).fit(z)
		return est.labels_

	# Plot the data set using estimated class labels
	def scatterPlot(self, x_col, y_col, labels, index):
		x = self.X[:, x_col]
		# print x
		y = self.X[:, y_col]
		# print y
		axes = plt.subplot(2, 3, index)
		axes.set_title("plane " + str(index))
		axes.scatter(x, y, edgecolors = 'k', c = labels)


if __name__ == "__main__":

    # Read CSV and load zoo data set
	cancer_data = pd.read_csv('breaset-cancer.csv')

	print "\n\nExercise 1: Observe Attributes and Values"
	print "============================================="
	print cancer_data.head()
	cancer_data = cancer_data.fillna(cancer_data.mean())
	# print data

	'''
	Exercise 2
	==========


	'''
	# X = data.iloc[:,1:4]
	X = map(list, cancer_data[cancer_data.columns.difference(['COUNTRY', 'urbanrate'])].values)
	print X


	model = Cluster(X)
	labels = model.K_Means(0, 3)
	print labels

