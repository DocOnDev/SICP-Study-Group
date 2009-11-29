#lang scheme

;Exercise 2.39. Complete the following definitions of reverse (exercise 2.18) in terms of fold-right and
;fold-left from exercise 2.38:
;(define (reverse sequence)
;  (fold-right (lambda (x y) <??>) nil sequence))
;(define (reverse sequence)
;  (fold-left (lambda (x y) <??>) nil sequence))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define fold-right accumulate)

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))


(define (reverse-r sequence)
  (fold-right (lambda (x y)
                (append y (list x)))
              '() sequence))

(define (reverse-l sequence)
  (fold-left (lambda (x y)
               (append (list y) x))
             '() sequence))

(reverse-r (list 2 3 4))

(reverse-r (list 1 2 3))

(reverse-l (list 2 3 4))
(reverse-l (list 9 8 7 6 5 4 3 2 1))
