#lang scheme

;Exercise 2.60. We specified that a set would be represented as a list with no duplicates. Now suppose
;we allow duplicates. For instance, the set {1, 2, 3} could be represented as the list (2 3 2 1 3 2 2).
;Design procedures element-of-set?, adjoin-set, union-set, and intersection-set that operate on
;this representation. How does the eficiency of each compare with the corresponding procedure for the non-
;duplicate representation? Are there applications for which you would use this representation in preference
;to the non-duplicate one?

; same
(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

; same
(define (adjoin-set x set)
  (if (element-of-set? x set)
      set
      (cons x set)))

; because we allow dupliation, the union is merely the combination of both lists
(define union-set append)

; not sure about this one. Made intersect the union of all elements matched in the sets.
(define (intersection-set set1 set2)
  (union-set (set-intersect set1 set2) (set-intersect set2 set1)))

(define (set-intersect set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2)
         (cons (car set1)
               (set-intersect (cdr set1) set2)))
        (else (set-intersect (cdr set1) set2))))