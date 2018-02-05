#lang racket
;; 27/07/2017
(define (maki lst)
  (call/cc (lambda (exit)
             (for-each 
              (lambda (x)
                (call/cc (lambda (yield)
                           (exit (cons x yield))
                           )))
              lst))))
(define (doit)
  (let ((x (maki '(a b c d))))
    (when (cons? x)
      (displayln (car x))
      ((cdr x)))))

(define-syntax curried
  (syntax-rules ()
    ((_ (x) e1 ...)
     (lambda (x) e1 ...))
    ((_ (x1 x2 ...) e1 ...)
     (lambda (x1)
       (curried (x2 ...) e1 ...)))))

(define-syntax mycurried
  (syntax-rules ()
    ((_ (x) e1 ...)
     (lambda (x) e1 ...))
    ((_ (x1 x2 ...) e1 ...)
     (lambda (x1)
       (curried (x2 ...) e1 ...)))))
(define f2 (mycurried (x y z) (+ x y z))) 

(define f (curried (x y) (+ x y)))

;; 30/01/2017
(define (take l n)
  (define (child l n nl)
    (if (equal? n 0)
        (cons 'end nl)
        (child (cdr l) (- n 1) (cons (car l) nl))))
  (let ((lista '()))
    (set! lista (reverse (child l n '())))
    lista))

(define (takeGroup l n acc)
  (if (< (length l) n)
      acc
      (let loop ((new '())
                 (i n)
                 (tmpl l))
        (if (equal? i 0)
            (takeGroup (cdr l) n (cons (reverse new) acc))
            (loop (cons (car tmpl) new) (- i 1) (cdr tmpl))))))

(define (checklist lst factor)
  (let ((gruppi (takeGroup lst (length (car factor)) '())))
    (foldl
     (lambda (x y)
       (if (member x factor)
           y
           (cons x y))) 
       '()
       gruppi)))

;; 08/09/2016
(define (setRow n row)
  (let loop ((i n)
             (l '()))
    (if (equal? i 0)
        l
        (if (equal? row i)
            (loop (- i 1) (cons 1 l))
            (loop (- i 1) (cons 0 l))))))

(define (genFig n)
  (let loop ((i n)
             (l '()))
    (if (equal? i 0)
        l
        (loop (- i 1) (cons (setRow n i) l)))))

;; 22/07/2016
(define (iterate f v)
  (delay (cons v (iterate f (f v)))))

;; 12/02/2014
(define (string-from-strings lista)
  (define (create-string l acc)
    (if (null? l)
        acc
        (if (string? (car l))
            (create-string (cdr l) (string-append acc (car l)))
            (create-string (cdr l) acc))))
  (create-string lista ""))