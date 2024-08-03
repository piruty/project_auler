(defun zellers-congruence (year month)
  (let* ((q 1)
         (m (if (< month 3) (+ month 12) month))
         (Y (if (< month 3) (1- year) year))
         (K (mod Y 100))
         (J (floor Y 100)))
    (mod (+ q (floor (* 13 (1+ m)) 5) K (floor K 4) (floor J 4) (- (* 2 J))) 7)))

(defun count-sundays ()
  (let ((count 0))
    (loop for year from 1900 to 2000 do
          (loop for month from 1 to 12 do
                (when (= (zellers-congruence year month) 1)
                  (when (> year 1900)
                    (incf count)))))
    count))

(print (count-sundays))
