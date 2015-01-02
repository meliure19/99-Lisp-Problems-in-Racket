#lang racket
(require typed/racket)

;; Question:
;;  Decode a run-length encoded list. Given a run-length code list 
;;  generated as specified in problem P11. Construct its uncompressed version.

(define (decode lst)
  (foldr (lambda (x y) (append (unpack x) y)) empty lst))

;; Unpacks a list using build-list (helper for decode function)
;; example: (unpack (list 4 'a)) => `(a a a a)
(define (unpack element)
  (cond
   [(list? element) (build-list (first element) (lambda (x) (second element)))]
   [else (list element)]))

;; Tests
(assert (equal? (decode '()) '()))
(assert (equal? (decode '((3 ()))) '(() () ())))
(assert (equal? (decode '(a (3 1) a (2 1))) '(a 1 1 1 a 1 1)))
(assert (equal? (decode '((4 a) b (2 c) (2 a) d (4 e))) '(a a a a b c c a a d e e e e)))
