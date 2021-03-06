/* Provide Declarations */
#include <stdarg.h>
#include <setjmp.h>
#include <limits.h>
#ifdef NEED_CBEAPINT
#include <autopilot_cbe.h>
#else
#define aesl_fopen fopen
#define aesl_freopen freopen
#define aesl_tmpfile tmpfile
#endif
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>
#ifdef __STRICT_ANSI__
#define inline __inline__
#define typeof __typeof__ 
#endif
#define __isoc99_fscanf fscanf
#define __isoc99_sscanf sscanf
#undef ferror
#undef feof
/* get a declaration for alloca */
#if defined(__CYGWIN__) || defined(__MINGW32__)
#define  alloca(x) __builtin_alloca((x))
#define _alloca(x) __builtin_alloca((x))
#elif defined(__APPLE__)
extern void *__builtin_alloca(unsigned long);
#define alloca(x) __builtin_alloca(x)
#define longjmp _longjmp
#define setjmp _setjmp
#elif defined(__sun__)
#if defined(__sparcv9)
extern void *__builtin_alloca(unsigned long);
#else
extern void *__builtin_alloca(unsigned int);
#endif
#define alloca(x) __builtin_alloca(x)
#elif defined(__FreeBSD__) || defined(__NetBSD__) || defined(__OpenBSD__) || defined(__DragonFly__) || defined(__arm__)
#define alloca(x) __builtin_alloca(x)
#elif defined(_MSC_VER)
#define inline _inline
#define alloca(x) _alloca(x)
#else
#include <alloca.h>
#endif

#ifndef __GNUC__  /* Can only support "linkonce" vars with GCC */
#define __attribute__(X)
#endif

#if defined(__GNUC__) && defined(__APPLE_CC__)
#define __EXTERNAL_WEAK__ __attribute__((weak_import))
#elif defined(__GNUC__)
#define __EXTERNAL_WEAK__ __attribute__((weak))
#else
#define __EXTERNAL_WEAK__
#endif

#if defined(__GNUC__) && (defined(__APPLE_CC__) || defined(__CYGWIN__) || defined(__MINGW32__))
#define __ATTRIBUTE_WEAK__
#elif defined(__GNUC__)
#define __ATTRIBUTE_WEAK__ __attribute__((weak))
#else
#define __ATTRIBUTE_WEAK__
#endif

#if defined(__GNUC__)
#define __HIDDEN__ __attribute__((visibility("hidden")))
#endif

#ifdef __GNUC__
#define LLVM_NAN(NanStr)   __builtin_nan(NanStr)   /* Double */
#define LLVM_NANF(NanStr)  __builtin_nanf(NanStr)  /* Float */
#define LLVM_NANS(NanStr)  __builtin_nans(NanStr)  /* Double */
#define LLVM_NANSF(NanStr) __builtin_nansf(NanStr) /* Float */
#define LLVM_INF           __builtin_inf()         /* Double */
#define LLVM_INFF          __builtin_inff()        /* Float */
#define LLVM_PREFETCH(addr,rw,locality) __builtin_prefetch(addr,rw,locality)
#define __ATTRIBUTE_CTOR__ __attribute__((constructor))
#define __ATTRIBUTE_DTOR__ __attribute__((destructor))
#define LLVM_ASM           __asm__
#else
#define LLVM_NAN(NanStr)   ((double)0.0)           /* Double */
#define LLVM_NANF(NanStr)  0.0F                    /* Float */
#define LLVM_NANS(NanStr)  ((double)0.0)           /* Double */
#define LLVM_NANSF(NanStr) 0.0F                    /* Float */
#define LLVM_INF           ((double)0.0)           /* Double */
#define LLVM_INFF          0.0F                    /* Float */
#define LLVM_PREFETCH(addr,rw,locality)            /* PREFETCH */
#define __ATTRIBUTE_CTOR__
#define __ATTRIBUTE_DTOR__
#define LLVM_ASM(X)
#endif

#if __GNUC__ < 4 /* Old GCC's, or compilers not GCC */ 
#define __builtin_stack_save() 0   /* not implemented */
#define __builtin_stack_restore(X) /* noop */
#endif

#if __GNUC__ && __LP64__ /* 128-bit integer types */
typedef int __attribute__((mode(TI))) llvmInt128;
typedef unsigned __attribute__((mode(TI))) llvmUInt128;
#endif

