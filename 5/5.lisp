; ユークリッドの互助法を用いて最小公倍数を求める
(defun lcm (a b)
  (let ((x (* a b)) r tmp)
    (if (< a b)
      (progn
        (setq tmp a)
        (setq a b)
        (setq b tmp)))
    (setq r (mod a b))
    (loop while (/= r 0) do
      (setq a b)
      (setq b r)
      (setq r (mod a b)))
    (/ x b)
  )
)

(let ((result 1))
  (loop for x from 2 upto 20 do
    (setq result (koubai result x)))
  (format t "~a~%" result))
