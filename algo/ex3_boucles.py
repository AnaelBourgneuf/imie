from math import sqrt

#exercice1
def untrois():
	nb=0
	while nb not in (1,2,3):
		nb=float(input("donnez un nombre entre un et trois : "))
	return nb

#print("le nombre entré est : "+str(untrois())+" !")

#exercice2
def dixapres():
	nb=0
	nb=float(input("donnez un nombre, je vous affiche les 10 suivants : "))
	for i in range (0,10):
		nb=nb+1
		print(nb)

#dixapres()

#exercice3
def entredeux():
	nb1=0
	nb2=0
	nb3=0
	nb1=int(input("entrez un premier nombre : "))
	nb2=int(input("entrez en un deuxieme : "))
	if nb1<nb2:
		while nb3 not in range(nb1,nb2+1):
			nb3=int(input("entrez un troisieme nombre entre "+str(nb1)+" et "+str(nb2)+" : "))
		print("vous avez entré "+str(nb3)+", qui etait compris entre "+str(nb1)+" et "+str(nb2)+".")
	else:
		while nb3 not in range(nb2,nb1+1):
			nb3=int(input("entrez un troisieme nombre entre "+str(nb2)+" et "+str(nb1)+" : "))
		print("vous avez entré "+str(nb3)+", qui etait compris entre "+str(nb2)+" et "+str(nb1)+".")

#entredeux()

#exercice4
def tabmulti():
	nb=0
	nb=int(input("donnez un nombre, je vous en affiche la table de multiplication : "))
	for i in range (1,11):
		print(". "+str(nb)+" x "+str(i)+" = "+str(nb*i)+" .")

#tabmulti()

#exercice5
def sommeentiers():
	nb=0
	nb=int(input("donnez un nombre, je vous affiche la somme des entiers jusqu'à ce nombre : "))
	som=0
	for i in range(1,nb+1):
		som+=i
	print(som)

#sommeentiers()

#exercice6
def factorielle():
	nb=0
	nb=int(input("donnez un nombre, je vous affiche la factorielle des entiers jusqu'à ce nombre : "))
	fact=1
	for i in range(1,nb+1):
		fact*=i
	print(fact)

#factorielle()

#exercice7
def plusGrand():
	nb=0
	grd=0
	nb=int(input("entrez un nombre : "))
	for i in range(1,20):
		nb=int(input("entrez encore un nombre : "))
		if nb > grd :
			grd = nb
	print("le plus grand nombre etait "+str(grd)+".")

#plusGrand()

#exercice8
def PlusGrand():
	nb=0
	grd=[0,0]
	nb=int(input("entrez un nombre : "))
	for i in range(1,20):
		nb=int(input("entrez encore un nombre : "))
		while not nb :
			nb=int(input("entrez encore un nombre : "))
		if nb > grd[0] :
			grd = [nb,i+1]
	print("le plus grand nombre etait "+str(grd[0])+", c'etait le "+str(grd[1])+"ème entré")

#PlusGrand()

#Projecteuler.net

#exercice 1
def SomMultiTroisCinq():
	nb=0
	som=0
	nb=int(input("donnez un nombre, je vous renvois la somme des entiers qui le précèdent et qui sont multiples de 3 ou de 5 : "))
	for i in range(1, nb):
		if i%3==0 or i%5==0:
			som+=i
	print("la somme des entiers inferieurs à "+str(nb)+" et multiples de 3 ou 5 est : "+str(som)+".")

#SomMultiTroisCinq()

#exercice 2
def fibonacci():
	nb=0
	fibo=[1,1]
	nb=int(input("entrez un nombre, je vous donne la suite de fibonacci des inferieurs : "))
	prespres=1
	pres=1
	while pres+prespres<nb:
		res=prespres+pres
		prespres=pres
		pres=res
		fibo+=[pres,]
	for i in range (0,len(fibo)):
		print(fibo[i])

#fibonacci()

