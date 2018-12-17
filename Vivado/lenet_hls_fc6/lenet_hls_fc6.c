#include "lenet_hls_fc6.h"
// Fully connected Layer 6
int fc6(float input[120][1][1], float weights[10][120][1][1], float bias[10], float output[10]) {
#pragma HLS INTERFACE m_axi      depth=120   port=input   offset=slave bundle=DATA_A
#pragma HLS INTERFACE m_axi      depth=1200  port=weights offset=slave bundle=DATA_B
#pragma HLS INTERFACE m_axi      depth=10    port=bias    offset=slave bundle=DATA_C
#pragma HLS INTERFACE m_axi      depth=10    port=output  offset=slave bundle=DATA_D
#pragma HLS INTERFACE s_axilite  port=return


    /* Local Buffers */
	float fc6_i[120][1][1];
	float fc6_w[10][120][1][1];
	float fc6_b[10];
	float fc6_o[10];

	/* BEGIN_LOOP_PARSER */
	int i, j, k, l;
	for(i = 0; i < 120; i++){
		fc6_i[i][0][0] = input[i][0][0];
	}

	for(i = 0; i < 10; i++){
		for(j = 0; j < 120; j++){
			fc6_w[i][j][0][0] = weights[i][j][0][0];
		}
	}

	for(i = 0; i < 10; i++){
		fc6_b[i] = bias[i];
	}

	int n, c;
    for(n = 0; n < 10; n++){
        output[n] = 0;
        for(c = 0; c < 120; c++){
            fc6_o[n] += fc6_w[n][c][0][0] * fc6_i[c][0][0];
        }
        fc6_o[n]+=fc6_b[n];
    }

	for(i = 0; i < 10; i++){
		output[i] = fc6_o[i];
	}
	/* END_LOOP_PARSER */

    return 0;
}