#define CODE_FOR_MAIN() /* Any target-specific code for main()*/

#ifndef __cplusplus
typedef unsigned char bool;
#endif


/* Support for floating point constants */
typedef unsigned long long ConstantDoubleTy;
typedef unsigned int        ConstantFloatTy;
typedef struct { unsigned long long f1; unsigned short f2; unsigned short pad[3]; } ConstantFP80Ty;
typedef struct { unsigned long long f1; unsigned long long f2; } ConstantFP128Ty;


/* Global Declarations */
/* Helper union for bitcasts */
typedef union {
  unsigned int Int32;
  unsigned long long Int64;
  float Float;
  double Double;
} llvmBitCastUnion;

/* Function Declarations */
double fmod(double, double);
float fmodf(float, float);
long double fmodl(long double, long double);
void copy_mat(float (*llvm_cbe_src)[100], float (*llvm_cbe_dest)[100]);
void mat_mul(float (*llvm_cbe_matA)[100], float (*llvm_cbe_matB)[100], float (*llvm_cbe_matC)[100]);
void mat_mul_wrap(float (*llvm_cbe_matA)[100], float (*llvm_cbe_matB)[100], float (*llvm_cbe_matC)[100]);


/* Function Bodies */
static inline int llvm_fcmp_ord(double X, double Y) { return X == X && Y == Y; }
static inline int llvm_fcmp_uno(double X, double Y) { return X != X || Y != Y; }
static inline int llvm_fcmp_ueq(double X, double Y) { return X == Y || llvm_fcmp_uno(X, Y); }
static inline int llvm_fcmp_une(double X, double Y) { return X != Y; }
static inline int llvm_fcmp_ult(double X, double Y) { return X <  Y || llvm_fcmp_uno(X, Y); }
static inline int llvm_fcmp_ugt(double X, double Y) { return X >  Y || llvm_fcmp_uno(X, Y); }
static inline int llvm_fcmp_ule(double X, double Y) { return X <= Y || llvm_fcmp_uno(X, Y); }
static inline int llvm_fcmp_uge(double X, double Y) { return X >= Y || llvm_fcmp_uno(X, Y); }
static inline int llvm_fcmp_oeq(double X, double Y) { return X == Y ; }
static inline int llvm_fcmp_one(double X, double Y) { return X != Y && llvm_fcmp_ord(X, Y); }
static inline int llvm_fcmp_olt(double X, double Y) { return X <  Y ; }
static inline int llvm_fcmp_ogt(double X, double Y) { return X >  Y ; }
static inline int llvm_fcmp_ole(double X, double Y) { return X <= Y ; }
static inline int llvm_fcmp_oge(double X, double Y) { return X >= Y ; }

