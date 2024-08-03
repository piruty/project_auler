(defun is-prime (n)
  (if (< n 2)
      (return-from is-prime nil))
  (loop for x from 2 while (<= (* x x) n) do
        (if (= (mod n x) 0)
            (return-from is-prime nil))
        )
  t)
