#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// renvoit un random en
int rand_a_b(int a, int b){
    return rand()%(b-a) +a;
}

//cree une grille vide
int creegrille(int taille){
    int grille[taille];
    for (int i = 0; i < taille; i++) {
        int ligne[taille];
        for (int j = 0; j < taille; j++) {
            ligne[j]=0;
        }
        grille[i]=ligne;
    }
    return grille;
}

//remplit la grille de 0 ou de 1 de façon aléatoire
int init(int grille, int taille){
    for (int i= 0 ; i < taille; i++) {
        for (int j = 0; j < taille; j++) {
            grille[i][j]=rand_a_b(0,2);
        }
    }
    return grille;
}

void affiche(){
    for (int i = 0; i < taille; i++) {
        for (int j = 0; j < taille; j++) {
            printf("%i", grille[i][j]);
        }
        printf("\n");
    }
}

void main(){
    int taille = 15;
    int grille[taille];
    grille = creegrille(taille);
    grille = init(grille, taille);
    affiche(grille,taille);
//    while (1) {
//        for (int i = 0; i < taille; i++) {
//            for (int j =0; j < taille; j++) {
//                posi[]={i-1,i,i+1};
//                posj[]={j-1,j,j+1};
//                for (int a = 0; a < 3; a++) {
//                    for (int b = 0; b < 3; b++) {
//                        <#statements#>
//                    }
//                }
//            }
//        }
//    }
}
