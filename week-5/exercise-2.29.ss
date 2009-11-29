#lang scheme

; Exercise 2.29. A binary mobile consists of two branches, a left branch and a right branch. Each branch is
; a rod of a certain length, from which hangs either a weight or another binary mobile. We can represent a
; binary mobile using compound data by constructing it from two branches (for example, using list):
;
 (define (make-mobile left right)
 (list left right))
;
; A branch is constructed from a length (which must be a number) together with a structure, which may
; be either a number (representing a simple weight) or another mobile:
;
 (define (make-branch length structure)
   (list length structure))
;
; a. Write the corresponding selectors left-branch and right-branch, which return the branches of a mobile,
; and branch-length and branch-structure, which return the components of a branch.
;
; b. Using your selectors, define a procedure total-weight that returns the total weight of a mobile.
;
; c. A mobile is said to be balanced if the torque applied by its top-left branch is equal to that applied by
; its top-right branch (that is, if the length of the left rod multiplied by the weight hanging from that rod is
; equal to the corresponding product for the right side) and if each of the submobiles hanging off its branches
; is balanced. Design a predicate that tests whether a binary mobile is balanced.
;
; d. Suppose we change the representation of mobiles so that the constructors are
;
; (define (make-mobile left right)
;   (cons left right))
; (define (make-branch length structure)
;   (cons length structure))
;
; How much do you need to change your programs to convert to the new representation?


; ANSWER

; a.
(define left-branch car)
(define right-branch cadr)
(define branch-length car)
(define branch-structure cadr)


; Tests
(let ((branch (make-branch 20 10)))
  (= 20 (branch-length branch))
  (= 10 (branch-structure branch)))

(let ((branch (make-branch 20 (make-branch 10 5))))
  (= 20 (branch-length branch))
  (= 10 (branch-length (branch-structure branch))))


; b.
(define (branch-weight branch)
  (let ((struct (branch-structure branch)))
    (if (number? struct)
        struct
        (mobile-weight struct))))

(define (mobile-weight mobile)
  (+ (branch-weight (left-branch mobile))
     (branch-weight (right-branch mobile))))

(define total-weight mobile-weight)

; Tests
(let* ((left-side (make-branch 15 20))
       (right-side (make-branch 20 30))
       (submobile (make-mobile left-side right-side))
       (branch (make-branch 10 submobile)))
  (= 10 (branch-length branch))
  (= 50 (branch-weight branch)))

(let* ((mobile-20 (make-branch 15 20))
       (mobile-30 (make-branch 20 30))
       (mobile-50 (make-mobile mobile-20 mobile-30))
       (mobile-60 (make-mobile mobile-30 mobile-30)))
  (= 50 (total-weight mobile-50))
  (= 60 (total-weight mobile-60)))

;c. 
(define (branch-torque branch)
  (* (branch-length branch)
     (branch-weight branch)))

(define (mobile-balanced? mobile)
  (= (branch-torque (left-branch mobile))
     (branch-torque (right-branch mobile))))

(let* ((left (make-branch 4 25))
       (right (make-branch 20 5))
       (mobile (make-mobile left right)))
  (mobile-balanced? mobile))

(let* ((left (make-branch 4 25))
       (right (make-branch 20 5))
       (mobile (make-mobile left right)))
  (mobile-balanced? mobile))
