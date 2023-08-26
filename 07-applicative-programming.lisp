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


; 7.10. Transpose a song from one key to another
; a. write a NOTE-TABLE variable containing notes and corresponding numbers
(setf note-table
      '((c 1)
        (c-sharp 2)
        (d 3)
        (d-sharp 4)
        (e 5)
        (f 6)
        (f-sharp 7)
        (g 8)
        (g-sharp 9)
        (a 10)
        (a-sharp 11)
        (b 12)))

; b. write a function called NUMBERS that takes a list of notes as
; input and returns the corresponding list of numbers
(second (assoc 'c note-table))
; 1

(defun numbers (l)
  (mapcar #'(lambda (x) (second (assoc x note-table))) l))

(numbers '(e d c e e e))
; (5 3 1 5 5 5)

; c. write a function called NOTES that takes a list of numbers as input
; and returns the corresponding list of notes
(defun notes (l)
  (let ((note-table-r (mapcar #'reverse note-table)))
    (mapcar #'(lambda (x) (second (assoc x note-table-r))) l)))

(notes '(5 3 1 3 5 5 5))
; (E D C D E E E)

; d. NOTES and NUMBERS are mutual inverses. What can be said about 
; (NOTES (NOTES X)) and (NUMBERS (NUMBERS X))

(notes (numbers '(e d c e e e)))
; (E D C E E E)

(numbers (notes '(5 3 1 3 5 5 5)))
; (5 3 1 3 5 5 5)

(notes (notes '(5 3 1 3 5 5 5)))
; (NIL NIL NIL NIL NIL NIL NIL)

(numbers (numbers '(e d c e e e)))
; (NIL NIL NIL NIL NIL NIL)

; e. write a function RAISE that takes a number n and a list of numbers
; as input and raises each number in the list by the value n
(defun raise (n l)
  (mapcar #'(lambda (x) (+ x n)) l))

(raise 5 '(5 3 1 3 5 5 5))
; (10 8 6 8 10 10 10)

; f. write a function NORMALIZE that takes a list of numbers as input
; and normalizes the list to make the numbers between 1 and 12

(defun normalize-number (n)
  (cond ((> n 12) (- n 12))
        ((< n 1) (+ n 12))
        (t n)))

(normalize-number 13)
; 1
(normalize-number -2)
; 10
(normalize-number 6)
; 6
(normalize-number 10)
; 10

(defun normalize (l)
  (mapcar #'normalize-number l))

(normalize '(6 10 13))
; (6 10 1)

; g. write a function TRANSPOSE that takes a number n and a song as
; input and returns the song transposed by n half steps
(defun transpose (n x)
  (notes (normalize (raise n (numbers x)))))

(transpose 5 '(E D C D E E E))
; (A G F G A A A)

(setf mary-little-lamb '(A G F G A A A))

(transpose 11 mary-little-lamb)
; (G-SHARP F-SHARP E F-SHARP G-SHARP G-SHARP G-SHARP)
(transpose 12 mary-little-lamb)
; (A G F G A A A)
(transpose 1 mary-little-lamb)
; (A-SHARP G-SHARP F-SHARP G-SHARP A-SHARP A-SHARP A-SHARP)


; REMOVE-IF and REMOVE-IF-NOT
(remove-if #'numberp '(2 for 1 sale))
; (FOR SALE)

(remove-if #'oddp '(1 2 3 4 5 6 7))
; (2 4 6)

(remove-if-not #'plusp '(2 0 -4 6 -8 10))
; (2 6 10)

(remove-if-not #'oddp '(2 0 -4 6 -8 10))
; NIL


; 7.11. write a function to pick out numbers in a list that are greater
; than 1 and less than 5
(defun pick-numbers (l)
  (remove-if-not 
    #'(lambda (x) 
        (and (> x 1) (< x 5))) 
    l))

(pick-numbers '(10 2 6 -5 4))
; (2 4)


; 7.12. write a function that counts how many times the word "the" appears in
; a sentence
(defun the-count (l)
  (length 
    (remove-if-not 
      #'(lambda (x) 
          (equal x 'the)) 
      l)))

(the-count '(the cat sat on the mat))
; 2

(the-count '(hello world))
; 0

(the-count '(these are the greatest days))
; 1


; 7.13. write a funciton that picks from a list of lists those of exactly length
; two
(defun length-two-lists (l)
  (remove-if-not #'(lambda (x) (equal (length x) 2)) l))

(length-two-lists '((one two)
                    (three four five)
                    (six seven)
                    (8 9)
                    (10 11 12)))
; ((ONE TWO) (SIX SEVEN) (8 9))

(length-two-lists '())
; NIL


; 7.14. show how the INTERSECTION and UNION functions can be written using
; REMOVE-IF and REMOVE-IF-NOT
(setf soap-info '(soap water))

(defun my-setdiff (x y)
  (remove-if #'(lambda (e) (member e y))
             x))

(set-difference soap-info '(stop for water))
; (SOAP)
(my-setdiff soap-info '(stop for water))
; (SOAP)

(defun my-union (x y)
  (remove-duplicates 
    (append x y)))

(defun my-union-remove-if (x y)
  (append x
          (remove-if
            #'(lambda (e)
                (member e x))
            y)))

(union soap-info '(no soap radio soap))
; (RADIO NO SOAP WATER)

(my-union soap-info '(no soap radio soap))
; (WATER NO RADIO SOAP)

(my-union-remove-if soap-info '(no soap radio soap))
; (SOAP WATER NO RADIO)

(defun my-intersection (x y)
  (remove-if-not #'(lambda (e) 
                     (member e y))
                 x))

(intersection soap-info '(soap biscuits water))
; (WATER SOAP)

(my-intersection soap-info '(soap biscuits water))
; (SOAP WATER)


; 7.15. playing cards
; a. write the functions RANK and SUIT that return the rank and suit of a card
(defun rank (l)
   (first l))

(defun suit (l)
  (second l))

(rank '(2 clubs))
; 2

(suit '(2 clubs))
; CLUBS

; b. set the global variable MY-HAND and write a function COUNT-SUIT that returns
; the number of cards belonging to that suit
(setf my-hand
      '((3 hearts)
        (5 clubs)
        (2 diamonds)
        (4 diamonds)
        (ace spades)))

(defun count-suit (x y)
  (length 
    (remove-if-not #'(lambda (e) 
                       (equal (suit e) x))
                   y)))

(count-suit 'diamonds my-hand)
; 2
(count-suit 'clubs my-hand)
; 1
(count-suit 'hearts my-hand)
; 1
(count-suit 'spades my-hand)
; 1
