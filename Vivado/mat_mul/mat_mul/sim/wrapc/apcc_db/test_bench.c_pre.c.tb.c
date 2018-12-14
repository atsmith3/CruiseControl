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

/* External Global Variable Declarations */
extern float matAh[100][100];
extern float matBh[100][100];
extern float matCh[100][100];
extern float matAs[100][100];
extern float matBs[100][100];
extern float matCs[100][100];

/* Function Declarations */
double fmod(double, double);
float fmodf(float, float);
long double fmodl(long double, long double);
void init(float (*llvm_cbe_hw)[100], float (*llvm_cbe_sw)[100]);
void mat_mul_s(float (*llvm_cbe_a)[100], float (*llvm_cbe_b)[100], float (*llvm_cbe_c)[100]);
signed int compare(float (*llvm_cbe_hw)[100], float (*llvm_cbe_sw)[100]);
void main(void);
void AESL_WRAP_mat_mul_wrap(float (*)[100], float (*)[100], float (*)[100]);


/* Global Variable Definitions and Initialization */
float matCh[100][100];
float matBh[100][100];
float matAh[100][100];
float matBs[100][100];
float matCs[100][100];
float matAs[100][100];
static  char aesl_internal_str[22] = "Beginning HW SW CoSim";
static  char aesl_internal_str1[17] = "HW SW CoSim Pass";


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

