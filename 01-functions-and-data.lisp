; Exercises

; 1.1 Fill the missing item
(* -8 6)
; -48

(/ 15 9)
; 5/3

(+ 8 0)
; 8

(- 5 6)
; -1

(- 1 1/3)
; 2/3

(abs (+ -5 3))
; 2


; 1.2 Determine types
(type-of 'AARDVARK) ; SYMBOL - S
(type-of 87) ; (INTEGER 0 4611686018427387903) - I
(type-of 'PLUMBING) ; SYMBOL - S
(type-of '1-2-3-G) ; SYMBOL - S
(type-of 1492) ; (INTEGER 0 4611686018427387903) - I
(type-of 3.14159265258979) ; SINGLE-FLOAT - N
(type-of 22/7) ; RATIO - N
(type-of 'ZEROP) ; SYMBOL - S
(type-of 'ZERO) ; SYMBOL - S
(type-of 0) ; BIT - I
(type-of -12) ; FIXNUM - N
(type-of 'SEVENTEEN) ; SYMBOL - S


; 1.3 Fill in the result of each computation
(< 7 11)
; T

(oddp 12)
; NIL

(equal "KIRK" "SPOCK")
; NIL

(numberp "TWELVE")
; NIL

(< -4 -3)
; T

(zerop 0)
; T

(equal 9 -9)
; NIL


; 1.4 Define a SUB2 function that subtracts two from its input
(defun sub1 (n)
  (- n 1))

(defun sub2 (n)
  (sub1 (sub1 n)))

(sub2 5)
; 3


; 1.5 Show how to write TWOP in terms of ZEROP and SUB2
(defun twop (n)
  (zerop (sub2 n)))

(twop 2)
; T

; 1.6 The HALF function returns a number that is one-half of its input.
; Show how to define HALF in two different ways
(defun half1 (n)
  (/ n 2))

(half1 6)
; 3

(defun half2 (n)
  (* n 1/2))

(half2 6)
; 3


; 1.7 Write a MULTI-DIGIT-P predicate that returns true if its input is
; greater than 9
(defun multi-digit-p (n)
  (> n 9))

(multi-digit-p 8)
; NIL

(multi-digit-p 10)
; T


; 1.8 What does this function do to a number?
(defun sub0 (n)
  (- n 0))

(sub0 5)
; 5
