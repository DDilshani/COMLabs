from sklearn import datasets
from sklearn.linear_model import LogisticRegression
from sklearn.linear_model import LinearRegression
from sklearn.model_selection import train_test_split
import numpy as np

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