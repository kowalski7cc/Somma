(defun parse (string)
  (let ((ch (coerce string 'list)))
    (parsesum '() ch)))

(defun parseint (found)
  (if (null found) 0
    (let ((string (coerce found 'string)))
      (parse-float string))))

(defun parsesum (found remaining)
  (cond ((null remaining) (parseint found))
        ((eql (first remaining) '#\Space)
         (+ (parseint found)
            (parsesum '() (rest remaining))))
        (T (parsesum (append found (list (first remaining))) (rest remaining)))))