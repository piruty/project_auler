(defun swap (array i j)
  "配列の要素を交換する補助関数"
  (let ((temp (aref array i))) ; tempにarrayのi番目の値を代入
    ; array i番目にj番目を、j番目にtemp = i番目に入っていた値を代入
    (setf (aref array i) (aref array j) (aref array j) temp)))

(defun permutations (n &key (start 1))
  "n個の要素(startから始まる連続した整数)の順列を生成"
  (let* ((arr (make-array n :initial-contents
                          (loop for i from start below (+ start n) collect i)))
         (result nil))
     (labels ((heap-generate (k array)
                (if (= k 1)
                    (push (copy-seq array) result)
                  (progn
                    (heap-generate (1- k) array)
                    (loop for i from 0 below (1- k) do
                              (if (evenp k)
                                (swap array i (1- k))
                                (swap array 0 (1- k)))
                              (heap-generate (1- k) array))))))
       (heap-generate n arr)
       (nreverse result))))

(defun print-permutations (perms)
  "順列を見やすく表示する補助関数"
  (loop for perm in perms
        for i from 1
        do (format t "~&~3D: ~A" i perm)))

(defun test-permutations (n)
  "テスト関数"
  (format t "~%Generating permutations for n=~D:~%" n)
  (let ((perms (permutations n)))
    (format t "Total number of permutations: ~D~%" (length perms))
    (print-permutations perms)
    perms))
