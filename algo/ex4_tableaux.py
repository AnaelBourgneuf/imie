#exercice 1
def creetab():
	tab=[]
	for i in range(0,7):
		tab+=[0,]
	print(tab)

#creetab()

#exercice 2 et 3
def notes():
	tab=[]
	for i in range(0,9):
		tab+=[float(input("donnez une note : ")),]
	print(tab)
	moy=0
	for i in range(0,len(tab)):
		moy+=tab[i]
	moy/=len(tab)
	print(moy)

#notes()

#exercice 4
def negpos():
	nb=0
	val=[]
	somn=0
	somp=0
	zero=0
	nb=int(input("combien voulez vous entrer de valeurs ?"))
	for i in range(0,nb):
		val+=[float(input("valeur : ")),]
	for i in range(0,len(val)):
		if val[i]<0 :
			somn+=1
		elif val[i]>0 :
			somp+=1
		else:
			zero+=1
	print("nombres de negatifs : "+str(somn)+".\nnombre de positifs : "+str(somp)+".\nnombre de nuls : "+str(zero)+".")

#negpos()

#exercice 5
def meilleuresnotes():
	notes=[]
	note=input("donnez une note : ")
	while note:
		notes+=[float(note),]
		note=input("donnez une note : ")
	if notes != []:
		moy=0
		for i in range(0,len(notes)):
			moy+=notes[i]
		moy/=len(notes)	
		print("\nla moyenne est de : "+str(moy)+"\nLes notes au dessus sont :")
		for i in range(0,len(notes)):
			if notes[i]>moy:
				print(notes[i])

meilleuresnotes()








