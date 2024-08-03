;d(n) を n の真の約数の和と定義する. (真の約数とは n 以外の約数のことである. )
; もし, d(a) = b かつ d(b) = a (a ≠ b のとき) を満たすとき, a と b は友愛数(親和数)であるという.
;
; 例えば, 220 の約数は 1, 2, 4, 5, 10, 11, 20, 22, 44, 55, 110 なので d(220) = 284 である.
; また, 284 の約数は 1, 2, 4, 71, 142 なので d(284) = 220 である.
;
; それでは10000未満の友愛数の和を求めよ.

(load "divisors.lisp")

; 真の約数を求める
(defun d (n)
  (let (divs)
    ; nの約数を求める
    (setq divs (divisors n))
    ; nのd値を求める
    (- (reduce #'+ divs) n)))

; 友愛数かを確認する
(defun fraternity-number (n)
  (let (d-n d-d-n)
    ; nのd値を求める
    (setq d-n (d n))
    ; d-nのd値を求める
    (setq d-d-n (d d-n))
    (if (and (/= n d-n) (= n d-d-n))
        (list n d-n)
        nil)))

(defun main()
    (let (fraternity-numbers (results '()))
      (loop for i from 2 to 10000 do
            (setq fraternity-numbers (fraternity-number i))
            (if fraternity-numbers
                (setq results (append results fraternity-numbers))))
      (setq results (sort (remove-duplicates results) #'<))
      (print (reduce #'+ results))))
