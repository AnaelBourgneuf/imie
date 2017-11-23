#exercice 3:
def creetab():
	plateau=[]
	compt=1
	for i in range(0,3):
		plateau+=[[],]
		for j in range(0,3):
			plateau[i]+=[compt,]
			compt+=1
	return plateau

def choixcase(plateau,tour="O"):
	restecases=[]
	for i in range(0,len(plateau)):
		print(plateau[i])
		for j in range(0,len(plateau)):
			if plateau[i][j] in [1,2,3,4,5,6,7,8,9]:
				restecases+=[str(plateau[i][j]),]
	if restecases==[]:
		return plateau
	case=input("Dans quelle case voulez vous jouer ? ")
	while case not in restecases:
		print("case déja prise ou inexistante")
		case=input("Dans quelle case voulez vous jouer ? ")
	case=int(case)
	for i in range(0,len(plateau)):
		for j in range(0,len(plateau[i])):
			if plateau[i][j]==case:
				plateau[i][j]=tour
	return plateau
#print(choixcase(creetab()))

def trouvegagnant(plateau):
	if plateau[0][0]==plateau[0][1]==plateau[0][2] or plateau[0][0]==plateau[1][1]==plateau[2][2] or plateau[0][0]==plateau[1][0]==plateau[2][0]:
		return plateau[0][0]
	elif plateau[2][2]==plateau[2][1]==plateau[2][0] or plateau[2][2]==plateau[1][2]==plateau[0][2]:
		return plateau[2][2]
	elif plateau[0][1]==plateau[1][1]==plateau[2][1]:
		return plateau[0][1]
	elif plateau[1][0]==plateau[1][1]==plateau[1][2]:
		return plateau[0][1]
	else :return 0

def jeu():
	plateau=creetab()
	tour="X"
	gagnant=0
	restecases=[]
	for i in range(0,len(plateau)):
		for j in range(0,len(plateau)):
			if plateau[i][j] in [1,2,3,4,5,6,7,8,9]:
				restecases+=[plateau[i][j],]
	while restecases != [] and gagnant==0:
		if tour=="O":
			tour="X"
		else :tour="O"
		plateau=choixcase(plateau,tour)
		restecases=[]
		for i in range(0,len(plateau)):
			for j in range(0,len(plateau)):
				if plateau[i][j] in [1,2,3,4,5,6,7,8,9]:
					restecases+=[plateau[i][j],]
		gagnant=trouvegagnant(plateau)
	for i in range(0,len(plateau)):
		print(plateau[i])
	print("Les "+tour+" ont gagné !!!")

jeu()