#lang scheme

;Exercise 2.61. Give an implementation of adjoin-set using the ordered representation. By analogy with
;element-of-set? show how to take advantage of the ordering to produce a procedure that requires on the
;average about half as many steps as with the unordered representation.

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((= x (car set)) true)
        ((< x (car set)) false)
        (else (element-of-set? x (cdr set)))))

(define (between? x a b)
  (and (> x a) (< x b)))

(define (add-to-set x set)
  (define (add-loop x set result)
    (cond ((null? set) result)
          ((and (null? result) (< x (car set))) (cons x set))
          ((null? (cdr set)) (append result set (list x)))
          ((between? x (car set) (cadr set)) (append result (list (car set)) (list x) (cdr set)))
          (else (add-loop x (cdr set) (append result (list(car set)))))))
  (add-loop x set '()))


(define (adjoin-set x set)
  (if (element-of-set? x set) set
      (add-to-set x set)))


(adjoin-set 2 (list 1 3 4))
(adjoin-set 5 (list 6 7 8))
(adjoin-set 12 (list 9 10 11))
(adjoin-set 4 (list 1 2 3 4 5 6))

