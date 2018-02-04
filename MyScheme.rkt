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
          ((number? (car l)) (number-series (cdr l)(+ acc (car l))))
          ((not(number? (car l))) (number-series (cdr l) acc) )))))
(define (string-series l acc)
  (if (or (null? l)(equal? (car l) '$))
      acc
      (begin
        (cond
          ((string? (car l)) (string-series (cdr l) (string-append acc (car l))))
          ((not(string? (car l))) (string-series (cdr l) acc))))))
(define (special-separator l)
  (let loop ((contN 1)
             (contS 1)
             (lista '())
             (originalL l))
    (if (not(null? originalL))
       (begin
         (cond
           ((and (equal? (car originalL) '$) (equal? contS 1)) (loop contN (* contS -1) (append lista (list (string-series (cdr originalL) ""))) (cdr originalL)))
           ((and (equal? (car originalL) '*) (equal? contN 1)) (loop (* contN -1) contS  (append lista (list (number-series (cdr originalL) 0))) (cdr originalL)))
           ((and (equal? (car originalL) '$) (equal? contS -1)) (loop contN (* contS -1) lista (cdr originalL)))
           ((and (equal? (car originalL) '*) (equal? contN -1)) (loop (* contN -1) contS lista (cdr originalL)))
           ((or (string? (car originalL)) (number? (car originalL))) (loop contN contS lista (cdr originalL)))))
       lista)))

;; Esame 01/09/2017
;(define (check-this l)
;   (define (check-next l3 testa s)
;    (if (or (and (or (equal? testa 2) (equal? testa 1) (equal? testa 'a)) (equal? s 1))
;            (and (or (equal? testa 'b) (equal? testa 'a) (equal? testa 1)) (equal? s 'a)))
;        #t
;        (begin
;          (if (or (null? l3) (and (equal? testa 'b) (equal? s 1)) (and (equal? testa 2) (equal? s 'a)))
;              #f
;              (check-next (cdr l3) (car l3) s))))))

(define (count-par l)
  (define (ret l stack acc)
    (if (null? l)
        (begin
          (if (null? stack)
              acc
              #f))
        (begin
          (cond
            ((or (equal? (car l) 1) (equal? (car l) 'a)) (ret (cdr l) (cons (car l) stack) (+ acc 1)))
            ((and (equal? (car l) 2) (equal? (car stack) 1)) (ret (cdr l) (cdr stack) acc))
            ((and (equal? (car l) 'b) (equal? (car stack) 'a)) (ret (cdr l) (cdr stack) acc))
            ((and (equal? (car l) 2) (equal? (car stack) 'a)) #f)
            ((and (equal? (car l) 'b) (equal? (car stack) 1)) #f)))))
  (ret l '() 0))


;; Esame 20/07/2017
(define (print+sub x y)
  (display x)
  (display " ")
  (display y)
  (display " -> ")
  (display (- x y)))
(define (puzzle)
  (call/cc (lambda (exit)
             (define (local e)
               (call/cc
                (lambda (local-exit)
                  ( (print+sub e
                                   (call/cc
                                    (lambda (new-exit)
                                      (set! exit new-exit)
                                      (local-exit #f))))))))
             (local 6)
             (display 123231)
           )))

(define (local e)
  (let ((x #f))
  (call/cc
   (lambda (local-exit)
     (exit (print+sub e
                      (call/cc
                       (lambda (new-exit)
                         (set! x new-exit)
                         (local-exit #f)))))))))
;example of wikipedia
(define (f return)
  (return 2)
  3)

( define saved-cont #f) ; place to save k
( define ( test-cont )
   (let ((x 0))
     ( call/cc
       ( lambda (k) ; k contains the continuation
          (set! saved-cont k))) ; here is saved
     ;; this *is* the continuation
     (set! x (+ x 1))
     ( display x)
     ( newline )))

;my example
(define bella #f)
(define (my-call)
  (display 0)
  (begin
    (display 1)
    (call/cc
     (lambda (x)
       (display 4)
       (set! bella x)
       (x (display 88)); not print 3 because here I stop the code inside call/cc
       (display 3)));I never see printed 3
    (display 2)))

;;Example that not work everywhere (on racket yes)
(define (prova x y)
  (display(+ x y)))
(define (zio)
  (call/cc
   (lambda (padre)
     (define (slave)
       (display 0)
       (call/cc
        (lambda (esci)
          (padre (prova 2
              (call/cc
               (lambda (esci2)
                 (set! padre esci2)
                 (esci)))))
              (display 4)
              (display 5))
          ))
       (display 6)
     (display 1)
     (slave)
     (padre 5)
     (display 2))))
             