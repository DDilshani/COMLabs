import numpy as np 
import pandas as pd
import matplotlib.pyplot as plt
from sklearn.cluster import KMeans
from scipy.cluster.hierarchy import dendrogram, linkage
import unittest

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
		axes = plt.subplot(1, 3, index)
		axes.set_title("Features: " + str(x_col) + " and " + str(y_col))
		axes.scatter(x, y, edgecolors = 'k', c = labels)

	def getLinkageMatrix(self, method):
		return linkage(self.X, method)

class ClusterTest(unittest.TestCase):
    def setUp(self):
        self.cancer_data = pd.read_csv('breaset-cancer.csv')
        self.cancer_data = self.cancer_data.fillna(self.cancer_data.mean())

    def test_None(self):
        self.assertFalse(self.cancer_data is None)


if __name__ == "__main__":

    # Read CSV and load zoo data set
	cancer_data = pd.read_csv('breaset-cancer.csv')

	print "\n\nExercise 1: Observe Attributes and Values"
	print "============================================="
	print cancer_data.head()
	cancer_data = cancer_data.fillna(cancer_data.mean())

	# Etract X as values of first 3 features
	X1 = cancer_data.as_matrix()[:, 1:4]
	# print X1

	# Create Cluster object
	model = Cluster(X1)

	# K-means clustering
	# ---------------------------------
	print "\n\nExercise 3: K-Means Cluster Analyasis"
	print "========================================="
	labels = model.K_Means(0, 3)
	print labels

	fig = plt.figure(figsize = (25,10))
	fig.subplots_adjust(hspace = .2)

	model.scatterPlot(0, 1, labels, 1)
	model.scatterPlot(0, 2, labels, 2)
	model.scatterPlot(1, 2, labels, 3)

	plt.show()

	# Hierachical Clustering
	# -------------------------------------------
	print "\n\nExercise 4: Hierarchical Cluster Analysis"
	print "============================================="

	# Etract X as values of first 3 features
	X2 = cancer_data.as_matrix()[:, 1:16]
	# print X2

	# Create new Cluster object with all data
	model = Cluster(X2)

	# Generate linkage matrix ward
	Z = model.getLinkageMatrix('average')

	# plot dendogram
	fig = plt.figure(figsize = (30, 15))
	fig.suptitle("Hierarchical Clustering Without Truncation ", fontsize = 16)
	dendrogram(Z, leaf_rotation = 90, leaf_font_size = 8)
	plt.show()

	fig = plt.figure(figsize = (15, 10))
	fig.suptitle("Hierarchical Clustering With Truncation ", fontsize = 16)
	dendrogram(Z, truncate_mode = 'lastp', p = 12, show_leaf_counts = False, leaf_rotation = 90, leaf_font_size = 12, show_contracted = True)
	plt.axhline(y = 0.5*10**11, c ='k')
	plt.show()

	unittest.main()


	'''
	Answers:
	========

	2) random state is an optional argument to provide a random generator to be used in the K-Means 
	algorithm. random state is used as the seed for the ransom number generator. I can be a int, 
	RandomState instance or None where None is the default configuration. For None, the random 
	generator is the RandomState instance used by np.random 

	3) A clear separation of clusters can be seen when the 1st feature (INCOMEPERPERSON) 
	is encorporated for the K-means clustering. Therefore, clusters show a high correlation 
	with the 1 st feature.

	5) Hierarchical clustering creates 3 clusters when the the distance cut off line lies 
	between approximately (0.25-1.0)*10^11. When the permitted distance reduces for the 
	distance cut off line the number of clusters increases.
	'''

