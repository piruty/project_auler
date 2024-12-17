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

(defun char-to-index (char)
  (- (char-code (char-downcase char))
     (char-code #\a)
     -1))

(defun test-char-to-index ()
  (format t "~A~%" (char-to-index #\A))
  (format t "~A~%" (char-to-index #\z)))

(defun split-csv-string (str)
  (loop for start = 0 then (+ pos 1)
        for pos = (position #\, str :start start)
        collect (string-trim '(#\" #\Space) (subseq str start (or pos (length str))))
        while pos))

(defun word-to-index-sum (word)
  (let ((c 0))
    (loop for s across word
          do (setf c (+ c (char-to-index s))))
    c))

(defun process ()
  (let ((c 0)
        (words (split-csv-string (read-file "42/words.txt"))))
    (loop for word in words
          do (if (is-triangle-number (word-to-index-sum word))
                 (setf c (1+ c))
                 nil))
    c))
