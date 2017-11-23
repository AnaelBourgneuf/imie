void affichearme(void)
{
	//definition de la puissance des armes
	int concasseur = 3;
	int pelle = 2;
	int gatling = 10;
	int batte = 1;
	int blaster = 6;
	if (arme==concasseur)
	{
		printf("Il équipe le concasseur.\nIl perd un point d'action.\n");
	}
	if (arme==pelle)
	{
		printf("Il équipe la pelle.\nIl perd un point d'action.\n");
	}
	if (arme==gatling)
	{
		printf("Il équipe la gatling.\nIl perd un point d'action.\n");
	}
	if (arme==batte)
	{
		printf("Il équipe la batte.\nIl perd un point d'action.\n");
	}
	if (arme==blaster)
	{
		printf("Il équipe le blaster.\nIl perd un point d'action.\n");
	}
}

int meilarme(int perso)
{
	//definition du cout de chaque arme
	int cconcasseur = 4;
	int cpelle = 1;
	int cgatling = 6;
	int cbatte = 1;
	int cblaster = 3;
	//calcul de la possibilité de chaque arme
	puissanceconcasseur = ((perso[2]-1)%cconcasseur)*perso[3];
	puissancepelle = ((perso[2]-1)%cpelle)*perso[3];
	puissancegatling = ((perso[2]-1)%cgatling)*perso[3];
	puissancebatte = ((perso[2]-1)%cbatte)*perso[3];
	puissanceblaster = ((perso[2]-1)%cblaster)*perso[3];
	//calcul de l'arme qui sera la plus efficace
	int parme = puissanceconcasseur;
	int arme = concasseur;
	if (puissancepelle>parme)
	{
		parme=puissancepelle;
		arme=pelle;
	}
	if (puissancegatling>parme)
	{
		parme=puissancegatling;
		arme=gatling;
	}
	if (puissancebatte>parme)
	{
		parme=puissancebatte;
		arme=batte;
	}
	if (puissanceblaster>parme)
	{
		parme=puissanceblaster;
		arme=blaster;
	}
	return arme;
}

//fonction principale
void main(void)
{
	//definition de la puissance des armes
	int concasseur = 3;
	int pelle = 2;
	int gatling = 10;
	int batte = 1;
	int blaster = 6;
	//definition des personnages
	//modele : {PV,shield,PT,PA,points arme}
	int perso1[]={50,4,10,5,0};
	int perso2[]={20,2,15,10,0};
	int perso=perso2;
	while(perso1[0]>0 && perso2[0]>0)
	{
		if (perso==perso1)
		{
			perso=perso2;
		}
		else
		{
			perso=perso1;
		}
		int arme=meilarme(perso);
		if arme=concasseur
	}
}