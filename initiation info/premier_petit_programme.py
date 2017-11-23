def calcul_simple():
	ch1=0
	ch2=0
	ch1=input("nombre : ")
	ch2=input("nombre : ")
	print("="+str(ch1+ch2))


def calculatrice():
	signe= "+"
	ch1=0
	ch2=0
	signes=["+","-","x","*","/","="]
	q="n"
	while str(signe)[0] in signes :
		if signe != "=":
			ch2=float(input("nombre : "))
		if signe[0] == "+":
			ch1+=ch2
		elif signe[0] == "-":
			ch1-=ch2
		elif signe[0] == "x" or signe == "*":
			ch1*=ch2
		elif signe[0] == "/":
			ch1/=ch2
		signe=str(input("signe : "))
		while signe[0] == "=":
			print (ch1)
			signe=str(input("signe : "))
		if str(signe)[0] not in signes:
			q=input("voulez vous vraiment quitter ?")
			if q[0] in ["N","n"]:
				signe="="
	return ch1

#print(calculatrice())

def moyenne():
	ch1=0
	ch2=0
	compt=0
	ok=False
	entrees=["1","2","3","4","5","6","7","8","9","0","="]
	while ok == False :
		ch2=input("note : ")
		ok=True
		for i in range (0,len(ch2)):
			if ch2[i] not in entrees:
				ok=False
	ok=False
	while ch2 != "=" :
		ch1+=float(ch2)
		compt+=1
		while ok == False :
			ch2=input("note : ")
			ok=True
			for i in range (0,len(ch2)):
				if ch2[i] not in entrees:
					ok=False
		ok=False
	return ch1/compt

def moyennes():
	nomsmoy=[]
	nom=str(input("nom de l\'eleve : "))
	while nom != "=" :
		moy=float(moyenne())
		nomsmoy+=[(nom,moy),]
		affichemoyenne([nom, moy])
		nom=str(input("nom de l\'eleve : "))
	return nomsmoy

def affichemoyenne(moy):
	print("\n\n\nMoyenne :")
	print (moy[0], end=" : ")
	print (moy[1], end="\n\n\n")

def affichemoyennes():
	moys=moyennes()
	moys=trinotes(moys)
	print("\n\n\nMoyennes :")
	for i in range (0, len(moys)):
		print (moys[i][0], end=" : ")
		print (moys[i][1], end=" \n")
	print("\n")

def trinotes(moys):
	ok=False
	while ok == False:
		ok=True
		for i in range (1,len(moys)):
			if moys[i][1]<moys[i-1][1]:
				stock=moys[i]
				moys[i]=moys[i-1]
				moys[i-1]=stock
				ok=False
	return moys

affichemoyennes()







