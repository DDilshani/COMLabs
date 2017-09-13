import unittest
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from scipy.cluster.hierarchy import dendrogram, linkage
from sklearn.cluster import KMeans


class TestLabExercise(unittest.TestCase):
    def setUp(self):
        self.bc = pd.read_csv('breaset-cancer.csv')
        self.bc = self.bc.fillna(self.bc.mean())

    def test_for_None(self):
        self.assertFalse(self.bc is None)


def KMeanCluster(X, a, b, label):
    x = X[:, a]
    y = X[:, b]
    plt.scatter(x, y, edgecolors='k', c=label)
    plt.show()


if __name__ == "__main__":
    # Read CSV
    bc = pd.read_csv('breaset-cancer.csv')

    # Fill missing values
    bc = bc.fillna(bc.mean())

    # training = np.array(map(list, bc[bc.columns.difference(['COUNTRY'])].values))
    training = bc.as_matrix()[:, 1:4]

    est = KMeans(n_clusters=3, random_state=0).fit(training)
    labels = est.labels_

    for i in range(2):
        for j in range(i+1, 3):
            KMeanCluster(training, i, j, labels)

    training_HCluster = np.array(map(list, bc[bc.columns.difference(['COUNTRY'])].values))
    Z = linkage(training_HCluster, 'average')

    plt.figure(figsize=(25, 10))
    dendrogram(Z, leaf_rotation=90., leaf_font_size=8)
    dendrogram(Z, truncate_mode='lastp', p=12, show_leaf_counts=False, leaf_rotation=90., leaf_font_size=12,
               show_contracted=True)
    plt.axhline(y=10, c='k')
    plt.show()

    # Unit Testing
    unittest.main()

    ''' 
    -- 2 --        
        random_state is an optional argument to enter the random number generator to be used for K-means algorithm. It 
        is the seed used by the random number generator. If the input is a RandomState instance,it will be used as the 
        random number generator. Default value is None and the random number generator is the RandomState instance 
        used by np.random. 
    '''

    '''
    -- 3 --
        A clear separation of clusters can be observed alone the first feature axis (i.e. INCOMEPERPERSON). Therefore 
        clusters can be said to have a correlation with the first feature of the data set.
    '''

    '''
    -- 5 --
          Hierarchical clustering creates 3 clusters when the distances within a cluster is in the order of 10^10. 
          When the permitted distance is reduced, number of clusters grow.
    '''
