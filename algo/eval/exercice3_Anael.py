#exercice 3 :
#partie 1 :
def touttabmult():
	listemult=[]
	for i in range(0,11):
		listemult+=[[],]
		for j in range(0,11):
			listemult[i]+=[i*j,]
	return listemult

def affichetouttabmult(tableau):
	print("X   | 0  1  2  3  4  5  6  7  8  9  10")
	print("______________________________________")
	for i in range(0,len(tableau)):
		print(i,end="  ")
		if i<10:
			print("", end=" | ")
		else :
			print("", end="| ")
		for j in range(0,len(tableau)):
			print(tableau[i][j], end=" ")
			if tableau[i][j]<10:
				print("", end=" ")
		print("")

#affichetouttabmult(touttabmult())

#partie 2 :
def tablemult(n=0,mult=0):
	if mult==0:
		mult=int(input("entrez la table à afficher : "))
	if n==0:
		n=int(input("entrez le nombre maximum à chercher : "))
	for i in range(1,n+1):
		print(str(i)+"*"+str(mult)+"= "+str(i*mult))

#tablemult()


