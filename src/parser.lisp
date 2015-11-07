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

(defrule program compstmt)

(defrule compstmt (and stmt
                       (* (or term expr))
                       (? term)))

(defrule stmt "stmt")

(defrule expr "expr")

(defrule call "call")

(defrule command "command")

(defrule function "function")

(defrule arg "arg")

(defrule primary "primary")

(defrule when-args "when-args")

(defrule then "then")

(defrule do "do")

(defrule block-var "block-var")

(defrule mlhs "mlhs")

(defrule mlhs-item "mlhs-item")

(defrule lhs "lhs")

(defrule mrhs "mrhs")

(defrule call-args "call-args")

(defrule args "args")

(defrule argdecl "argdecl")

(defrule arglist "arglist")

(defrule singleton "singleton")

(defrule assocs "assocs")

(defrule assoc "assoc")

(defrule variable "variable")

(defrule literal "literal")

(defrule string "string")

(defrule term "term")

(defrule op-asgn "op-asgn")

(defrule symbol "symbol")

(defrule fname "fname")

(defrule operation "operation")

(defrule varname "varname")

(defrule global "global")

(defrule literal-string "literal-string")

(defrule here-doc "here-doc")

|
words
need some functions to catch current character and detect close or not
|
(defrule words "words")

(defrule regexp "regexp")

(defrule identifier (and (or alphabet underscare)
                         (* (or alphanumeric underscare)))
  (:lambda (list) (text list)))