#exercice 3
def facteurprem(nb=0):
	factp=[1]
	if nb==0:
		nb=int(input("entrez un nombre, je vous calcule les facteurs premiers : "))
	for i in range(1,nb):
		if nb%i==0: 
			factnb=facteurprem(nb)
			for n in range(len(factnb)):
				if factnb[n] not in factp:
					factp+=[factnb[n],]
	return factp

#print(facteurprem())

#exercice 4
def pgpalin():
	nb1=9999
	nb2=9999
	maxi=[0,0,0]
	for i in range(1000,nb1+1):
		for j in range(1000,nb2+1):
			mult=i*j
			if palin(mult):
				if mult > maxi[0]:
					maxi = [mult,i,j]
	return maxi

def palin(nb):
	ch1=str(nb)
	ch2="".join(reversed(ch1))
	#print(ch1,ch2)
	if ch1==ch2:
		return True
	return False

#print(pgpalin())

#exercice 5
def divisible20():
	lisdiv=[1,2,3,5,7]
	nb=1
	while 1:
		if nb%11==0 and nb%12==0 and nb%13==0 and nb%14==0 and nb%15==0 and nb%16==0 and nb%17==0 and nb%18==0 and nb%19==0 and nb%20==0:
			return nb
		nb+=1

#print(divisible20())

def divisible40():
	nb=1
	while 1:
		if nb%21==0 and nb%22==0 and nb%23==0 and nb%24==0 and nb%25==0 and nb%26==0 and nb%27==0 and nb%28==0 and nb%29==0 and nb%30==0 and nb%31==0 and nb%32==0 and nb%33==0 and nb%34==0 and nb%35==0 and nb%36==0 and nb%37==0 and nb%38==0 and nb%39==0 and nb%40==0:
			return nb
		nb+=1

#print(divisible40())

#exercice 6
def difsumcarre():
	sumcarre=0
	carresum=0
	for i in range (0,101):
		sumcarre+=i*i
		carresum+=i
	carresum*=carresum
	return carresum-sumcarre

#print(difsumcarre())

#exercice 7
def nbpremiers(maxi):
	listprem=[2]
	nb=3
	while len(listprem)<maxi:
		prem=True
		for n in listprem:
			if nb % n ==0 :
				prem=False
		if prem==True:
			listprem+=[nb,]
		nb+=1
		#print(listprem[-1])
	return listprem

#print(nbpremiers(10001))


#exercice 8
def trouvepgprod(chaine,nb):
	multmax=[0]
	for i in range(0,len(chaine)-nb):
		mult=1
		for n in range(0,nb):
			mult*=int(chaine[i+n])
		if mult >= multmax[0]:
			multmax=[mult]
			for n in range(0,nb):
				multmax+=[chaine[i+n],]
	return multmax

liste="7316717653133062491922511967442657474235534919493496983520312774506326239578318016984801869478851843858615607891129494954595017379583319528532088055111254069874715852386305071569329096329522744304355766896648950445244523161731856403098711121722383113622298934233803081353362766142828064444866452387493035890729629049156044077239071381051585930796086670172427121883998797908792274921901699720888093776657273330010533678812202354218097512545405947522435258490771167055601360483958644670632441572215539753697817977846174064955149290862569321978468622482839722413756570560574902614079729686524145351004748216637048440319989000889524345065854122758866688116427171479924442928230863465674813919123162824586178664583591245665294765456828489128831426076900422421902267105562632111110937054421750694165896040807198403850962455444362981230987879927244284909188845801561660979191338754992005240636899125607176060588611646710940507754100225698315520005593572972571636269561882670428252483600823257530420752963450"
#print(trouvepgprod(liste,13))

#exercice 9
def tripletpytha(nb=1000):
	for a in range(0,500):
		for b in range(0,500):
			for c in range(0,500):
				if a+b+c==nb:
					if (a*a)+(b*b)==(c*c):
						return (int(a),int(b),int(c))

#print(tripletpytha())

#exercice 10
def nbpremiersmax(maxi):
	listprem=[2]
	nb=3
	while listprem[0]<maxi:
		prem=True
		for n in listprem:
			if nb % n ==0 :
				prem=False
		if prem==True:
			listprem+=[nb,]
		nb+=1
		#print(listprem[-1])
	return listprem

