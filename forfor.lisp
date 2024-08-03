(defun main ()
  (loop for i from 1 to 10
        for j = (+ i 1)
        when (= (mod j 2) 0) do
        (print (list i j))))
