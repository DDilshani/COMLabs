# coding=utf-8
"""
Registration Number  = E13175
According to the given format  e1 = 1, e2 = 7, e3 = 5

f(x) = e2 ∗ x^(e1 mod 5) − e3 ∗ x^(e2 mod 5) − e1 ∗ x^(e3 mod 5) + e3
Therefore,

    f(x) = 7 ∗ x^(1 mod 5) − 5 ∗ x^(7 mod 5) − 1 ∗ x^(5 mod 5) + 5
    f(x) = 7 ∗ x^1 − 5 ∗ x^2 − 1 ∗ x^(0) + 5
    f(x) = 7 ∗ x − 5 ∗ x^2 + 4
    f(x) = − 5x^2 + 7x + 4

funtion defined in the form:
	f(X) = c1 * X ^ e1 - c2 * X ^ e2 - c3 * X ^ e3 + c4
	f = [c1, e1, c2, e2, c3, e3, c4]
	c1=7, e1=1, c2=5, e2=2, c3=1, e3=0, c4=5 

"""
import matplotlib
import matplotlib.pyplot as plt
import numpy as np
import unittest

class GradientDescentAlgorithm:

	def __init__(self, startPoint, function, precision, learnRate):
		self.startPoint = startPoint
		self.function = function
		self.precision = precision 
 		self.learnRate = learnRate

 	def get_grad_f(self, point):
 		"""
 		Calculate gradient of the function at a givent point.
 		funtion defined in the form:
 		f(X) = c1 * X ^ e1 - c2 * X ^ e2 - c3 * X ^ e3 + c4
 		f = [c1, e1, c2, e2, c3, e3, c4]
 		"""
		c1 = self.function[0]
		e1 = self.function[1]
		c2 = self.function[2]
		e2 = self.function[3]
		c3 = self.function[4]
		e3 = self.function[5]

		return (c1 * e1 * (point ** (e1 - 1))) - (c2 * e2 * (point ** (e2 - 1))) - (c3 * e3 * (point ** (e3 - 1)))

	def  get_local_minimum(self):
		"""
		Finding the local mimimum of a function with a given start point
		"""
		current_x = self.startPoint
		previous_step_size = current_x

		while previous_step_size > self.learnRate:
			previous_x = current_x
			current_x = current_x - (self.learnRate * self.get_grad_f(current_x))
			previous_step_size = np.abs(current_x - previous_x)
		return current_x

class GradientDescentAlgorithmTest(unittest.TestCase):

	def setUp(self):
		# f(x) for E13175
		self.f1 = [7, 1, 5, 2, 1, 0, 5]
		self.gda1 = GradientDescentAlgorithm(5, self.f1, 0.00005, 0.0005)
		# f(x) for E13326
		self.f2 = [2, 3, 6, 2, 3, 1, 6]
		self.gda2 = GradientDescentAlgorithm(5, self.f2, 0.1, 0.05)

	def testGetGradF(self):
		self.assertEquals(self.gda1.get_grad_f(5), -43)

	def testGetLocalMinimum(self):
		self.assertEquals(int(self.gda2.get_local_minimum()), 2)




if __name__ == '__main__':

	# Exercise 1:

	matplotlib.rc('xtick', labelsize = 10)
	matplotlib.rc('ytick', labelsize = 10)
	matplotlib.rc('axes', titlesize = 30)
	matplotlib.rc('legend', fontsize = 30)

	x = range(-100, 100)
	y = np.polyval([-5, 7, 4], x)
	# f(x) for E13326
	# y = np.polyval([2, -6, -3, 6], x)
	plt.plot(x, y)

	plt.ylabel('f(X)')
	plt.xlabel('X Values')
	plt.title('f(x) = 5X^2 + 7X +4')
	# plt.show()

	# Exercise 2:
	"""
	The minimum result returned from the gradient descent algorithm can change according to the initial value selection.
	The algorithm will converge to the nearest minimum that is closest to the initial value given.
	"""

	# Exercise 3:
	"""
	When the learning rate is a small value, the algorithm converges to the minimum in small step sizes slowly.
	When the learning rate is a large value, the algorithm converges to the minimum in large step sizes fast. 
	Hence, there is a possibility to miss the minimum value when the learning rate increases from a small 
	gradient value to a large gradient value.
	"""
	f = []

	c1 = 7
	e1 = 1
	c2 = 5
	e2 = 2
	c3 = 1
	e3 = 0
	c4 = 5

	f.insert(0, c1)
	f.insert(1, e1)
	f.insert(2, c2)
	f.insert(3, e2)
	f.insert(4, c3)
	f.insert(5, e3)
	f.insert(6, c4)

	# f = [2, 3, 6, 2, 3, 1, 6]

	gda = GradientDescentAlgorithm(5, f, 0.00005, 0.0005)
	print '', gda.get_local_minimum()
	plt.show()

	# Exercise 4:
	"""
	f(x) = 7X - 5X^2 + 4 is a parabola with a downward opening.
	Hence, it will have global maximum.
	Global minimum can be found when reaching positive infinity and negative infinity.
	Therefore, results obtained:
		when starting point > 0 : inf
		when starting point < 0 : -inf

	"""

	"""
	Using Registration Number: E13326
	According to the given format  e1 = 3, e2 = 2, e3 = 6

	f(x) = e2 ∗ x^(e1 mod 5) − e3 ∗ x^(e2 mod 5) − e1 ∗ x^(e3 mod 5) + e3
	Therefore,

    f(x) = 2 ∗ x^3 − 6 ∗ x^2 − 3 ∗ x + 6

	funtion defined in the form:
	f(X) = c1 * X ^ e1 - c2 * X ^ e2 - c3 * X ^ e3 + c4
	f = [c1, e1, c2, e2, c3, e3, c4]
	c1=2, e1=3, c2=6, e2=2, c3=3, e3=1, c4=6 
	"""

	#------ Uncomment to test for an registration number with a minimum
	"""
	x = range(-10, 10)
	y = np.polyval([2, -6, -3, 6], x)
	plt.plot(x, y)

	f = [2, 3, 6, 2, 3, 1, 6]

	gda = GradientDescentAlgorithm(5, f, 0.00005, 0.0005)
	print '', gda.get_local_minimum()
	plt.show()
	"""
	
	#------------------------------------------------------------
	"""
	Results:
		when starting point > 0 : 2.29028806732
		when starting point < 0 : starting point

	"""

	unittest.main()
