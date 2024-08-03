; 19.lispの内容をGPTでリファクタリング

(defun last-day (year month)
  (cond ((member month '(4 6 9 11)) 30)
        ((/= month 2) 31)
        ((or (= (mod year 400) 0)
             (and (= (mod year 4) 0) (/= (mod year 100) 0))) 29)
        (t 28)))

(defun solve ()
  (let ((result 0)
        (day-flag 0))
    (loop for year from 1900 upto 2000 do
          (loop for month from 1 upto 12 do
                (loop for day from 1 upto (last-day year month) do
                      (when (and (= day 1) (= (mod day-flag 7) 6))
                        (when (> year 1900)
                          (setq result (+ result 1))))
                      (setq day-flag (+ day-flag 1)))))
    result))

(print (solve))
