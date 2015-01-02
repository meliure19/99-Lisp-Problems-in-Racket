#lang racket
(require typed/racket)

;; Question:
;; Pack consecutive duplicates of list elements into sublists.
;;    If a list contains repeated elements they should be placed in separate sublists.
;;
;;    Example:
;;    (pack '(a a a a b c c a a d e e e e))
;; => '((a a a a) (b) (c c) (a a) (d) (e e e e))

;; Packs consecutive duplicates of list elements into sublists.
(define (pack lst)
  (foldr (lambda (x y) (cond
                         [(or (empty? y) (not (equal? x (first (first y))))) (cons (list x) y)]
                         [else (cons (cons x (first y)) (rest y))])) empty lst))

;; Tests
(assert (equal? (pack '()) '()))
(assert (equal? (pack '(() () ())) '((() () ()))))
(assert (equal? (pack '(a 1 1 1 a 1 1)) '((a) (1 1 1) (a) (1 1))))
(assert (equal? (pack '(a a a a b c c a a d e e e e)) '((a a a a) (b) (c c) (a a) (d) (e e e e))))
