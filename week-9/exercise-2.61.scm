;Exercise 2.61. Give an implementation of adjoin-set using the ordered representation. By analogy with
;element-of-set? show how to take advantage of the ordering to produce a procedure that requires on the
;average about half as many steps as with the unordered representation.

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((= x (car set)) true)
        ((< x (car set)) false)
        (else (element-of-set? x (cdr set)))))

(define (add-to-set x set)
  (cond (= x (car set) set)
        (< x (car set)


(define (adjoin-set x set)
  (if (element-of-set? x set)
      set
      (cons x set)))

(+ 1 2)