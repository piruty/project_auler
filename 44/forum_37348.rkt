#lang racket
(define (is-pentagonal? n)
  (let ([sqrt-val (sqrt (+ 1 (* 24 n)))]) (and (integer? sqrt-val) (= (modulo (+ 1 sqrt-val) 6) 0))))

(define (PE044 c)
  (let loop ([i 0]
             [D 0]
             [remaining c])
    (if (= remaining 0)
        'done
        (let ([D (+ D (* 3 i) 1)]
              [i (+ i 1)])
          (let next-d ([d 1]
                       [Pd 0])
            (if (< d i)
                (let* ([Pd (+ Pd (- (* 3 d) 2))]
                       [divmod (/ (- D Pd) (* 3 d))]
                       [j (floor divmod)]
                       [r (modulo (- D Pd) (* 3 d))])
                  (when (and (= r 0) (is-pentagonal? (+ (* j (+ (* 3 j) -1)) D)))
                    (begin
                      (displayln D)
                      (loop i D (- remaining 1))))
                  (next-d (+ d 1) Pd))
                (loop i D remaining)))))))

(PE044 10000)
