#lang scheme

;Exercise 2.54. Two lists are said to be equal? if they contain equal elements arranged in the same order.
;For example,
;(equal? '(this is a list) '(this is a list))
;is true, but
;(equal? '(this is a list) '(this (is a) list))
;is false. To be more precise, we can define equal? recursively in terms of the basic eq? equality of symbols
;by saying that a and b are equal? if they are both symbols and the symbols are eq?, or if they are both lists
;such that (car a) is equal? to (car b) and (cdr a) is equal? to (cdr b). Using this idea, implement
;equal? as a procedure.

(define (new-equal? x y)
  (lambda x y)
  (if (pair? x)
      (if (eq? (car x) (car y))
          (new-equal? (cdr x) (cdr y))
          #f)
      (eq? x y))) 

(new-equal? (list 1 2 3 4) (list 1 2 3 4))
(new-equal? (list 1 2 3 4) (list 1 2 4 3))
(new-equal? '(this is a list) '(this is a list))
(new-equal? '(this is a list) '(this (is a) list))