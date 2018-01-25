def cree_grille():
	grille=[]
	for i in range(0, 10):
		grille+=[[],]
		for j in range(0, 10):
			if i<4 :
				if i%2==0 and j%2==0:
					grille[i]+=["B",]
				elif i%2!=0 and j%2!=0:
					grille[i]+=["B",]
				else:
					grille[i]+=["_",]
			elif i>5 :
				if i%2==0 and j%2==0:
					grille[i]+=["N",]
				elif i%2!=0 and j%2!=0:
					grille[i]+=["N",]
				else:
					grille[i]+=["_",]
			else:
				grille[i]+=["_",]
	return grille

def affiche_grille(grille):
	print("     A     B     C     D     E     F     G     H     I     J   ")
	print("  _____________________________________________________________")
	for i in range(0,len(grille)):
		print(str(i)+" |", end="")
		for j in range(0,len(grille)):
			if grille[i][j]!="_":
				print("  "+ grille[i][j], end="  |")
			else:
				print("   ",end="  |")
		print("\n  |_____|_____|_____|_____|_____|_____|_____|_____|_____|_____|")

def trientree(entree):
	alpha=("A","B","C","D","E","F","G","H","I","J")
	num=("1","2","3","4","5","6","7","8","9","0")
	if entree[0] in alpha:
		if entree[-1] in num:
			return True
	else:
		return False

def changelettre(lettre):
	alpha=("A","B","C","D","E","F","G","H","I","J")
	for i in range(0,len(alpha)):
		if lettre==alpha[i]:
			return i

def testpionaudepart(coorddepart, grille, tour):
	if grille[coorddepart[0]][coorddepart[1]]==tour:
		return True
	else:
		return False

def testcasenoire(coordarrivee, grille):
	if (coordarrivee[0]+coordarrivee[1])%2==0:
		return False
	else:
		return True

