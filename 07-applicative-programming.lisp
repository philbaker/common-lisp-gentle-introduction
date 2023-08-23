; The #' (sharp quote) notation is the correct way to quote a function in Common Lisp
(setf fn #'cons)
; #<FUNCTION CONS>

fn
; #<FUNCTION CONS>

(type-of fn)
; FUNCTION

(funcall fn 'c 'd)
; (C . D)

; MAPCAR is the most frequently used applicative operator
(defun square (n)
  (* n n))

(mapcar #'square '(1 2 3 4 5))
; (1 4 9 16 25)

(mapcar #'square ())
; NIL


; 7.1. write an ADD1 function that adds one to its input
(defun add1 (x)
  (+ x 1))

(mapcar #'add1 '(1 3 5 7 9))
; (2 4 6 8 10)
