#lang racket
(require typed/racket)

;; Question:
;;   Split a list into two parts; the length of the first part is given.
;;    Example:
;;     (split '(a b c d e f g h i k) 3)
;;  => '((a b c) (d e f g h i k))


;; Splits the given list in two sublists, where
;; the length of the first sublist is N.
(define (split lst n)
  (list (take lst n) (drop lst n)))

;; Tests
(assert (equal? (split '() 0) '(() ())))
(assert (equal? (split '(1 2 3) 0) '(() (1 2 3))))
(assert (equal? (split '(1 2 3) 2) '((1 2) (3))))
(assert (equal? (split '(a b c d) 4) '((a b c d) ())))
(assert (equal? (split '(a b c d e f g h i k) 3) '((a b c) (d e f g h i k))))
