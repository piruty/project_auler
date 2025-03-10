#lang racket

(define (is-natural-number N)
  (and (integer? N) (> N 0)))

(define (n_T T)
  (/ (+ -1 (sqrt (+ 1 (* 8 T)))) 2))

(define (n_P P)
  (/ (+ 1 (sqrt (+ 1 (* 24 P)))) 6))

(define (n_H H)
  (/ (+ 1 (sqrt (+ 1 (* 8 H)))) 4))

(define (solve)
  (for ([i (in-range 5 10000000000)])
    (let* ([nT (n_T i)]
           [nP (n_P i)]
           [nH (n_H i)])
      (when (and (is-natural-number nT) (is-natural-number nP) (is-natural-number nH))
        (displayln i)))))

(solve)