void copy_mat(float (*llvm_cbe_src)[100], float (*llvm_cbe_dest)[100]) {
  static  unsigned long long aesl_llvm_cbe_1_count = 0;
  static  unsigned long long aesl_llvm_cbe_2_count = 0;
  static  unsigned long long aesl_llvm_cbe_3_count = 0;
  static  unsigned long long aesl_llvm_cbe_4_count = 0;
  static  unsigned long long aesl_llvm_cbe_5_count = 0;
  static  unsigned long long aesl_llvm_cbe_6_count = 0;
  static  unsigned long long aesl_llvm_cbe_7_count = 0;
  static  unsigned long long aesl_llvm_cbe_8_count = 0;
  static  unsigned long long aesl_llvm_cbe_9_count = 0;
  static  unsigned long long aesl_llvm_cbe_10_count = 0;
  static  unsigned long long aesl_llvm_cbe_11_count = 0;
  static  unsigned long long aesl_llvm_cbe_12_count = 0;
  static  unsigned long long aesl_llvm_cbe_13_count = 0;
  static  unsigned long long aesl_llvm_cbe_14_count = 0;
  static  unsigned long long aesl_llvm_cbe_15_count = 0;
  static  unsigned long long aesl_llvm_cbe_16_count = 0;
  static  unsigned long long aesl_llvm_cbe_17_count = 0;
  static  unsigned long long aesl_llvm_cbe_18_count = 0;
  static  unsigned long long aesl_llvm_cbe_19_count = 0;
  static  unsigned long long aesl_llvm_cbe_20_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge3_count = 0;
  unsigned int llvm_cbe_storemerge3;
  unsigned int llvm_cbe_storemerge3__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_21_count = 0;
  static  unsigned long long aesl_llvm_cbe_22_count = 0;
  static  unsigned long long aesl_llvm_cbe_23_count = 0;
  static  unsigned long long aesl_llvm_cbe_24_count = 0;
  static  unsigned long long aesl_llvm_cbe_25_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge12_count = 0;
  unsigned int llvm_cbe_storemerge12;
  unsigned int llvm_cbe_storemerge12__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_26_count = 0;
  float *llvm_cbe_tmp__1;
  static  unsigned long long aesl_llvm_cbe_27_count = 0;
  float llvm_cbe_tmp__2;
  static  unsigned long long aesl_llvm_cbe_28_count = 0;
  float *llvm_cbe_tmp__3;
  static  unsigned long long aesl_llvm_cbe_29_count = 0;
  static  unsigned long long aesl_llvm_cbe_30_count = 0;
  unsigned int llvm_cbe_tmp__4;
  static  unsigned long long aesl_llvm_cbe_31_count = 0;
  static  unsigned long long aesl_llvm_cbe_32_count = 0;
  static  unsigned long long aesl_llvm_cbe_33_count = 0;
  static  unsigned long long aesl_llvm_cbe_34_count = 0;
  static  unsigned long long aesl_llvm_cbe_35_count = 0;
  static  unsigned long long aesl_llvm_cbe_exitcond_count = 0;
  static  unsigned long long aesl_llvm_cbe_36_count = 0;
  static  unsigned long long aesl_llvm_cbe_37_count = 0;
  unsigned int llvm_cbe_tmp__5;
  static  unsigned long long aesl_llvm_cbe_38_count = 0;
  static  unsigned long long aesl_llvm_cbe_39_count = 0;
  static  unsigned long long aesl_llvm_cbe_40_count = 0;
  static  unsigned long long aesl_llvm_cbe_41_count = 0;
  static  unsigned long long aesl_llvm_cbe_42_count = 0;
  static  unsigned long long aesl_llvm_cbe_exitcond4_count = 0;
  static  unsigned long long aesl_llvm_cbe_43_count = 0;
  static  unsigned long long aesl_llvm_cbe_44_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @copy_mat\n");
  llvm_cbe_storemerge3__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
  goto llvm_cbe__2e_preheader;

  do {     /* Syntactic loop '.preheader' to make GCC happy */
llvm_cbe__2e_preheader:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge3 = phi i32 [ 0, %%0 ], [ %%7, %%6  for 0x%I64xth hint within @copy_mat  --> \n", ++aesl_llvm_cbe_storemerge3_count);
  llvm_cbe_storemerge3 = (unsigned int )llvm_cbe_storemerge3__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge3 = 0x%X",llvm_cbe_storemerge3);
printf("\n = 0x%X",0u);
printf("\n = 0x%X",llvm_cbe_tmp__5);
}
  llvm_cbe_storemerge12__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
  goto llvm_cbe_tmp__6;

llvm_cbe_tmp__7:
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = add nsw i32 %%storemerge3, 1, !dbg !4 for 0x%I64xth hint within @copy_mat  --> \n", ++aesl_llvm_cbe_37_count);
  llvm_cbe_tmp__5 = (unsigned int )((unsigned int )(llvm_cbe_storemerge3&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__5&4294967295ull)));
  if (((llvm_cbe_tmp__5&4294967295U) == (100u&4294967295U))) {
    goto llvm_cbe_tmp__8;
  } else {
    llvm_cbe_storemerge3__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__5;   /* for PHI node */
    goto llvm_cbe__2e_preheader;
  }

  do {     /* Syntactic loop '' to make GCC happy */
llvm_cbe_tmp__6:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge12 = phi i32 [ 0, %%.preheader ], [ %%5, %%1  for 0x%I64xth hint within @copy_mat  --> \n", ++aesl_llvm_cbe_storemerge12_count);
  llvm_cbe_storemerge12 = (unsigned int )llvm_cbe_storemerge12__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge12 = 0x%X",llvm_cbe_storemerge12);
printf("\n = 0x%X",0u);
printf("\n = 0x%X",llvm_cbe_tmp__4);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = getelementptr inbounds [100 x float]* %%src, i32 %%storemerge3, i32 %%storemerge12, !dbg !3 for 0x%I64xth hint within @copy_mat  --> \n", ++aesl_llvm_cbe_26_count);
  llvm_cbe_tmp__1 = (float *)(&llvm_cbe_src[(((signed int )llvm_cbe_storemerge3))
#ifdef AESL_BC_SIM
 % 100
#endif
][(((signed int )llvm_cbe_storemerge12))]);
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge3 = 0x%X",((signed int )llvm_cbe_storemerge3));
printf("\nstoremerge12 = 0x%X",((signed int )llvm_cbe_storemerge12));
}

#ifdef AESL_BC_SIM
  if (!(((signed int )llvm_cbe_storemerge12) < 100)) fprintf(stderr, "%s:%d: warning: Read access out of array 'src' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%3 = load float* %%2, align 4, !dbg !3 for 0x%I64xth hint within @copy_mat  --> \n", ++aesl_llvm_cbe_27_count);
  llvm_cbe_tmp__2 = (float )*llvm_cbe_tmp__1;
if (AESL_DEBUG_TRACE)
printf("\n = %f,  0x%x\n", llvm_cbe_tmp__2, *(int*)(&llvm_cbe_tmp__2));
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = getelementptr inbounds [100 x float]* %%dest, i32 %%storemerge3, i32 %%storemerge12, !dbg !3 for 0x%I64xth hint within @copy_mat  --> \n", ++aesl_llvm_cbe_28_count);
  llvm_cbe_tmp__3 = (float *)(&llvm_cbe_dest[(((signed int )llvm_cbe_storemerge3))
#ifdef AESL_BC_SIM
 % 100
#endif
][(((signed int )llvm_cbe_storemerge12))]);
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge3 = 0x%X",((signed int )llvm_cbe_storemerge3));
printf("\nstoremerge12 = 0x%X",((signed int )llvm_cbe_storemerge12));
}

#ifdef AESL_BC_SIM
  assert(((signed int )llvm_cbe_storemerge12) < 100 && "Write access out of array 'dest' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store float %%3, float* %%4, align 4, !dbg !3 for 0x%I64xth hint within @copy_mat  --> \n", ++aesl_llvm_cbe_29_count);
  *llvm_cbe_tmp__3 = llvm_cbe_tmp__2;
if (AESL_DEBUG_TRACE)
printf("\n = %f\n", llvm_cbe_tmp__2);
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = add nsw i32 %%storemerge12, 1, !dbg !5 for 0x%I64xth hint within @copy_mat  --> \n", ++aesl_llvm_cbe_30_count);
  llvm_cbe_tmp__4 = (unsigned int )((unsigned int )(llvm_cbe_storemerge12&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__4&4294967295ull)));
  if (((llvm_cbe_tmp__4&4294967295U) == (100u&4294967295U))) {
    goto llvm_cbe_tmp__7;
  } else {
    llvm_cbe_storemerge12__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__4;   /* for PHI node */
    goto llvm_cbe_tmp__6;
  }

  } while (1); /* end of syntactic loop '' */
  } while (1); /* end of syntactic loop '.preheader' */
