#|
  This file is a part of luby project.
  Copyright (c) 2015 Rudolph Miller (chopsticks.tk.ppfm@gmail.com)
|#

(in-package :cl-user)
(defpackage luby-test-asd
  (:use :cl :asdf))
(in-package :luby-test-asd)

(defsystem luby-test
  :author "Rudolph Miller"
  :license "MIT"
  :homepage "https://github.com/Rudolph-Miller/luby"
  :depends-on (:luby
               :prove)
  :components ((:module "t"
                :components
                ((:test-file "parser")
                 (:test-file "luby"))))
  :description "Test system for luby."

  :defsystem-depends-on (:prove-asdf)
  :perform (test-op :after (op c)
                    (funcall (intern #.(string :run-test-system) :prove-asdf) c)
                    (asdf:clear-system c)))
