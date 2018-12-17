#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#include "lenet_hls_c5.h"

float relu_tb(float input) {
    if(input > 0) return input;
    else return 0;
}

// Relu Layer 5
void relu5_tb(float input[120][1][1], float output[120][1][1]) {
	int i;
    for(i = 0; i < 120; i++) {
        output[i][0][0] = relu_tb(input[i][0][0]);
    }
}

// Convolution Layer 3
void convolution5_tb(float input[16][5][5], float weights[120][16][5][5], float bias[120], float output[120][1][1]) {
	int co, h, w, i, m, j, n, ci;
	float sum = 0.0;

	for(co = 0; co < 120; co++){
		sum = 0;
		for(i = 0, m = 0; i < 5; i++, m++) {
			for(j = 0, n = 0; j < 5; j++, n++) {
				for (ci = 0; ci < 16; ci++)
					sum += weights[co][ci][m][n] * input[ci][i][j];
			}
		}
		output[co][0][0] = sum + bias[co];
	}
	return;
}




int main() {

	float _i[16][5][5];
	float _w[120][16][5][5];
	float _b[120];
	float _o_h[120][1][1];
	float _o_s[120][1][1];
	float _o_s_int[120][1][1];

	int i, j, k, l;
	for(i = 0; i < 16; i++) {
		for(j = 0; j < 5; j++) {
			for(k = 0; k < 5; k++) {
				_i[i][j][k] = (float)(rand()%100)/100.0;
			}
		}
	}

	for(i = 0; i < 120; i++) {
		for(j = 0; j < 16; j++) {
			for(k = 0; k < 5; k++) {
				for(l = 0; l < 5; l++) {
						_w[i][j][k][l] = (float)(rand()%100)/100.0;
				}
			}
		}
	}

	for(i = 0; i < 120; i++) {
		_b[i] = (float)(rand()%100)/100.0;
	}

	/* Tests */
	convolution5_tb(_i, _w, _b, _o_s_int);
	relu5_tb(_o_s_int, _o_s);
	convolution5(_i, _w, _b, _o_h);




	printf("[TEST_BENCH] Output SW: ");
	for(i = 0; i < 120; i++) {
		 printf("%f ", _o_s[i][0][0]);
	}
	printf("\n");

	printf("[TEST_BENCH] Output HW: ");
	for(i = 0; i < 120; i++) {
		 printf("%f ", _o_h[i][0][0]);
	}
	printf("\n");

	fflush(stdout);

    return 0;
}