void init(float (*llvm_cbe_hw)[100], float (*llvm_cbe_sw)[100]) {
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
  static  unsigned long long aesl_llvm_cbe_storemerge3_count = 0;
  unsigned int llvm_cbe_storemerge3;
  unsigned int llvm_cbe_storemerge3__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_11_count = 0;
  static  unsigned long long aesl_llvm_cbe_12_count = 0;
  static  unsigned long long aesl_llvm_cbe_13_count = 0;
  static  unsigned long long aesl_llvm_cbe_14_count = 0;
  static  unsigned long long aesl_llvm_cbe_15_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge12_count = 0;
  unsigned int llvm_cbe_storemerge12;
  unsigned int llvm_cbe_storemerge12__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_16_count = 0;
  unsigned int llvm_cbe_tmp__1;
  static  unsigned long long aesl_llvm_cbe_17_count = 0;
  unsigned int llvm_cbe_tmp__2;
  static  unsigned long long aesl_llvm_cbe_18_count = 0;
  float llvm_cbe_tmp__3;
  static  unsigned long long aesl_llvm_cbe_19_count = 0;
  double llvm_cbe_tmp__4;
  static  unsigned long long aesl_llvm_cbe_20_count = 0;
  double llvm_cbe_tmp__5;
  static  unsigned long long aesl_llvm_cbe_21_count = 0;
  double llvm_cbe_tmp__6;
  static  unsigned long long aesl_llvm_cbe_22_count = 0;
  float llvm_cbe_tmp__7;
  static  unsigned long long aesl_llvm_cbe_23_count = 0;
  float *llvm_cbe_tmp__8;
  static  unsigned long long aesl_llvm_cbe_24_count = 0;
  static  unsigned long long aesl_llvm_cbe_25_count = 0;
  float *llvm_cbe_tmp__9;
  static  unsigned long long aesl_llvm_cbe_26_count = 0;
  static  unsigned long long aesl_llvm_cbe_27_count = 0;
  unsigned int llvm_cbe_tmp__10;
  static  unsigned long long aesl_llvm_cbe_28_count = 0;
  static  unsigned long long aesl_llvm_cbe_29_count = 0;
  static  unsigned long long aesl_llvm_cbe_30_count = 0;
  static  unsigned long long aesl_llvm_cbe_31_count = 0;
  static  unsigned long long aesl_llvm_cbe_32_count = 0;
  static  unsigned long long aesl_llvm_cbe_exitcond_count = 0;
  static  unsigned long long aesl_llvm_cbe_33_count = 0;
  static  unsigned long long aesl_llvm_cbe_34_count = 0;
  unsigned int llvm_cbe_tmp__11;
  static  unsigned long long aesl_llvm_cbe_35_count = 0;
  static  unsigned long long aesl_llvm_cbe_36_count = 0;
  static  unsigned long long aesl_llvm_cbe_37_count = 0;
  static  unsigned long long aesl_llvm_cbe_38_count = 0;
  static  unsigned long long aesl_llvm_cbe_39_count = 0;
  static  unsigned long long aesl_llvm_cbe_exitcond4_count = 0;
  static  unsigned long long aesl_llvm_cbe_40_count = 0;
  static  unsigned long long aesl_llvm_cbe_41_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @init\n");
  llvm_cbe_storemerge3__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
  goto llvm_cbe__2e_preheader;

  do {     /* Syntactic loop '.preheader' to make GCC happy */
llvm_cbe__2e_preheader:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge3 = phi i32 [ 0, %%0 ], [ %%13, %%12  for 0x%I64xth hint within @init  --> \n", ++aesl_llvm_cbe_storemerge3_count);
  llvm_cbe_storemerge3 = (unsigned int )llvm_cbe_storemerge3__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge3 = 0x%X",llvm_cbe_storemerge3);
printf("\n = 0x%X",0u);
printf("\n = 0x%X",llvm_cbe_tmp__11);
}
  llvm_cbe_storemerge12__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
  goto llvm_cbe_tmp__12;

llvm_cbe_tmp__13:
if (AESL_DEBUG_TRACE)
printf("\n  %%13 = add nsw i32 %%storemerge3, 1, !dbg !7 for 0x%I64xth hint within @init  --> \n", ++aesl_llvm_cbe_34_count);
  llvm_cbe_tmp__11 = (unsigned int )((unsigned int )(llvm_cbe_storemerge3&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__11&4294967295ull)));
  if (((llvm_cbe_tmp__11&4294967295U) == (100u&4294967295U))) {
    goto llvm_cbe_tmp__14;
  } else {
    llvm_cbe_storemerge3__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__11;   /* for PHI node */
    goto llvm_cbe__2e_preheader;
  }

  do {     /* Syntactic loop '' to make GCC happy */
llvm_cbe_tmp__12:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge12 = phi i32 [ 0, %%.preheader ], [ %%11, %%1  for 0x%I64xth hint within @init  --> \n", ++aesl_llvm_cbe_storemerge12_count);
  llvm_cbe_storemerge12 = (unsigned int )llvm_cbe_storemerge12__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge12 = 0x%X",llvm_cbe_storemerge12);
printf("\n = 0x%X",0u);
printf("\n = 0x%X",llvm_cbe_tmp__10);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = tail call i32 @rand() nounwind, !dbg !6 for 0x%I64xth hint within @init  --> \n", ++aesl_llvm_cbe_16_count);
  llvm_cbe_tmp__1 = (unsigned int ) /*tail*/ rand();
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__1);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%3 = srem i32 %%2, 1000, !dbg !6 for 0x%I64xth hint within @init  --> \n", ++aesl_llvm_cbe_17_count);
  llvm_cbe_tmp__2 = (unsigned int )((signed int )(((signed int )llvm_cbe_tmp__1) % ((signed int )1000u)));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((signed int )llvm_cbe_tmp__2));
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = sitofp i32 %%3 to float, !dbg !6 for 0x%I64xth hint within @init  --> \n", ++aesl_llvm_cbe_18_count);
  llvm_cbe_tmp__3 = (float )((float )(signed int )llvm_cbe_tmp__2);
if (AESL_DEBUG_TRACE)
printf("\n = %f,  0x%x\n", llvm_cbe_tmp__3, *(int*)(&llvm_cbe_tmp__3));
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = fpext float %%4 to double, !dbg !6 for 0x%I64xth hint within @init  --> \n", ++aesl_llvm_cbe_19_count);
  llvm_cbe_tmp__4 = (double )((double )llvm_cbe_tmp__3);
if (AESL_DEBUG_TRACE)
printf("\n = %lf,  0x%llx\n", llvm_cbe_tmp__4, *(long long*)(&llvm_cbe_tmp__4));
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = fdiv double %%5, 1.000000e+03, !dbg !6 for 0x%I64xth hint within @init  --> \n", ++aesl_llvm_cbe_20_count);
  llvm_cbe_tmp__5 = (double )llvm_cbe_tmp__4 / 0x1.f4p9;
if (AESL_DEBUG_TRACE)
printf("\n = %lf,  0x%llx\n", llvm_cbe_tmp__5, *(long long*)(&llvm_cbe_tmp__5));
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = fadd double %%6, -5.000000e-01, !dbg !6 for 0x%I64xth hint within @init  --> \n", ++aesl_llvm_cbe_21_count);
  llvm_cbe_tmp__6 = (double )llvm_cbe_tmp__5 + -0x1p-1;
if (AESL_DEBUG_TRACE)
printf("\n = %lf,  0x%llx\n", llvm_cbe_tmp__6, *(long long*)(&llvm_cbe_tmp__6));
if (AESL_DEBUG_TRACE)
printf("\n  %%8 = fptrunc double %%7 to float, !dbg !6 for 0x%I64xth hint within @init  --> \n", ++aesl_llvm_cbe_22_count);
  llvm_cbe_tmp__7 = (float )((float )llvm_cbe_tmp__6);
if (AESL_DEBUG_TRACE)
printf("\n = %f,  0x%x\n", llvm_cbe_tmp__7, *(int*)(&llvm_cbe_tmp__7));
if (AESL_DEBUG_TRACE)
printf("\n  %%9 = getelementptr inbounds [100 x float]* %%sw, i32 %%storemerge3, i32 %%storemerge12, !dbg !6 for 0x%I64xth hint within @init  --> \n", ++aesl_llvm_cbe_23_count);
  llvm_cbe_tmp__8 = (float *)(&llvm_cbe_sw[(((signed int )llvm_cbe_storemerge3))
#ifdef AESL_BC_SIM
 % 100
#endif
][(((signed int )llvm_cbe_storemerge12))]);
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge3 = 0x%X",((signed int )llvm_cbe_storemerge3));
printf("\nstoremerge12 = 0x%X",((signed int )llvm_cbe_storemerge12));
}

#ifdef AESL_BC_SIM
  assert(((signed int )llvm_cbe_storemerge12) < 100 && "Write access out of array 'sw' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store float %%8, float* %%9, align 4, !dbg !6 for 0x%I64xth hint within @init  --> \n", ++aesl_llvm_cbe_24_count);
  *llvm_cbe_tmp__8 = llvm_cbe_tmp__7;
