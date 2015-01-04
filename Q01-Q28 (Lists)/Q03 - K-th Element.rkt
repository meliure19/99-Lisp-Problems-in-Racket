#lang racket
(require typed/racket)

;; Question:
;;  Find the K'th element of a list.
;;    Example:
;;    (element-at '(a b c d e) 3)
;;  => c

;; Consumes a list and returns the K-th element in it.
(define (element-at lst loc)
  (define (element-at/helper lst i)
    (cond
      [(empty? lst) (error 'element-at "No element found at given position!")]
      [(equal? loc i) (first lst)]
      [else (element-at/helper (rest lst) (add1 i))]))
  (element-at/helper lst 1))

;; Tests
(assert (equal? (element-at '(a b) 1) 'a))
(assert (equal? (element-at '(a b c d e) 3) 'c))
(assert (equal? (element-at '(a b c d e f) 6) 'f))