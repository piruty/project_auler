(defun solve ()
  (let ((solved nil))
  (loop for a from 1 upto 1000 do
        (loop for b from (+ a 1) upto 1000 do
              (loop for c from (+ b 1) upto 1000 do
                    (when (= (+ a b c) 1000)
                      (when (= (+ (* a a) (* b b)) (* c c))
                        (format t "~a ~a ~a~%" a b c)
                      (format t "~a~%" (* a b c))
                      (return))
                      ))))))
(solve)


                
