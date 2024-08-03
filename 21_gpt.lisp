(load "divisors.lisp")

(defun d (n)
  "真の約数の和を求める"
  (- (reduce #'+ (divisors n)) n))

(defun fraternity-number (n)
  "友愛数を検証し、友愛数であればそのペアを返す"
  (let ((d-n (d n))
        (d-d-n (d (d n))))
    (when (and (/= n d-n) (= n d-d-n))
      (list n d-n))))

(defun main ()
  (let ((results nil))
    (loop for i from 2 to 10000
          for fraternity-numbers = (fraternity-number i)
          when fraternity-numbers do
          (setf results (append results fraternity-numbers)))
    (setf results (sort (remove-duplicates results) #'<))
    (format t "~a~%" (reduce #'+ results))))
