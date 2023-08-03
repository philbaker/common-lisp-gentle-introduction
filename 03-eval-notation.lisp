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
