;; SICP 2.3

;; Exercise 2.3.  Implement a representation for rectangles in a
;; plane. (Hint: You may want to make use of exercise 2.2.) In terms
;; of your constructors and selectors, create procedures that compute
;; the perimeter and the area of a given rectangle. Now implement a
;; different representation for rectangles. Can you design your system
;; with suitable abstraction barriers, so that the same perimeter and
;; area procedures will work using either representation?

;; ANSWER ------------------------------------------------------------

(define (make-point x y) (cons x y))
(define (x-point pnt) (car pnt))
(define (y-point pnt) (cdr pnt))

(define (from-point x y) (make-point x y))
(define (to-point x y) (make-point x y))

(define (make-segment start end) (cons start end))
(define (make-line point-a point-b) (make-segment point-a point-b))
(define (start-point line) (car line))
(define (end-point line) (cdr line))

(define (point-add point-a point-b)
  (make-point
   (+ (x-point point-a) (x-point point-b))
   (+ (y-point point-a) (y-point point-b))))

(define (make-rect start-point h w) (list start-point h w))

(define (start-point rect) (car rect))
(define (height rect) (cadr rect))
(define (width rect) (caddr rect))
(define (area rect) (* (height rect) (width rect)))
(define (perimiter rect) (* 2 (+ (height rect) (width rect))))