llvm_cbe_tmp__8:
  if (AESL_DEBUG_TRACE)
      printf("\nEND @copy_mat}\n");
  return;
}


void mat_mul(float (*llvm_cbe_matA)[100], float (*llvm_cbe_matB)[100], float (*llvm_cbe_matC)[100]) {
  static  unsigned long long aesl_llvm_cbe_45_count = 0;
  static  unsigned long long aesl_llvm_cbe_46_count = 0;
  static  unsigned long long aesl_llvm_cbe_47_count = 0;
  static  unsigned long long aesl_llvm_cbe_48_count = 0;
  static  unsigned long long aesl_llvm_cbe_49_count = 0;
  static  unsigned long long aesl_llvm_cbe_50_count = 0;
  static  unsigned long long aesl_llvm_cbe_51_count = 0;
  static  unsigned long long aesl_llvm_cbe_52_count = 0;
  static  unsigned long long aesl_llvm_cbe_53_count = 0;
  static  unsigned long long aesl_llvm_cbe_54_count = 0;
  static  unsigned long long aesl_llvm_cbe_55_count = 0;
  static  unsigned long long aesl_llvm_cbe_56_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge6_count = 0;
  unsigned int llvm_cbe_storemerge6;
  unsigned int llvm_cbe_storemerge6__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_57_count = 0;
  static  unsigned long long aesl_llvm_cbe_58_count = 0;
  static  unsigned long long aesl_llvm_cbe_59_count = 0;
  static  unsigned long long aesl_llvm_cbe_60_count = 0;
  static  unsigned long long aesl_llvm_cbe_61_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge15_count = 0;
  unsigned int llvm_cbe_storemerge15;
  unsigned int llvm_cbe_storemerge15__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_62_count = 0;
  static  unsigned long long aesl_llvm_cbe_63_count = 0;
  static  unsigned long long aesl_llvm_cbe_64_count = 0;
  static  unsigned long long aesl_llvm_cbe_65_count = 0;
  static  unsigned long long aesl_llvm_cbe_66_count = 0;
  float *llvm_cbe_tmp__9;
  static  unsigned long long aesl_llvm_cbe_67_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge23_count = 0;
  unsigned int llvm_cbe_storemerge23;
  unsigned int llvm_cbe_storemerge23__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_68_count = 0;
  float *llvm_cbe_tmp__10;
  static  unsigned long long aesl_llvm_cbe_69_count = 0;
  float llvm_cbe_tmp__11;
  static  unsigned long long aesl_llvm_cbe_70_count = 0;
  float *llvm_cbe_tmp__12;
  static  unsigned long long aesl_llvm_cbe_71_count = 0;
  float llvm_cbe_tmp__13;
  static  unsigned long long aesl_llvm_cbe_72_count = 0;
  float llvm_cbe_tmp__14;
  static  unsigned long long aesl_llvm_cbe_73_count = 0;
  static  unsigned long long aesl_llvm_cbe_74_count = 0;
  unsigned int llvm_cbe_tmp__15;
  static  unsigned long long aesl_llvm_cbe_75_count = 0;
  static  unsigned long long aesl_llvm_cbe_76_count = 0;
  static  unsigned long long aesl_llvm_cbe_77_count = 0;
  static  unsigned long long aesl_llvm_cbe_78_count = 0;
  static  unsigned long long aesl_llvm_cbe_79_count = 0;
  static  unsigned long long aesl_llvm_cbe_exitcond_count = 0;
  static  unsigned long long aesl_llvm_cbe_80_count = 0;
  static  unsigned long long aesl_llvm_cbe_81_count = 0;
  unsigned int llvm_cbe_tmp__16;
  static  unsigned long long aesl_llvm_cbe_82_count = 0;
  static  unsigned long long aesl_llvm_cbe_83_count = 0;
  static  unsigned long long aesl_llvm_cbe_84_count = 0;
  static  unsigned long long aesl_llvm_cbe_85_count = 0;
  static  unsigned long long aesl_llvm_cbe_86_count = 0;
  static  unsigned long long aesl_llvm_cbe_exitcond7_count = 0;
  static  unsigned long long aesl_llvm_cbe_87_count = 0;
  static  unsigned long long aesl_llvm_cbe_88_count = 0;
  unsigned int llvm_cbe_tmp__17;
  static  unsigned long long aesl_llvm_cbe_89_count = 0;
  static  unsigned long long aesl_llvm_cbe_90_count = 0;
  static  unsigned long long aesl_llvm_cbe_91_count = 0;
  static  unsigned long long aesl_llvm_cbe_92_count = 0;
  static  unsigned long long aesl_llvm_cbe_93_count = 0;
  static  unsigned long long aesl_llvm_cbe_exitcond8_count = 0;
  static  unsigned long long aesl_llvm_cbe_94_count = 0;
  static  unsigned long long aesl_llvm_cbe_95_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @mat_mul\n");
  llvm_cbe_storemerge6__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
  goto llvm_cbe__2e_preheader4;

  do {     /* Syntactic loop '.preheader4' to make GCC happy */
llvm_cbe__2e_preheader4:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge6 = phi i32 [ 0, %%0 ], [ %%12, %%11  for 0x%I64xth hint within @mat_mul  --> \n", ++aesl_llvm_cbe_storemerge6_count);
  llvm_cbe_storemerge6 = (unsigned int )llvm_cbe_storemerge6__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge6 = 0x%X",llvm_cbe_storemerge6);
printf("\n = 0x%X",0u);
printf("\n = 0x%X",llvm_cbe_tmp__17);
}
  llvm_cbe_storemerge15__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
  goto llvm_cbe__2e_preheader;

llvm_cbe_tmp__18:
if (AESL_DEBUG_TRACE)
printf("\n  %%12 = add nsw i32 %%storemerge6, 1, !dbg !5 for 0x%I64xth hint within @mat_mul  --> \n", ++aesl_llvm_cbe_88_count);
  llvm_cbe_tmp__17 = (unsigned int )((unsigned int )(llvm_cbe_storemerge6&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__17&4294967295ull)));
  if (((llvm_cbe_tmp__17&4294967295U) == (100u&4294967295U))) {
    goto llvm_cbe_tmp__19;
  } else {
    llvm_cbe_storemerge6__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__17;   /* for PHI node */
    goto llvm_cbe__2e_preheader4;
  }

  do {     /* Syntactic loop '.preheader' to make GCC happy */
llvm_cbe__2e_preheader:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge15 = phi i32 [ 0, %%.preheader4 ], [ %%10, %%9  for 0x%I64xth hint within @mat_mul  --> \n", ++aesl_llvm_cbe_storemerge15_count);
  llvm_cbe_storemerge15 = (unsigned int )llvm_cbe_storemerge15__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge15 = 0x%X",llvm_cbe_storemerge15);
printf("\n = 0x%X",0u);
printf("\n = 0x%X",llvm_cbe_tmp__16);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%1 = getelementptr inbounds [100 x float]* %%matC, i32 %%storemerge6, i32 %%storemerge15, !dbg !3 for 0x%I64xth hint within @mat_mul  --> \n", ++aesl_llvm_cbe_66_count);
  llvm_cbe_tmp__9 = (float *)(&llvm_cbe_matC[(((signed int )llvm_cbe_storemerge6))
#ifdef AESL_BC_SIM
 % 100
#endif
][(((signed int )llvm_cbe_storemerge15))]);
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge6 = 0x%X",((signed int )llvm_cbe_storemerge6));
printf("\nstoremerge15 = 0x%X",((signed int )llvm_cbe_storemerge15));
}
  llvm_cbe_storemerge23__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
  goto llvm_cbe_tmp__20;

llvm_cbe_tmp__21:
if (AESL_DEBUG_TRACE)
printf("\n  %%10 = add nsw i32 %%storemerge15, 1, !dbg !5 for 0x%I64xth hint within @mat_mul  --> \n", ++aesl_llvm_cbe_81_count);
  llvm_cbe_tmp__16 = (unsigned int )((unsigned int )(llvm_cbe_storemerge15&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__16&4294967295ull)));
  if (((llvm_cbe_tmp__16&4294967295U) == (100u&4294967295U))) {
    goto llvm_cbe_tmp__18;
  } else {
    llvm_cbe_storemerge15__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__16;   /* for PHI node */
    goto llvm_cbe__2e_preheader;
  }

  do {     /* Syntactic loop '' to make GCC happy */
llvm_cbe_tmp__20:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge23 = phi i32 [ 0, %%.preheader ], [ %%8, %%2  for 0x%I64xth hint within @mat_mul  --> \n", ++aesl_llvm_cbe_storemerge23_count);
  llvm_cbe_storemerge23 = (unsigned int )llvm_cbe_storemerge23__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge23 = 0x%X",llvm_cbe_storemerge23);
printf("\n = 0x%X",0u);
printf("\n = 0x%X",llvm_cbe_tmp__15);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%3 = getelementptr inbounds [100 x float]* %%matA, i32 %%storemerge6, i32 %%storemerge23, !dbg !3 for 0x%I64xth hint within @mat_mul  --> \n", ++aesl_llvm_cbe_68_count);
  llvm_cbe_tmp__10 = (float *)(&llvm_cbe_matA[(((signed int )llvm_cbe_storemerge6))
#ifdef AESL_BC_SIM
 % 100
#endif
][(((signed int )llvm_cbe_storemerge23))]);
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge6 = 0x%X",((signed int )llvm_cbe_storemerge6));
printf("\nstoremerge23 = 0x%X",((signed int )llvm_cbe_storemerge23));
}

#ifdef AESL_BC_SIM
  if (!(((signed int )llvm_cbe_storemerge23) < 100)) fprintf(stderr, "%s:%d: warning: Read access out of array 'matA' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = load float* %%3, align 4, !dbg !3 for 0x%I64xth hint within @mat_mul  --> \n", ++aesl_llvm_cbe_69_count);
  llvm_cbe_tmp__11 = (float )*llvm_cbe_tmp__10;
if (AESL_DEBUG_TRACE)
printf("\n = %f,  0x%x\n", llvm_cbe_tmp__11, *(int*)(&llvm_cbe_tmp__11));
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = getelementptr inbounds [100 x float]* %%matB, i32 %%storemerge23, i32 %%storemerge15, !dbg !3 for 0x%I64xth hint within @mat_mul  --> \n", ++aesl_llvm_cbe_70_count);
  llvm_cbe_tmp__12 = (float *)(&llvm_cbe_matB[(((signed int )llvm_cbe_storemerge23))
#ifdef AESL_BC_SIM
 % 100
#endif
][(((signed int )llvm_cbe_storemerge15))]);
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge23 = 0x%X",((signed int )llvm_cbe_storemerge23));
printf("\nstoremerge15 = 0x%X",((signed int )llvm_cbe_storemerge15));
}

#ifdef AESL_BC_SIM
  if (!(((signed int )llvm_cbe_storemerge15) < 100)) fprintf(stderr, "%s:%d: warning: Read access out of array 'matB' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = load float* %%5, align 4, !dbg !3 for 0x%I64xth hint within @mat_mul  --> \n", ++aesl_llvm_cbe_71_count);
  llvm_cbe_tmp__13 = (float )*llvm_cbe_tmp__12;
if (AESL_DEBUG_TRACE)
printf("\n = %f,  0x%x\n", llvm_cbe_tmp__13, *(int*)(&llvm_cbe_tmp__13));
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = fmul float %%4, %%6, !dbg !3 for 0x%I64xth hint within @mat_mul  --> \n", ++aesl_llvm_cbe_72_count);
  llvm_cbe_tmp__14 = (float )((float )(llvm_cbe_tmp__11 * llvm_cbe_tmp__13));
if (AESL_DEBUG_TRACE)
printf("\n = %f,  0x%x\n", llvm_cbe_tmp__14, *(int*)(&llvm_cbe_tmp__14));

#ifdef AESL_BC_SIM
  assert(((signed int )llvm_cbe_storemerge15) < 100 && "Write access out of array 'matC' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store float %%7, float* %%1, align 4, !dbg !3 for 0x%I64xth hint within @mat_mul  --> \n", ++aesl_llvm_cbe_73_count);
  *llvm_cbe_tmp__9 = llvm_cbe_tmp__14;
if (AESL_DEBUG_TRACE)
printf("\n = %f\n", llvm_cbe_tmp__14);
if (AESL_DEBUG_TRACE)
printf("\n  %%8 = add nsw i32 %%storemerge23, 1, !dbg !5 for 0x%I64xth hint within @mat_mul  --> \n", ++aesl_llvm_cbe_74_count);
  llvm_cbe_tmp__15 = (unsigned int )((unsigned int )(llvm_cbe_storemerge23&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__15&4294967295ull)));
  if (((llvm_cbe_tmp__15&4294967295U) == (100u&4294967295U))) {
    goto llvm_cbe_tmp__21;
  } else {
    llvm_cbe_storemerge23__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__15;   /* for PHI node */
    goto llvm_cbe_tmp__20;
  }

  } while (1); /* end of syntactic loop '' */
  } while (1); /* end of syntactic loop '.preheader' */
  } while (1); /* end of syntactic loop '.preheader4' */
