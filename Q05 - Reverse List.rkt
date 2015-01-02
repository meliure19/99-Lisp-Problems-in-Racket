#lang racket
(require typed/racket)

;; Question:
;;  Reverse a list.

;; Reverses a list
(define (my-reverse lst)
  (foldl cons empty lst))

;; Tests
(assert (equal? (my-reverse '()) '()))
(assert (equal? (my-reverse '(a)) '(a)))
(assert (equal? (my-reverse '((0) (1))) '((1) (0))))
(assert (equal? (my-reverse '(a b c d e)) '(e d c b a)))
