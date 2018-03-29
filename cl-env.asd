(asdf:defsystem #:cl-env
  :description "Easily parse .env files. That's it!"
  :author "Evan M Jones (https://evanjon.es/) <me@evanjon.es>"
  :license "MIT"
  :serial t
  :components ((:file "package")
               (:file "cl-env")))

(asdf:defsystem #:cl-env/test
  :description "Test suite for cl-env."
  :author "Evan M Jones (https://evanjon.es/) <me@evanjon.es>"
  :license "MIT"
  :serial t
  :depends-on ("lisp-unit" "cl-env")
  :components ((:module :t
                :components ((:file "package")
                             (:file "cl-env-test")))))
