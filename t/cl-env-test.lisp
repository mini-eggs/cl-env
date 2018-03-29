(in-package #:cl-env/test)

(define-test ensure-test-env-var-is-not-set ()
  "Ensure our testing values specified in .test.env are not already set."
  (assert-equal (uiop:getenv "TEST_VALUE") nil))

(define-test set-env-and-check-var ()
  "Load the .test.env file and ensure it has set value as expected."
  (init (merge-pathnames #p"t/.test.env" (asdf:system-source-directory :cl-env/test)))
  (assert-equal (uiop:getenv "TEST_VALUE") "NOTHING_WAS_THE_SAME")
  (assert-equal (uiop:getenv "TEST_VALUE2") "SO_HELP_ME_GOD"))

(define-test re-set-and-check ()
  "Load a different .env file and recheck test value."
  (init (merge-pathnames #p"t/.dev.env" (asdf:system-source-directory :cl-env/test)))
  (assert-equal (uiop:getenv "TEST_VALUE") "MII_PLAZA")
  (assert-equal (uiop:getenv "TEST_VALUE2") "THIS_WAS_THE_TURNING_POINT"))

(define-test ensure-default-works ()
  "Attempt to load a non-existant env var."
  (assert-equal (getenv "TEST_VALUE3") nil)
  (assert-equal (getenv "TEST_VALUE3" :default "BEES_KNEES") "BEES_KNEES"))

(define-test ensure-default-does-not-override ()
  "Ensure getenv with a default var does not override correct var."
  (assert-equal (getenv "TEST_VALUE2" :default "LAUGH_OUT_LOUD") "THIS_WAS_THE_TURNING_POINT"))

(defun test-suite ()
  (run-tests :all :cl-env/test))
