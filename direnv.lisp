(in-package #:cl-env)

(pushnew (asdf:system-source-directory :cl-env)
	 cffi:*foreign-library-directories*
	 :test #'equal)

(define-foreign-library c-go-test
  (t (:default "playground/main")))

(use-foreign-library c-go-test)

(defun test ()
  (foreign-funcall "call_go" :string))

