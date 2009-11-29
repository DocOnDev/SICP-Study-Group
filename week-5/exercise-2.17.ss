; Exercise 2.17. Define a procedure last-pair that returns the list that contains only the last element of a
; given (nonempty) list:
; (last-pair (list 23 72 149 34))
; (34)

; ANSWER

;(define (last-pair-old set)
;  (if (null? (cdr set))
;      (car set)
;      (last-pair-old (cdr set))))
;
  
(define (last-pair set)  
  (define (next-pair set last-set)
    (if (null? set)
        last-set
        (next-pair (cdr set) set)))
  (if (null? set)
      '()
      (next-pair (cdr set) set)))