if (AESL_DEBUG_TRACE)
printf("\n = %f\n", llvm_cbe_tmp__7);
if (AESL_DEBUG_TRACE)
printf("\n  %%10 = getelementptr inbounds [100 x float]* %%hw, i32 %%storemerge3, i32 %%storemerge12, !dbg !6 for 0x%I64xth hint within @init  --> \n", ++aesl_llvm_cbe_25_count);
  llvm_cbe_tmp__9 = (float *)(&llvm_cbe_hw[(((signed int )llvm_cbe_storemerge3))
#ifdef AESL_BC_SIM
 % 100
#endif
][(((signed int )llvm_cbe_storemerge12))]);
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge3 = 0x%X",((signed int )llvm_cbe_storemerge3));
printf("\nstoremerge12 = 0x%X",((signed int )llvm_cbe_storemerge12));
}

#ifdef AESL_BC_SIM
  assert(((signed int )llvm_cbe_storemerge12) < 100 && "Write access out of array 'hw' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store float %%8, float* %%10, align 4, !dbg !6 for 0x%I64xth hint within @init  --> \n", ++aesl_llvm_cbe_26_count);
  *llvm_cbe_tmp__9 = llvm_cbe_tmp__7;
if (AESL_DEBUG_TRACE)
printf("\n = %f\n", llvm_cbe_tmp__7);
if (AESL_DEBUG_TRACE)
printf("\n  %%11 = add nsw i32 %%storemerge12, 1, !dbg !7 for 0x%I64xth hint within @init  --> \n", ++aesl_llvm_cbe_27_count);
  llvm_cbe_tmp__10 = (unsigned int )((unsigned int )(llvm_cbe_storemerge12&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__10&4294967295ull)));
  if (((llvm_cbe_tmp__10&4294967295U) == (100u&4294967295U))) {
    goto llvm_cbe_tmp__13;
  } else {
    llvm_cbe_storemerge12__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__10;   /* for PHI node */
    goto llvm_cbe_tmp__12;
  }

  } while (1); /* end of syntactic loop '' */
  } while (1); /* end of syntactic loop '.preheader' */
llvm_cbe_tmp__14:
  if (AESL_DEBUG_TRACE)
      printf("\nEND @init}\n");
  return;
}


