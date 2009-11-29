#lang scheme

;Exercise 2.57. Extend the differentiation program to handle sums and products of arbitrary numbers of
;(two or more) terms. Then the last example above could be expressed as
;(deriv '(* x y (+ x 3)) 'x)
;Try to do this by changing only the representation for sums and products, without changing the deriv
;procedure at all. For example, the addend of a sum would be the first term, and the augend would be the
;sum of the rest of the terms.

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
          (make-product (multiplier exp)
                        (deriv (multiplicand exp) var))
          (make-product (deriv (multiplier exp) var)
                        (multiplicand exp))))
        ((exponentiation? exp)
         (make-product
          (make-product
           (exponent exp)
           (make-exponentiation (base exp) (- (exponent exp) 1)))
          (deriv (base exp) var)))
        (else
         (error "unknown expression type -- DERIV" exp))))

(define (variable? x) (symbol? x))
(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list '+ a1 a2))))
(define (make-sum-from-list l)
  (cond ((number? l) l)
        ((null? l) 0)
        (else
          (make-sum (car l) (make-sum-from-list (cdr l))))))


(define (=number? a b)
  (and (number? a) (number? b) (= a b)))

(define (sum? x)
  (and (pair? x) (eq? '+ (car x))))
(define (addend s) (cadr s))
(define (augend s)
  (make-sum-from-list (cddr s)))

(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list '* m1 m2))))
(define (make-product-from-list l)
  (cond ((number? l) l)
        ((null? l) 1)
        (else
          (make-product (car l) (make-product-from-list (cdr l))))))

(define (product? x)
  (and (pair? x) (eq? '* (car x))))
(define (multiplier p) (cadr p))
(define (multiplicand p)
  (make-product-from-list (cddr p)))


(define (exponentiation? expr)
  (and (pair? expr) (eq? '** (car expr))))

(define (base expr) (cadr expr))

(define (exponent expr) (caddr expr))

(define (make-exponentiation base expo)
  (cond ((=number? expo 0) 1)
        ((=number? expo 1) base)
        (else (list '** base expo))))

(deriv '(* x y (+ x 3)) 'x)
(deriv '(+ x (* 3 (+ x (+ y 2)))) 'x)