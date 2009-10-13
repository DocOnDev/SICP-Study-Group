; Exercise 1.11

; Recursive
(define (f1 given-value)
  (if (< given-value 3)
      given-value
      (+ (f1 (- given-value 1))
         (* 2 (f1 (- given-value 2)))
         (* 3 (f1 (- given-value 3)))
         )
      )
  )

; Iterative
(define (f2 given-value)
  (define (iter i value-1 value-2 value-3)
    (if (= given-value i)
        value-1
        (iter (+ 1 i) (+ value-1 (* 2 value-2) (* 3 value-3)) value-1 value-2))
        )
    (if (< given-value 3)
        given-value
        (iter 3 4 2 1)
        )
    )
        
      
; Tests
(define tests
  (and (= 1 (f1 1) (f2 1))
       (= 2 (f1 2) (f2 2))
       (= 4 (f1 3) (f2 3))
       (= 11 (f1 4) (f2 4))
       (= 25 (f1 5) (f2 5))
       )
  )

  