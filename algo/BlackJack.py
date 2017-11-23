from random import shuffle

def creeJeuMelange(nbjeux):
	signes=["♦","♥︎","︎︎♣︎","♠︎"]
	start=1
	end=13
	jeu=[]
	for i in range(0,nbjeux):
		njeu=creeJeu(signes,start,end)
		#affichecartes(njeu)
		for j in range(0,len(njeu)):
			jeu+=[njeu[j],]
	print(shuffle(jeu))
	return shuffle(jeu)

def creeJeu(signes,start,end):
	listecartes=[]
	for i in range(0,len(signes)):
		for j in range(start,end+1):
			#print((signes[i],j))
			listecartes+=[(signes[i],j),]
	#print (listecartes)
	return listecartes



def affichecartes(cartes):
	for i in range(0,len(cartes)):
		print(cartes[i])

#affichecartes(creeJeuMelange(6))
creeJeuMelange(6)