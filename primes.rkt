#lang racket

(define (is-prime? n)
  (cond 
    [(< n 2) #f]
    [else
     (let loop ([x 2])
       (cond
         [(> (* x x) n) #t]
         [(= (modulo n x) 0) #f]
         [else (loop (+ x 1))]))]))

(provide is-prime?)