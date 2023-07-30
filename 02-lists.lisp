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

; [A|.]->[.|.]->[.|.]
;  ...

