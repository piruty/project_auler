;; Problem 1
(defun divisor? (x y)
  ; zerop x: xが0かを確認する
  ; mod x y: xをyで割ったあまりを返す
  (zerop (mod x y)))

(defun range-list (bgn end)
  (if (>= bgn end)
      '() ; '() : 空のリスト
      ; cons x y: x と yを組み合わせたリストを返す
      (cons bgn (range-list (+ bgn 1) end))))

(defun solver (num)
  ; reduce ope (x, y, ...): リストの先頭から順番に ope を適用する
  ; #'+: 合計を計算するためのショートハンド
    ; #' : 関数を表すためのプリフィックス
    ; = (function +)
  ; remove-if-not ope (x): リストxからope判定でfalseの項目を除外する
  (reduce #'+ (remove-if-not (lambda (x) (or (divisor? x 3) (divisor? x 5)))
                             (range-list 2 num))))

; format op format val: valを整形して出力するための関数
  ; op: 出力先の指定(t: 標準出力)
  ; format: 出力フォーマット
    ; "~d~%": ~d = 数字, ~% = 改行
(format t "~d~%" (solver 1000))
