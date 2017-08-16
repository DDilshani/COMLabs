import numpy as np
import pandas as pd
from sklearn import tree
import pydotplus
from IPython.display import Image
from PIL import Image as img
from PIL import ImageDraw
import unittest

class CancerDecisionTree:

    def __init__(self, target, data):
        self.target = target
        self.data = data











if __name__ == '__main__':

    # Load the data from csv file
    data = pd.read_csv('breast-cancer.csv')
    data = data.fillna(data.mean())

    # Set BREASTCANCERPER100TH as the target
    target = data['BREASTCANCERPER100TH']
    del data['BREASTCANCERPER100TH']

    # Remove the COUNTRY data in data set
    del data['COUNTRY']

#     Create CancerDecisionTree object
    cancer = CancerDecisionTree(target, data)



