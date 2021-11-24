#include <stdio.h>
#include <stdlib.h>

void print(int *v, int size){   // Módulo para realizar o print dos elementos ordenados.
    printf("Resultado = ");
    for(int i = 0; i < size; i++){
        printf("%d ", v[i]);
    }
    printf("\n");
}