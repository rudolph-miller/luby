(in-package :cl-user)
(defpackage luby-test.parser
  (:use #:cl
        #:luby.parser
        #:prove)
  (:import-from #:esrap
                #:parse))
(in-package :luby-test.parser)

(plan nil)

(diag "luby.test.parser")

(finalize)
