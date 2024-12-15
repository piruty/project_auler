(load "permutations.lisp")
(load "primes.lisp")

  (defun array-to-list (arr)
    "配列をリストに変換する"
    (map 'list #'identity arr))

  (defun join-numbers (numbers)
    "数値のリストを連結して1つの整数にする"
    (parse-integer
      (format nil "~{~D~}" numbers)))

  (defun solve (n)
    "配列から生成可能な順列の中で最大の素数を見つける"
    (let ((max-num most-negative-fixnum))
        (dolist (perm (permutations n) max-num)
            (let ((num (join-numbers (array-to-list perm))))
            (when (and (is-prime num)
                       (> num max-num))
              (setf max-num num))))))


  (defun test-solve ()
    (let ((maxn 9))
      (loop for i from 1 upto maxn 
            do (format t "~D: ~D~%" i (solve i)))))
