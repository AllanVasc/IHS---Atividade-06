#include <stdio.h>
#include <stdlib.h>

extern void sort(int *v, int size);  // Módulo para realizar 

int main(){

    int *v;         // Ponteiro para o Vetor
    int size = 0;   // Tamanho do Vetor

    printf("Digite o tamanho do vetor:\n");
    scanf("%d", &size);

    v = (int*) malloc(size*sizeof(int)); // Alocação Dinamica para o vetor

    printf("Digite os elementos do vetor:\n");
    for(int i = 0; i < size; i++){
        scanf("%d", &v[i]);
    }

    sort(v, size);  // Chamando o módulo em Assembly para ordenação.

    free(v);
    return 0;
}
