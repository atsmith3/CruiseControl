#include "mat_mul.h"

void copy_mat(float** src, float** dest) {
	int i = 0, j = 0;
	for(i = 0; i < N; i++) {
		for(j = 0; j < N; j++){
			dest[i][j] = src[i][j];
		}
	}
}

void mat_mul(float** matA, float** matB, float** matC) {
	int i, j, k;
	for(i = 0; i < N; i++){
		for(j = 0; j < N; j++){
			for(k = 0; k < N; k++){

			}
		}
	}
}

void mat_mul_wrap(float** matA, float** matB, float** matC) {
	/* Input FIFO */

	/* Local Buffers */
	float matC_local[N][N];
	float matB_local[N][N];
	float matA_local[N][N];

	/* Copy Data to Local */
	copy_mat(matA, matA_local);
	copy_mat(matB, matB_local);

	/* Matrix Mult */

	/* Writeback */
	copy_mat(matC_local, matC);
}