void mat_mul_s(float (*llvm_cbe_a)[100], float (*llvm_cbe_b)[100], float (*llvm_cbe_c)[100]) {
  static  unsigned long long aesl_llvm_cbe_42_count = 0;
  static  unsigned long long aesl_llvm_cbe_43_count = 0;
  static  unsigned long long aesl_llvm_cbe_44_count = 0;
  static  unsigned long long aesl_llvm_cbe_45_count = 0;
  static  unsigned long long aesl_llvm_cbe_46_count = 0;
  static  unsigned long long aesl_llvm_cbe_47_count = 0;
  static  unsigned long long aesl_llvm_cbe_48_count = 0;
  static  unsigned long long aesl_llvm_cbe_49_count = 0;
  static  unsigned long long aesl_llvm_cbe_50_count = 0;
  static  unsigned long long aesl_llvm_cbe_51_count = 0;
  static  unsigned long long aesl_llvm_cbe_52_count = 0;
  static  unsigned long long aesl_llvm_cbe_53_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge6_count = 0;
  unsigned int llvm_cbe_storemerge6;
  unsigned int llvm_cbe_storemerge6__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_54_count = 0;
  static  unsigned long long aesl_llvm_cbe_55_count = 0;
  static  unsigned long long aesl_llvm_cbe_56_count = 0;
  static  unsigned long long aesl_llvm_cbe_57_count = 0;
  static  unsigned long long aesl_llvm_cbe_58_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge15_count = 0;
  unsigned int llvm_cbe_storemerge15;
  unsigned int llvm_cbe_storemerge15__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_59_count = 0;
  static  unsigned long long aesl_llvm_cbe_60_count = 0;
  static  unsigned long long aesl_llvm_cbe_61_count = 0;
  static  unsigned long long aesl_llvm_cbe_62_count = 0;
  static  unsigned long long aesl_llvm_cbe_63_count = 0;
  float *llvm_cbe_tmp__15;
  static  unsigned long long aesl_llvm_cbe_64_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge23_count = 0;
  unsigned int llvm_cbe_storemerge23;
  unsigned int llvm_cbe_storemerge23__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_65_count = 0;
  float *llvm_cbe_tmp__16;
  static  unsigned long long aesl_llvm_cbe_66_count = 0;
  float llvm_cbe_tmp__17;
  static  unsigned long long aesl_llvm_cbe_67_count = 0;
  float *llvm_cbe_tmp__18;
  static  unsigned long long aesl_llvm_cbe_68_count = 0;
  float llvm_cbe_tmp__19;
  static  unsigned long long aesl_llvm_cbe_69_count = 0;
  float llvm_cbe_tmp__20;
  static  unsigned long long aesl_llvm_cbe_70_count = 0;
  static  unsigned long long aesl_llvm_cbe_71_count = 0;
  unsigned int llvm_cbe_tmp__21;
  static  unsigned long long aesl_llvm_cbe_72_count = 0;
  static  unsigned long long aesl_llvm_cbe_73_count = 0;
  static  unsigned long long aesl_llvm_cbe_74_count = 0;
  static  unsigned long long aesl_llvm_cbe_75_count = 0;
  static  unsigned long long aesl_llvm_cbe_76_count = 0;
  static  unsigned long long aesl_llvm_cbe_exitcond_count = 0;
  static  unsigned long long aesl_llvm_cbe_77_count = 0;
  static  unsigned long long aesl_llvm_cbe_78_count = 0;
  unsigned int llvm_cbe_tmp__22;
  static  unsigned long long aesl_llvm_cbe_79_count = 0;
  static  unsigned long long aesl_llvm_cbe_80_count = 0;
  static  unsigned long long aesl_llvm_cbe_81_count = 0;
  static  unsigned long long aesl_llvm_cbe_82_count = 0;
  static  unsigned long long aesl_llvm_cbe_83_count = 0;
  static  unsigned long long aesl_llvm_cbe_exitcond7_count = 0;
  static  unsigned long long aesl_llvm_cbe_84_count = 0;
  static  unsigned long long aesl_llvm_cbe_85_count = 0;
  unsigned int llvm_cbe_tmp__23;
  static  unsigned long long aesl_llvm_cbe_86_count = 0;
  static  unsigned long long aesl_llvm_cbe_87_count = 0;
  static  unsigned long long aesl_llvm_cbe_88_count = 0;
  static  unsigned long long aesl_llvm_cbe_89_count = 0;
  static  unsigned long long aesl_llvm_cbe_90_count = 0;
  static  unsigned long long aesl_llvm_cbe_exitcond8_count = 0;
  static  unsigned long long aesl_llvm_cbe_91_count = 0;
  static  unsigned long long aesl_llvm_cbe_92_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @mat_mul_s\n");
  llvm_cbe_storemerge6__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
  goto llvm_cbe__2e_preheader4;

  do {     /* Syntactic loop '.preheader4' to make GCC happy */
llvm_cbe__2e_preheader4:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge6 = phi i32 [ 0, %%0 ], [ %%12, %%11  for 0x%I64xth hint within @mat_mul_s  --> \n", ++aesl_llvm_cbe_storemerge6_count);
  llvm_cbe_storemerge6 = (unsigned int )llvm_cbe_storemerge6__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge6 = 0x%X",llvm_cbe_storemerge6);
printf("\n = 0x%X",0u);
printf("\n = 0x%X",llvm_cbe_tmp__23);
}
  llvm_cbe_storemerge15__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
  goto llvm_cbe__2e_preheader;

llvm_cbe_tmp__24:
if (AESL_DEBUG_TRACE)
printf("\n  %%12 = add nsw i32 %%storemerge6, 1, !dbg !7 for 0x%I64xth hint within @mat_mul_s  --> \n", ++aesl_llvm_cbe_85_count);
  llvm_cbe_tmp__23 = (unsigned int )((unsigned int )(llvm_cbe_storemerge6&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__23&4294967295ull)));
  if (((llvm_cbe_tmp__23&4294967295U) == (100u&4294967295U))) {
    goto llvm_cbe_tmp__25;
  } else {
    llvm_cbe_storemerge6__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__23;   /* for PHI node */
    goto llvm_cbe__2e_preheader4;
  }

  do {     /* Syntactic loop '.preheader' to make GCC happy */
llvm_cbe__2e_preheader:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge15 = phi i32 [ 0, %%.preheader4 ], [ %%10, %%9  for 0x%I64xth hint within @mat_mul_s  --> \n", ++aesl_llvm_cbe_storemerge15_count);
  llvm_cbe_storemerge15 = (unsigned int )llvm_cbe_storemerge15__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge15 = 0x%X",llvm_cbe_storemerge15);
printf("\n = 0x%X",0u);
printf("\n = 0x%X",llvm_cbe_tmp__22);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%1 = getelementptr inbounds [100 x float]* %%c, i32 %%storemerge6, i32 %%storemerge15, !dbg !6 for 0x%I64xth hint within @mat_mul_s  --> \n", ++aesl_llvm_cbe_63_count);
  llvm_cbe_tmp__15 = (float *)(&llvm_cbe_c[(((signed int )llvm_cbe_storemerge6))
#ifdef AESL_BC_SIM
 % 100
#endif
][(((signed int )llvm_cbe_storemerge15))]);
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge6 = 0x%X",((signed int )llvm_cbe_storemerge6));
printf("\nstoremerge15 = 0x%X",((signed int )llvm_cbe_storemerge15));
}
  llvm_cbe_storemerge23__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
  goto llvm_cbe_tmp__26;

llvm_cbe_tmp__27:
if (AESL_DEBUG_TRACE)
printf("\n  %%10 = add nsw i32 %%storemerge15, 1, !dbg !8 for 0x%I64xth hint within @mat_mul_s  --> \n", ++aesl_llvm_cbe_78_count);
  llvm_cbe_tmp__22 = (unsigned int )((unsigned int )(llvm_cbe_storemerge15&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__22&4294967295ull)));
  if (((llvm_cbe_tmp__22&4294967295U) == (100u&4294967295U))) {
    goto llvm_cbe_tmp__24;
  } else {
    llvm_cbe_storemerge15__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__22;   /* for PHI node */
    goto llvm_cbe__2e_preheader;
  }

  do {     /* Syntactic loop '' to make GCC happy */
llvm_cbe_tmp__26:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge23 = phi i32 [ 0, %%.preheader ], [ %%8, %%2  for 0x%I64xth hint within @mat_mul_s  --> \n", ++aesl_llvm_cbe_storemerge23_count);
  llvm_cbe_storemerge23 = (unsigned int )llvm_cbe_storemerge23__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge23 = 0x%X",llvm_cbe_storemerge23);
printf("\n = 0x%X",0u);
printf("\n = 0x%X",llvm_cbe_tmp__21);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%3 = getelementptr inbounds [100 x float]* %%a, i32 %%storemerge6, i32 %%storemerge23, !dbg !6 for 0x%I64xth hint within @mat_mul_s  --> \n", ++aesl_llvm_cbe_65_count);
  llvm_cbe_tmp__16 = (float *)(&llvm_cbe_a[(((signed int )llvm_cbe_storemerge6))
#ifdef AESL_BC_SIM
 % 100
#endif
][(((signed int )llvm_cbe_storemerge23))]);
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge6 = 0x%X",((signed int )llvm_cbe_storemerge6));
printf("\nstoremerge23 = 0x%X",((signed int )llvm_cbe_storemerge23));
}

#ifdef AESL_BC_SIM
  if (!(((signed int )llvm_cbe_storemerge23) < 100)) fprintf(stderr, "%s:%d: warning: Read access out of array 'a' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = load float* %%3, align 4, !dbg !6 for 0x%I64xth hint within @mat_mul_s  --> \n", ++aesl_llvm_cbe_66_count);
  llvm_cbe_tmp__17 = (float )*llvm_cbe_tmp__16;
if (AESL_DEBUG_TRACE)
printf("\n = %f,  0x%x\n", llvm_cbe_tmp__17, *(int*)(&llvm_cbe_tmp__17));
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = getelementptr inbounds [100 x float]* %%b, i32 %%storemerge23, i32 %%storemerge15, !dbg !6 for 0x%I64xth hint within @mat_mul_s  --> \n", ++aesl_llvm_cbe_67_count);
  llvm_cbe_tmp__18 = (float *)(&llvm_cbe_b[(((signed int )llvm_cbe_storemerge23))
#ifdef AESL_BC_SIM
 % 100
#endif
][(((signed int )llvm_cbe_storemerge15))]);
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge23 = 0x%X",((signed int )llvm_cbe_storemerge23));
printf("\nstoremerge15 = 0x%X",((signed int )llvm_cbe_storemerge15));
}

#ifdef AESL_BC_SIM
  if (!(((signed int )llvm_cbe_storemerge15) < 100)) fprintf(stderr, "%s:%d: warning: Read access out of array 'b' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = load float* %%5, align 4, !dbg !6 for 0x%I64xth hint within @mat_mul_s  --> \n", ++aesl_llvm_cbe_68_count);
  llvm_cbe_tmp__19 = (float )*llvm_cbe_tmp__18;
if (AESL_DEBUG_TRACE)
printf("\n = %f,  0x%x\n", llvm_cbe_tmp__19, *(int*)(&llvm_cbe_tmp__19));
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = fmul float %%4, %%6, !dbg !6 for 0x%I64xth hint within @mat_mul_s  --> \n", ++aesl_llvm_cbe_69_count);
  llvm_cbe_tmp__20 = (float )((float )(llvm_cbe_tmp__17 * llvm_cbe_tmp__19));
if (AESL_DEBUG_TRACE)
printf("\n = %f,  0x%x\n", llvm_cbe_tmp__20, *(int*)(&llvm_cbe_tmp__20));

#ifdef AESL_BC_SIM
  assert(((signed int )llvm_cbe_storemerge15) < 100 && "Write access out of array 'c' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store float %%7, float* %%1, align 4, !dbg !6 for 0x%I64xth hint within @mat_mul_s  --> \n", ++aesl_llvm_cbe_70_count);
  *llvm_cbe_tmp__15 = llvm_cbe_tmp__20;
if (AESL_DEBUG_TRACE)
printf("\n = %f\n", llvm_cbe_tmp__20);
if (AESL_DEBUG_TRACE)
printf("\n  %%8 = add nsw i32 %%storemerge23, 1, !dbg !8 for 0x%I64xth hint within @mat_mul_s  --> \n", ++aesl_llvm_cbe_71_count);
  llvm_cbe_tmp__21 = (unsigned int )((unsigned int )(llvm_cbe_storemerge23&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__21&4294967295ull)));
  if (((llvm_cbe_tmp__21&4294967295U) == (100u&4294967295U))) {
    goto llvm_cbe_tmp__27;
  } else {
    llvm_cbe_storemerge23__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__21;   /* for PHI node */
    goto llvm_cbe_tmp__26;
  }

  } while (1); /* end of syntactic loop '' */
  } while (1); /* end of syntactic loop '.preheader' */
  } while (1); /* end of syntactic loop '.preheader4' */
