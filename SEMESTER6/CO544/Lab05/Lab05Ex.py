from sklearn import tree
from sklearn.datasets import load_iris
import pydotplus
from IPython.display import Image
from PIL import Image, ImageDraw

X = [[140,1], [130,1], [150,0], [170,0]]
Y = [1, 2, 3, 4]

clf = tree.DecisionTreeClassifier()
clf = clf.fit(X, Y)

print clf.predict([[170, 1]])
print clf.predict([[140, 0]])

print clf.predict_proba([[140, 0]])

iris = load_iris()
clf_iris = tree.DecisionTreeClassifier()
clf_iris = clf_iris.fit(iris.data, iris.target)

dot_data = tree.export_graphviz(clf_iris, out_file=None)
graph = pydotplus.graph_from_dot_data(dot_data)
graph.write_pdf("iris.pdf")

# dot_data = tree.export_graphviz(clf_iris, out_file=None, 
# 			feature_names = iris.feature_names, 
# 			class_names = iris.target_names, 
# 			filled = True, 
# 			rounded = True, 
# 			special_characters = True)

# graph = pydotplus.graph_from_dot_data(dot_data)
# Image(graph.create_png())
# graph.write_png("iris.png")

image = Image.open("iris.png")
image.show()

print clf_iris.predict(iris.data[:1, :])
print clf_iris.predict_proba(iris.data[:1, :])
