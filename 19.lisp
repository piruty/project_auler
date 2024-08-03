; 次の情報が与えられている.
;   1900年1月1日は月曜日である.
;   9月, 4月, 6月, 11月は30日まであり, 2月を除く他の月は31日まである.
;   2月は28日まであるが, うるう年のときは29日である.
;   うるう年は西暦が4で割り切れる年に起こる. しかし, 西暦が400で割り切れず100で割り切れる年はうるう年でない.
; 20世紀（1901年1月1日から2000年12月31日）中に月の初めが日曜日になるのは何回あるか?

; 1900/01/01, 08, 15, 22, 29, ... : Mon
; 1900/01/02,                 ... : Tue
; 1900/01/03,                 ... : Wed
; 1900/01/04,                 ... : Thu
; 1900/01/05,                 ... : Fri
; 1900/01/06,                 ... : Sat
; 1900/01/07, 14, 21, 28,     ... : Sun

; 1900/01/01 + 31 days = 1900/02/01

(defun last-day (year month)
  (when (= month 4)
    (return-from last-day 30))
  (when (= month 6)
    (return-from last-day 30))
  (when (= month 9)
    (return-from last-day 30))
  (when (= month 11)
    (return-from last-day 30))
  (unless (= month 2)
    (return-from last-day 31))
  (unless (= (mod year 4) 0)
    (return-from last-day 28))
  (when (and (/= (mod year 400) 0) (= (mod year 100) 0))
    (return-from last-day 28))
  29)

(defun solve ()
  (let ((result 0) (day-flag 1))
    (loop for year from 1900 upto 2000 do
          (loop for month from 1 upto 12 do
                (loop for day from 1 upto (last-day year month) do
                      (when (and (> year 1900) (= day 1) (= (mod day-flag 7) 0))
                        (setq result (+ result 1)))
                      (setq day-flag (+ day-flag 1)))))
    (print result)))

