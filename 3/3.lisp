(defun prime_factorize (n)
  (let ((a '()) (f 3))
    (loop while (= (mod n 2) 0) do
      (setq a (append a '(2)))
      (setq n (/ n 2)))
    (loop while (<= (* f f) n) do
      (if (= (mod n f) 0)
          (progn
            (setq a (append a (list f)))
            (setq n (/ n f)))
          (progn
            (setq f (+ f 2)))))
    (if (/= n 1)
        (setq a (append a (list n))))
    a))

(print (prime_factorize 2))
