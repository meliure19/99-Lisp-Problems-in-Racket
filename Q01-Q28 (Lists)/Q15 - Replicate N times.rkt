#lang racket
(require typed/racket)

;; Question:
;;   Replicate the elements of a list a given number of times.
;;    Example:
;;     (repli '(a b c) 3)
;;  => '(a a a b b b c c c)

;; Replicates every element in the given list N times.
(define (repli lst n)
  (if (>= n 0) 
      (foldr (lambda (x y) (append (build-list n (lambda (a) x)) y)) empty lst)
      (error 'repli "Number must be positive!")))

;; Tests
(assert (equal? (repli '() 10) '()))
(assert (equal? (repli '(0) 0) '()))
(assert (equal? (repli '(a b c) 3) '(a a a b b b c c c)))
(assert (equal? (repli '(1 1 2 3 4 4) 2) '(1 1 1 1 2 2 3 3 4 4 4 4)))
