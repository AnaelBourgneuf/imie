#include <stdio.h>

int main(){
//    int stockart[]={0,0,0,0,0,0,0,0,0,0,2,1,0};
//    int stockpieces[]={1,1,3,2,1,100};
    int choix;
    choix=0;
    float piecesvalides[]={2,1,0.5,0.2,0.1,0.05};
    int pieceok;
    printf("Bonjour, Bienvenue dans le distributeur v0 !\n");
//    while (stockart[choix]==0) {
    while (choix!=10 or choix!=11) {
        printf(" 10 : madeleines (0.80€) \n 11 : Coca (1.00€) \n\nQuelle référence souhaitez vous ?\n");
        scanf("%d", &choix);
        if (choix==10){
            float donne;
            donne=0;
            float ndon;
            ndon=0;
            printf("Vous avez demandé des madeleines (0.80)\n");
            while (donne<0.80) {
                printf("Give me money ! ");
                printf("%.2f", 0.80-donne);
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
            printf("Voici un sachet de Madeleines.\n");
            if (donne>0.80){
                float rendu=0;
                printf("Et : \n");
                while (rendu+0.01<donne-0.80) {
                    for (int i=0; i<(sizeof(piecesvalides)/sizeof(*piecesvalides)); i++){
                        if ((piecesvalides[i]-0.01)<=(donne-0.80-rendu)){
                            rendu=rendu+piecesvalides[i];
//                            donne=donne-piecesvalides[i];
                            printf("%.2f",piecesvalides[i]);
                            printf("€\n");
                            break;
                        }
                    }
//                    printf("%.2f",rendu);
                }
            }
        }
        else if (choix==11){
            float donne;
            donne=0;
            float ndon;
            ndon=0;
            printf("Vous avec demandé du coca (1.00€)\n");
            while (donne<1.00) {
                printf("Give me money ! ");
                printf("%.2f",1.00-donne);
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
            printf("Voici un Coca.\n");
            if (donne>1.00){
                float rendu=0;
                printf("Et : \n");
                while (rendu<donne-1.00) {
//                    printf("%.2f",rendu);
                    for (int i=0; i<(sizeof(piecesvalides)/sizeof(*piecesvalides)); i++){
                        if (piecesvalides[i]<=(donne-1.00-rendu)){
                            rendu=rendu+piecesvalides[i];
//                            donne=donne-piecesvalides[i];
                            printf("%.2f",piecesvalides[i]);
                            printf("€\n");
                            break;
                        }
                    }
                }
            }
        }
        else {
            printf("Votre choix est invalide\n");
        }
    }
	return 0;
}
