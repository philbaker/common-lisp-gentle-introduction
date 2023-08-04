; 3.1 what does (not (equal 3 (abs -3))) eval to?
(not (equal 3 (abs -3)))
; NIL


; 3.2 write an expression in eval notation to add 8 and 12 and divide the result
; by 2
(/ (+ 8 12) 2)
; 10


; 3.3 write an expression in eval notation to add the square of 3 and the square
; of 4
(+ (* 3 3) (* 4 4))
; 25


; 3.4 draw an evaltrace diagram for each of the following
(- 8 2)
  ; 8 evaluates to 8
  ; 2 evaluates to 2
; Enter - with inputs 8 and 2
; Result of - is 6

(not (oddp 4))
    ; 4 evaluates to 4
  ; Enter ODDP with input 4
  ; Result of ODDP is NIL
; Enter NOT with input NIL
; Result of NOT is T

(> (* 2 5) 9)
      ; 2 evaluates to 2
      ; 5 evaluates to 5
    ; Enter * with inputs 2 and 5
    ; Result of * is 10
  ; 9 evaluates to 9
; Enter > with inputs 10 and 9
; Result of > is T

(not (equal 5 (+ 1 4)))
        ; 1 evaluates to 1
        ; 4 evaluates to 4
      ; Enter + with inputs 1 and 4
      ; Result of + is 5
    ; 5 evaluates to 5
  ; Enter EQUAL with inputs 5 and 5
  ; Result of EQUAL is T
; Enter NOT with input T
; Result of NOT is NIL


; 3.5 write definitions for HALF, CUBE ande ONEMOREP using DEFUN
(defun half (x)
  (/ x 2))

(half 10)
; 5

(defun cube (x)
  (* x x x))

(cube 2)
; 8

(defun onemorep (x y)
  (equal x (+ y 1)))

(onemorep 5 4)
; T


; 3.6 define the function PYTHAG
(defun square (x)
  (* x x))

(square 2)
; 4

(defun pythag (x y)
  (sqrt (+ (square x) (square y))))

(pythag 10 20)
; 22.36068


; 3.7 define a function MILES-PER-GALLON
(defun miles-per-gallon (initial-odometer-reading final-odometer-reading gallons-consumed)
  (/ gallons-consumed (- final-odometer-reading initial-odometer-reading)))

(miles-per-gallon 0 10 50)
; 5


; 3.8 how would you define SQUARE in box notation
; SQUARE
; -----[ * ]----->


; 3.9 the following expressions evaluate without any errors. Write down the results
(cons 5 (list 6 7))
; (5 6 7)

(cons 5 '(list 6 7))
; (5 LIST 6 7)

(list 3 'from 9 'gives (- 9 3))
; (3 FROM 9 GIVES 6)

(+ (length '(1 foo 2 moo))
   (third '(1 foo 2 moo)))
; 6

(rest '(cons is short for construct))
; (IS SHORT FOR CONSTRUCT)


; 3.10 The following expressions have errors. Write down the errors and what
; caused them, correct the expression by changing only the quotes

; (third (the quick brown fox)) - the inner list should be quoted
(third '(the quick brown fox))
; BROWN

; (list 2 and 2 is 4) - and, is should be quoted
(list 2 'and 2 'is 4)
; (2 AND 2 IS 4)

; (+ 1 '(length (list t t t t))) - the quote is causing this error
(+ 1 (length (list t t t t)))
; 5

; (cons 'patrick (seymour marvin)) - the inner list should be quoted
(cons 'patrick '(symour marvin))
; (PATRICK SYMOUR MARVIN)

; (cons 'patrick (list seymour marvin)) - seymour and marvin should be quoted
(cons 'patrick '(list seymour marvin))
; (PATRICK LIST SEYMOUR MARVIN)

; 3.11 define a predicate called LONGER-THAN that takes two lists as input and
; returns T if the first list is longer than the second
(defun longer-than (x y)
  (> (length x) (length y)))

(longer-than '(a b c) '(1 2 3 4))
; NIL

(longer-than '(a b c d e) '(1 2 3 4))
; T


; 3.12 write a function ADDLENGTH that takes a list as input and returns a 
; new list with the length of the input added onto the front of it
(defun addlength (l)
  (cons (length l) l))

(addlength '(MOO GOO GAI PAN))
; (4 MOO GOO GAI PAN)

(addlength (addlength '(A B C)))
; (4 3 A B C)


; 3.13 study the function CALL-UP.
; How many arguments does it require? 2
; What are the names of the arguments? caller and callee

(defun call-up (caller callee)
  (list 'hello callee 'this 'is caller 'calling))

(call-up 'FRED 'WANDA)
; (HELLO WANDA THIS IS FRED CALLING)

(defun crank-call (caller callee)
  '(hello callee this is caller calling))

(crank-call 'WANDA 'FRED)
; (HELLO CALLEE THIS IS CALLER CALLING)


; 3.15 consider the scrabble function
; the symbol WORD is used in two different ways in this function -
; what are they? it is passed as a value and as a quoted value to list

(defun scrabble (word)
  (list word 'is 'a 'word))

(scrabble 'aardvark)
; (AARDVARK IS A WORD)

(scrabble 'word)
; (WORD IS A WORD)


; 3.16
(defun stooge (larry moe curly)
  (list larry (list 'moe curly) curly 'larry))

(stooge 'moe 'curly 'larry)
; (MOE (MOE LARRY) LARRY LARRY)


; 3.17 why can't the special symbols T or Nil be used as variables in a function
; definition?
; because they evaluate to themselves


; 3.18 name two advantages of eval notation over box notation
; 1. It is closer to the final lisp code
; 2. It is more concise