llvm_cbe_tmp__25:
  if (AESL_DEBUG_TRACE)
      printf("\nEND @mat_mul_s}\n");
  return;
}


signed int compare(float (*llvm_cbe_hw)[100], float (*llvm_cbe_sw)[100]) {
  static  unsigned long long aesl_llvm_cbe_93_count = 0;
  static  unsigned long long aesl_llvm_cbe_94_count = 0;
  static  unsigned long long aesl_llvm_cbe_95_count = 0;
  static  unsigned long long aesl_llvm_cbe_96_count = 0;
  static  unsigned long long aesl_llvm_cbe_97_count = 0;
  static  unsigned long long aesl_llvm_cbe_98_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge_count = 0;
  unsigned int llvm_cbe_storemerge;
  unsigned int llvm_cbe_storemerge__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_99_count = 0;
  static  unsigned long long aesl_llvm_cbe_100_count = 0;
  static  unsigned long long aesl_llvm_cbe_101_count = 0;
  static  unsigned long long aesl_llvm_cbe_102_count = 0;
  static  unsigned long long aesl_llvm_cbe_103_count = 0;
  static  unsigned long long aesl_llvm_cbe_104_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge1_count = 0;
  unsigned int llvm_cbe_storemerge1;
  unsigned int llvm_cbe_storemerge1__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_105_count = 0;
  static  unsigned long long aesl_llvm_cbe_106_count = 0;
  static  unsigned long long aesl_llvm_cbe_107_count = 0;
  static  unsigned long long aesl_llvm_cbe_108_count = 0;
  static  unsigned long long aesl_llvm_cbe_109_count = 0;
  static  unsigned long long aesl_llvm_cbe_110_count = 0;
  static  unsigned long long aesl_llvm_cbe_111_count = 0;
  float *llvm_cbe_tmp__28;
  static  unsigned long long aesl_llvm_cbe_112_count = 0;
  float llvm_cbe_tmp__29;
  static  unsigned long long aesl_llvm_cbe_113_count = 0;
  static  unsigned long long aesl_llvm_cbe_114_count = 0;
  unsigned int llvm_cbe_tmp__30;
  static  unsigned long long aesl_llvm_cbe_115_count = 0;
  float llvm_cbe_tmp__31;
  static  unsigned long long aesl_llvm_cbe_116_count = 0;
  float *llvm_cbe_tmp__32;
  static  unsigned long long aesl_llvm_cbe_117_count = 0;
  static  unsigned long long aesl_llvm_cbe_118_count = 0;
  static  unsigned long long aesl_llvm_cbe_119_count = 0;
  unsigned int llvm_cbe_tmp__33;
  static  unsigned long long aesl_llvm_cbe_120_count = 0;
  static  unsigned long long aesl_llvm_cbe_121_count = 0;
  static  unsigned long long aesl_llvm_cbe_122_count = 0;
  unsigned int llvm_cbe_tmp__34;
  static  unsigned long long aesl_llvm_cbe_123_count = 0;
  static  unsigned long long aesl_llvm_cbe_124_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge2_count = 0;
  unsigned int llvm_cbe_storemerge2;
  unsigned int llvm_cbe_storemerge2__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_125_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @compare\n");
  llvm_cbe_storemerge__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
  goto llvm_cbe_tmp__35;

  do {     /* Syntactic loop '' to make GCC happy */
llvm_cbe_tmp__35:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge = phi i32 [ 0, %%0 ], [ %%14, %%13  for 0x%I64xth hint within @compare  --> \n", ++aesl_llvm_cbe_storemerge_count);
  llvm_cbe_storemerge = (unsigned int )llvm_cbe_storemerge__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge = 0x%X",llvm_cbe_storemerge);
printf("\n = 0x%X",0u);
printf("\n = 0x%X",llvm_cbe_tmp__34);
}
  if ((((signed int )llvm_cbe_storemerge) < ((signed int )100u))) {
    llvm_cbe_storemerge1__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
    goto llvm_cbe__2e_preheader;
  } else {
    llvm_cbe_storemerge2__PHI_TEMPORARY = (unsigned int )1u;   /* for PHI node */
    goto llvm_cbe__2e_loopexit;
  }

llvm_cbe_tmp__36:
if (AESL_DEBUG_TRACE)
printf("\n  %%14 = add nsw i32 %%storemerge, 1, !dbg !7 for 0x%I64xth hint within @compare  --> \n", ++aesl_llvm_cbe_122_count);
  llvm_cbe_tmp__34 = (unsigned int )((unsigned int )(llvm_cbe_storemerge&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__34&4294967295ull)));
  llvm_cbe_storemerge__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__34;   /* for PHI node */
  goto llvm_cbe_tmp__35;

  do {     /* Syntactic loop '.preheader' to make GCC happy */
llvm_cbe__2e_preheader:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge1 = phi i32 [ %%12, %%4 ], [ 0, %%1  for 0x%I64xth hint within @compare  --> \n", ++aesl_llvm_cbe_storemerge1_count);
  llvm_cbe_storemerge1 = (unsigned int )llvm_cbe_storemerge1__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge1 = 0x%X",llvm_cbe_storemerge1);
printf("\n = 0x%X",llvm_cbe_tmp__33);
printf("\n = 0x%X",0u);
}
  if ((((signed int )llvm_cbe_storemerge1) < ((signed int )100u))) {
    goto llvm_cbe_tmp__37;
  } else {
    goto llvm_cbe_tmp__36;
  }

llvm_cbe_tmp__37:
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = getelementptr inbounds [100 x float]* %%sw, i32 %%storemerge, i32 %%storemerge1, !dbg !6 for 0x%I64xth hint within @compare  --> \n", ++aesl_llvm_cbe_111_count);
  llvm_cbe_tmp__28 = (float *)(&llvm_cbe_sw[(((signed int )llvm_cbe_storemerge))
#ifdef AESL_BC_SIM
 % 100
#endif
][(((signed int )llvm_cbe_storemerge1))]);
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge = 0x%X",((signed int )llvm_cbe_storemerge));
printf("\nstoremerge1 = 0x%X",((signed int )llvm_cbe_storemerge1));
}

#ifdef AESL_BC_SIM
  if (!(((signed int )llvm_cbe_storemerge1) < 100)) fprintf(stderr, "%s:%d: warning: Read access out of array 'sw' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = load float* %%5, align 4, !dbg !6 for 0x%I64xth hint within @compare  --> \n", ++aesl_llvm_cbe_112_count);
  llvm_cbe_tmp__29 = (float )*llvm_cbe_tmp__28;
if (AESL_DEBUG_TRACE)
printf("\n = %f,  0x%x\n", llvm_cbe_tmp__29, *(int*)(&llvm_cbe_tmp__29));
if (AESL_DEBUG_TRACE)
printf("\n  %%8 = zext i1 %%7 to i32, !dbg !6 for 0x%I64xth hint within @compare  --> \n", ++aesl_llvm_cbe_114_count);
  llvm_cbe_tmp__30 = (unsigned int )((unsigned int )(bool )(llvm_fcmp_oeq(llvm_cbe_tmp__29, 0x0p0))&1U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__30);
if (AESL_DEBUG_TRACE)
printf("\n  %%9 = sitofp i32 %%8 to float, !dbg !6 for 0x%I64xth hint within @compare  --> \n", ++aesl_llvm_cbe_115_count);
  llvm_cbe_tmp__31 = (float )((float )(signed int )llvm_cbe_tmp__30);
if (AESL_DEBUG_TRACE)
printf("\n = %f,  0x%x\n", llvm_cbe_tmp__31, *(int*)(&llvm_cbe_tmp__31));
if (AESL_DEBUG_TRACE)
printf("\n  %%10 = getelementptr inbounds [100 x float]* %%hw, i32 %%storemerge, i32 %%storemerge1, !dbg !6 for 0x%I64xth hint within @compare  --> \n", ++aesl_llvm_cbe_116_count);
  llvm_cbe_tmp__32 = (float *)(&llvm_cbe_hw[(((signed int )llvm_cbe_storemerge))
#ifdef AESL_BC_SIM
 % 100
#endif
][(((signed int )llvm_cbe_storemerge1))]);
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge = 0x%X",((signed int )llvm_cbe_storemerge));
printf("\nstoremerge1 = 0x%X",((signed int )llvm_cbe_storemerge1));
}

