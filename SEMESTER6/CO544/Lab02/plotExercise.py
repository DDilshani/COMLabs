import matplotlib
import matplotlib.pyplot as plt
import numpy as np

matplotlib.rc('xtick', labelsize = 30)
matplotlib.rc('ytick', labelsize = 30)
matplotlib.rc('axes', titlesize = 30)
matplotlib.rc('legend', fontsize = 30)

fig = plt.figure(figsize = (20,20))
#plt.show()
fig.subplots_adjust(hspace = .5)
axes = plt.subplot(5, 1, 1)
# axes = plt.subplot(511)
# plt.show()

x = np.linspace(0, 10, 100)
y = np.cos(x)
axes.plot(x, y, linewidth=4.0, ls='--', color='r', marker='o')
# plt.show()

axes.legend("cos(X)", loc="upper right")
axes.set_title("Title for (5,1) subplot")
axes.set_xlabel('xlabel')
axes.set_ylabel('ylabel')

axes.set_autoscaley_on(False)
axes.set_ylim([-1,1])
axes.xaxis.set(ticks = range(1,0))

fig.text(0.5, 0.04, 'common x label', ha='center', fontsize=15)
fig.text (0.04, 0.5, 'common y label', va='center', rotation ='vertical', fontsize =15)
# plt.show()

plt.savefig('cosine.png', dpi=400, bbox_inches='tight')

