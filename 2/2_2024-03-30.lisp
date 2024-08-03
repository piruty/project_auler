(defun fibo (n &optional (hash (make-hash-table)))
  (cond ((eq n 0) 0)
        ((eq n 1) 1)
        (t (or (gethash n hash)
                (setf (gethash n hash)
                      (+ (fibo (- n 1) hash)
                         (fibo (- n 2) hash)))))))

(defun main ()
  (print (fibo 10)))