#lang racket
(require typed/racket)

;; Question:
;;   Find out whether a list is a palindrome.

;; Predicate: Checks if a list is a palindrome.
(define (palindrome? lst)
  (equal? lst (foldl cons empty lst)))

;; Tests
(assert (palindrome? '()))
(assert (palindrome? '(a)))
(assert (palindrome? '(a o a)))
(assert (palindrome? '(x a m a x)))
(assert (not (palindrome? '(a b))))