def testpionpeutbouger(coorddepart, coordarrivee, grille, tour):
	tindices=(1,2,3,4,5,6,7,8,9,0)
	if tour =="B":
		if coorddepart[0]+1==coordarrivee[0]:
			if coorddepart[1]+1==coordarrivee[1]:
				if grille[coordarrivee[0]][coordarrivee[1]]=="_":
					return (True,grille)
			elif coorddepart[1]-1==coordarrivee[1]:
				if grille[coordarrivee[0]][coordarrivee[1]]=="_":
					return (True,grille)
		if coorddepart[0]+2 in tindices:
			if coorddepart[0]+2==coordarrivee[0]:
				if coorddepart[1]+2 in tindices:
					if coorddepart[1]+2==coordarrivee[1]:
						if grille[coordarrivee[0]][coordarrivee[1]]=="_" and grille[coorddepart[0]+1][coorddepart[1]+1]=="N":
							grille[coorddepart[0]+1][coorddepart[1]+1]="_"
							return (True,grille)
				elif coorddepart[1]-2 in tindices:
					if coorddepart[1]-2==coordarrivee[1]:
						if grille[coordarrivee[0]][coordarrivee[1]]=="_" and grille[coorddepart[0]+1][coorddepart[1]-1]=="N":
							grille[coorddepart[0]+1][coorddepart[1]-1]="_"
							return (True,grille)
			elif coorddepart[0]+4 in tindices:
				if coorddepart[0]+4==coordarrivee[0]:
					if coorddepart[1]+4 in tindices:
						if coorddepart[1]+4==coordarrivee[1]:
							if grille[coordarrivee[0]][coordarrivee[1]]=="_" and grille[coorddepart[0]+3][coorddepart[1]+3]=="N" and grille[coorddepart[0]+2][coorddepart[1]+2]=="_" and grille[coorddepart[0]+1][coorddepart[1]+1]=="N":
								grille[coorddepart[0]+3][coorddepart[1]+3]="_"
								grille[coorddepart[0]+1][coorddepart[1]+1]="_"
								return (True,grille)
					elif coorddepart[1]-4 in tindices:
						if coorddepart[1]-4==coordarrivee[1]:
							if grille[coordarrivee[0]][coordarrivee[1]]=="_" and grille[coorddepart[0]+3][coorddepart[1]-3]=="N" and grille[coorddepart[0]+2][coorddepart[1]-2]=="_" and grille[coorddepart[0]+1][coorddepart[1]-1]=="N":
								grille[coorddepart[0]+3][coorddepart[1]-3]="_"
								grille[coorddepart[0]+1][coorddepart[1]-1]="_"
								return (True,grille)
	elif tour =="N":
		if coorddepart[0]-1==coordarrivee[0]:
			if coorddepart[1]+1==coordarrivee[1]:
				if grille[coordarrivee[0]][coordarrivee[1]]=="_":
					return (True,grille)
			elif coorddepart[1]-1==coordarrivee[1]:
				if grille[coordarrivee[0]][coordarrivee[1]]=="_":
					return (True,grille)
		if coorddepart[0]-2 in tindices:
			if coorddepart[0]-2==coordarrivee[0]:
				if coorddepart[1]+2 in tindices:
					if coorddepart[1]+2==coordarrivee[1]:
						if grille[coordarrivee[0]][coordarrivee[1]]=="_" and grille[coorddepart[0]-1][coorddepart[1]+1]=="B":
							grille[coorddepart[0]-1][coorddepart[1]+1]="_"
							return (True,grille)
				elif coorddepart[1]-2 in tindices:
					if coorddepart[1]-2==coordarrivee[1]:
						if grille[coordarrivee[0]][coordarrivee[1]]=="_" and grille[coorddepart[0]-1][coorddepart[1]-1]=="B":
							grille[coorddepart[0]-1][coorddepart[1]-1]="_"
							return (True,grille)
			elif coorddepart[0]-4 in tindices:
				if coorddepart[0]-4==coordarrivee[0]:
					if coorddepart[1]+4 in tindices:
						if coorddepart[1]+4==coordarrivee[1]:
							if grille[coordarrivee[0]][coordarrivee[1]]=="_" and grille[coorddepart[0]-3][coorddepart[1]+3]=="N" and grille[coorddepart[0]-2][coorddepart[1]+2]=="_" and grille[coorddepart[0]-1][coorddepart[1]+1]=="B":
								grille[coorddepart[0]-3][coorddepart[1]+3]="_"
								grille[coorddepart[0]-1][coorddepart[1]+1]="_"
								return (True,grille)
					elif coorddepart[1]-4 in tindices:
						if coorddepart[1]-4==coordarrivee[1]:
							if grille[coordarrivee[0]][coordarrivee[1]]=="_" and grille[coorddepart[0]-3][coorddepart[1]-3]=="N" and grille[coorddepart[0]-2][coorddepart[1]-2]=="_" and grille[coorddepart[0]-1][coorddepart[1]-1]=="B":
								grille[coorddepart[0]-3][coorddepart[1]-3]="_"
								grille[coorddepart[0]-1][coorddepart[1]-1]="_"
								return (True,grille)
	return (False,grille)

def echangepions(grille, coorddepart, coordarrivee):
	stock=grille[coorddepart[0]][coorddepart[1]]
	grille[coorddepart[0]][coorddepart[1]]=grille[coordarrivee[0]][coordarrivee[1]]
	grille[coordarrivee[0]][coordarrivee[1]]=stock
	return grille

#_______________________________________________________________________________________________

def boucle(grille,tour):
	coorddepart=(0,1)
	coordarrivee=(0,1)
	print("tour des "+tour)
	while testpionaudepart(coorddepart, grille, tour)==False:
		depart=input("Quelle est la position de depart du pion (exemple: \"A 7\")")
		while trientree(depart)==False:
			depart=input("*erreur*\nQuelle est la position de depart du pion (exemple: \"A 7\")")
		coorddepart=(int(depart[-1]),changelettre(depart[0]))
	print("depart : "+str(coorddepart[0])+","+str(coorddepart[1]))
	while testcasenoire(coordarrivee, grille):
		arrivee=input("Quelle est la case d'arrivée ?")
		while trientree(arrivee)==False:
			arrivee=input("*erreur*\nQuelle est la case d'arrivée ?")
		coordarrivee=(int(arrivee[-1]),changelettre(arrivee[0]))
	print("arrivée : "+str(coordarrivee[0])+","+str(coordarrivee[1]))
	test=testpionpeutbouger(coorddepart, coordarrivee, grille, tour)
	grille=test[1]
	if test[0]:
		grille=echangepions(grille, coorddepart, coordarrivee)
	else:
		print("mouvement impossible !")
	return grille



def jeu():
	tour="B"
	grille=cree_grille()
	affiche_grille(grille)
	while 1:
		grille=boucle(grille,tour)
		if tour=="B":
			tour="N"
		else:
			tour="B"
		affiche_grille(grille)

jeu()