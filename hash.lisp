(defparameter n (make-hash-table))

(setf (gethash 'y n) 1)

(format t "~d~%" (gethash 'y n))

(incf (gethash 'y n))

(format t "~d~%" (gethash 'y n))
