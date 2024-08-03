(defun solve (n)
  (let ((count 0) (current 0))
    (loop for x from 1 while (< count n) do
           (setq current (+ current x))
           (setq count 0)
           (let ((i 0))
             (loop for y from 1 while (<= y current) do
                    (if (= 0 (mod current y))
                        (setq count (+ count 1))))))
    current))

(defun count_divisors (n)
  (let ((count 0))
    ; sqrt(n) まで調査すれば十分
    (loop for i from 1 to (+ (sqrt n) 1) do
          ; n が i で割り切れる場合 => 約数を 2 つ増やす
          (if (eql (mod n i) 0)
              (setq count (+ count 2))))
    ; n が平方数の場合 => 約数の数を 1 減らす
    (if (eql (* (sqrt n) (sqrt n)) n)
        (setq count (- count 1)))
    count))

;; find_triangle_number_with_divisors
(defun solve2 (divisors)
  (let ((n 1) (triangle_number 1))
    (loop while (<= (count_divisors triangle_number) divisors) do
          (setq n (+ n 1))
          (setq triangle_number (+ triangle_number n)))
    triangle_number))

(print (solve 6))
