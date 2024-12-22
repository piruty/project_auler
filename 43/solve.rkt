#lang racket

(require "./../permutations.rkt")

(define (list->number vec)
  (string->number (apply string-append (map number->string vec))))

(define (extract-numbers vec a b c)
  (let ([n1 (vector-ref vec a)]
        [n2 (vector-ref vec b)]
        [n3 (vector-ref vec c)])
    (string->number (string-append (number->string n1) (number->string n2) (number->string n3)))))

(define (is-divisible? perm)
  (and (= (modulo (extract-numbers perm 1 2 3) 2) 0)
       (= (modulo (extract-numbers perm 2 3 4) 3) 0)
       (= (modulo (extract-numbers perm 3 4 5) 5) 0)
       (= (modulo (extract-numbers perm 4 5 6) 7) 0)
       (= (modulo (extract-numbers perm 5 6 7) 11) 0)
       (= (modulo (extract-numbers perm 6 7 8) 13) 0)
       (= (modulo (extract-numbers perm 7 8 9) 17) 0)))

(define (solve)
  (let ([result 0])
    (for ([perm (permutations 10)])
      (when (is-divisible? (list->vector perm))
        (set! result (+ result (list->number perm)))))
    result))

(define (test-is-divisible?)
  (display (is-divisible? (vector 1 4 0 6 3 5 7 2 8 9))))
