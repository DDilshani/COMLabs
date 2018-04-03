import matplotlib
import matplotlib.pyplot as plt
import numpy as np

def position(n):
	vector = []
	p = 0
	for i in range (0,n):
		r = np.random.randint(0, 2)
		if ( r == 0):
			p = p -1
		else:
			p = p + 1

		vector.append(p);
	return vector;

Pos_v = position(500)

matplotlib.rc('xtick', labelsize = 10)
matplotlib.rc('ytick', labelsize = 10)
matplotlib.rc('axes', titlesize = 20)
matplotlib.rc('legend', fontsize = 10)

fig = plt.figure(figsize = (10,10))
fig.subplots_adjust(hspace = .5)

axis1 = plt.subplot(3, 1, 1)
axis1.plot(Pos_v)
axis1.legend("Pos_v", loc="upper right")
axis1.set_title("Position Vector of Random Walker")
axis1.set_xlabel('Number of Steps')
axis1.set_ylabel('Position')


axis2 = plt.subplot(3, 1, 2)
axis2.hist(Pos_v, bins=20, color='r')
axis2.legend("Pos_v", loc="upper right")
axis2.set_title("Histogram of Random Walker")
axis2.set_xlabel('Number of Steps')
axis2.set_ylabel('Position')

Pos_v1 = position(500)
Pos_v2 = position(500)

axis3 = plt.subplot(3,1,3)
axis3.scatter(Pos_v1, Pos_v2, color='green', alpha=0.3, edgecolors='grey')
axis3.legend("Pos_v", loc="upper right")
axis3.set_title("Histogram of Random Walker")
axis3.set_xlabel('Number of Steps')
axis3.set_ylabel('Position of V1 and V2')
plt.show()
