(load "primes.lisp")

(defun array-to-list (arr)
  "配列をリストに変換する"
  (map 'list #'identity arr))

;;;; 素数判定の実装
; (defun is-prime (n)
;   "数値nが素数かどうかを判定する"
;   (when (< n 2)
;     (return-from is-prime nil))
;   (when (= n 2)
;     (return-from is-prime t))
;   (when (evenp n)
;     (return-from is-prime nil))
;   (loop for i from 3 to (isqrt n) by 2
;         never (zerop (mod n i))))

;;;; 順列生成の実装
(defun swap (array i j)
  "配列の要素を交換する補助関数"
  (let ((temp (aref array i)))
    (setf (aref array i) (aref array j)
          (aref array j) temp)))

(defun permutations (lst)
  "リストのすべての順列を生成する"
  (let* ((n (length lst))
         (arr (make-array n :initial-contents lst))
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
      (mapcar #'array-to-list (nreverse result)))))

;;;; メインの解決関数
(defun join-numbers (numbers)
  "数値のリストを連結して1つの整数にする"
  (parse-integer 
    (format nil "~{~D~}" numbers)))

(defun solve (arr)
  "配列から生成可能な順列の中で最大の素数を見つける"
  (let ((max-num most-negative-fixnum)
        (num-list (array-to-list arr)))
    (dolist (perm (permutations num-list) max-num)
      (let ((num (join-numbers perm)))
        (when (and (is-prime num)
                  (> num max-num))
          (setf max-num num))))))

;;;; テスト関数
(defun test-solve ()
  (let ((test-array #(1 2 3 4 5 6 7)))
    (format t "Input: ~A~%" test-array)
    (format t "Result: ~A~%" (solve test-array))))

;;;; 追加のテスト関数
(defun run-tests ()
  (format t "~%Testing is-prime function:~%")
  (loop for n in '(2 3 4 5 6 7 8 9 10 11)
        do (format t "~D: ~A~%" n (is-prime n)))
  
  (format t "~%Testing permutations function:~%")
  (let ((test-list '(1 2 3)))
    (format t "Input: ~A~%" test-list)
    (format t "Permutations: ~A~%" (permutations test-list)))
  
  (format t "~%Testing solve function:~%")
  (test-solve))
