#include "mat_mul.h"

void copy_mat(matrix src, matrix dest) {
	int i = 0, j = 0;
	for(i = 0; i < N; i++) {
		for(j = 0; j < N; j++){
			dest[i][j] = src[i][j];
		}
	}
}

void mat_mul(matrix matA, matrix matB, matrix matC) {
	int i, j, k;
	for(i = 0; i < N; i++){
		for(j = 0; j < N; j++){
			for(k = 0; k < N; k++){
				matC[i][j] = matA[i][k] * matB[k][j];
			}
		}
	}
}

void mat_mul_wrap(matrix matA, matrix matB, matrix matC) {
	/* Input FIFO */

	/* Local Buffers */
	matrix matC_local;
	matrix matB_local;
	matrix matA_local;

	/* Copy Data to Local */
	copy_mat(matA, matA_local);
	copy_mat(matB, matB_local);

	/* Matrix Mult */
	mat_mul(matA_local, matB_local, matC_local);

	/* Writeback */
	copy_mat(matC_local, matC);
}
