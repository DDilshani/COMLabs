
def position(n):
	p = 0
	for i in range (0,n):
		r = np.random.randint(0, 2)
		if ( r == 0):
			p = p -1
		else:
			p = p + 1

	return p

position(500)
