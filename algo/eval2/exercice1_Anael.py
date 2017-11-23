#exercice 1:
def legislatives():
	cand=[]
	for i in range(0,4):
		cand+=[int(input("score du candidat n°"+str(i+1)+" : ")),]
	pourscand1=(cand[0]*100)/(cand[0]+cand[1]+cand[2]+cand[3])
	print(pourscand1)
	if pourscand1>50:
		print("candidat 1 élu avec "+str(pourscand1)+"% des voix.")
	elif cand[0]>cand[1] and cand[0]>cand[2] and cand[0]>cand[3] and pourscand1>12.5:
		print("candidat 1 en ballotage favorable.")
	elif cand[0]>cand[1] and cand[0]>cand[2] and pourscand1<12.5:
		print("candidat 1 en balottage défavorable")
	elif cand[0]>cand[1] and cand[0]>cand[3] and pourscand1<12.5:
		print("candidat 1 en balottage défavorable")
	elif cand[0]>cand[3] and cand[0]>cand[2] and pourscand1<12.5:
		print("candidat 1 en balottage défavorable")
	else:
		print("candidat battu.")
print("exercice 1 : \n")
legislatives()
print("\n\n\n")
