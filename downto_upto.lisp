(loop for x from 1 upto 10 do
      (loop for y from 10 downto 1 do
            (let ((ans (* x y)))
              (format t "~a~%" ans))))
