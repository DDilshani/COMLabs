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

"""
import matplotlib
import matplotlib.pyplot as plt
import numpy as np

matplotlib.rc('xtick', labelsize = 30)
matplotlib.rc('ytick', labelsize = 30)
matplotlib.rc('axes', titlesize = 30)
matplotlib.rc('legend', fontsize = 30)

x = range(-100, 100)
y = np.polyval([-5, 7, 4], x)
plt.plot(x, y)

plt.ylabel('f(x)')
plt.xlabel('x values')
plt.title('f(x) = 5')
plt.show()