#ifndef LENET_HLS_C5_H
#define LENET_HLS_C5_H

int convolution5(float input[16][5][5], float weights[120][16][5][5], float bias[120], float output[120][1][1]);

#endif
