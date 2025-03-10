#lang racket

(define (Pn n)
  (/ (* n (- (* 3 n) 1)) 2))

(define (is-answer? vec i j)
  (let ([sum (+ (vector-ref vec i) (vector-ref vec j))]
        [dif (abs (- (vector-ref vec i) (vector-ref vec j)))])
    ; (displayln sum)
    ; (displayln dif)
    (if (and (vector-member sum vec) (vector-member dif vec)) dif +Inf.0)))

(define (solve)
  (let ([vec (list->vector (map (lambda (x) (Pn x)) (range 1 10000)))]
        [answer +inf.0])
    ; (displayln vec)
    ; (displayln (is-answer? vec 1 2))))
    (for ([i (range (vector-length vec))])
      (for ([j (range (add1 i) (vector-length vec))])
        (let ([tmp (is-answer? vec i j)])
          (when (< tmp answer)
            (set! answer tmp)))))
    answer))
;(displayln (is-answer? vec i j)

(solve)
