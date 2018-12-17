#ifndef LENET_HLS_FC6_H
#define LENET_HLS_FC6_H

int fc6(float input[120][1][1], float weights[10][120][1][1], float bias[10], float output[10]);

#endif
