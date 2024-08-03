(defun f ()
  (let ((x 1)
        (sum 0))
    (lambda () (setq x (1+ x)))))

(format t "~a~%" (funcall (f)))
