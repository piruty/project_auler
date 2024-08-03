(defun collatz (n)
  (let ((c 1))
    (loop while (/= n 1) do
          (setq c (+ c 1))
          (if (= (mod n 2) 0)
              (setq n (/ n 2))
              (setq n (+ (* 3 n) 1))
          ))
    c))

(defun collatz2 (i hash)
  (let ((c 1) (n i))
    (loop while (/= n 1) do
          (if (gethash n hash)
              (return-from collatz2 (gethash n hash)))
          (setq c (+ c 1))
          (if (= (mod n 2) 0)
              (setq n (/ n 2))
              (setq n (+ (* 3 n) 1)))
          )
    (setf (gethash i hash) c)
    c))

(defun solve ()
  (let (tmp (c 0) (m 0) (hash (make-hash-table)))
    (loop for i from 1 upto 1000000 do
          (setq tmp (collatz i))
          (if (< c tmp)
              (progn
                (setq c tmp)
                (setq m i))))
    m))

(print (solve))
