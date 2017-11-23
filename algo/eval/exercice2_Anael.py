#exercice 2 :
def cryptage():
	chaine=input("Entrez le texte à crypter : ")
	chiffres=[]
	for i in range(0,1000):
		chiffres+=[str(i),]
	cle=input("entrez la clé de codage : ")
	while cle not in chiffres:
		cle=input("entrez la clé de codage (ça doit etre un nombre) :")
	cle=int(cle)
	chainecrypt=[]
	for i in range(0,len(chaine)):
		asc=ord(chaine[i])
		code=(asc*asc)-asc+cle
		chainecrypt+=[code,]
	return chainecrypt

#print(cryptage())