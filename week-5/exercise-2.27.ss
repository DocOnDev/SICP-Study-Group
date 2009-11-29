;Exercise 2.27. Modify your reverse procedure of exercise 2.18 to produce a deep-reverse procedure that
;takes a list as argument and returns as its value the list with its elements reversed and with all sublists
;deep-reversed as well. For example,
;(define x (list (list 1 2) (list 3 4)))

; ANSWER

(define (deep-reverse set)
  (define (reverse-loop set result)
    (cond ((null? set) result)
          ((not (pair? set)) set)
          (else (reverse-loop (cdr set) (cons (deep-reverse (car set)) result)))))
  (reverse-loop set ()))

(define x (list (list 1 2) (list 3 4)))

(deep-reverse x)

