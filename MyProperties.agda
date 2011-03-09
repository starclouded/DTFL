-- Author: Andres Eugenio Castaño Cardenas <starclouded@gmail.com>
-- References
-- (1) M.H. Sorense, P. Urzyczyn, Lecutres on the Curry-Howard Isomorphism
-- (2) John O'Donnell, Discrete Mathematics Using a Computer. Springer

----------------------------------------------------------------------
-- First part: using PropositionsAsTypes

module MyProperties  where

open import PropositionsAsTypes

-- (1) Page 198, (iii)
-- ∀a(φ(a) → ψ(a)) → (∀aφ(a) → ∀aψ(a))

hw1 : {A : Set}{φ ψ : A → Set} →
      ((x : A) → (φ x → ψ x)) →
      (((a : A) → φ a) →((a : A) → ψ a))

hw1 f g a = f a (g a)

-- (1) Page 198, (iv)
-- ∀a(φ(a) → ψ(a)) → (∃aφ(a) → ∃aψ(a))

hw2 : {A : Set}{φ ψ : A → Set} →
      ((x : A) → (φ x → ψ x)) →
      (∃ A φ) → (∃ A ψ)

hw2 f (x , p) = x , f x p

-- (2) Page 183,(Example 10)
-- ∃a(φ(a) → ψ(a)) ∧ ∀aφ(a) → ∃aψ(a)

-- P : (A : Set)(φ ψ : A → Set) → A → Set

-- P a φ ψ = ψ

hw3 : {A : Set}{φ ψ : A → Set} → ∃ A ( \x → (φ x → ψ x))  ∧ ((x : A) → φ x) → ∃ A ψ

hw3 ((a , p) , ψ) = a , p (ψ a)
