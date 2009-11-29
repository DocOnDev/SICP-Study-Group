#lang scheme

;(define (horner-eval x coefficient-sequence)
;(accumulate (lambda (this-coeff higher-terms) <??>)
;0
;coefficient-sequence))
;
;For example, to compute 1 + 3x + 5x3 + x5 at x = 2 you would evaluate
; 1 + 6 + 40 + 32 = 79
;(horner-eval 2 (list 1 3 0 5 0 1))

(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (accumulate op initial (cdr sequence)))))


(define (horner-eval x coefficient-sequence)
  (accumulate 
   (lambda (this-coeff higher-terms)
     (+ this-coeff (* x higher-terms)))
   0
   coefficient-sequence))

(horner-eval 2 (list 1 3 0 5 0 1))
(= (horner-eval 2 (list 1 3 0 5 0 1)) 79)
(= (horner-eval 1 (list 1 3 0 5 0 1)) 10)
(= (horner-eval 0 (list 1 3 0 5 0 1)) 1)