llvm_cbe_tmp__19:
  if (AESL_DEBUG_TRACE)
      printf("\nEND @mat_mul}\n");
  return;
}


void mat_mul_wrap(float (*llvm_cbe_matA)[100], float (*llvm_cbe_matB)[100], float (*llvm_cbe_matC)[100]) {
  static  unsigned long long aesl_llvm_cbe_matC_local_count = 0;
  float llvm_cbe_matC_local[100][100];    /* Address-exposed local */
  static  unsigned long long aesl_llvm_cbe_matB_local_count = 0;
  float llvm_cbe_matB_local[100][100];    /* Address-exposed local */
  static  unsigned long long aesl_llvm_cbe_matA_local_count = 0;
  float llvm_cbe_matA_local[100][100];    /* Address-exposed local */
  static  unsigned long long aesl_llvm_cbe_96_count = 0;
  static  unsigned long long aesl_llvm_cbe_97_count = 0;
  static  unsigned long long aesl_llvm_cbe_98_count = 0;
  static  unsigned long long aesl_llvm_cbe_99_count = 0;
  static  unsigned long long aesl_llvm_cbe_100_count = 0;
  static  unsigned long long aesl_llvm_cbe_101_count = 0;
  static  unsigned long long aesl_llvm_cbe_102_count = 0;
  static  unsigned long long aesl_llvm_cbe_103_count = 0;
  static  unsigned long long aesl_llvm_cbe_104_count = 0;
  static  unsigned long long aesl_llvm_cbe_105_count = 0;
  float (*llvm_cbe_tmp__22)[100];
  static  unsigned long long aesl_llvm_cbe_106_count = 0;
  static  unsigned long long aesl_llvm_cbe_107_count = 0;
  float (*llvm_cbe_tmp__23)[100];
  static  unsigned long long aesl_llvm_cbe_108_count = 0;
  static  unsigned long long aesl_llvm_cbe_109_count = 0;
  float (*llvm_cbe_tmp__24)[100];
  static  unsigned long long aesl_llvm_cbe_110_count = 0;
  static  unsigned long long aesl_llvm_cbe_111_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @mat_mul_wrap\n");
if (AESL_DEBUG_TRACE)
printf("\n  %%1 = getelementptr inbounds [100 x [100 x float]]* %%matA_local, i32 0, i32 0, !dbg !5 for 0x%I64xth hint within @mat_mul_wrap  --> \n", ++aesl_llvm_cbe_105_count);
  llvm_cbe_tmp__22 = (float (*)[100])(&llvm_cbe_matA_local[(((signed int )0u))
#ifdef AESL_BC_SIM
 % 100
#endif
]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  call void @copy_mat([100 x float]* %%matA, [100 x float]* %%1), !dbg !5 for 0x%I64xth hint within @mat_mul_wrap  --> \n", ++aesl_llvm_cbe_106_count);
  copy_mat(llvm_cbe_matA, llvm_cbe_tmp__22);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = getelementptr inbounds [100 x [100 x float]]* %%matB_local, i32 0, i32 0, !dbg !3 for 0x%I64xth hint within @mat_mul_wrap  --> \n", ++aesl_llvm_cbe_107_count);
  llvm_cbe_tmp__23 = (float (*)[100])(&llvm_cbe_matB_local[(((signed int )0u))
#ifdef AESL_BC_SIM
 % 100
#endif
]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  call void @copy_mat([100 x float]* %%matB, [100 x float]* %%2), !dbg !3 for 0x%I64xth hint within @mat_mul_wrap  --> \n", ++aesl_llvm_cbe_108_count);
  copy_mat(llvm_cbe_matB, llvm_cbe_tmp__23);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%3 = getelementptr inbounds [100 x [100 x float]]* %%matC_local, i32 0, i32 0, !dbg !4 for 0x%I64xth hint within @mat_mul_wrap  --> \n", ++aesl_llvm_cbe_109_count);
  llvm_cbe_tmp__24 = (float (*)[100])(&llvm_cbe_matC_local[(((signed int )0u))
#ifdef AESL_BC_SIM
 % 100
#endif
]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  call void @copy_mat([100 x float]* %%3, [100 x float]* %%matC), !dbg !4 for 0x%I64xth hint within @mat_mul_wrap  --> \n", ++aesl_llvm_cbe_110_count);
  copy_mat(llvm_cbe_tmp__24, llvm_cbe_matC);
if (AESL_DEBUG_TRACE) {
}
  if (AESL_DEBUG_TRACE)
      printf("\nEND @mat_mul_wrap}\n");
  return;
}

