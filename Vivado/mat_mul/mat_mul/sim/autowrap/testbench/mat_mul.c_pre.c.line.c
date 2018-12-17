#pragma line 1 "C:/Users/anges/Documents/UIUC/ECE_527/Final_Project/Vivado/mat_mul/mat_mul.c"
#pragma line 1 "<built-in>"
#pragma line 1 "<command-line>"
#pragma line 1 "C:/Users/anges/Documents/UIUC/ECE_527/Final_Project/Vivado/mat_mul/mat_mul.c"
#pragma line 1 "C:/Users/anges/Documents/UIUC/ECE_527/Final_Project/Vivado/mat_mul/mat_mul.h" 1
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
typedef float matrix[100][100];
#pragma empty_line
void mat_mul(matrix, matrix, matrix);
#pragma line 2 "C:/Users/anges/Documents/UIUC/ECE_527/Final_Project/Vivado/mat_mul/mat_mul.c" 2
#pragma empty_line
void copy_mat(matrix src, matrix dest) {
 int i = 0, j = 0;
 for(i = 0; i < 100; i++) {
  for(j = 0; j < 100; j++){
   dest[i][j] = src[i][j];
  }
 }
}
#pragma empty_line
void mat_mul(matrix matA, matrix matB, matrix matC) {
 int i, j, k;
 for(i = 0; i < 100; i++){
  for(j = 0; j < 100; j++){
   for(k = 0; k < 100; k++){
#pragma HLS UNROLL factor=10
    matC[i][j] = matA[i][k] * matB[k][j];
   }
  }
 }
}
#pragma empty_line
void mat_mul_wrap(matrix matA, matrix matB, matrix matC) {
#pragma empty_line
#pragma empty_line
#pragma empty_line
 matrix matC_local;
 matrix matB_local;
 matrix matA_local;
#pragma empty_line
#pragma empty_line
 copy_mat(matA, matA_local);
 copy_mat(matB, matB_local);
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
 copy_mat(matC_local, matC);
}
