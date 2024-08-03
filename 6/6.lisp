(defun nijo (max)
  (let ((result 0))
    (loop for x from 1 upto max do
          (setq result (+ result (* x x))))
    result))

(defun nibai (max)
  (let ((result 0))
    (loop for x from 1 upto max do
          (setq result (+ result x)))
    (* result result)))

; from project auler pdf
(defun solve (limit)
  (let ((sum 0) (sum_sq 0))
    (setq sum (/ (* limit (+ limit 1)) 2))
    (setq sum_sq (/ (* (+ (* 2 limit) 1) (+ limit 1) limit) 6))

    (- (* sum sum) sum_sq)))
(nijo 10)
(nibai 10)

(- (nibai 100) (nijo 100))
(solve 100)
