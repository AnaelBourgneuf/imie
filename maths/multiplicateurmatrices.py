mat1=[[2,-3],[-1,-2]]
mat2=[[3,1,2],[1,0,2]]


def multiplicateurM(matA,matB):
	if len(matA[0])==len(matB):
		matR=[]
		for i in range(len(matA)):
			matR+=[[],]
			for l in range(len(matB[0])):
				matR[i]+=[0,]
				for jk in range(len(matA[i])):
					matR[i][l]+=matA[i][jk]*matB[jk][l]
		return matR
	elif len(matB[0])==len(matA):
		return(multiplicateurM(matB,matA))
	else :
		return("erreur")

print(multiplicateurM(mat1,mat2))