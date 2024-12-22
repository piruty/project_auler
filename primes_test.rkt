#lang racket
(require rackunit)
(require "primes.rkt")

(test-case "tests"
  (check-equal? (is-prime? 2) #t)
  (check-equal? (is-prime? 3) #t)
  (check-equal? (is-prime? 4) #f)
  (check-equal? (is-prime? 6) #f))