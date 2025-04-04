(* This file is extracted from the TLC library.
   http://github.com/charguer/tlc
   DO NOT EDIT. *)

(**************************************************************************
* TLC: A library for Coq                                                  *
* Product of Data Structures                                              *
**************************************************************************)

Set Implicit Arguments.
From SLF Require Import LibTactics LibLogic LibReflect.
Generalizable Variables A B.


(* ********************************************************************** *)
(* ################################################################# *)
(** * Product type *)

(* ---------------------------------------------------------------------- *)
(* ================================================================= *)
(** ** Definition *)

(** From the Prelude:

    Inductive prod A B : Type :=
      | pair : A -> B -> prod A B.

    Hint Constructors prod : core.

    Add Printing Let prod.
    Notation "x * y" := (prod x y) : type_scope.
    Notation "( x , y , .. , z )" := (pair .. (pair x y) .. z) : core_scope.

    Definition fst A B (p:A*B) : A :=
      match p with (x,y) => x end.

    Definition snd A B (p:A*B) : B :=
      match p with (x,y) => y end.

  Remark: to follow conventions [pair] should be renamed to [prod_intro].

*)

(* ---------------------------------------------------------------------- *)
(* ================================================================= *)
(** ** Inhabited *)

Global Instance Inhab_prod : forall `{Inhab A, Inhab B}, Inhab (A * B).
Proof using. intros. apply (Inhab_of_val (arbitrary, arbitrary)). Qed.

(* ********************************************************************** *)
(* ################################################################# *)
(** * Structure *)

(** Decomposition as projection *)

Lemma prod2_eq_tuple_proj : forall A1 A2 (x:A1*A2),
  x = (fst x, snd x).
Proof using. intros. destruct~ x. Qed.

(** Structural equality *)

Section Properties.
Variables (A1 A2 A3 A4 : Type).
Lemma eq_prod2 : forall (x1 y1:A1) (x2 y2:A2),
  x1 = y1 ->
  x2 = y2 ->
  (x1, x2) = (y1, y2).
Proof using. intros. subst~. Qed.

Lemma eq_prod3 : forall (x1 y1:A1) (x2 y2:A2) (x3 y3:A3),
  x1 = y1 ->
  x2 = y2 ->
  x3 = y3 ->
  (x1, x2, x3) = (y1, y2, y3).
Proof using. intros. subst~. Qed.

Lemma eq_prod4 : forall (x1 y1:A1) (x2 y2:A2) (x3 y3:A3) (x4 y4:A4),
  x1 = y1 ->
  x2 = y2 ->
  x3 = y3 ->
  x4 = y4 ->
  (x1, x2, x3, x4) = (y1, y2, y3, y4).
Proof using. intros. subst~. Qed.

End Properties.

#[global]
Hint Immediate eq_prod2 eq_prod3 eq_prod4.


(* ********************************************************************** *)
(* ################################################################# *)
(** * Operations *)

(* ---------------------------------------------------------------------- *)
(* ================================================================= *)
(** ** Definition of projections *)

(** [fst] and [snd] are defined in the Prelude

  Definition fst A B (p:A*B) : A :=
    match p with (x,y) => x end.

  Definition snd A B (p:A*B) : B :=
    match p with (x,y) => y end.

*)

Arguments fst {A} {B}.
Arguments snd {A} {B}.

(* ---------------------------------------------------------------------- *)
(* ================================================================= *)
(** ** Notation for projections *)

(** N-ary projections are defined as notations and not as
    definitions, which has appeared to be more flexible with
    respect to type inference.
    --TODO: investigate the possibility of using definitions. *)

Notation "'proj11' P" := P (at level 69, only parsing).

Notation "'proj21' P" := (proj1 P) (at level 69, only parsing).
Notation "'proj22' P" := (proj2 P) (at level 69, only parsing).

Notation "'proj31' P" := (proj1 P) (at level 69).
Notation "'proj32' P" := (proj1 (proj2 P)) (at level 69).
Notation "'proj33' P" := (proj2 (proj2 P)) (at level 69).

Notation "'proj41' P" := (proj1 P) (at level 69).
Notation "'proj42' P" := (proj1 (proj2 P)) (at level 69).
Notation "'proj43' P" := (proj1 (proj2 (proj2 P))) (at level 69).
Notation "'proj44' P" := (proj2 (proj2 (proj2 P))) (at level 69).

Notation "'proj51' P" := (proj1 P) (at level 69).
Notation "'proj52' P" := (proj1 (proj2 P)) (at level 69).
Notation "'proj53' P" := (proj1 (proj2 (proj2 P))) (at level 69).
Notation "'proj54' P" := (proj1 (proj2 (proj2 (proj2 P)))) (at level 69).
Notation "'proj55' P" := (proj2 (proj2 (proj2 (proj2 P)))) (at level 69).

(*-----------------------------------------------------*)
(* ================================================================= *)
(** ** Currying *)

Section Currying.
Variables (A1 A2 A3 A4 A5 B : Type).
Definition curry1 f : A1 -> B :=
  f.
Definition curry2 f : A1 -> A2 -> B :=
  fun x1 x2 => f (x1,x2).
Definition curry3 f : A1 -> A2 -> A3 -> B :=
  fun x1 x2 x3 => f (x1,x2,x3).
Definition curry4 f : A1 -> A2 -> A3 -> A4 -> B :=
  fun x1 x2 x3 x4 => f (x1,x2,x3,x4).
Definition curry5 f : A1 -> A2 -> A3 -> A4 -> A5 -> B :=
  fun x1 x2 x3 x4 x5 => f (x1,x2,x3,x4,x5).
End Currying.

(*-----------------------------------------------------*)
(* ================================================================= *)
(** ** Uncurrying *)

Section Uncurrying.
Variables (A1 A2 A3 A4 A5 B : Type).
Definition uncurry1 f : A1 -> B :=
  f.
Definition uncurry2 f : A1*A2 -> B :=
  fun p => match p with (x1,x2) =>
  f x1 x2 end.
Definition uncurry3 f : A1*A2*A3 -> B :=
  fun p => match p with (x1,x2,x3) =>
  f x1 x2 x3 end.
Definition uncurry4 f : A1*A2*A3*A4 -> B :=
  fun p => match p with (x1,x2,x3,x4) =>
  f x1 x2 x3 x4 end.
Definition uncurry5 f : A1*A2*A3*A4*A5 -> B :=
  fun p => match p with (x1,x2,x3,x4,x5) =>
  f x1 x2 x3 x4 x5 end.
End Uncurrying.

(* ---------------------------------------------------------------------- *)
(* ================================================================= *)
(** ** Uncurrying for relations *)

(** [uncurrypN] turns a function of type [A1 -> A1 -> .. -> AN -> AN -> B]
    into a function of type [(A1*..*AN) -> (A1*..*AN) -> B]. *)

Section Uncurryp.
Variables (A1 A2 A3 A4 B : Type).
Definition uncurryp1 f : A1 -> A1 -> B :=
  f.
Definition uncurryp2 f : A1*A2 -> A1*A2 -> B :=
  fun p1 p2 => match p1,p2 with (x1,x2),(y1,y2) =>
  f x1 y1 x2 y2 end.
Definition uncurryp3 f : A1*A2*A3 -> A1*A2*A3 -> B :=
  fun p1 p2 => match p1,p2 with (x1,x2,x3),(y1,y2,y3) =>
  f x1 x2 x3 y1 y2 y3 end.
Definition uncurryp4 f : A1*A2*A3*A4 -> A1*A2*A3*A4 -> B :=
  fun p1 p2 => match p1,p2 with (x1,x2,x3,x4),(y1,y2,y3,y4) =>
  f x1 x2 x3 x4 y1 y2 y3 y4 end.
End Uncurryp.

(** Unfolding *)

Tactic Notation "unfold_uncurryp" :=
  unfold uncurryp1, uncurryp2, uncurryp3, uncurryp4.

Tactic Notation "unfolds_uncurryp" :=
  unfold uncurryp1, uncurryp2, uncurryp3, uncurryp4 in *.

(* ---------------------------------------------------------------------- *)
(* ================================================================= *)
(** ** Inverse projections for relations *)

(* --TODO: rename to [unprojpNK] and define also [unprojNK] *)

(** [unprojNK] turns a function of type [AK -> AK -> B]
    into a function of type [(A1*..*AN) -> (A1*..*AN) -> B]. *)

Section Unproj.
Variables (A1 A2 A3 A4 A5 B : Type).

Definition unproj21 f : A1*A2 -> A1*A2 -> B :=
  fun p1 p2 => match p1,p2 with (x1,x2),(y1,y2) =>
  f x1 y1 end.
Definition unproj22 f : A1*A2 -> A1*A2 -> B :=
  fun p1 p2 => match p1,p2 with (x1,x2),(y1,y2) =>
  f x2 y2 end.
Definition unproj31 f : A1*A2*A3 -> A1*A2*A3 -> B :=
  fun p1 p2 => match p1,p2 with (x1,x2,x3),(y1,y2,y3) =>
  f x1 y1 end.
Definition unproj32 f : A1*A2*A3 -> A1*A2*A3 -> B :=
  fun p1 p2 => match p1,p2 with (x1,x2,x3),(y1,y2,y3) =>
  f x2 y2 end.
Definition unproj33 f : A1*A2*A3 -> A1*A2*A3 -> B :=
  fun p1 p2 => match p1,p2 with (x1,x2,x3),(y1,y2,y3) =>
  f x3 y3 end.
Definition unproj41 f : A1*A2*A3*A4 -> A1*A2*A3*A4 -> B :=
  fun p1 p2 => match p1,p2 with (x1,x2,x3,x4),(y1,y2,y3,y4) =>
  f x1 y1 end.
Definition unproj42 f : A1*A2*A3*A4 -> A1*A2*A3*A4 -> B :=
  fun p1 p2 => match p1,p2 with (x1,x2,x3,x4),(y1,y2,y3,y4) =>
  f x2 y2 end.
Definition unproj43 f : A1*A2*A3*A4 -> A1*A2*A3*A4 -> B :=
  fun p1 p2 => match p1,p2 with (x1,x2,x3,x4),(y1,y2,y3,y4) =>
  f x3 y3 end.
Definition unproj44 f : A1*A2*A3*A4 -> A1*A2*A3*A4 -> B :=
  fun p1 p2 => match p1,p2 with (x1,x2,x3,x4),(y1,y2,y3,y4) =>
  f x4 y4 end.
Definition unproj51 f : A1*A2*A3*A4*A5 -> A1*A2*A3*A4*A5 -> B :=
  fun p1 p2 => match p1,p2 with (x1,x2,x3,x4,x5),(y1,y2,y3,y4,y5) =>
  f x1 y1 end.
Definition unproj52 f : A1*A2*A3*A4*A5 -> A1*A2*A3*A4*A5 -> B :=
  fun p1 p2 => match p1,p2 with (x1,x2,x3,x4,x5),(y1,y2,y3,y4,y5) =>
  f x2 y2 end.
Definition unproj53 f : A1*A2*A3*A4*A5 -> A1*A2*A3*A4*A5 -> B :=
  fun p1 p2 => match p1,p2 with (x1,x2,x3,x4,x5),(y1,y2,y3,y4,y5) =>
  f x3 y3 end.
Definition unproj54 f : A1*A2*A3*A4*A5 -> A1*A2*A3*A4*A5 -> B :=
  fun p1 p2 => match p1,p2 with (x1,x2,x3,x4,x5),(y1,y2,y3,y4,y5) =>
  f x4 y4 end.
Definition unproj55 f : A1*A2*A3*A4*A5 -> A1*A2*A3*A4*A5 -> B :=
  fun p1 p2 => match p1,p2 with (x1,x2,x3,x4,x5),(y1,y2,y3,y4,y5) =>
  f x5 y5 end.

End Unproj.

Arguments unproj21 [A1] A2 [B].
Arguments unproj22 A1 [A2] [B].
Arguments unproj31 [A1] A2 A3 [B].
Arguments unproj32 A1 [A2] A3 [B].
Arguments unproj33 A1 A2 [A3] [B].
Arguments unproj41 [A1] A2 A3 A4 [B].
Arguments unproj42 A1 [A2] A3 A4 [B].
Arguments unproj43 A1 A2 [A3] A4 [B].
Arguments unproj44 A1 A2 A3 [A4] [B].
Arguments unproj51 [A1] A2 A3 A4 A5 [B].
Arguments unproj52 A1 [A2] A3 A4 A5 [B].
Arguments unproj53 A1 A2 [A3] A4 A5 [B].
Arguments unproj54 A1 A2 A3 [A4] A5 [B].
Arguments unproj55 A1 A2 A3 A4 [A5] [B].

(** Unfolding *)

Tactic Notation "unfold_unproj" :=
  unfold unproj21, unproj22, unproj31, unproj32, unproj33,
         unproj41, unproj42, unproj43, unproj44,
         unproj51.

Tactic Notation "unfolds_unproj" :=
  unfold unproj21, unproj22, unproj31, unproj32, unproj33,
         unproj41, unproj42, unproj43, unproj44,
         unproj51 in *.

(* 2024-12-27 01:30 *)
