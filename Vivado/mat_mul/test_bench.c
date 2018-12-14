#include <stdio.h>
#include <stdlib.h>
#include "mat_mul.h"

float matAh[N][N] = {0};
float matBh[N][N] = {0};
float matCh[N][N] = {0};

float matAs[N][N] = {0};
float matBs[N][N] = {0};
float matCs[N][N] = {0};

void init(matrix hw, matrix sw) {
	int i, j;
	for(i = 0; i < N; i++){
		for(j = 0; j < N; j++){
			hw[i][j] = sw[i][j] = (float)(rand()%1000)/1000.0 - 0.5;
		}
	}
}

void mat_mul_s(matrix a, matrix b, matrix c) {
	int i, j, k;
	for(i = 0; i < N; i++){
		for(j = 0; j < N; j++){
			for(k = 0; k < N; k++){
				c[i][j] = a[i][k] * b[k][j];
			}
		}
	}
}

int compare(matrix hw, matrix sw) {
	int i, j;
	for(i = 0; i < N; i++){
		for(j = 0; j < N; j++){
			if(hw[i][j] =! sw[i][j]) {
				return 0;
			}
		}
	}
	return 1;
}

void main() {
	init(matAh, matAs);
	init(matBh, matBs);
	printf("Beginning HW SW CoSim\n");

	mat_mul_s(matAs, matBs, matCs);
	mat_mul_wrap(matAh, matBh, matCh);

	if(compare(matCh, matCs) == 1) printf("HW SW CoSim Pass\n");
}



