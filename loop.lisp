(defun l ()
  (let ((n 1)
        (sum 5))
    (loop while (<= n 5) do
          (incf n))
    (+ n sum)))

;(format t "~a~%" (funcall #'l))
(format t "~d~%" (l))
