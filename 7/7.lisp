(defun solve ()
  (let ((is_prime-p t) (primes '(2)) (prime 3))
    (loop while (< (length primes) 10001) do
      (progn
          (setq is_prime-p t)
          (dolist (p primes)
            (if (= (mod prime p) 0)
                (progn
                  (setq is_prime-p nil)
                  (return)
                  )))
            (if is_prime-p
                (push prime primes))
            (setq prime (+ prime 2))))
    (print (last (reverse primes)))
    ))

(defun find-primes ()
  (let ((primes (list 2))
        (prime 3))
    (loop while (< (length primes) 10001)
          do (progn
               (let ((is-prime t))
                 (dolist (p primes)
                   (when (= (mod prime p) 0)
                     (setq is-prime nil)
                     (return)))
                 (when is-prime
                   (push prime primes)))
               (setq prime (+ prime 2))))
    (print (last (reverse primes)))))

(solve)
