#|
  This file is a part of luby project.
  Copyright (c) 2015 Rudolph Miller (chopsticks.tk.ppfm@gmail.com)
|#

(in-package :cl-user)
(defpackage luby-asd
  (:use :cl :asdf))
(in-package :luby-asd)

(defsystem luby
  :version "0.1"
  :author "Rudolph Miller"
  :license "MIT"
  :homepage "https://github.com/Rudolph-Miller/luby"
  :depends-on (:cl-syntax
               :cl-syntax-annot
               :cl-ppcre
               :esrap)
  :components ((:module "src"
                :components
                ((:file "parser")
                 (:file "luby"))))
  :description "[WIP] Luby"
  :long-description
  #.(with-open-file (stream (merge-pathnames
                             #p"README.md"
                             (or *load-pathname* *compile-file-pathname*))
                            :if-does-not-exist nil
                            :direction :input)
      (when stream
        (let ((seq (make-array (file-length stream)
                               :element-type 'character
                               :fill-pointer t)))
          (setf (fill-pointer seq) (read-sequence seq stream))
          seq)))
  :in-order-to ((test-op (test-op luby-test))))
