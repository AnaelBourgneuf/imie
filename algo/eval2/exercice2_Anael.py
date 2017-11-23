#exercice 2:
def tableaux():
	tab1=[4,8,7,9,1,5,4,6]
	tab2=[7,6,5,2,1,3,7,4]
	tab3=[0,0,0,0,0,0,0,0]
	for i in range(0,len(tab1)):
		tab3[i]=tab1[i]+tab2[i]
	print(tab3)
	for i in range(0,len(tab1)):
		tab1[i]+=1
		tab2[i]+=1
	for i in range(0,len(tab1)):
		tab3[i]=tab1[i]+tab2[i]
	print(tab3)
	pg=[0,0]
	for i in range(0,len(tab1)):
		if tab3[i]>pg[0]:
			pg=[tab3[i],i]
	print("le plus grand est "+str(pg[0])+" à la "+str(pg[1]+1)+"ème position")
print("exercice 2 : \n")
tableaux()
print("\n\n\n")