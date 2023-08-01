; 2.1 show how the list (TO BE OR NOT TO BE) would be reperesented in computer
; memory by drawing its cons cell representation
; [.|.]->[BE|.]->[OR|.]->[NOT|.]->[TO|.]->[BE|.]->NIL


; 2.2 which of these are well-formed lists?

; ('A 'B ('C) - no
; (('A) ('B)) - yes
; 'A 'B ) ('C 'D) - no
; ('A ('B ('C)) - no
; ('A ('B ('C))) - yes
; ((('A) ('B)) ('C)) - yes


; 2.3 draw the cons cell representation of the list (PLEASE (BE MY) VALENTINE)
; [PLEASE|.]->[.|.]->[VALENTINE|.]->NIL
;              |
;             [BE|.]->[MY|.]->NIL

; 2.4 draw the parenthesis notation
(('BOWS 'ARROWS) ('FLOWERS 'CHOCOLATES))

; 2.5 how many elements do each of the following lists have?

(length '(OPEN THE POD BAY DOORS HAL))
; 6

(length '((OPEN) (THE POD BAY DOORS) HAL))
; 3

(length '((ONE) FOR ALL (AND (TWO (FOR ME)))))
; 4

(length '((Q SPADES)
          (7 HEARTS)
          (6 CLUBS)
          (5 DIAMONDS)
          (2 DIAMONDS)))
; 5

(length '((PENNSYLVANIA (THE KEYSTONE STATE))
          (NEW-JERSEY (THE GARDEN STATE))
          (MASSACHUSETTS (THE BAY STATE))
          (NEW-YORK (THE EMPIRE STATE))
          (INDIANA (THE HOOSIER STATE))))
; 5


; 2.6 match each list on the left with the list on the right

(equalp () nil)
; T

(equalp '(()) '(nil))
; T

(equalp '((())) '((nil)))
; T

(equalp '(() ()) '(nil nil))
; T

(equalp '(() (())) '(NIL (NIL)))
; T


; 2.7 what goes on inside my-second when it is given the input (HONK IF YOU LIKE GEESE)?
(defun my-second (l)
  (print (rest l))
  (first (rest l)))

(my-second '(HONK IF YOU LIKE GEESE))
; (IF YOU LIKE GEESE) 
; => IF


; 2.8 show how to write my-third using first and two rests
(defun my-third (l)
  (first (rest (rest l))))

(my-third '(HONK IF YOU LIKE GEESE))
; YOU


; 2.8 show to write my-third using second
(defun my-third-2 (l)
  (second (rest l)))

(my-third-2 '(HONK IF YOU LIKE GEESE))
; YOU


; 2.10 draw the cons cell representation of the list (((PHONE HOME)))
; what is the car of this list and what is the cdr
; [.|.]->NIL
;  |
; [.|.]->NIL
;  |
; [PHONE|.]->[HOME|.]->NIL

(car '(((PHONE HOME))))
; ((PHONE HOME))

(cdr '(((PHONE HOME))))
; NIL

; 2.11 draw the cons cell representation of the list (A (TOLL) ((CALL)))

; [A|.]->[.|.]---------->[.|.]->NIL
;         |               |
;        [TOLL\.]->NIL   [.|.]->NIL
;                         |
;                        [CALL|.]->NIL


; 2.12 what c...r name does lisp use for the function that returns the fourth
; element of a list? how would you prononce it?
(cadddr '(a b c d e))
; D
; "ka-dih-dih-der"


; 2.13 write down a table to illustrate how to get to each word in the list
; (((FUN)) (IN THE) (SUN))
(car '(((FUN)) (IN THE) (SUN))) ; ((FUN))
(caar '(((FUN)) (IN THE) (SUN))) ; (FUN)
(caaar '(((FUN)) (IN THE) (SUN))) ; FUN

(cdr '(((FUN)) (IN THE) (SUN))) ; ((IN THE) (SUN))
(cadr '(((FUN)) (IN THE) (SUN))) ; (IN THE)
(caadr '(((FUN)) (IN THE) (SUN))) ; IN
(cadadr '(((FUN)) (IN THE) (SUN))) ; THE

(cddr '(((FUN)) (IN THE) (SUN))) ; ((SUN))
(caddr '(((FUN)) (IN THE) (SUN))) ; (SUN)
(caaddr '(((FUN)) (IN THE) (SUN))) ; SUN


; 2.14 what would happen if you tried to explain the operation of the CAADR
; function on the list ((BLUE CUBE) (RED PYRAMID)) by reading the As and Ds
; from left to right instead of right to left?
(caadr '((BLUE CUBE) (RED PYRAMID))) ; RED
; (cdaar '((BLUE CUBE) (RED PYRAMID))) ; The value BLUE is not of type LIST


; 2.15 using the list ((A B) (C D) (E F)), fill in the missing pairs of this table
(defun cadaddr (l)
  (car (cdaddr l)))

(car '((A B) (C D) (E F))) ; (A B)
(cddr '((A B) (C D) (E F))) ; ((E F))
(cadr '((A B) (C D) (E F))) ; (C D)
(cdar '((A B) (C D) (E F))) ; (B)
(cadar '((A B) (C D) (E F))) ; B
(cddar '((A B) (C D) (E F))) ; NIL
(caar '((A B) (C D) (E F))) ; A
(cdaddr '((A B) (C D) (E F))) ; (F)
(cadaddr '((A B) (C D) (E F))) ; F


; 2.16 what does CAAR do when given the input (FRED NIL)?
; (caar '(FRED NIL)) ; The value FRED is not of type LIST


; 2.17 fill in the results of the following computations
(car '(POST NO BILLS)) ; POST
(cdr '(POST NO BILLS)) ; (NO BILLS)
(car '((POST NO) BILLS)) ; (POST NO)
(cdr '(BILLS)) ; NIL
; (car 'BILLS) ; The value BILLS is not of type LIST when binding LIST
(cdr '(POST (NO BILLS))) ; ((NO BILLS))
(cdr '((POST NO BILLS))) ; NIL
(car nil) ; NIL

; cons
(cons 'FROB nil) ; (FROB)


; 2.18 write a function that takes any two inputs and makes a list of them 
; using CONS
(defun my-cons (x y)
  (cons x (cons y nil)))

(my-cons 'BAZ 'FRED)
; (BAZ FRED)

(my-cons 2 8)
; (2 8)


; 2.19 fill in the results of the following computations
(list 'FRED 'AND 'WILMA)
; (FRED AND WILMA)

(list 'FRED '(AND WILMA))
; (FRED (AND WILMA))

(cons 'FRED '(AND WILMA))
; (FRED AND WILMA)

(cons nil nil)
; (NIL)

(list nil nil)
; (NIL NIL)


; 20 what results are returned by the following?
 (list nil)
; (NIL)

(list t nil)
; (T NIL)

(cons t nil)
; (T)

(cons '(t) nil)
; ((T))

(list '(IN ONE EAR) '(OUT THE OTHER))
; ((IN ONE EAR) (OUT THE OTHER))

(cons '(IN ONE EAR) '(OUT THE OTHER))
; ((IN ONE EAR) OUT THE OTHER)


; 2.21 write a function that takes four inputs and returns a two-element
; list. The first element should be a list of the first two inputs, and the 
; second element a list of the last two inputs
(defun four-inputs (w x y z)
  (list (list w x) (list y z)))

(four-inputs 1 2 3 4)
; ((1 2) (3 4))


; 2.22 write a duo-cons function that adds two elements to the front of a list
(defun duo-cons (x y z)
  (cons x (cons y z)))

(duo-cons 'PATRICK 'SEYMOUR '(MARVIN))
; (PATRICK SEYMOUR MARVIN)

; 2.23 write a two-deeper function that surrounds its input with two levels of parens.
; write another version using cons
(defun two-deeper (x)
  (list (list x)))

(defun two-deeper-cons (x)
  (cons (cons x nil) nil))

(two-deeper 'MOO)
; ((MOO))

(two-deeper-cons 'MOO)
; ((MOO))

(two-deeper '(BOW WOW))
; (((BOW WOW)))

(two-deeper-cons '(BOW WOW))
; (((BOW WOW)))


; 2.24 what built in lisp function would extract the symbol NIGHT from (((GOOD)) ((NIGHT)))
(caaadr '(((GOOD)) ((NIGHT))))
; NIGHT


; 2.25 why do cons cells and the CONS function share the same name?
; because CONS creates a new cons cell
