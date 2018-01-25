#include <stdio.h>

int main(){
    int stockart[]={0,0,0,0,0,0,0,0,0,0,2,1,0};
    char *listart[]={"rien","rien","rien","rien","rien","rien","rien","rien","rien","rien","sachet de Madeleines","Coca","rien"};
    float prixart[]={0,0,0,0,0,0,0,0,0,0,0.80,1,0};
    int stockpieces[]={1,1,3,2,1,100};
    int choix;
    choix=0;
    float piecesvalides[]={2,1,0.5,0.2,0.1,0.05};
    int pieceok;
    printf("Bonjour, Bienvenue dans le distrubuteur v1 !\n");
    while (1) {
        printf(" 10 : madeleines (0.80€) \n 11 : Coca (1.00€) \n\nQuelle référence souhaitez vous ? (99 = shutdown)\n");
        scanf("%d", &choix);
        if (choix==99) {
            break;
        }
        float donne;
        donne=0;
        float ndon;
        ndon=0;
        printf("Vous avez demandé un ");
        printf("%s", listart[choix]);
        printf(".\n");
        if (stockart[choix]!=0) {
            while (donne<prixart[choix]) {
                printf("Give me money ! ");
                printf("%.2f", prixart[choix]-donne);
                printf(" manquant.\n");
                scanf("%f", &ndon);
                pieceok=0;
                for (int i=0; i<(sizeof(piecesvalides)/sizeof(*piecesvalides)); i++){
                    if (ndon==piecesvalides[i]){
                        donne=donne+ndon;
                        pieceok=1;
                    }
                }
                if (pieceok==0){
                    printf("La piece entrée n'est pas prise en compte, je la garde mais elle ne compte pas.\n");
                }
            }
            printf("Voici un \n");
            printf("%s", listart[choix]);
            printf(".\n");
            stockart[choix]=stockart[choix]-1;
            if (donne>prixart[choix]){
                float rendu=0;
                printf("Et : \n");
                while (rendu+0.01<donne-prixart[choix]) {
                    for (int i=0; i<(sizeof(piecesvalides)/sizeof(*piecesvalides)); i++){
                        if (((piecesvalides[i]-0.01)<=(donne-prixart[choix]-rendu)) && (stockpieces[i]>0)){
                            rendu=rendu+piecesvalides[i];
                            printf("%.2f",piecesvalides[i]);
                            printf("€\n");
                            stockpieces[i]=stockpieces[i]-1;
                            break;
                        }
                    }
                }
                printf("\n\n\n");
            }
        }
        else {
            printf("Cet article n'est pas/plus disponible.\n");
            choix=0;
        }
    }
    printf("\n     ShutDown...\n\n");
	return 0;
}
