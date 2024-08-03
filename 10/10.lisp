(load "is-prime.lisp")

(defun solve ()
  (let ((result 5))
    (loop for x from 5 while (< x 2000000) do
          (if (is-prime x)
              (setq result (+ result x))))
    result))

(solve)
