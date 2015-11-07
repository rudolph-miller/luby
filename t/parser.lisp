(in-package :cl-user)
(defpackage luby-test.parser
  (:use #:cl
        #:luby.parser
        #:prove)
  (:import-from #:esrap
                #:parse)
  (:import-from #:luby.parser
                #:identifier))
(in-package :luby-test.parser)

(plan nil)

(diag "luby.test.parser")

(subtest "with identifier"
  (subtest "pass"
    (macrolet ((identifier-test (target expected comment)
                 `(is (parse 'identifier ,target)
                      ,expected
                      ,comment)))
      (identifier-test
       "identifier"
       "identifier"
       "with alphabets")

      (identifier-test
       "identifier1"
       "identifier1"
       "with alphanumericals")

      (identifier-test
       "identifier_1"
       "identifier_1"
       "with underscores")))

  (subtest "fail"
    (macrolet ((identifier-fail-test (target comment)
                 `(is-error (parse 'identifier ,target)
                            'error
                            ,comment)))
      (identifier-fail-test
       "1identifier"
       "start with numericals")

      (identifier-fail-test
       "identifier-1"
       "with dashes"))))

(finalize)
