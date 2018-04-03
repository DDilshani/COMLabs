import numpy as np 
import matplotlib.pyplot as plt
from sklearn.cluster import KMeans
from sklearn import datasets
from scipy.cluster.hierarchy import dendrogram, linkage

# Clustering by K-means algorithm
def K_Means(X, start_col, end_col):
	z = X[:, start_col:end_col]
	# print z
	est = KMeans(n_clusters = 3, random_state = 0).fit(z)
	return est.labels_

# Plot the data set using estimated class labels
def scatterPlot(X, x_col, y_col, labels, index):
	x = X[:, x_col]
	# print x
	y = X[:, y_col]
	# print y
	axes = plt.subplot(2, 3, index)
	axes.set_title("plane " + str(index))
	axes.scatter(x, y, edgecolors = 'k', c = labels)

# Load Iris data set
iris = datasets.load_iris()
X = iris.data

# K-means clustering
# ---------------------------------
labels = K_Means(X, 0, 4)
fig = plt.figure(figsize = (20,20))
fig.subplots_adjust(hspace = .2)

scatterPlot(X, 0, 1, labels, 1)
scatterPlot(X, 0, 2, labels, 2)
scatterPlot(X, 0, 3, labels, 3)
scatterPlot(X, 1, 2, labels, 4)
scatterPlot(X, 1, 3, labels, 5)
scatterPlot(X, 2, 3, labels, 6)

plt.show()

# Hierachical Clustering

# Generate linkage matrix ward
Z = linkage(X, 'ward')

# plot dendogram
fig = plt.figure(figsize = (20, 20))
fig.suptitle("Hierarchical Clustering Without Truncation ", fontsize = 16)
dendrogram(Z, leaf_rotation = 90, leaf_font_size = 8)
plt.show()

fig = plt.figure(figsize = (20, 20))
fig.suptitle("Hierarchical Clustering With Truncation ", fontsize = 16)
dendrogram(Z, truncate_mode = 'lastp', p = 12, show_leaf_counts = False, leaf_rotation = 90, leaf_font_size = 12, show_contracted = True)
plt.axhline(y = 10, c ='k')
plt.show()