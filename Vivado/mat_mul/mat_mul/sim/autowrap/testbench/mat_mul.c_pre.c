# 1 "C:/Users/anges/Documents/UIUC/ECE_527/Final_Project/Vivado/mat_mul/mat_mul.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "C:/Users/anges/Documents/UIUC/ECE_527/Final_Project/Vivado/mat_mul/mat_mul.c"
# 1 "C:/Users/anges/Documents/UIUC/ECE_527/Final_Project/Vivado/mat_mul/mat_mul.h" 1





typedef float matrix[100][100];

void mat_mul(matrix, matrix, matrix);
# 2 "C:/Users/anges/Documents/UIUC/ECE_527/Final_Project/Vivado/mat_mul/mat_mul.c" 2

void copy_mat(matrix src, matrix dest) {
 int i = 0, j = 0;
 for(i = 0; i < 100; i++) {
  for(j = 0; j < 100; j++){
   dest[i][j] = src[i][j];
  }
 }
}

void mat_mul(matrix matA, matrix matB, matrix matC) {
 int i, j, k;
 for(i = 0; i < 100; i++){
  for(j = 0; j < 100; j++){
   for(k = 0; k < 100; k++){
    matC[i][j] = matA[i][k] * matB[k][j];
   }
  }
 }
}

void mat_mul_wrap(matrix matA, matrix matB, matrix matC) {



 matrix matC_local;
 matrix matB_local;
 matrix matA_local;


 copy_mat(matA, matA_local);
 copy_mat(matB, matB_local);




 copy_mat(matC_local, matC);
}
