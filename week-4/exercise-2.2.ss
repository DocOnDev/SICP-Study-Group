;; SICP 2.2

;; Exercise 2.2.  Consider the problem of representing line segments
;; in a plane. Each segment is represented as a pair of points: a
;; starting point and an ending point. Define a constructor
;; make-segment and selectors start-segment and end-segment that
;; define the representation of segments in terms of
;; points. Furthermore, a point can be represented as a pair of
;; numbers: the x coordinate and the y coordinate. Accordingly,
;; specify a constructor make-point and selectors x-point and y-point
;; that define this representation. Finally, using your selectors and
;; constructors, define a procedure midpoint-segment that takes a line
;; segment as argument and returns its midpoint (the point whose
;; coordinates are the average of the coordinates of the
;; endpoints). To try your procedures, you'll need a way to print
;; points:

;; (define (print-point p)
;;   (newline)
;;   (display "(")
;;   (display (x-point p))
;;   (display ",")
;;   (display (y-point p))
;;   (display ")"))

;; ANSWER ------------------------------------------------------------

(define (avg a b) (/ (+ a b) 2))

(define (make-point x y) (cons x y))
(define (x-point pnt) (car pnt))
(define (y-point pnt) (cdr pnt))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (from-point x y) (make-point x y))
(define (to-point x y) (make-point x y))

(define (make-segment start end) (cons start end))
(define (make-line point-a point-b) (make-segment point-a point-b))
(define (start-point line) (car line))
(define (end-point line) (cdr line))

(define (mid-point line)
  (make-point 
   (avg (x-point (start-point line)) (x-point (end-point line)))
   (avg (y-point (start-point line)) (y-point (end-point line)))))



(define line-1 (make-line (from-point 2 2) (to-point 6 8)))
(print-point (mid-point line-1))
