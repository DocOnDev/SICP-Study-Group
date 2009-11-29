;; SICP 2.1

;; Exercise 2.1.  Define a better version of make-rat that handles
;; both positive and negative arguments. Make-rat should normalize the
;; sign so that if the rational number is positive, both the numerator
;; and denominator are positive, and if the rational number is
;; negative, only the numerator is negative.

;; ANSWER ------------------------------------------------------------


(define (make-rat n d)
  (define (internal-make n d)
    (let ((g (gcd n d)))
      (cons (/ n g) (/ d g))))
  (if (< d 0)
      (internal-make (- n) (- d))
      (internal-make n d)))