#ifdef AESL_BC_SIM
  assert(((signed int )llvm_cbe_storemerge1) < 100 && "Write access out of array 'hw' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store float %%9, float* %%10, align 4, !dbg !6 for 0x%I64xth hint within @compare  --> \n", ++aesl_llvm_cbe_117_count);
  *llvm_cbe_tmp__32 = llvm_cbe_tmp__31;
if (AESL_DEBUG_TRACE)
printf("\n = %f\n", llvm_cbe_tmp__31);
if (AESL_DEBUG_TRACE)
printf("\n  %%12 = add nsw i32 %%storemerge1, 1, !dbg !7 for 0x%I64xth hint within @compare  --> \n", ++aesl_llvm_cbe_119_count);
  llvm_cbe_tmp__33 = (unsigned int )((unsigned int )(llvm_cbe_storemerge1&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__33&4294967295ull)));
  if ((llvm_fcmp_une(llvm_cbe_tmp__31, 0x0p0))) {
    llvm_cbe_storemerge2__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
    goto llvm_cbe__2e_loopexit;
  } else {
    llvm_cbe_storemerge1__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__33;   /* for PHI node */
    goto llvm_cbe__2e_preheader;
  }

  } while (1); /* end of syntactic loop '.preheader' */
  } while (1); /* end of syntactic loop '' */
