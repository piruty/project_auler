(defun factorial-digit (x)
  (loop for i from 1 to x
        for tmp = 1 then (* tmp i)
        finally (return tmp)))

(defun factorial-digit-to-sum (x)
  (let ((digits (factorial-digit x)))
    (loop for digit = digits then (floor digit 10)
          until (= digit 0)
          sum (mod digit 10))))

(print (factorial-digit-to-sum 100))

