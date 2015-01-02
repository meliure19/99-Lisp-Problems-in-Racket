#lang racket
(require typed/racket)

;; Question:
;;  Modified run-length encoding. Modify the result of problem P10 in such 
;;  a way that if an element has no duplicates it is simply copied into the 
;;  result list. Only elements with duplicates are transferred as (N E) lists.
;;
;;    Example:
;;    (encode-modified '(a a a a b c c a a d e e e e))
;;  => '((4 a) b (2 c) (2 a) d (4 e))

(define (encode-modified lst)
  (foldr (lambda (x y) 
           (define len (length x))
           (cond
             [(equal? len 1) (cons (first x) y)]
             [else (cons (list len (first x)) y)])) empty (pack lst)))

;; Packs consecutive duplicates of list elements into sublists.
(define (pack lst)
  (foldr (lambda (x y) (cond
                         [(or (empty? y) (not (equal? x (first (first y))))) (cons (list x) y)]
                         [else (cons (cons x (first y)) (rest y))])) empty lst))

;; Tests
(assert (equal? (encode-modified '()) '()))
(assert (equal? (encode-modified '(() () ())) '((3 ()))))
(assert (equal? (encode-modified '(a 1 1 1 a 1 1)) '(a (3 1) a (2 1))))
(assert (equal? (encode-modified '(a a a a b c c a a d e e e e)) '((4 a) b (2 c) (2 a) d (4 e))))
