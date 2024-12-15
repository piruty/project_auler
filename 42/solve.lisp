  (defun read-file (filename)
    (handler-case
          (with-open-file (stream filename)
            (let ((contents (make-string (file-length stream))))
              (read-sequence contents stream)
              contents))
            (error (c)
                   (format t "Error reading file: ~A~%" c)
                   nil)))

  (defun test-read-file ()
    (let ((content (read-file "42/words.txt")))
      (if content
          (format t "File content: ~%~A~%" content)
          (format t "Failed to read file~%"))))

  (defun is-triangle-number_ (n)
    (loop for i from 0 to n
          when (= (* i (+ i 1) 1/2) n)
          return t
          finally (return nil)))

  (defun is-triangle-number (n)
    (let* ((x (sqrt (+ (* 8 n) 1)))
           (n1 (- x 1))
           (n2 (/ n1 2)))
      (= n2 (floor n2))))
