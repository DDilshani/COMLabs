import pandas as pd
import numpy as np

# Create a series with list
s = pd.Series([2, 4, 1, -4, 'home'], index= ['a', 'b', 'c', 'd', 'e'])

# create data frame witha dictionary
data = {'population': [1.5, 1.7, 3.6, 2.4, 2.9],
'state': ['Ohio','Ohio', 'Ohio', 'Nevada', 'Nevada'],
'year': [2000, 2001, 2002, 2001, 2002]}

df = pd.DataFrame(data, columns = ['year', 'state', 'population', 'debt'], index = ['one', 'two', 'three', 'four', 'five'])

# print s
# print s[['a', 0]]
# print s.values[2:]
# print df[['population', 'state']]
# print df.population
# print df.ix[0:,]
# print df.ix [2:4: ,2]
# print df.iloc [2:4: ,2]
# print df.loc['one']
# df.debt = 34.67
# print df
df.debt = [df.ix[:,2][i]*5 for i in range(0, df.shape[0])]
# print df
# print df.shape[0]
# print df.head()
# print df.tail()
# print df.sample(n=5)
df['newColumn'] = pd.Series(np.random.randn(df.shape [0]), index=df.index)
# print df

# Loading Data from CSV file
df = pd.read_csv('sampleDataSet.csv')
# print df.shape
# print df
df = pd.read_csv ('sampleDataSet.csv', names = ['a','b','c','d','e','f','g','h','i'])
# print df. shape
# print df

# Deal with missing data
# print df.isnull().a
# print df.isnull()
# print df.isnull().sum()
# df = df [df.isnull().a != True]
# print df
# print df.dropna(axis = 0).isnull().sum()
df.dropna(axis = 1)
df.dropna(axis = 4, how = 'all')
print df
