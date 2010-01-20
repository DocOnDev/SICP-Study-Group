#lang scheme

(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right)
  (list entry left right))

(define (adjoin-set x set)
  (cond ((null? set) (make-tree x '() '()))
        ((= x (entry set)) set)
        ((< x (entry set))
         (make-tree (entry set)
                    (adjoin-set x (left-branch set))
                    (right-branch set)))
        ((> x (entry set))
         (make-tree (entry set)
                    (left-branch set)
                    (adjoin-set x (right-branch set))))))

; Exercise 2.63. Each of the following two procedures converts a binary tree to a list.
(define (tree->list-1 tree)
  (if (null? tree)
      '()
      (append (tree->list-1 (left-branch tree))
              (cons (entry tree)
                    (tree->list-1 (right-branch tree))))))

(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
        result-list
        (copy-to-list (left-branch tree)
                      (cons (entry tree)
                            (copy-to-list (right-branch tree)
                                          result-list)))))
  (copy-to-list tree '()))

; a. Do the two procedures produce the same result for every tree? If not, how do the results differ? What
; lists do the two procedures produce for the trees in  figure 2.16?
; (define tree1 (make-tree 7 (make-tree 3 1 5) (make-tree 9 '() 11)))
(define tree1 (make-tree 7 3 9))
tree1
(adjoin-set 1 tree1)
tree1
(adjoin-set 5 tree1)
tree1
(adjoin-set 9 tree1)
tree1
(adjoin-set 11 tree1)
tree1

(define tree2 (make-tree 3 1 (make-tree 7 5 (make-tree 9 '() 11))))
(define tree3 (make-tree 5 (make-tree 3 1 '()) (make-tree 9 7 11)))

(tree->list-1 tree1)
(tree->list-2 tree1)




; b. Do the two procedures have the same order of growth in the number of steps required to convert a
; balanced tree with n elements to a list? If not, which one grows more slowly?
