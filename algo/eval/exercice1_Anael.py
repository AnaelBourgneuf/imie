from random import randint

#exercice 1 :
def créecarte():
	carte=[]
	y=randint(30,30)
	x=randint(30,30)
	for i in range(0,y):
		carte+=[[],]
		for j in range(0,x):
			T=randint(1,3)
			carte[i]+=[[T,"V"],]
	y1 = randint(0,len(carte)-1)
	x1 = randint(0,len(carte[y1])-1)
	carte[y1][x1][1] = "0"
	y2 = randint(0,len(carte)-1)
	x2 = randint(0,len(carte[y2])-1)
	if y2!=y1 or x2!=x1:
		carte[y2][x2][1] = "X"
	else :
		y2 = randint(0,len(carte)-1)
		x2 = randint(0,len(carte[y2])-1)
		if y2!=y1 or x2!=x1:
			carte[y2][x2][1] = "X"
	return carte

def affichecarte(carte):
	for i in range(0,len(carte)):
		for j in range(0,len(carte[i])):
			if str(carte[i][j][1])!="V":
				print(carte[i][j][1], end="  ")
			else :
				print(carte[i][j][0], end="  ")
		print("")
	print("\n")

#affichecarte(créecarte())

def deplacealea(perso,carte,pm):
	xp=0
	yp=0
	xa=0
	ya=0
	pmterrain=[1,5,3]
	for i in range(0,len(carte)):
		for j in range(0,len(carte[i])):
			if carte[i][j][1]==perso:
				xp=j
				yp=i
			elif carte[i][j][1]!="V":
				xa=j
				ya=i
	if (xp==xa-1 and yp==ya) or (xp==xa+1 and yp==ya) or (yp==ya-1 and xp==xa) or (yp==ya+1 and xp==xa):
		carte[yp][xp][1]="V"
		carte[ya][xa][1]="X0"
	else :
		direction=randint(1,4)
		if direction==1:
			if yp+1<len(carte):
				terrain=carte[yp+1][xp][0]-1
				if pmterrain[terrain]<pm:
					pm-=pmterrain[carte[yp+1][xp][0]-1]
					carte[yp][xp][1]="V"
					carte[yp+1][xp][1]=perso
				else :
					carte=deplacealea(perso,carte,pm)
					return carte
			else:
				carte=deplacealea(perso,carte,pm)
				return carte
		elif direction==2:
			if xp-1>0:
				terrain=carte[yp][xp-1][0]-1
				if pmterrain[terrain]<pm:
					pm-=pmterrain[carte[yp][xp-1][0]-1]
					carte[yp][xp][1]="V"
					carte[yp][xp-1][1]=perso
				else :
					carte=deplacealea(perso,carte,pm)
					return carte
			else:
				carte=deplacealea(perso,carte,pm)
				return carte
		elif direction==3:
			if yp-1>0:
				terrain=carte[yp-1][xp][0]-1
				if pmterrain[terrain]<pm:
					pm-=pmterrain[carte[yp-1][xp][0]-1]
					carte[yp][xp][1]="V"
					carte[yp-1][xp][1]=perso
				else :
					carte=deplacealea(perso,carte,pm)
					return carte
			else:
				carte=deplacealea(perso,carte,pm)
				return carte
		elif direction==4:
			if xp+1<len(carte[0]):
				terrain=carte[yp][xp+1][0]-1
				if pmterrain[terrain]<pm:
					pm-=pmterrain[carte[yp][xp+1][0]-1]
					carte[yp][xp][1]="V"
					carte[yp][xp+1][1]=perso
				else :
					carte=deplacealea(perso,carte,pm)
					return carte
			else:
				carte=deplacealea(perso,carte,pm)
				return carte
	if pm<0:
		carte=deplacealea(perso,carte,pm)
	return carte

def jeu():
	carte=créecarte()
	joueur="0"
	fin=False
	affichecarte(carte)
	while fin==False:
		
		deplacealea(joueur,carte,10)
		if joueur=="0":
			joueur="X"
		else:
			joueur="0"
		affichecarte(carte)
		for i in range(0,len(carte)):
			for j in range(0,len(carte[i])):
				if carte[i][j][1]=="X0":
					print("Jeu fini !!!")
					fin=True
					break

jeu()