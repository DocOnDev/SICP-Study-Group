;; SICP 2.5

;; Exercise 2.5.  Show that we can represent pairs of nonnegative
;; integers using only numbers and arithmetic operations if we
;; represent the pair a and b as the integer that is the product 2a
;; 3b. Give the corresponding definitions of the procedures cons, car,
;; and cdr.

(define (new-cons a b)
  (* (expt 2 a) (expt 3 b)))

(define (factor-count composite factor)
  (define (repeat check count)
    (if (zero? (modulo check factor))
        (repeat (/ check factor) (+ 1 count))
        count))
  (repeat composite 0))

(define (new-car p)
  (factor-count p 2))

(define (new-cdr p)
  (factor-count p 3))

(define (test)
  (= 5 (new-car (new-cons 5 6)))
  (= 6 (new-cdr (new-cons 5 6)))
  (= 99 (new-cdr (new-cons 20 99)))
  )

(test)
