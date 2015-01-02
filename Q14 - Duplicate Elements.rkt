#lang racket
(require typed/racket)

;; Question:
;;   Duplicate the elements of a list.
;;    Example:
;;    (dupli '(a b c c d))
;; => '(a a b b c c c c d d)

;; Duplicates every element in the given list.
(define (dupli lst)
  (foldr (lambda (x y) (cons x (cons x y))) empty lst))

;; Tests
(assert (equal? (dupli '()) '()))
(assert (equal? (dupli '(0)) '(0 0)))
(assert (equal? (dupli '(a b c c d)) '(a a b b c c c c d d)))
(assert (equal? (dupli '(1 1 2 3 4 4)) '(1 1 1 1 2 2 3 3 4 4 4 4)))
