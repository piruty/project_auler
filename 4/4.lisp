(defun is-palindrome? (n)
  (let ((s (write-to-string n)))
    (equal s (reverse s))))

(let ((result 0))
  (loop for x from 999 downto 100 do
        (loop for y from 999 downto 100 do
              (let ((ans (* x y)))
                (when (and (is-palindrome? ans)
                           (> ans result))
                  (setf result ans)))))
  (format t "~a~%" result))
