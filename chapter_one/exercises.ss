(define (exercise-1_3 x y z)
  (define mid
    (if (= y (max x y z))
        (max x z)
        (min (max x y) (max y z))
        )
    )
  (define (sum-of-squares a b)
    (+ (* a a) (* b b))
    )
  (sum-of-squares mid (max x y z))
  )


(define tests
  (and (= 25 (exercise-1_3 2 3 4))
       (= 25 (exercise-1_3 3 4 2))
       (= 25 (exercise-1_3 4 2 3))
       (= 25 (exercise-1_3 4 3 2))
       (= 25 (exercise-1_3 2 4 3))
       (= 25 (exercise-1_3 3 2 4))
       )
  )
