#lang racket

;; MACRO
(define-syntax-rule (my-while condition body ...)
  (let loop ()
    (when condition
      body ...
      (loop))))

;; While done by me (culo is useless)
(define-syntax while
  (syntax-rules(culo)
    ((_ condition culo body ...)
     (let loop()
      (when condition
        body ...
        (loop))))))