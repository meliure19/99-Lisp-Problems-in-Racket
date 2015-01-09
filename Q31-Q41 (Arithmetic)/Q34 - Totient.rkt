#lang racket
(require typed/racket)

;; Question:
;; Calculate Euler's totient function phi(m).
;; Euler's so-called totient function phi(m) is defined as the number of positive integers r (1 <= r < m) that are coprime to m.
;; For example: m = 10; r = 1,3,7,9; thus phi(m) = 4. Note the special case: phi(1) = 1.
;; Example:
;; (totient-phi 10)
;; => 4
;;
;; Find out what the value of phi(m) is if m is a prime number. Euler's totient
;; function plays an important role in one of the most widely used public key
;; cryptography methods (RSA). In this exercise you should use the most primitive
;; method to calculate this function (there are smarter ways that we shall discuss later).
;;

(define (totient-phi x)
  (error "Not implemented yet"))