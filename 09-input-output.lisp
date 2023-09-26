; Character strings

; Strings evaluate to themselves
"strings are things"
; "strings are things"

(setf test-string "This object is a string.")

test-string
; "This object is a string."

(stringp test-string)
; T

(setf test-symbol 'this-object-is-a-symbol)

(stringp test-symbol)
; NIL


; The format function
(format t "Hi, mom!")
; Hi, mom!
; NIL

; The ~% directive moves following text to a new line

(format t "Time flies~%like an arrow.")
; Time flies
; like an arrow.
; NIL

(format t "Fruit flies~%~%like bananas.")
; Fruit flies
; 
; like bananas.
; NIL

; &~ moves following text to a new line unless it knows it is already at the
; beginning of a new line

(defun mary ()
  (format t "~&Mary had a little bat.")
  (format t "~&Its wings were long and brown.")
  (format t "~&And everywhere that Mary went.")
  (format t "~&The bat went, upside-down."))

(mary)
; Mary had a little bat.
; Its wings were long and brown.
; And everywhere that Mary went.
; The bat went, upside-down.
; NIL


; The ~S directive inserts the printed representation of a Lisp object into the
; message that FORMAT prints

(format t "From ~S to ~S in ~S minutes!" 'boston '(new york) 55)
; From BOSTON to (NEW YORK) in 55 minutes!

(defun square-talk (n)
  (format t "~&~S squared is ~S" n (* n n)))

(square-talk 10)
; 10 squared is 100
; NIL

(mapcar #'square-talk '(1 2 3 4 5))
; 1 squared is 1
; 2 squared is 4
; 3 squared is 9
; 4 squared is 16
; 5 squared is 25
; (NIL NIL NIL NIL NIL)

(defun test (x)
  (format t "~&With escape characters: ~S" x)
  (format t "~&Without escape characters: ~A" x))

(test "Hi, mom")
; eval (root-form): (test "Hi, mom")
; With escape characters: "Hi, mom"
; Without escape characters: Hi, mom
; NIL


; 9.1. write a function to print "There are old pilots, and there are bold pilots,
; but there are no old bold pilots." Your function should break up the quotation
; into several lines

(format t "There are old pilots,~%and there are bold pilots,~%but there are no old bold pilots.")
; There are old pilots,
; and there are bold pilots,
; but there are no old bold pilots.
; NIL


; 9.2. write a recursive function DRAW-LINE that draws a line of a specified
; length by donig (FORMAT T "*") the correct number of times
(defun draw-line (x)
  (cond ((zerop x) nil)
        (t 
          (format t "*")
          (draw-line (- x 1)))))

(draw-line 10)
; **********
; NIL


; 9.3. write a recursive function DRAW-BOX that calls DRAW-LINE repeatedly to
; draw a box of specified dimensions. 

(defun draw-box (x y)
  (cond ((zerop y) nil)
        (t
          (format t "~&")
          (draw-line x)
          (draw-box x (- y 1)))))

(draw-box 10 4)
; **********
; **********
; **********
; **********
; NIL


; 9.4. write a recursive function NINETY-NINE-BOTTLES that sings the well-known song

(defun format-bottles (x)
  (format t "~S bottles of beer on the wall,~%~S bottles of beer!~%Take one down, Pass it around,~%~S bottles of beer on the wall.~%" x x (- x 1)))

(format-bottles 99)
; 99 bottles of beer on the wall,
; 99 bottles of beer!
; Take one down, Pass it around,
; 98 bottles of beer on the wall.
; 
; NIL

(defun ninety-nine-bottles (x)
  (cond ((zerop x) 
         (print "Time to buy some beer!")
         nil)
        (t 
          (format-bottles x)
          (ninety-nine-bottles (- x 1)))))

(ninety-nine-bottles 3)
; 3 bottles of beer on the wall,
; 3 bottles of beer!
; Take one down, Pass it around,
; 2 bottles of beer on the wall.
; 2 bottles of beer on the wall,
; 2 bottles of beer!
; Take one down, Pass it around,
; 1 bottles of beer on the wall.
; 1 bottles of beer on the wall,
; 1 bottles of beer!
; Take one down, Pass it around,
; 0 bottles of beer on the wall.
; 
; "Time to buy some beer!" 
; NIL


; 9.5. write a function PRINT-BOARD that prints a tic-tac-toe / noughts and crosses
; board

(defun print-line (x)
  (format t " ~A | ~A | ~A~%"
          (first x)
          (second x)
          (third x)))

(defun print-board (x)
  (let ((x2 (sublis '((x . "X")
                       (o . "O")
                       (nil . " "))
                     x)))
    (format t "~&")
    (print-line x2)
    (format t "----------~%")
    (print-line (nthcdr 3 x2))
    (format t "----------~%")
    (print-line (nthcdr 6 x2))))

(print-board '(x o o nil x nil o nil x))
;  X | O | O
; ----------
;    | X |  
; ----------
;  O |   | X
; 
; NIL
