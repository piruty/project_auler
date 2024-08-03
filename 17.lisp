(defun c (n)
  (let (x (tmp n) (result 0))
    (when (eql n 1000)
        (return-from c 11)) ; one thousand
    (when (>= tmp 100) ; 100以上の時の100の位
      (setq x (floor tmp 100)) ; x: 100の位の値
      (cond ((eq x 9) (setq result (+ result (length "nine")))) ; nine
            ((eq x 8) (setq result (+ result (length "eight")))) ; eight
            ((eq x 7) (setq result (+ result (length "seven")))) ; seven
            ((eq x 6) (setq result (+ result (length "six")))) ; six
            ((eq x 5) (setq result (+ result (length "five")))) ; five
            ((eq x 4) (setq result (+ result (length "four")))) ; four
            ((eq x 3) (setq result (+ result (length "three")))) ; three
            ((eq x 2) (setq result (+ result (length "two")))) ; two
            ((eq x 1) (setq result (+ result (length "one")))) ; one
      )
      (setq result (+ result 7)) ; hundred
      (when (> (mod n 100) 0) ; 1xxで100以下の数字があるとき => and分を追加
        (setq result (+ result 3)))
      (setq tmp (mod tmp 100)))
    (when (>= tmp 20) ; 20 ~ 90の10の位
      (setq x (floor tmp 10))
      (cond ((eq x 9) (setq result (+ result (length "ninety")))) ; ninty
            ((eq x 8) (setq result (+ result (length "eighty")))) ; eighty
            ((eq x 7) (setq result (+ result (length "seventy")))) ; seventy
            ((eq x 6) (setq result (+ result (length "sixty")))) ; sixty
            ((eq x 5) (setq result (+ result (length "fifty")))) ; fifty
            ((eq x 4) (setq result (+ result (length "forty")))) ; fourty
            ((eq x 3) (setq result (+ result (length "thirty")))) ; thirty
            ((eq x 2) (setq result (+ result (length "twenty")))) ; twenty
            )
      (setq tmp (mod tmp 10)))
    (cond ((eq tmp 19) (setq result (+ result (length "nineteen"))))
          ((eq tmp 18) (setq result (+ result (length "eighteen"))))
          ((eq tmp 17) (setq result (+ result (length "seventeen"))))
          ((eq tmp 16) (setq result (+ result (length "sixteen"))))
          ((eq tmp 15) (setq result (+ result (length "fifteen"))))
          ((eq tmp 14) (setq result (+ result (length "fourteen"))))
          ((eq tmp 13) (setq result (+ result (length "thirteen"))))
          ((eq tmp 12) (setq result (+ result (length "twelve"))))
          ((eq tmp 11) (setq result (+ result (length "evelen"))))
          ((eq tmp 10) (setq result (+ result (length "ten"))))
          ((eq tmp 9) (setq result (+ result (length "nine")))) ; nine
          ((eq tmp 8) (setq result (+ result (length "eight")))) ; eight
          ((eq tmp 7) (setq result (+ result (length "seven")))) ; seven
          ((eq tmp 6) (setq result (+ result (length "six")))) ; six
          ((eq tmp 5) (setq result (+ result (length "five")))) ; five
          ((eq tmp 4) (setq result (+ result (length "four")))) ; four
          ((eq tmp 3) (setq result (+ result (length "three")))) ; three
          ((eq tmp 2) (setq result (+ result (length "two")))) ; two
          ((eq tmp 1) (setq result (+ result (length "one")))) ; one
    )
    result))

(defun solve (n)
  (let ((result 0) (end n))
    (loop for i from 1 upto end do
          (setq result (+ result (c i))))
    (print result)))

