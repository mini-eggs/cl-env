;;;; package.lisp

(defpackage #:cl-env
  (:use #:cl
	#:cffi)
  (:export #:init
           #:getenv))

