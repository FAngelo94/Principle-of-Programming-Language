#lang racket
;; Write a function that returns the sum of squares of a list l
;; '(1 | 2 3 4 5) -> '(x | xs...)
(define (square-sum l)
  (if (not (pair? l))
      0
      (let ([x (* (car l)(car l))])
        (+ x (square-sum (cdr l))))
      ))

;; Range function. That provided lo and hi provides the range [lo, hi)

(define (range lo hi)
  (if (= lo (- hi 1))
      (list lo)
      (let ([x lo])
        (list* x (range (+ lo 1) hi)))))

;; A function that packs elements
;; '(1 1 1 2 1 1 3 3 4 4 4) -> '((1 1 1) (2) (1 1) (3 3) (4 4 4))
(define (pack l)
  (define (rec l acc)
    (if (null? l)
        acc
        (let loop ([lista (list (car l))]
                   [coda (cdr l)])
          (if (null? coda)
              (rec '() (append acc (list lista)))
              (if (= (car lista) (car coda))
                  (loop (append lista (list (car coda))) (cdr coda))
                  (rec coda (append acc (list lista))))))))
  (rec l '()))

;; function to understand recursive
(define (recorsive n)
  (if (null? n)
    (display "end")
    (if (positive? (car n))
        (begin
          (display (car n))
          (recorsive (cdr n)))
         (begin
           (display (* (car n) -1))
           (recorsive (cdr n))))
    ))

;; Esame 16/01/2018
(define (number-series l acc)
  (if (or (null? l)(equal? (car l) '*))
      acc
      (begin
        (cond
          ((number? (car l)) (number-series (cdr l)(append acc (list (car l)))))
          ((not(number? (car l))) (number-series (cdr l) acc) )))))
(define (string-series l acc)
  (if (or (null? l)(equal? (car l) '$))
      acc
      (begin
        (cond
          ((string? (car l)) (string-series (cdr l) (string-append acc (car l))))
          ((not(string? (car l))) (string-series (cdr l) acc))))))
(define (special-separator)
  (