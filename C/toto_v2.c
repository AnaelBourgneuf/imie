#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int main(){
    int stockart[]={0,0,0,0,0,0,0,0,0,0,0,0,0};
//    char*listart[]={"rien","rien","rien","rien","rien","rien","rien","rien","rien","rien","srien","rien","rien"};
    char listart[13][255];
    for  (int i; i<13; i++){
        strcpy(listart[i], "rien");
    }
    float prixart[]={0,0,0,0,0,0,0,0,0,0,0,0,0};
    int stockpieces[]={1,1,3,2,1,100};
    int choix;
    choix=0;
    float piecesvalides[]={2,1,0.5,0.2,0.1,0.05};
    int pieceok;
    printf("Bonjour, Bienvenue dans le distrubuteur v2 !\n");
    FILE* fichier = NULL;
    fichier = fopen("articles.txt", "r");
    if (fichier == NULL){
        printf("il n'y a pas d'articles (fichier innexistant)\n\n");
        return 0;
    }
    //lecture du fichier et enregistrement des variables contenues
    while (! feof(fichier)){
        int num;
        char nom[255];
        float prix;
        int stock;
        fscanf(fichier, "%d:%99[^:]:%f:%d\n",&num, nom, &prix, &stock);
        stockart[num]=stock;
        strcpy(listart[num], nom);
        prixart[num]=prix;
    }
//    printf("lecture ok");
    fclose(fichier);
    while (1) {
        printf(" 10 : madeleines (0.80€) \n 11 : Coca (1.00€) \n\nQuelle référence souhaitez vous ? (88 = mise a jour des produits, 99 = shutdown)\n");
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
    fichier = NULL;
    fichier = fopen("articles.txt", "w");
    if (fichier == NULL){
        printf("Impossible de sauvegarder les articles dispo.\n\n");
        return 0;
    }
    //lecture du fichier et enregistrement des variables contenues
    for (int i; i<(sizeof(stockart)/sizeof(*stockart)); i++){
        fprintf(fichier, "%d:%s:%.2f:%d\n",i,listart[i],prixart[i],stockart[i]);
    }
    fclose(fichier);
    
    printf("\n     ShutDown...\n\n");
	return 0;
}
