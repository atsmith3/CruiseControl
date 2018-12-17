#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#include "lenet_hls_fc6.h"

// Fully connected Layer 6

int fc6_tb(float input[120][1][1], float weights[10][120][1][1], float bias[10], float output[10]) {
	int n, c;
    for(n = 0; n < 10; n++) {
        output[n] = 0;
        for(c = 0; c < 120; c++)
        {
            output[n] += weights[n][c][0][0] * input[c][0][0];
        }
        output[n]+=bias[n];
    }

    return 0;
}



int main() {

	float _i[120][1][1];
	float _w[10][120][1][1];
	float _b[10];
	float _o_h[10];
	float _o_s[10];

	int i, j, k, l;
	for(i = 0; i < 120; i++) {
		for(j = 0; j < 1; j++) {
			for(k = 0; k < 1; k++) {
				_i[i][j][k] = (float)(rand()%1000)/100.0;
			}
		}
	}

	for(i = 0; i < 10; i++) {
		for(j = 0; j < 120; j++) {
			for(k = 0; k < 1; k++) {
				for(l = 0; l < 1; l++) {
				    _w[i][j][k][l] = (float)(rand()%100)/100.0;
				}
			}
		}
	}

	for(i = 0; i < 10; i++) {
		_b[i] = (float)(rand()%100)/100.0;
	}

	/* Tests */
	fc6_tb(_i, _w, _b, _o_s);
	fc6(_i, _w, _b, _o_h);




	printf("[TEST_BENCH] Output SW: ");
	for(i = 0; i < 10; i++) {
		 printf("%f ", _o_s[i]);
	}
	printf("\n");

	printf("[TEST_BENCH] Output HW: ");
	for(i = 0; i < 10; i++) {
		 printf("%f ", _o_s[i]);
	}
	printf("\n");

	fflush(stdout);

    return 0;
}
