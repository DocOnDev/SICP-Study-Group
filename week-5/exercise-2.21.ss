;Exercise 2.21. The procedure square-list takes a list of numbers as argument and returns a list of the
;squares of those numbers.
;(square-list (list 1 2 3 4))
;(1 4 9 16)
;Here are two different definitions of square-list. Complete both of them by filling in the missing expres-
;sions:
;(define (square-list items)
;  (if (null? items)
;      nil
;      (cons <??> <??>)))
;(define (square-list items)
;  (map <??> <??>))


; ANSWER

; few setup items due to environment
(define square (lambda (x) (expt x 2)))
(define nil '())



(define (square-list-a items)
  (if (null? items)
      nil
      (cons (square (car items)) (square-list-a (cdr items)))))


(define (square-list-b items)
  (map (lambda (x) (square x)) items))
