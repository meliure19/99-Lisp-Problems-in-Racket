#lang racket
(require typed/racket)

;; Question:
;;  Use the result of problem P09 to implement the so-called run-length encoding data compression 
;;  method. Consecutive duplicates of elements are encoded as lists (N E) where N is the number 
;;  of duplicates of the element E.
;;
;;    Example:
;;    (encode '(a a a a b c c a a d e e e e))
;; => '((4 a) (1 b) (2 c) (2 a) (1 d)(4 e))

(define (encode lst)
  (foldr (lambda (x y) (cons (list (length x) (first x)) y)) empty (pack lst)))

;; Packs consecutive duplicates of list elements into sublists.
(define (pack lst)
  (foldr (lambda (x y) (cond
                         [(or (empty? y) (not (equal? x (first (first y))))) (cons (list x) y)]
                         [else (cons (cons x (first y)) (rest y))])) empty lst))

;; Tests
(assert (equal? (encode '()) '()))
(assert (equal? (encode '(() () ())) '((3 ()))))
(assert (equal? (encode '(a 1 1 1 a 1 1)) '((1 a) (3 1) (1 a) (2 1))))
(assert (equal? (encode '(a a a a b c c a a d e e e e)) '((4 a) (1 b) (2 c) (2 a) (1 d) (4 e))))
