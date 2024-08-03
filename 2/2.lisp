; Problem 2
; &optional: 引数があればそのまま、なければ設定された初期値の変数が設定される
; make-hash-table ハッシュテーブルを作成する
(defun fibo (n &optional (memo (make-hash-table)))
  ; cond: 条件式で処理を分岐する
    ; t: cond式のデフォルト設定
  (cond ((<= n 2) n)
        ; gethash ハッシュから値を取り出す
        ; (or A B): AがnilでなければA, そうでなければBの結果を返す
        (t (or (gethash n memo)
               ; setf (gethash A N) B): hash NのキーAに、Bの評価結果を代入する
               (setf (gethash n memo)
                     (+ (fibo (- n 1) memo)
                        (fibo (- n 2) memo)))))))

(defun even-fibo-sum (limit)
  (let ((sum 0)
        (n 1)
        (f (fibo 1)))
    ; loop while A do B: Aが有効な間はBが繰り返し処理される。doは省略可能
    (loop while (<= f limit) do
          ; (when A B): Aが真になったらBを評価する
          ; (evenp f): fが偶数なら真
          (when (evenp f)
            ; (incf A B): AをBの数値分大きくする
              ; Bが渡されなければ、1だけ大きくする
            (incf sum f))
          (incf n)
          (setf f (fibo n)))
    sum))

(format t "~d~%" (even-fibo-sum 4000000))
