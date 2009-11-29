;Exercise 2.18. Define a procedure reverse that takes a list as argument and returns a list of the same
;elements in reverse order:
;(reverse (list 1 4 9 16 25))
;(25 16 9 4 1)

; ANSWER

(define (reverse set)
  (define (reverse-loop set result)
    (if (null? set)
        result
        (reverse-loop (cdr set) (cons (car set) result))))
  (reverse-loop set ()))
