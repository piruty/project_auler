(defun factorial-digit (x)
  (let ((tmp 1))
    (loop for i from 1 to x do
          (setq tmp (* tmp i)))
    tmp))

(defun factorial-digit-to-sum (x)
  (let (
        (result 0)
        (digits (factorial-digit x)))
    (loop while (> digits 0) do
          (setq result (+ result (mod digits 10)))
          (setq digits (floor (/ digits 10))))
    result))

(print (factorial-digit-to-sum 100))
