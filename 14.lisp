(defun pow (a n)
  (let ((result a))
    (loop for i from 1 while (< i n) do
          (setq result (* result a)))
    result))

(defun solve ()
  (let ((p (pow 2 1000)) (result 0))
    (loop while (> p 0) do
          ;; 10で割った余り = 1桁目の数字を取り出して乗算
          (setq result (+ result (mod p 10)))
          ;; pを10で割る = ひとけた目を削除
          (setq p (floor p 10)))
    result))

(print (solve))
