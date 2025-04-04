From Coq Require Import String List ZArith.
From compcert Require Import Coqlib Integers Floats AST Ctypes Cop Clight Clightdefs.
Import Clightdefs.ClightNotations.
Local Open Scope Z_scope.
Local Open Scope string_scope.
Local Open Scope clight_scope.

Module Info.
  Definition version := "3.10".
  Definition build_number := "".
  Definition build_tag := "".
  Definition build_branch := "".
  Definition arch := "x86".
  Definition model := "64".
  Definition abi := "standard".
  Definition bitsize := 64.
  Definition big_endian := false.
  Definition source_file := "strlib.c".
  Definition normalized := true.
End Info.

Definition ___builtin_annot : ident := 17%positive.
Definition ___builtin_annot_intval : ident := 18%positive.
Definition ___builtin_bswap : ident := 2%positive.
Definition ___builtin_bswap16 : ident := 4%positive.
Definition ___builtin_bswap32 : ident := 3%positive.
Definition ___builtin_bswap64 : ident := 1%positive.
Definition ___builtin_clz : ident := 5%positive.
Definition ___builtin_clzl : ident := 6%positive.
Definition ___builtin_clzll : ident := 7%positive.
Definition ___builtin_ctz : ident := 8%positive.
Definition ___builtin_ctzl : ident := 9%positive.
Definition ___builtin_ctzll : ident := 10%positive.
Definition ___builtin_debug : ident := 36%positive.
Definition ___builtin_expect : ident := 25%positive.
Definition ___builtin_fabs : ident := 11%positive.
Definition ___builtin_fabsf : ident := 12%positive.
Definition ___builtin_fmadd : ident := 28%positive.
Definition ___builtin_fmax : ident := 26%positive.
Definition ___builtin_fmin : ident := 27%positive.
Definition ___builtin_fmsub : ident := 29%positive.
Definition ___builtin_fnmadd : ident := 30%positive.
Definition ___builtin_fnmsub : ident := 31%positive.
Definition ___builtin_fsqrt : ident := 13%positive.
Definition ___builtin_membar : ident := 19%positive.
Definition ___builtin_memcpy_aligned : ident := 15%positive.
Definition ___builtin_read16_reversed : ident := 32%positive.
Definition ___builtin_read32_reversed : ident := 33%positive.
Definition ___builtin_sel : ident := 16%positive.
Definition ___builtin_sqrt : ident := 14%positive.
Definition ___builtin_unreachable : ident := 24%positive.
Definition ___builtin_va_arg : ident := 21%positive.
Definition ___builtin_va_copy : ident := 22%positive.
Definition ___builtin_va_end : ident := 23%positive.
Definition ___builtin_va_start : ident := 20%positive.
Definition ___builtin_write16_reversed : ident := 34%positive.
Definition ___builtin_write32_reversed : ident := 35%positive.
Definition ___compcert_i64_dtos : ident := 60%positive.
Definition ___compcert_i64_dtou : ident := 61%positive.
Definition ___compcert_i64_sar : ident := 72%positive.
Definition ___compcert_i64_sdiv : ident := 66%positive.
Definition ___compcert_i64_shl : ident := 70%positive.
Definition ___compcert_i64_shr : ident := 71%positive.
Definition ___compcert_i64_smod : ident := 68%positive.
Definition ___compcert_i64_smulh : ident := 73%positive.
Definition ___compcert_i64_stod : ident := 62%positive.
Definition ___compcert_i64_stof : ident := 64%positive.
Definition ___compcert_i64_udiv : ident := 67%positive.
Definition ___compcert_i64_umod : ident := 69%positive.
Definition ___compcert_i64_umulh : ident := 74%positive.
Definition ___compcert_i64_utod : ident := 63%positive.
Definition ___compcert_i64_utof : ident := 65%positive.
Definition ___compcert_va_composite : ident := 59%positive.
Definition ___compcert_va_float64 : ident := 58%positive.
Definition ___compcert_va_int32 : ident := 56%positive.
Definition ___compcert_va_int64 : ident := 57%positive.
Definition ___stringlit_1 : ident := 54%positive.
Definition _buf : ident := 53%positive.
Definition _c : ident := 40%positive.
Definition _d : ident := 41%positive.
Definition _d1 : ident := 50%positive.
Definition _d2 : ident := 51%positive.
Definition _dest : ident := 43%positive.
Definition _example_call_strcpy : ident := 55%positive.
Definition _i : ident := 38%positive.
Definition _j : ident := 46%positive.
Definition _main : ident := 75%positive.
Definition _src : ident := 44%positive.
Definition _str : ident := 37%positive.
Definition _str1 : ident := 48%positive.
Definition _str2 : ident := 49%positive.
Definition _strcat : ident := 47%positive.
Definition _strchr : ident := 42%positive.
Definition _strcmp : ident := 52%positive.
Definition _strcpy : ident := 45%positive.
Definition _strlen : ident := 39%positive.
Definition _t'1 : ident := 76%positive.
Definition _t'2 : ident := 77%positive.
Definition _t'3 : ident := 78%positive.

