#lang racket
(require typed/racket)

;; Question:
;;   Find the number of elements of a list.

;; Consumes a list and returns its length.
(define (my-length lst)
  (foldl (lambda (x y) (+ 1 y)) 0 lst))

;; Tests
(assert (equal? (my-length '()) 0))
(assert (equal? (my-length '(a)) 1))
(assert (equal? (my-length '(a b c d e)) 5))