def somprem(nb=2000000):
	listprem=nbpremiersmax(nb)
	som=0
	for i in range(0,len(listprem)):
		som+=listprem[i]
	return som

#print(somprem())

#exercice 11
def prodligne(liste,nb=4):
	prodmax=[0]
	for i in range(0,len(liste)-nb):
		for j in range(0,len(liste[i])-nb):
			prod=1
			nbs=[]
			for n in range(0,nb):
				prod*=liste[i][j+n]
				nbs+=[liste[i][j+n],]
			if prod >= prodmax[0]:
				prodmax=[prod,nbs]
			prod=1
			nbs=[]
			for n in range(0,nb):
				prod*=liste[i+n][j+n]
				nbs+=[liste[i+n][j+n],]
			if prod >= prodmax[0]:
				prodmax=[prod,nbs]
			prod=1
			nbs=[]
			for n in range(0,nb):
				prod*=liste[i+n][j]
				nbs+=[liste[i+n][j],]
			if prod >= prodmax[0]:
				prodmax=[prod,nbs]
	for i in range(nb,len(liste)):
		for j in range(nb,len(liste)):
			prod=1
			nbs=[]
			for n in range(0,nb):
				prod*=liste[i][j-n]
				nbs+=[liste[i][j-n],]
			if prod >= prodmax[0]:
				prodmax=[prod,nbs]
			prod=1
			nbs=[]
			for n in range(0,nb):
				prod*=liste[i-n][j-n]
				nbs+=[liste[i-n][j-n],]
			if prod >= prodmax[0]:
				prodmax=[prod,nbs]
			prod=1
			nbs=[]
			for n in range(0,nb):
				prod*=liste[i-n][j]
				nbs+=[liste[i-n][j],]
			if prod >= prodmax[0]:
				prodmax=[prod,nbs]
	return prodmax

liste2=[[8,2,22,97,38,15,0,40,0,75,4,5,7,78,52,12,50,77,91,8],[49,49,99,40,17,81,18,57,60,87,17,40,98,43,69,48,4,56,62,0],[81,49,31,73,55,79,14,29,93,71,40,67,53,88,30,3,49,13,36,65],[52,70,95,23,4,60,11,42,69,24,68,56,1,32,56,71,37,2,36,91],[22,31,16,71,51,67,63,89,41,92,36,54,22,40,40,28,66,33,13,80],[24,47,32,60,99,3,45,2,44,75,33,53,78,36,84,20,35,17,12,50],[32,98,81,28,64,23,67,10,26,38,40,67,59,54,70,66,18,38,64,70],[67,26,20,68,2,62,12,20,95,63,94,39,63,8,40,91,66,49,94,21],[24,55,58,5,66,73,99,26,97,17,78,78,96,83,14,88,34,89,63,72],[21,36,23,9,75,0,76,44,20,45,35,14,0,61,33,97,34,31,33,95],[78,17,53,28,22,75,31,67,15,94,3,80,4,62,16,14,9,53,56,92],[16,39,5,42,96,35,31,47,55,58,88,24,0,17,54,24,36,29,85,57],[86,56,0,48,35,71,89,7,5,44,44,37,44,60,21,58,51,54,17,58],[19,80,81,68,5,94,47,69,28,73,92,13,86,52,17,77,4,89,55,40],[4,52,8,83,97,35,99,16,7,97,57,32,16,26,26,79,33,27,98,66],[88,36,68,87,57,62,20,72,3,46,33,67,46,55,12,32,63,93,53,69],[4,42,16,73,38,25,39,11,24,94,72,18,8,46,29,32,40,62,76,36],[20,69,36,41,72,30,23,88,34,62,99,69,82,67,59,85,74,4,36,16],[20,73,35,29,78,31,90,1,74,31,49,71,48,86,81,16,23,57,5,54],[1,70,54,71,83,51,54,69,16,92,33,48,61,43,52,1,89,19,67,48]]

print(prodligne(liste2))








