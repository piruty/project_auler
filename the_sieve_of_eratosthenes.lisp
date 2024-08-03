(defun sieve-of-eratosthenes (limit)
  (let ((p 2) (prime (make-array (+ limit 1) :initial-element t)))
    (loop while (<= (* p p) limit) do
          (if (aref prime p)
              (loop for i from (* p p) upto limit by p do
                    (setf (aref prime i) nil)))
          (setq p (+ p 1)))
    (loop for i from 2 upto limit
          when (aref prime i)
            collect i)))

(sieve-of-eratosthenes 10)
