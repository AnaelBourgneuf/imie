#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// renvoit un random en
int rand_a_b(int a, int b)
{
    return rand()%(b-a) +a;
}

//cree une grille vide
void creegrille(int* grille, int taille)
{
    //int grille[taille][taille];
    for (int i = 0; i < taille; i++) 
    {
        // int ligne[taille];
        for (int j = 0; j < taille; j++) 
        {
            *(grille + i * taille + j)=0;
        }
        // grille[i]=ligne;
    }
    //return grille;
}

//remplit la grille de 0 ou de 1 de façon aléatoire
void init(int * grille, int taille)
{
    for (int i= 0 ; i < taille; i++) 
    {
        for (int j = 0; j < taille; j++) 
        {
            *(grille + i * taille + j)=rand_a_b(0,2);
        }
    }
    //return grille;
}

void affiche(int * grille, int taille)
{
    for (int i = 0; i < taille; i++)
    {
        for (int j = 0; j < taille; j++)
        {
            printf("%d  ", * (grille + i * taille + j));
        }
        printf("\n");
    }
    printf("\n\n\n");
}

int testcase(int * grille, int i, int j, int taille){
    if (i==0)
    {
        if (j==0)
        {   
            int nb= *(grille + i * taille + j + 1)+ *(grille + (i + 1) * taille + j) + *(grille +(i + 1) * taille + j + 1);
            if (nb==3)
            {
                *(grille + i * taille + j)= 1;
            }
            else if (nb<2)
            {
                *(grille + i * taille + j)= 0;
            }
        }
        else if (j==taille-1)
        {
            int nb= *(grille + i * taille + j - 1) + *(grille + (i + 1) * taille + j - 1) + *(grille + (i + 1) * taille + j);
            if (nb==3)
            {
                *(grille + i * taille + j)= 1;
            }
            else if (nb<2)
            {
                *(grille + i * taille + j)= 0;
            }
        }
        else
        {
            int nb= *(grille + i * taille + j - 1) + *(grille + i * taille + j + 1) + *(grille + (i + 1) * taille + j - 1) + *(grille + (i + 1) * taille + j) + *(grille + (i + 1) * taille + j + 1);
            if (nb>3)
            {
                *(grille + i * taille + j)= 0;
            }
            else if (nb==3)
            {
                *(grille + i * taille + j)= 1;
            }
            else if (nb<2)
            {
                *(grille + i * taille + j)= 0;
            }
        }
    }
    else if (i==taille-1)
    {
        if (j==0)
        {
            int nb= *(grille +i * taille + j + 1) + *(grille + (i - 1) * taille + j) + *(grille + (i-1) * taille + j + 1);
            if (nb==3)
            {
                *(grille + i * taille + j)= 1;
            }
            else if (nb<2)
            {
                *(grille + i * taille + j)= 0;
            }
        }
        else if (j==taille-1)
        {
            int nb= *(grille + i * taille + j - 1) + *(grille + (i - 1) * taille + j) + *(grille + (i - 1) * taille + j - 1);
            if (nb==3)
            {
                *(grille + i * taille + j)= 1;
            }
            else if (nb<2)
            {
                *(grille + i * taille + j)= 0;
            }
        }
        else
        {
            int nb= *(grille + i * taille + j - 1) + *(grille + i * taille + j + 1) + *(grille + (i + 1) * taille + j - 1) + *(grille + (i + 1) * taille + j) + *(grille + (i + 1) * taille + j + 1);
            if (nb>3)
            {
                *(grille + i * taille + j)= 0;
            }
            else if (nb==3)
            {
                *(grille + i * taille + j)= 1;
            }
            else if (nb<2)
            {
                *(grille + i * taille + j)= 0;
            }
        }
    }
    else if (j==0)
    {
        if (i==0)
        {   
            int nb= *(grille + (i + 1) * taille + j) + *(grille + i * taille + j + 1) + *(grille + (i + 1) * taille + j + 1);
            if (nb==3)
            {
                *(grille + i * taille + j)= 1;
            }
            else if (nb<2)
            {
                *(grille + i * taille + j)= 0;
            }
        }
        else if (i==taille-1)
        {
            int nb= *(grille + (i - 1) * taille + j) + *(grille+ (i - 1) * taille + j + 1) + *(grille + i * taille + j + 1);
            if (nb==3)
            {
                *(grille + i * taille + j)= 1;
            }
            else if (nb<2)
            {
                *(grille + i * taille + j)= 0;
            }
        }
        else
        {
            int nb= *(grille + (i - 1) * taille + j) + *(grille + (i + 1) * taille + j) + *(grille + (i - 1) * taille + j + 1) + *(grille + i * taille + j + 1) + *(grille + (i + 1) * taille + j + 1);
            if (nb>3)
            {
                *(grille + i * taille + j)= 0;
            }
            else if (nb==3)
            {
                *(grille + i * taille + j)= 1;
            }
            else if (nb<2)
            {
                *(grille + i * taille + j)= 0;
            }
        }
    }
    else if (j==taille-1)
    {
        if (i==0)
        {
            int nb= *(grille + (i + 1) * taille + j) + *(grille + i * taille + j - 1) + *(grille + (i + 1) *taille + j - 1);
            if (nb==3)
            {
                *(grille + i * taille + j)= 1;
            }
            else if (nb<2)
            {
                *(grille + i * taille + j)= 0;
            }
        }
        else if (j==taille-1)
        {
            int nb= *(grille + (i - 1) * taille + j) + *(grille + i * taille + j - 1) + *(grille + (i - 1) * taille + j - 1);
            if (nb==3)
            {
                *(grille + i * taille + j)= 1;
            }
            else if (nb<2)
            {
                *(grille + i * taille + j)= 0;
            }
        }
        else
        {
            int nb= *(grille +(i - 1) * taille + j) + *(grille + (i + 1) * taille + j) + *(grille + (i - 1) * taille + j + 1) + *(grille + i * taille + j + 1) + *(grille +(i + 1) * taille + j + 1);
            if (nb>3)
            {
                *(grille + i * taille + j)= 0;
            }
            else if (nb==3)
            {
                *(grille + i * taille + j)= 1;
            }
            else if (nb<2)
            {
                *(grille + i * taille + j)= 0;
            }
        }
    }
    else 
    {
        int nb= *(grille + (i - 1) * taille + j - 1) + *(grille + (i - 1) * taille + j) + *(grille + (i-1) * taille + j + 1) + *(grille + i * taille + j - 1) + *(grille + i * taille + j + 1) + *(grille + (i + 1) * taille + j - 1) + *(grille + (i + 1) * taille + j) + *(grille + (i + 1) * taille + j + 1);
        if (nb>3)
        {
            *(grille + i * taille + j)= 0;
        }
        else if (nb==3)
        {
            *(grille + i * taille + j)= 1;
        }
        else if (nb<2)
        {
            *(grille + i * taille + j)= 0;
        }
    }
    // *(grille + i * taille + j)= -1 ;
}

int main()
{
    int taille = 30;
    int * grille = malloc(taille * taille * sizeof(int));

    init(grille, taille);

    affiche(grille,taille);
// return 0;
   


   while (1)
   {
       for (int i = 0; i < taille; i++)
       {
           for (int j =0; j < taille; j++)
           {
                testcase(grille,i,j,taille); 
                // **(grille + i * taille + j)=testcase(grille,i,j,taille);
           }
       }
       affiche(grille, taille);
   }
}
