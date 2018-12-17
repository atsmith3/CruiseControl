#include "lenet_hls_c5.h"

float relu(float input) {
    if(input > 0) return input;
    else return 0;
}

// Convolution Layer 3
int convolution5(float input[16][5][5], float weights[120][16][5][5], float bias[120], float output[120][1][1]) {
#pragma HLS INTERFACE m_axi      depth=400    port=input   offset=slave bundle=DATA_A
#pragma HLS INTERFACE m_axi      depth=48000    port=weights offset=slave bundle=DATA_B
#pragma HLS INTERFACE m_axi      depth=120      port=bias    offset=slave bundle=DATA_C
#pragma HLS INTERFACE m_axi      depth=120    port=output  offset=slave bundle=DATA_D
#pragma HLS INTERFACE s_axilite  port=return

	/* Local Buffers */
	float c5_i[16][5][5];
	float c5_w[120][16][5][5];
	float c5_b[120];
	float c5_o[120][1][1];
	float c5_intermediate[120][1][1];

	int k, l;

	int co, h, w, i, m, j, n, ci;
	float sum = 0.0;

	/* BEGIN_LOOP_PARSER */
	for(i = 0; i < 16; i++) {
		for(j = 0; j < 5; j++) {
			for(k = 0; k < 5; k++) {
				c5_i[i][j][k] = input[i][j][k];
			}
		}
	}

	for(i = 0; i < 120; i++) {
		for(j = 0; j < 16; j++) {
			for(k = 0; k < 5; k++) {
				for(l = 0; l < 5; l++) {
					c5_w[i][j][k][l] = weights[i][j][k][l];
				}
			}
		}
	}

	for(i = 0; i < 120; i++) {
		c5_b[i] = bias[i];
	}

	/* Convolution 5 */
	for(co = 0; co < 120; co++) {
		sum = 0;
		for(i = 0, m = 0; i < 5; i++, m++) {
			for(j = 0, n = 0; j < 5; j++, n++) {
				for (ci = 0; ci < 16; ci++) {
					sum += c5_w[co][ci][m][n] * c5_i[ci][i][j];
				}
			}
		}
		c5_intermediate[co][0][0] = sum + c5_b[co];
	}

	/* ReLU 5 */
	for(i = 0; i < 120; i++) {
		c5_o[i][0][0] = relu(c5_intermediate[i][0][0]);
	}

	for(i = 0; i < 120; i++) {
		output[i][0][0] = c5_o[i][0][0];
	}
	/* END_LOOP_PARSER */

	return 0;
}
