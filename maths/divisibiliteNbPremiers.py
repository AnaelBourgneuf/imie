
def divisibilite(nb):
	nbpremiers=[2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73,79,83,89,97,101,103,107,109,113,127,131,137,139,149,151,157,163,167,173,175,181]
	nnb=nb
	ldiv=[1]
	somldiv=1
	for i in range(len(ldiv)):
		somldiv*=ldiv[i]
	while somldiv != nb:
		for i in range(0,len(nbpremiers)):
			div=nbpremiers[len(nbpremiers)-i-1]
			if nnb/div == int(nnb/div):
				ldiv+=[div,]
				print(div)
				nnb=nnb/div
				break
		for i in range(len(ldiv)):
			somldiv*=ldiv[i]
	return ldiv

print(divisibilite(200))