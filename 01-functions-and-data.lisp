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
(defun half (n)
  (/ n 2))

(half 6)
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


; 1.9 write a predicate TWOMOREP that returns T if its first input is
; exactly two more than its second input. Use the ADD2 function in
; your definition of TWOMOREP
(defun add2 (n)
  (+ n 2))

(defun twomorep (x y)
  (equal x (add2 y)))

(twomorep 5 3)
; T

(twomorep 5 5)
; NIL

; 1.10 find a way to write the TWOMOREP predicate using SUB2 instead of
; ADD2
 (defun twomoresubp (x y)
   (equal (sub2 x) y))

(twomoresubp 5 3)
; T

(twomoresubp 5 5)
; NIL

; 1.11 the average of two numbers is half their sum. Write the AVERAGE
; function
(defun average (x y)
  (half (+ x y)))

(average 5 9)
; 7


; 1.12 write a MORE-THAN-HALF-P predicate that returns T if its first
; input is more than half of its second input
(defun more-than-half-p (x y)
  (> x (half y)))

(more-than-half-p 6 10)
; T

(more-than-half-p 6 12)
; NIL


; 1.13 the following function returns the same result no matter what
; its input. What result does it return?
(symbolp (numberp nil))
; T

(symbolp (numberp 4))
; T

(symbolp (numberp "hello"))
; T

(symbolp (numberp 'a))
; T


; 1.14 fill in the results of the following computations
(not nil) ; T
(not 12) ; NIL
; (not not) - error


; 1.15 write a predicate NOT-ONEP that returns T if its input is anything
; other than 1
(defun not-onep (x)
  (not (equal x 1)))

(not-onep 5)
; T

(not-onep 'a)
; T

(not-onep 1)
; NIL


; 1.16 write the predicate NOT-PLUSP that returns T if its input is not greater
; than zero
(defun not-plusp (n)
  (not (plusp n)))

(not-plusp 4)
; NIL

(not-plusp -4)
; T


; 1.17 some earlier Lisp dialects did not have the EVENP primitive; they only
; had ODDP. Show how to define EVENP in terms of ODDP
(defun my-evenp (n)
  (not (oddp n)))

(my-evenp 7)
; NIL

(my-evenp 4)
; T


; 1.18 under what condition does this predicate function return T
(defun add1 (n)
  (+ n 1))

(defun add-two-zerop (n)
  (zerop (add1 (add1 n))))

(add-two-zerop -2)
; T

(add-two-zerop 0)
; NIL


; 1.19 what result does the functtion below produce when given the input NIL?
; What about the input T? Will all data flow through this function unchanged?
; What result is produced for the input RUTABAGA?
(defun not-not (x)
  (not (not x)))

(not-not nil)
; NIL

(not-not t)
; T

(not-not "RUTUBAGA")
; T
