(defun divisors (n)
  (let ((result '()))
    (loop for i from 1 to (floor (/ n 2)) do
          (if (eql (mod n i) 0)
              (setq result (append result (list i (/ n i))))))
    (sort (remove-duplicates result) #'<)))

(defun main ()
  (print (divisors 10)))
