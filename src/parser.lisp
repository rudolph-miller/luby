(in-package :cl-user)
(defpackage luby.parser
  (:use #:cl
        #:annot.doc
        #:cl-ppcre
        #:esrap))
(in-package :luby.parser)

(syntax:use-syntax :annot)

(let ((scanner (create-scanner "[0-9]")))
  (defun numericp (character)
    (when (scan scanner (text character)) t)))

(defun alphabetp (character)
  (and (alphanumericp character)
       (not (numericp character))))

(defrule alphanumeric (alphanumericp character))

(defrule numeric (numericp character))

(defrule alphabet (alphabetp character))

(defrule underscare #\_)

(defrule identifier (and (or alphabet underscare)
                         (* (or alphanumeric underscare)))
  (:lambda (list) (text list)))