Definition v___stringlit_1 := {|
  gvar_info := (tarray tschar 6);
  gvar_init := (Init_int8 (Int.repr 72) :: Init_int8 (Int.repr 101) ::
                Init_int8 (Int.repr 108) :: Init_int8 (Int.repr 108) ::
                Init_int8 (Int.repr 111) :: Init_int8 (Int.repr 0) :: nil);
  gvar_readonly := true;
  gvar_volatile := false
|}.

Definition f_strlen := {|
  fn_return := tulong;
  fn_callconv := cc_default;
  fn_params := ((_str, (tptr tschar)) :: nil);
  fn_vars := nil;
  fn_temps := ((_i, tulong) :: (_t'1, tschar) :: nil);
  fn_body :=
(Ssequence
  (Sset _i (Ecast (Econst_int (Int.repr 0) tint) tulong))
  (Sloop
    (Ssequence
      Sskip
      (Ssequence
        (Sset _t'1
          (Ederef
            (Ebinop Oadd (Etempvar _str (tptr tschar)) (Etempvar _i tulong)
              (tptr tschar)) tschar))
        (Sifthenelse (Ebinop Oeq (Etempvar _t'1 tschar)
                       (Econst_int (Int.repr 0) tint) tint)
          (Sreturn (Some (Etempvar _i tulong)))
          Sskip)))
    (Sset _i
      (Ebinop Oadd (Etempvar _i tulong) (Econst_int (Int.repr 1) tint)
        tulong))))
|}.

Definition f_strchr := {|
  fn_return := (tptr tschar);
  fn_callconv := cc_default;
  fn_params := ((_str, (tptr tschar)) :: (_c, tint) :: nil);
  fn_vars := nil;
  fn_temps := ((_i, tulong) :: (_d, tschar) :: (_t'1, tschar) :: nil);
  fn_body :=
(Ssequence
  (Sset _i (Ecast (Econst_int (Int.repr 0) tint) tulong))
  (Sloop
    (Ssequence
      Sskip
      (Ssequence
        (Ssequence
          (Sset _t'1
            (Ederef
              (Ebinop Oadd (Etempvar _str (tptr tschar)) (Etempvar _i tulong)
                (tptr tschar)) tschar))
          (Sset _d (Ecast (Etempvar _t'1 tschar) tschar)))
        (Ssequence
          (Sifthenelse (Ebinop Oeq (Etempvar _d tschar) (Etempvar _c tint)
                         tint)
            (Sreturn (Some (Ebinop Oadd (Etempvar _str (tptr tschar))
                             (Etempvar _i tulong) (tptr tschar))))
            Sskip)
          (Sifthenelse (Ebinop Oeq (Etempvar _d tschar)
                         (Econst_int (Int.repr 0) tint) tint)
            (Sreturn (Some (Econst_int (Int.repr 0) tint)))
            Sskip))))
    (Sset _i
      (Ebinop Oadd (Etempvar _i tulong) (Econst_int (Int.repr 1) tint)
        tulong))))
|}.

Definition f_strcpy := {|
  fn_return := (tptr tschar);
  fn_callconv := cc_default;
  fn_params := ((_dest, (tptr tschar)) :: (_src, (tptr tschar)) :: nil);
  fn_vars := nil;
  fn_temps := ((_i, tulong) :: (_d, tschar) :: (_t'1, tschar) :: nil);
  fn_body :=
(Ssequence
  (Sset _i (Ecast (Econst_int (Int.repr 0) tint) tulong))
  (Sloop
    (Ssequence
      Sskip
      (Ssequence
        (Ssequence
          (Sset _t'1
            (Ederef
              (Ebinop Oadd (Etempvar _src (tptr tschar)) (Etempvar _i tulong)
                (tptr tschar)) tschar))
          (Sset _d (Ecast (Etempvar _t'1 tschar) tschar)))
        (Ssequence
          (Sassign
            (Ederef
              (Ebinop Oadd (Etempvar _dest (tptr tschar))
                (Etempvar _i tulong) (tptr tschar)) tschar)
            (Etempvar _d tschar))
          (Sifthenelse (Ebinop Oeq (Etempvar _d tschar)
                         (Econst_int (Int.repr 0) tint) tint)
            (Sreturn (Some (Etempvar _dest (tptr tschar))))
            Sskip))))
    (Sset _i
      (Ebinop Oadd (Etempvar _i tulong) (Econst_int (Int.repr 1) tint)
        tulong))))
|}.

Definition f_strcat := {|
  fn_return := (tptr tschar);
  fn_callconv := cc_default;
  fn_params := ((_dest, (tptr tschar)) :: (_src, (tptr tschar)) :: nil);
  fn_vars := nil;
  fn_temps := ((_i, tulong) :: (_j, tulong) :: (_d, tschar) ::
               (_t'2, tschar) :: (_t'1, tschar) :: nil);
  fn_body :=
(Ssequence
  (Ssequence
    (Sset _i (Ecast (Econst_int (Int.repr 0) tint) tulong))
    (Sloop
      (Ssequence
        Sskip
        (Ssequence
          (Ssequence
            (Sset _t'2
              (Ederef
                (Ebinop Oadd (Etempvar _dest (tptr tschar))
                  (Etempvar _i tulong) (tptr tschar)) tschar))
            (Sset _d (Ecast (Etempvar _t'2 tschar) tschar)))
          (Sifthenelse (Ebinop Oeq (Etempvar _d tschar)
                         (Econst_int (Int.repr 0) tint) tint)
            Sbreak
            Sskip)))
      (Sset _i
        (Ebinop Oadd (Etempvar _i tulong) (Econst_int (Int.repr 1) tint)
          tulong))))
  (Ssequence
    (Sset _j (Ecast (Econst_int (Int.repr 0) tint) tulong))
    (Sloop
      (Ssequence
        Sskip
        (Ssequence
          (Ssequence
            (Sset _t'1
              (Ederef
                (Ebinop Oadd (Etempvar _src (tptr tschar))
                  (Etempvar _j tulong) (tptr tschar)) tschar))
            (Sset _d (Ecast (Etempvar _t'1 tschar) tschar)))
          (Ssequence
            (Sassign
              (Ederef
                (Ebinop Oadd (Etempvar _dest (tptr tschar))
                  (Ebinop Oadd (Etempvar _i tulong) (Etempvar _j tulong)
                    tulong) (tptr tschar)) tschar) (Etempvar _d tschar))
            (Sifthenelse (Ebinop Oeq (Etempvar _d tschar)
                           (Econst_int (Int.repr 0) tint) tint)
              (Sreturn (Some (Etempvar _dest (tptr tschar))))
              Sskip))))
      (Sset _j
        (Ebinop Oadd (Etempvar _j tulong) (Econst_int (Int.repr 1) tint)
          tulong)))))
|}.

Definition f_strcmp := {|
  fn_return := tint;
  fn_callconv := cc_default;
  fn_params := ((_str1, (tptr tschar)) :: (_str2, (tptr tschar)) :: nil);
  fn_vars := nil;
  fn_temps := ((_i, tulong) :: (_d1, tschar) :: (_d2, tschar) ::
               (_t'1, tint) :: (_t'3, tschar) :: (_t'2, tschar) :: nil);
  fn_body :=
(Ssequence
  (Sset _i (Ecast (Econst_int (Int.repr 0) tint) tulong))
  (Sloop
    (Ssequence
      Sskip
      (Ssequence
        (Ssequence
          (Sset _t'3
            (Ederef
              (Ebinop Oadd (Etempvar _str1 (tptr tschar))
                (Etempvar _i tulong) (tptr tschar)) tschar))
          (Sset _d1 (Ecast (Etempvar _t'3 tschar) tschar)))
        (Ssequence
          (Ssequence
            (Sset _t'2
              (Ederef
                (Ebinop Oadd (Etempvar _str2 (tptr tschar))
                  (Etempvar _i tulong) (tptr tschar)) tschar))
            (Sset _d2 (Ecast (Etempvar _t'2 tschar) tschar)))
          (Ssequence
            (Sifthenelse (Ebinop Oeq (Etempvar _d1 tschar)
                           (Econst_int (Int.repr 0) tint) tint)
              (Sset _t'1
                (Ecast
                  (Ebinop Oeq (Etempvar _d2 tschar)
                    (Econst_int (Int.repr 0) tint) tint) tbool))
              (Sset _t'1 (Econst_int (Int.repr 0) tint)))
            (Sifthenelse (Etempvar _t'1 tint)
              (Sreturn (Some (Econst_int (Int.repr 0) tint)))
              (Sifthenelse (Ebinop Olt (Etempvar _d1 tschar)
                             (Etempvar _d2 tschar) tint)
                (Sreturn (Some (Eunop Oneg (Econst_int (Int.repr 1) tint)
                                 tint)))
                (Sifthenelse (Ebinop Ogt (Etempvar _d1 tschar)
                               (Etempvar _d2 tschar) tint)
                  (Sreturn (Some (Econst_int (Int.repr 1) tint)))
                  Sskip)))))))
    (Sset _i
      (Ebinop Oadd (Etempvar _i tulong) (Econst_int (Int.repr 1) tint)
        tulong))))
|}.

Definition f_example_call_strcpy := {|
  fn_return := tint;
  fn_callconv := cc_default;
  fn_params := nil;
  fn_vars := ((_buf, (tarray tschar 10)) :: nil);
  fn_temps := ((_t'1, tschar) :: nil);
  fn_body :=
(Ssequence
  (Scall None
    (Evar _strcpy (Tfunction (Tcons (tptr tschar) (Tcons (tptr tschar) Tnil))
                    (tptr tschar) cc_default))
    ((Evar _buf (tarray tschar 10)) ::
     (Evar ___stringlit_1 (tarray tschar 6)) :: nil))
  (Ssequence
    (Sset _t'1
      (Ederef
        (Ebinop Oadd (Evar _buf (tarray tschar 10))
          (Econst_int (Int.repr 0) tint) (tptr tschar)) tschar))
    (Sreturn (Some (Etempvar _t'1 tschar)))))
|}.

Definition composites : list composite_definition :=
nil.

Definition global_definitions : list (ident * globdef fundef type) :=
((___compcert_va_int32,
   Gfun(External (EF_runtime "__compcert_va_int32"
                   (mksignature (AST.Tlong :: nil) AST.Tint cc_default))
     (Tcons (tptr tvoid) Tnil) tuint cc_default)) ::
 (___compcert_va_int64,
   Gfun(External (EF_runtime "__compcert_va_int64"
                   (mksignature (AST.Tlong :: nil) AST.Tlong cc_default))
     (Tcons (tptr tvoid) Tnil) tulong cc_default)) ::
 (___compcert_va_float64,
   Gfun(External (EF_runtime "__compcert_va_float64"
                   (mksignature (AST.Tlong :: nil) AST.Tfloat cc_default))
     (Tcons (tptr tvoid) Tnil) tdouble cc_default)) ::
 (___compcert_va_composite,
   Gfun(External (EF_runtime "__compcert_va_composite"
                   (mksignature (AST.Tlong :: AST.Tlong :: nil) AST.Tlong
                     cc_default)) (Tcons (tptr tvoid) (Tcons tulong Tnil))
     (tptr tvoid) cc_default)) ::
 (___compcert_i64_dtos,
   Gfun(External (EF_runtime "__compcert_i64_dtos"
                   (mksignature (AST.Tfloat :: nil) AST.Tlong cc_default))
     (Tcons tdouble Tnil) tlong cc_default)) ::
 (___compcert_i64_dtou,
   Gfun(External (EF_runtime "__compcert_i64_dtou"
                   (mksignature (AST.Tfloat :: nil) AST.Tlong cc_default))
     (Tcons tdouble Tnil) tulong cc_default)) ::
 (___compcert_i64_stod,
   Gfun(External (EF_runtime "__compcert_i64_stod"
                   (mksignature (AST.Tlong :: nil) AST.Tfloat cc_default))
     (Tcons tlong Tnil) tdouble cc_default)) ::
 (___compcert_i64_utod,
   Gfun(External (EF_runtime "__compcert_i64_utod"
                   (mksignature (AST.Tlong :: nil) AST.Tfloat cc_default))
     (Tcons tulong Tnil) tdouble cc_default)) ::
 (___compcert_i64_stof,
   Gfun(External (EF_runtime "__compcert_i64_stof"
                   (mksignature (AST.Tlong :: nil) AST.Tsingle cc_default))
     (Tcons tlong Tnil) tfloat cc_default)) ::
 (___compcert_i64_utof,
   Gfun(External (EF_runtime "__compcert_i64_utof"
                   (mksignature (AST.Tlong :: nil) AST.Tsingle cc_default))
     (Tcons tulong Tnil) tfloat cc_default)) ::
 (___compcert_i64_sdiv,
   Gfun(External (EF_runtime "__compcert_i64_sdiv"
                   (mksignature (AST.Tlong :: AST.Tlong :: nil) AST.Tlong
                     cc_default)) (Tcons tlong (Tcons tlong Tnil)) tlong
     cc_default)) ::
 (___compcert_i64_udiv,
   Gfun(External (EF_runtime "__compcert_i64_udiv"
                   (mksignature (AST.Tlong :: AST.Tlong :: nil) AST.Tlong
                     cc_default)) (Tcons tulong (Tcons tulong Tnil)) tulong
     cc_default)) ::
 (___compcert_i64_smod,
   Gfun(External (EF_runtime "__compcert_i64_smod"
                   (mksignature (AST.Tlong :: AST.Tlong :: nil) AST.Tlong
                     cc_default)) (Tcons tlong (Tcons tlong Tnil)) tlong
     cc_default)) ::
 (___compcert_i64_umod,
   Gfun(External (EF_runtime "__compcert_i64_umod"
                   (mksignature (AST.Tlong :: AST.Tlong :: nil) AST.Tlong
                     cc_default)) (Tcons tulong (Tcons tulong Tnil)) tulong
     cc_default)) ::
 (___compcert_i64_shl,
   Gfun(External (EF_runtime "__compcert_i64_shl"
                   (mksignature (AST.Tlong :: AST.Tint :: nil) AST.Tlong
                     cc_default)) (Tcons tlong (Tcons tint Tnil)) tlong
     cc_default)) ::
 (___compcert_i64_shr,
   Gfun(External (EF_runtime "__compcert_i64_shr"
                   (mksignature (AST.Tlong :: AST.Tint :: nil) AST.Tlong
                     cc_default)) (Tcons tulong (Tcons tint Tnil)) tulong
     cc_default)) ::
 (___compcert_i64_sar,
   Gfun(External (EF_runtime "__compcert_i64_sar"
                   (mksignature (AST.Tlong :: AST.Tint :: nil) AST.Tlong
                     cc_default)) (Tcons tlong (Tcons tint Tnil)) tlong
     cc_default)) ::
 (___compcert_i64_smulh,
   Gfun(External (EF_runtime "__compcert_i64_smulh"
                   (mksignature (AST.Tlong :: AST.Tlong :: nil) AST.Tlong
                     cc_default)) (Tcons tlong (Tcons tlong Tnil)) tlong
     cc_default)) ::
 (___compcert_i64_umulh,
   Gfun(External (EF_runtime "__compcert_i64_umulh"
                   (mksignature (AST.Tlong :: AST.Tlong :: nil) AST.Tlong
                     cc_default)) (Tcons tulong (Tcons tulong Tnil)) tulong
     cc_default)) :: (___stringlit_1, Gvar v___stringlit_1) ::
 (___builtin_bswap64,
   Gfun(External (EF_builtin "__builtin_bswap64"
                   (mksignature (AST.Tlong :: nil) AST.Tlong cc_default))
     (Tcons tulong Tnil) tulong cc_default)) ::
 (___builtin_bswap,
   Gfun(External (EF_builtin "__builtin_bswap"
                   (mksignature (AST.Tint :: nil) AST.Tint cc_default))
     (Tcons tuint Tnil) tuint cc_default)) ::
 (___builtin_bswap32,
   Gfun(External (EF_builtin "__builtin_bswap32"
                   (mksignature (AST.Tint :: nil) AST.Tint cc_default))
     (Tcons tuint Tnil) tuint cc_default)) ::
 (___builtin_bswap16,
   Gfun(External (EF_builtin "__builtin_bswap16"
                   (mksignature (AST.Tint :: nil) AST.Tint16unsigned
                     cc_default)) (Tcons tushort Tnil) tushort cc_default)) ::
 (___builtin_clz,
   Gfun(External (EF_builtin "__builtin_clz"
                   (mksignature (AST.Tint :: nil) AST.Tint cc_default))
     (Tcons tuint Tnil) tint cc_default)) ::
 (___builtin_clzl,
   Gfun(External (EF_builtin "__builtin_clzl"
                   (mksignature (AST.Tlong :: nil) AST.Tint cc_default))
     (Tcons tulong Tnil) tint cc_default)) ::
 (___builtin_clzll,
   Gfun(External (EF_builtin "__builtin_clzll"
                   (mksignature (AST.Tlong :: nil) AST.Tint cc_default))
     (Tcons tulong Tnil) tint cc_default)) ::
 (___builtin_ctz,
   Gfun(External (EF_builtin "__builtin_ctz"
                   (mksignature (AST.Tint :: nil) AST.Tint cc_default))
     (Tcons tuint Tnil) tint cc_default)) ::
 (___builtin_ctzl,
   Gfun(External (EF_builtin "__builtin_ctzl"
                   (mksignature (AST.Tlong :: nil) AST.Tint cc_default))
     (Tcons tulong Tnil) tint cc_default)) ::
 (___builtin_ctzll,
   Gfun(External (EF_builtin "__builtin_ctzll"
                   (mksignature (AST.Tlong :: nil) AST.Tint cc_default))
     (Tcons tulong Tnil) tint cc_default)) ::
 (___builtin_fabs,
   Gfun(External (EF_builtin "__builtin_fabs"
                   (mksignature (AST.Tfloat :: nil) AST.Tfloat cc_default))
     (Tcons tdouble Tnil) tdouble cc_default)) ::
 (___builtin_fabsf,
   Gfun(External (EF_builtin "__builtin_fabsf"
                   (mksignature (AST.Tsingle :: nil) AST.Tsingle cc_default))
     (Tcons tfloat Tnil) tfloat cc_default)) ::
 (___builtin_fsqrt,
   Gfun(External (EF_builtin "__builtin_fsqrt"
                   (mksignature (AST.Tfloat :: nil) AST.Tfloat cc_default))
     (Tcons tdouble Tnil) tdouble cc_default)) ::
 (___builtin_sqrt,
   Gfun(External (EF_builtin "__builtin_sqrt"
                   (mksignature (AST.Tfloat :: nil) AST.Tfloat cc_default))
     (Tcons tdouble Tnil) tdouble cc_default)) ::
 (___builtin_memcpy_aligned,
   Gfun(External (EF_builtin "__builtin_memcpy_aligned"
                   (mksignature
                     (AST.Tlong :: AST.Tlong :: AST.Tlong :: AST.Tlong ::
                      nil) AST.Tvoid cc_default))
     (Tcons (tptr tvoid)
       (Tcons (tptr tvoid) (Tcons tulong (Tcons tulong Tnil)))) tvoid
     cc_default)) ::
 (___builtin_sel,
   Gfun(External (EF_builtin "__builtin_sel"
                   (mksignature (AST.Tint :: nil) AST.Tvoid
                     {|cc_vararg:=(Some 1); cc_unproto:=false; cc_structret:=false|}))
     (Tcons tbool Tnil) tvoid
     {|cc_vararg:=(Some 1); cc_unproto:=false; cc_structret:=false|})) ::
 (___builtin_annot,
   Gfun(External (EF_builtin "__builtin_annot"
                   (mksignature (AST.Tlong :: nil) AST.Tvoid
                     {|cc_vararg:=(Some 1); cc_unproto:=false; cc_structret:=false|}))
     (Tcons (tptr tschar) Tnil) tvoid
     {|cc_vararg:=(Some 1); cc_unproto:=false; cc_structret:=false|})) ::
 (___builtin_annot_intval,
   Gfun(External (EF_builtin "__builtin_annot_intval"
                   (mksignature (AST.Tlong :: AST.Tint :: nil) AST.Tint
                     cc_default)) (Tcons (tptr tschar) (Tcons tint Tnil))
     tint cc_default)) ::
 (___builtin_membar,
   Gfun(External (EF_builtin "__builtin_membar"
                   (mksignature nil AST.Tvoid cc_default)) Tnil tvoid
     cc_default)) ::
 (___builtin_va_start,
   Gfun(External (EF_builtin "__builtin_va_start"
                   (mksignature (AST.Tlong :: nil) AST.Tvoid cc_default))
     (Tcons (tptr tvoid) Tnil) tvoid cc_default)) ::
 (___builtin_va_arg,
   Gfun(External (EF_builtin "__builtin_va_arg"
                   (mksignature (AST.Tlong :: AST.Tint :: nil) AST.Tvoid
                     cc_default)) (Tcons (tptr tvoid) (Tcons tuint Tnil))
     tvoid cc_default)) ::
 (___builtin_va_copy,
   Gfun(External (EF_builtin "__builtin_va_copy"
                   (mksignature (AST.Tlong :: AST.Tlong :: nil) AST.Tvoid
                     cc_default))
     (Tcons (tptr tvoid) (Tcons (tptr tvoid) Tnil)) tvoid cc_default)) ::
 (___builtin_va_end,
   Gfun(External (EF_builtin "__builtin_va_end"
                   (mksignature (AST.Tlong :: nil) AST.Tvoid cc_default))
     (Tcons (tptr tvoid) Tnil) tvoid cc_default)) ::
 (___builtin_unreachable,
   Gfun(External (EF_builtin "__builtin_unreachable"
                   (mksignature nil AST.Tvoid cc_default)) Tnil tvoid
     cc_default)) ::
 (___builtin_expect,
   Gfun(External (EF_builtin "__builtin_expect"
                   (mksignature (AST.Tlong :: AST.Tlong :: nil) AST.Tlong
                     cc_default)) (Tcons tlong (Tcons tlong Tnil)) tlong
     cc_default)) ::
 (___builtin_fmax,
   Gfun(External (EF_builtin "__builtin_fmax"
                   (mksignature (AST.Tfloat :: AST.Tfloat :: nil) AST.Tfloat
                     cc_default)) (Tcons tdouble (Tcons tdouble Tnil))
     tdouble cc_default)) ::
 (___builtin_fmin,
   Gfun(External (EF_builtin "__builtin_fmin"
                   (mksignature (AST.Tfloat :: AST.Tfloat :: nil) AST.Tfloat
                     cc_default)) (Tcons tdouble (Tcons tdouble Tnil))
     tdouble cc_default)) ::
 (___builtin_fmadd,
   Gfun(External (EF_builtin "__builtin_fmadd"
                   (mksignature
                     (AST.Tfloat :: AST.Tfloat :: AST.Tfloat :: nil)
                     AST.Tfloat cc_default))
     (Tcons tdouble (Tcons tdouble (Tcons tdouble Tnil))) tdouble
     cc_default)) ::
 (___builtin_fmsub,
   Gfun(External (EF_builtin "__builtin_fmsub"
                   (mksignature
                     (AST.Tfloat :: AST.Tfloat :: AST.Tfloat :: nil)
                     AST.Tfloat cc_default))
     (Tcons tdouble (Tcons tdouble (Tcons tdouble Tnil))) tdouble
     cc_default)) ::
 (___builtin_fnmadd,
   Gfun(External (EF_builtin "__builtin_fnmadd"
                   (mksignature
                     (AST.Tfloat :: AST.Tfloat :: AST.Tfloat :: nil)
                     AST.Tfloat cc_default))
     (Tcons tdouble (Tcons tdouble (Tcons tdouble Tnil))) tdouble
     cc_default)) ::
 (___builtin_fnmsub,
   Gfun(External (EF_builtin "__builtin_fnmsub"
                   (mksignature
                     (AST.Tfloat :: AST.Tfloat :: AST.Tfloat :: nil)
                     AST.Tfloat cc_default))
     (Tcons tdouble (Tcons tdouble (Tcons tdouble Tnil))) tdouble
     cc_default)) ::
 (___builtin_read16_reversed,
   Gfun(External (EF_builtin "__builtin_read16_reversed"
                   (mksignature (AST.Tlong :: nil) AST.Tint16unsigned
                     cc_default)) (Tcons (tptr tushort) Tnil) tushort
     cc_default)) ::
 (___builtin_read32_reversed,
   Gfun(External (EF_builtin "__builtin_read32_reversed"
                   (mksignature (AST.Tlong :: nil) AST.Tint cc_default))
     (Tcons (tptr tuint) Tnil) tuint cc_default)) ::
 (___builtin_write16_reversed,
   Gfun(External (EF_builtin "__builtin_write16_reversed"
                   (mksignature (AST.Tlong :: AST.Tint :: nil) AST.Tvoid
                     cc_default)) (Tcons (tptr tushort) (Tcons tushort Tnil))
     tvoid cc_default)) ::
 (___builtin_write32_reversed,
   Gfun(External (EF_builtin "__builtin_write32_reversed"
                   (mksignature (AST.Tlong :: AST.Tint :: nil) AST.Tvoid
                     cc_default)) (Tcons (tptr tuint) (Tcons tuint Tnil))
     tvoid cc_default)) ::
 (___builtin_debug,
   Gfun(External (EF_external "__builtin_debug"
                   (mksignature (AST.Tint :: nil) AST.Tvoid
                     {|cc_vararg:=(Some 1); cc_unproto:=false; cc_structret:=false|}))
     (Tcons tint Tnil) tvoid
     {|cc_vararg:=(Some 1); cc_unproto:=false; cc_structret:=false|})) ::
 (_strlen, Gfun(Internal f_strlen)) :: (_strchr, Gfun(Internal f_strchr)) ::
 (_strcpy, Gfun(Internal f_strcpy)) :: (_strcat, Gfun(Internal f_strcat)) ::
 (_strcmp, Gfun(Internal f_strcmp)) ::
 (_example_call_strcpy, Gfun(Internal f_example_call_strcpy)) :: nil).

Definition public_idents : list ident :=
(_example_call_strcpy :: _strcmp :: _strcat :: _strcpy :: _strchr ::
 _strlen :: ___builtin_debug :: ___builtin_write32_reversed ::
 ___builtin_write16_reversed :: ___builtin_read32_reversed ::
 ___builtin_read16_reversed :: ___builtin_fnmsub :: ___builtin_fnmadd ::
 ___builtin_fmsub :: ___builtin_fmadd :: ___builtin_fmin ::
 ___builtin_fmax :: ___builtin_expect :: ___builtin_unreachable ::
 ___builtin_va_end :: ___builtin_va_copy :: ___builtin_va_arg ::
 ___builtin_va_start :: ___builtin_membar :: ___builtin_annot_intval ::
 ___builtin_annot :: ___builtin_sel :: ___builtin_memcpy_aligned ::
 ___builtin_sqrt :: ___builtin_fsqrt :: ___builtin_fabsf ::
 ___builtin_fabs :: ___builtin_ctzll :: ___builtin_ctzl :: ___builtin_ctz ::
 ___builtin_clzll :: ___builtin_clzl :: ___builtin_clz ::
 ___builtin_bswap16 :: ___builtin_bswap32 :: ___builtin_bswap ::
 ___builtin_bswap64 :: ___compcert_i64_umulh :: ___compcert_i64_smulh ::
 ___compcert_i64_sar :: ___compcert_i64_shr :: ___compcert_i64_shl ::
 ___compcert_i64_umod :: ___compcert_i64_smod :: ___compcert_i64_udiv ::
 ___compcert_i64_sdiv :: ___compcert_i64_utof :: ___compcert_i64_stof ::
 ___compcert_i64_utod :: ___compcert_i64_stod :: ___compcert_i64_dtou ::
 ___compcert_i64_dtos :: ___compcert_va_composite ::
 ___compcert_va_float64 :: ___compcert_va_int64 :: ___compcert_va_int32 ::
 nil).

Definition prog : Clight.program :=
  mkprogram composites global_definitions public_idents _main Logic.I.


(* 2024-12-27 01:34 *)
