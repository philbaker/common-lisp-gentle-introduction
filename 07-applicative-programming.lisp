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


; 7.2. use MAPCAR on the table below to extract a list of social security numbers
(setf daily-planet
      '((olsen jimmy 123-76-4535 cub-reporter)
        (kent clark 089-52-6787 reporter)
        (lane lois 951-26-1438 reporter)
        (white perry 355-16-7439 editor)))


(mapcar #'third daily-planet)
; (|123-76-4535| |089-52-6787| |951-26-1438| |355-16-7439|)


; 7.3. write an expression to apply the ZEROP predicate to each element of
; the following list
(mapcar #'zerop '(2 0 3 4 0 -5 -6))
; (NIL T NIL NIL T NIL NIL)


; 7.4. write the function GREATER-THAN-FIVE and show how it would help with
; mapcar
(defun greater-than-five (x)
  (> x 5))

(greater-than-five -4)
; NIL
(greater-than-five 5)
; NIL
(greater-than-five 6)
; T

(mapcar #'greater-than-five '(6 0 3 11 0 -5 -6))
; (T NIL NIL T NIL NIL NIL)

; lambda expression alternative
(mapcar #'(lambda (n) (> n 5)) '(6 0 3 11 0 -5 -6))
; (T NIL NIL T NIL NIL NIL)


; 7.5. write a lambda expression to subtract seven from a number
(defun subtract-seven (n)
  (- n 7))

(lambda (n) (- n 7))

(subtract-seven 10)
; 3


; 7.6. write a lambda expression that returns T if its input is T or NIL, but
; nil for any other input
(defun t-or-nil (x)
  (or (equal x t) (equal x nil)))

(lambda (x) (or (equal x t) (equal x nil)))

(t-or-nil 'a)
; NIL
(t-or-nil t)
; T
(t-or-nil nil)
; T


; 7.7 write a function that takes a list and flips each element
(setf direction-list '(up down up up))

(mapcar 
  #'(lambda (x) 
      (if 
        (equal x 'up) 'down 
        'up)) 
  direction-list)
; (DOWN UP DOWN DOWN)


; writing assoc with find-if
(defun my-assoc (key table)
  (find-if #'(lambda (entry)
               (equal key (first entry)))
           table))

(my-assoc 'two '((one un)
                 (two deux)
                 (three trois)))
; (TWO DEUX)


; 7.8. write a function that returns the first number in a list that is roughly
; equal (within -10 - +10 of number)


(defun roughly-equal (x y)
  (and 
    (<= (- x 10) y) 
    (>= (+ x 10) y)))

(roughly-equal 50 39)
; NIL
(roughly-equal 50 41)
; T
(roughly-equal 50 50)
; T
(roughly-equal 50 60)
; T
(roughly-equal 50 61)
; NIL

(defun roughly-equal-first (x y)
  (find-if 
    #'(lambda (z) 
        (roughly-equal z y)) 
    x))

(roughly-equal-first '(1 5 55 80) 50)
; 55


; 7.9. write the funcntion FIND-NESTED that returns the first element of a list
; that itself is a non-NIL list
(defun non-nil-listp (l)
  (and 
    (not (null l))
    (listp l)))

(non-nil-listp '())
; NIL
(non-nil-listp '(a b c))
; T

(defun find-nested (l)
  (find-if 
    #'(lambda (x) 
        (non-nil-listp x)) 
    l))

(find-nested '(() nil (a b c) (2 5 5)))
; (A B C)
