def transposition(mat):
	nmat=[];
	lignes=len(mat)
	colonnes=len(mat[0])
	for i in range(0,colonnes):
		nmat+=[[],]
		for j in range(0,lignes):
			nmat[i]+=[mat[j][i],]
	return nmat

print(transposition([[1,0,4],[-3,2,5],[7,-3,6],[1,0,7]]))