llvm_cbe__2e_loopexit:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge2 = phi i32 [ 0, %%4 ], [ 1, %%1  for 0x%I64xth hint within @compare  --> \n", ++aesl_llvm_cbe_storemerge2_count);
  llvm_cbe_storemerge2 = (unsigned int )llvm_cbe_storemerge2__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge2 = 0x%X",llvm_cbe_storemerge2);
printf("\n = 0x%X",0u);
printf("\n = 0x%X",1u);
}
  if (AESL_DEBUG_TRACE)
      printf("\nEND @compare}\n");
  return llvm_cbe_storemerge2;
}


void main(void) {
  static  unsigned long long aesl_llvm_cbe_126_count = 0;
  static  unsigned long long aesl_llvm_cbe_127_count = 0;
  static  unsigned long long aesl_llvm_cbe_puts_count = 0;
  unsigned int llvm_cbe_puts;
  static  unsigned long long aesl_llvm_cbe_128_count = 0;
  static  unsigned long long aesl_llvm_cbe_129_count = 0;
  static  unsigned long long aesl_llvm_cbe_130_count = 0;
  unsigned int llvm_cbe_tmp__38;
  static  unsigned long long aesl_llvm_cbe_131_count = 0;
  static  unsigned long long aesl_llvm_cbe_132_count = 0;
  static  unsigned long long aesl_llvm_cbe_puts1_count = 0;
  unsigned int llvm_cbe_puts1;
  static  unsigned long long aesl_llvm_cbe_133_count = 0;
  static  unsigned long long aesl_llvm_cbe_134_count = 0;

  CODE_FOR_MAIN();
const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @main\n");
if (AESL_DEBUG_TRACE)
printf("\n  tail call void @init([100 x float]* getelementptr inbounds ([100 x [100 x float]]* @matAh, i32 0, i32 0), [100 x float]* getelementptr inbounds ([100 x [100 x float]]* @matAs, i32 0, i32 0)), !dbg !6 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_126_count);
   /*tail*/ init(((&matAh[(((signed int )0u))
#ifdef AESL_BC_SIM
 % 100
#endif
])), ((&matAs[(((signed int )0u))
#ifdef AESL_BC_SIM
 % 100
#endif
])));
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  tail call void @init([100 x float]* getelementptr inbounds ([100 x [100 x float]]* @matBh, i32 0, i32 0), [100 x float]* getelementptr inbounds ([100 x [100 x float]]* @matBs, i32 0, i32 0)), !dbg !6 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_127_count);
   /*tail*/ init(((&matBh[(((signed int )0u))
#ifdef AESL_BC_SIM
 % 100
#endif
])), ((&matBs[(((signed int )0u))
#ifdef AESL_BC_SIM
 % 100
#endif
])));
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%puts = tail call i32 @puts(i8* getelementptr inbounds ([22 x i8]* @aesl_internal_str, i32 0, i32 0)), !dbg !6 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_puts_count);
   /*tail*/ puts(( char *)((&aesl_internal_str[(((signed int )0u))
#ifdef AESL_BC_SIM
 % 22
#endif
])));
if (AESL_DEBUG_TRACE) {
printf("\nReturn puts = 0x%X",llvm_cbe_puts);
}
if (AESL_DEBUG_TRACE)
printf("\n  tail call void @mat_mul_s([100 x float]* getelementptr inbounds ([100 x [100 x float]]* @matAs, i32 0, i32 0), [100 x float]* getelementptr inbounds ([100 x [100 x float]]* @matBs, i32 0, i32 0), [100 x float]* getelementptr inbounds ([100 x [100 x float]]* @matCs, i32 0, i32 0)), !dbg !6 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_128_count);
   /*tail*/ mat_mul_s(((&matAs[(((signed int )0u))
#ifdef AESL_BC_SIM
 % 100
#endif
])), ((&matBs[(((signed int )0u))
#ifdef AESL_BC_SIM
 % 100
#endif
])), ((&matCs[(((signed int )0u))
#ifdef AESL_BC_SIM
 % 100
#endif
])));
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  tail call void @AESL_WRAP_mat_mul_wrap([100 x float]* getelementptr inbounds ([100 x [100 x float]]* @matAh, i32 0, i32 0), [100 x float]* getelementptr inbounds ([100 x [100 x float]]* @matBh, i32 0, i32 0), [100 x float]* getelementptr inbounds ([100 x [100 x float]]* @matCh, i32 0, i32 0)) nounwind, !dbg !6 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_129_count);
   /*tail*/ AESL_WRAP_mat_mul_wrap(((&matAh[(((signed int )0u))
#ifdef AESL_BC_SIM
 % 100
#endif
])), ((&matBh[(((signed int )0u))
#ifdef AESL_BC_SIM
 % 100
#endif
])), ((&matCh[(((signed int )0u))
#ifdef AESL_BC_SIM
 % 100
#endif
])));
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%1 = tail call i32 @compare([100 x float]* getelementptr inbounds ([100 x [100 x float]]* @matCh, i32 0, i32 0), [100 x float]* getelementptr inbounds ([100 x [100 x float]]* @matCs, i32 0, i32 0)), !dbg !6 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_130_count);
  llvm_cbe_tmp__38 = (unsigned int ) /*tail*/ compare(((&matCh[(((signed int )0u))
#ifdef AESL_BC_SIM
 % 100
#endif
])), ((&matCs[(((signed int )0u))
#ifdef AESL_BC_SIM
 % 100
#endif
])));
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__38);
}
  if (((llvm_cbe_tmp__38&4294967295U) == (1u&4294967295U))) {
    goto llvm_cbe_tmp__39;
  } else {
    goto llvm_cbe_tmp__40;
  }

llvm_cbe_tmp__39:
if (AESL_DEBUG_TRACE)
printf("\n  %%puts1 = tail call i32 @puts(i8* getelementptr inbounds ([17 x i8]* @aesl_internal_str1, i32 0, i32 0)), !dbg !6 for 0x%I64xth hint within @main  --> \n", ++aesl_llvm_cbe_puts1_count);
   /*tail*/ puts(( char *)((&aesl_internal_str1[(((signed int )0u))
#ifdef AESL_BC_SIM
 % 17
#endif
])));
if (AESL_DEBUG_TRACE) {
printf("\nReturn puts1 = 0x%X",llvm_cbe_puts1);
}
  goto llvm_cbe_tmp__40;

llvm_cbe_tmp__40:
  if (AESL_DEBUG_TRACE)
      printf("\nEND @main}\n");
  return;
}

