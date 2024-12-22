#lang racket

(define (swap! vec i j)
  ; ベクターの要素を交換する補助関数
  (let ([temp (vector-ref vec i)]) ; tempにvecのi番目の値を保存
    (vector-set! vec i (vector-ref vec j)) ; i番目にj番目の値を設定
    (vector-set! vec j temp))) ; j番目にtempの値を設定

(define (test-swap!)
  (let ([v1 (vector 1 2 3 4 5)])
    (display v1)
    (newline)
    (swap! v1 0 1)
    (display v1)))

(define (permutations n #:start [start 0])
  (let* ([vec (build-vector n (lambda (i) (+ i start)))]
         [result '()])
    (define (heap-generate k vec)
      (if (= k 1)
          (set! result (cons (vector->list (vector-copy vec)) result))
          (begin
            (heap-generate (- k 1) vec)
            (for ([i (in-range 0 (- k 1))])
              (if (even? k)
                  (swap! vec i (- k 1))
                  (swap! vec 0 (- k 1)))
              (heap-generate (- k 1) vec)))))
    (heap-generate n vec)
    (reverse result)))

(define (permutations-from-1 n #:start [start 1])
  (let* ([vec (build-vector n (lambda (i) (+ i start)))]
         [result '()])
    (define (heap-generate k vec)
      (if (= k 1)
          (set! result (cons (vector->list (vector-copy vec)) result))
          (begin
            (heap-generate (- k 1) vec)
            (for ([i (in-range 0 (- k 1))])
              (if (even? k)
                  (swap! vec i (- k 1))
                  (swap! vec 0 (- k 1)))
              (heap-generate (- k 1) vec)))))
    (heap-generate n vec)
    (reverse result)))

(define (test-permutations)
  (let ([result (permutations 5)])
    (display (length result))
    (newline)
    (display (* 5 4 3 2 1))
    (newline)
    (for ([perm (take result 5)])
      (display perm)
      (newline))))

(provide permutations)
