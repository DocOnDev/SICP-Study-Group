;Exercise 2.28. Write a procedure fringe that takes as argument a tree (represented as a list) and returns
;a list whose elements are all the leaves of the tree arranged in left-to-right order. For example,
;(define x (list (list 1 2) (list 3 4)))
;(fringe x)
;(1 2 3 4)
;(fringe (list x x))
;(1 2 3 4 1 2 3 4)

; ANSWER
(define x (list (list 1 2) (list 3 4)))
(define y (list (list 1 2 3) (list 4 5 6 7)))
(define z (list (list 1 2 3) (list 4 5 6 7) 8 (list 9 10)))
;
;(define (fringe queue)
;    (cond ((null? queue) ())
;          ((not (pair? queue)) (list queue))
;          (else (append (fringe (car queue)) (fringe (cdr queue))))))


(define (fringe tree)
  (cond ((not (pair? tree)) (list tree))
        ((null? (car tree)) (fringe (cdr tree)))
        ((null? (cdr tree)) (fringe (car tree)))
        (else (append (fringe (car tree)) (fringe (cdr tree))))))



(fringe x)
(fringe (list x x))
(newline)
(fringe y)
(fringe (list x y))
(newline)
(fringe z)
(fringe (list x y z))
