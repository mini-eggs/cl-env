(in-package #:cl-env)

(defun split (somestring &key delim)
  "Simple function, similar to String.prototype.split in JavaScript"
  (let ((s (list )) (current ""))
    (loop for char across somestring do
          (if (equal delim char)
              (progn
                (setq s (concatenate 'list s (list current)))
                (setq current ""))
              (setq current (concatenate 'string current (string char)))))
    (remove-if #'(lambda (item) (equal "" item)) (concatenate 'list s (list current)))))

;; PUBLIC
(defun getenv (key &key default)
  "Small wrapper around (uiop:getenv). :default always you to specify a 
  default variable. If the current environment does not have a value."
  (let ((value default) (possible (uiop:getenv key)))
    (if possible possible value)))

;; PUBLIC
(defun init (&optional (filepath (merge-pathnames (truename ".") ".env")))
  "Reads the environment file, splits it up, and injects into current environment."
  (with-open-file (s filepath :if-does-not-exist nil)
    (loop for line = (read-line s nil)
          while line do 
          (let ((parts (split line :delim #\=)))
            (setf (uiop:getenv (first parts)) (first (reverse parts)))))))
