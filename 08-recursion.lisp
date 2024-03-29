; A function to search for odd numbers
(defun anyoddp (x)
  (cond ((null x) nil)
        ((oddp (first x)) t)
        (t (anyoddp (rest x)))))

; (dtrace anyoddp)

(anyoddp nil)
; NIL
; ----Enter ANYODDP
; |     Arg-1 = NIL
;  \--ANYODDP returned NIL

(anyoddp '(7))
; T
; ----Enter ANYODDP
; |     Arg-1 = (7)
;  \--ANYODDP returned T

(anyoddp '(6))
; NIL
; ----Enter ANYODDP
; |     Arg-1 = (6)
; |   ----Enter ANYODDP
; |   |     Arg-1 = NIL
; |    \--ANYODDP returned NIL
;  \--ANYODDP returned NIL

(anyoddp '(6 7))
; T
; ----Enter ANYODDP
; |     Arg-1 = (6 7)
; |   ----Enter ANYODDP
; |   |     Arg-1 = (7)
; |    \--ANYODDP returned T
;  \--ANYODDP returned T

(anyoddp '(2 4 6 7 8 9))
; T
; ----Enter ANYODDP
; |     Arg-1 = (2 4 6 7 8 9)
; |   ----Enter ANYODDP
; |   |     Arg-1 = (4 6 7 8 9)
; |   |   ----Enter ANYODDP
; |   |   |     Arg-1 = (6 7 8 9)
; |   |   |   ----Enter ANYODDP
; |   |   |   |     Arg-1 = (7 8 9)
; |   |   |    \--ANYODDP returned T
; |   |    \--ANYODDP returned T
; |    \--ANYODDP returned T
;  \--ANYODDP returned T

; 8.1. use a trace to show how ANYODDP would handle the list (3142 5798 6550 8914)
; which COND clause is never true in this case? - the check for ODDP

(anyoddp '(3142 5798 6550 8914))
; NIL
; ----Enter ANYODDP
; |     Arg-1 = (3142 5798 6550 8914)
; |   ----Enter ANYODDP
; |   |     Arg-1 = (5798 6550 8914)
; |   |   ----Enter ANYODDP
; |   |   |     Arg-1 = (6550 8914)
; |   |   |   ----Enter ANYODDP
; |   |   |   |     Arg-1 = (8914)
; |   |   |   |   ----Enter ANYODDP
; |   |   |   |   |     Arg-1 = NIL
; |   |   |   |    \--ANYODDP returned NIL
; |   |   |    \--ANYODDP returned NIL
; |   |    \--ANYODDP returned NIL
; |    \--ANYODDP returned NIL
;  \--ANYODDP returned NIL


; 8.2 show how to write ANYODDP using IF instead of COND

(defun anyoddp-if (x)
  (if (null x) 
    nil
    (if (oddp (first x))
      t
      (anyoddp-if (rest x)))))

(anyoddp-if nil)
; NIL

(anyoddp-if '(7))
; T

(anyoddp-if '(6))
; NIL

(anyoddp-if '(6 7))
; T

(anyoddp-if '(2 4 6 7 8 9))
; T


; A lisp version of the factorial function
(defun fact (n)
  (cond ((zerop n) 1)
        (t (* n (fact (- n 1))))))

; (dtrace fact)

(fact 5)
; 120
; ----Enter FACT
; |     Arg-1 = 5
; |   ----Enter FACT
; |   |     Arg-1 = 4
; |   |   ----Enter FACT
; |   |   |     Arg-1 = 3
; |   |   |   ----Enter FACT
; |   |   |   |     Arg-1 = 2
; |   |   |   |   ----Enter FACT
; |   |   |   |   |     Arg-1 = 1
; |   |   |   |   |   ----Enter FACT
; |   |   |   |   |   |     Arg-1 = 0
; |   |   |   |   |    \--FACT returned 1
; |   |   |   |    \--FACT returned 1
; |   |   |    \--FACT returned 2
; |   |    \--FACT returned 6
; |    \--FACT returned 24
;  \--FACT returned 120


; 8.3. why does (FACT 20.0) produce a different result than (FACT 20)?
; because of floating point numbers and lack of precision
; why do (FACT 0.0) and (FACT 0) both produce the same result?
; because both 0 and 0.0 match the zerop check 

(fact 20.0)
; 2.432902e18

(fact 20)
; 2432902008176640000

(fact 0.0)
; 1

(fact 0)
; 1

; A recursive function for counting slices of bread
(defun count-slices (loaf)
  (cond ((null loaf) 0)
        (t (+ 1 (count-slices (rest loaf))))))

; (dtrace count-slices)
(count-slices nil)
; 0
; ----Enter COUNT-SLICES
; |     Arg-1 = NIL
;  \--COUNT-SLICES returned 0

(count-slices '(x))
; 1
; ----Enter COUNT-SLICES
; |     Arg-1 = NIL
;  \--COUNT-SLICES returned 0
; ----Enter COUNT-SLICES
; |     Arg-1 = (X)
; |   ----Enter COUNT-SLICES
; |   |     Arg-1 = NIL
; |    \--COUNT-SLICES returned 0
;  \--COUNT-SLICES returned 1

(count-slices '(x x))
; 2
; ----Enter COUNT-SLICES
; |     Arg-1 = (X X)
; |   ----Enter COUNT-SLICES
; |   |     Arg-1 = (X)
; |   |   ----Enter COUNT-SLICES
; |   |   |     Arg-1 = NIL
; |   |    \--COUNT-SLICES returned 0
; |    \--COUNT-SLICES returned 1
;  \--COUNT-SLICES returned 2

(count-slices '(x x x x x))
; 5
; ----Enter COUNT-SLICES
; |     Arg-1 = (X X X X X)
; |   ----Enter COUNT-SLICES
; |   |     Arg-1 = (X X X X)
; |   |   ----Enter COUNT-SLICES
; |   |   |     Arg-1 = (X X X)
; |   |   |   ----Enter COUNT-SLICES
; |   |   |   |     Arg-1 = (X X)
; |   |   |   |   ----Enter COUNT-SLICES
; |   |   |   |   |     Arg-1 = (X)
; |   |   |   |   |   ----Enter COUNT-SLICES
; |   |   |   |   |   |     Arg-1 = NIL
; |   |   |   |   |    \--COUNT-SLICES returned 0
; |   |   |   |    \--COUNT-SLICES returned 1
; |   |   |    \--COUNT-SLICES returned 2
; |   |    \--COUNT-SLICES returned 3
; |    \--COUNT-SLICES returned 4
;  \--COUNT-SLICES returned 5

; The three rules of recursion
; 1. Know when to stop
; 2. Decide how to take one step
; 3. Break the journey down into that step plus a smaller journey


; 8.4. 

(defun count-slices (loaf)
  (cond ((null loaf) 0)
        (t (+ 1 (count-slices (rest loaf))))))

(defun laugh (n)
  (cond ((zerop n) nil)
        (t (cons 'ha (laugh (- n 1))))))

(dtrace laugh)

(laugh 0)
; NIL
; ----Enter LAUGH
; |     Arg-1 = 0
;  \--LAUGH returned NIL

(laugh 1)
; (HA)
; ----Enter LAUGH
; |     Arg-1 = 1
; |   ----Enter LAUGH
; |   |     Arg-1 = 0
; |    \--LAUGH returned NIL
;  \--LAUGH returned (HA)

(laugh 5)
; (HA HA HA HA HA)
; ----Enter LAUGH
; |     Arg-1 = 5
; |   ----Enter LAUGH
; |   |     Arg-1 = 4
; |   |   ----Enter LAUGH
; |   |   |     Arg-1 = 3
; |   |   |   ----Enter LAUGH
; |   |   |   |     Arg-1 = 2
; |   |   |   |   ----Enter LAUGH
; |   |   |   |   |     Arg-1 = 1
; |   |   |   |   |   ----Enter LAUGH
; |   |   |   |   |   |     Arg-1 = 0
; |   |   |   |   |    \--LAUGH returned NIL
; |   |   |   |    \--LAUGH returned (HA)
; |   |   |    \--LAUGH returned (HA HA)
; |   |    \--LAUGH returned (HA HA HA)
; |    \--LAUGH returned (HA HA HA HA)
;  \--LAUGH returned (HA HA HA HA HA)

; (laugh -1)
; infinite loop
; |   |   |   |   |   |   |   |   |     Arg-1 = -16854
; |   |   |   |   |   |   |   |   |   ----Enter LAUGH
; |   |   |   |   |   |   |   |   |   |     Arg-1 = -16855
; INFO: Control stack guard page unprotected
; Control stack guard page temporarily disabled: proceed with caution


; 8.5. write an ADD-UP function by answering these questions
; a.
; - when do we stop? when the list is empty
; - is there any list for which we immediately know hat the sum of all its
; elements is? () or nil is equal to 0
; - what is that list? ()
; - what value should the function return if it gets that list as input: 0

; b. do we know how to take a single step? base case: (null l) 0

; c. how should ADD-UP call itself recursively to solve the rest of the
; problem
; (t (+ (first l) (testing-add (rest l))))
; it will keep adding the first of the rest of the list to the total until
; the list is empty

(defun add-up (l)
  (cond ((null l) 0)
        (t (+ (first l) (add-up (rest l))))))

; (dtrace add-up)

(add-up '(2 3 7))
; 12
; ----Enter ADD-UP
; |     Arg-1 = (2 3 7)
; |   ----Enter ADD-UP
; |   |     Arg-1 = (3 7)
; |   |   ----Enter ADD-UP
; |   |   |     Arg-1 = (7)
; |   |   |   ----Enter ADD-UP
; |   |   |   |     Arg-1 = NIL
; |   |   |    \--ADD-UP returned 0
; |   |    \--ADD-UP returned 7
; |    \--ADD-UP returned 10
;  \--ADD-UP returned 12


; 8.6. write the function ALLODDP that returns T if all numbers in a list
; are odd

 (defun alloddp (l)
   (cond ((null l) t)
         ((evenp (first l)) nil)
         (t (alloddp (rest l)))))

(alloddp '(1 3 5 7))
; T

(alloddp '(1 3 4 7))
; NIL

; 8.7. write a recursive version of MEMBER

(setf ducks '(huey dewey louie))
; (HUEY DEWEY LOUIE)

(member 'dewey ducks)
; (DEWEY LOUIE)

(defun rec-member (match l)
  (cond ((null l) nil)
        ((equal (first l) match) l)
        (t (rec-member match (rest l)))))

(rec-member 'huey ducks)
; (HUEY DEWEY LOUIE)

(rec-member 'dewey ducks)
; (DEWEY LOUIE)

(rec-member 'louie ducks)
; (LOUIE)

(rec-member 'kablouie ducks)
; NIL


; 8.8. write a recursive version of ASSOC
(setf produce2
      '((apple fruit) 
        (celery veggie)
        (banana fruit)
        (lettuce veggie)))

(assoc 'apple produce2)
; (APPLE FRUIT)

(defun assoc-rec (x l)
   (cond ((null l) nil)
         ((equal (first (first l)) x) (first l))
         (t (assoc-rec x (rest l)))))

(assoc-rec 'apple produce2)
; (APPLE FRUIT)

(assoc-rec 'celery produce2)
; (CELERY VEGGIE)

(assoc-rec 'banana produce2)
; (BANANA FRUIT)

(assoc-rec 'lettuce produce2)
; (LETTUCE VEGGIE)

(assoc-rec 'kiwi produce2)
; NIL

(assoc-rec 'fruit produce2)
; NIL


; 8.9. write a recursive version of NTH. Call it REC-NTH
(defun rec-nth (i l)
  (cond ((null l) nil)
        ((equal i 0) (first l))
        (t (rec-nth (- i 1) (rest l)))))

(rec-nth 0 '(a b c))
; A

(rec-nth 1 '(a b c))
; B

(rec-nth 2 '(a b c))
; C


; 8.10. create a REC-PLUS function (a recursive version of +)
; - for x a non-negative integer and y a positive integer, x+y = x+1+(y-1)
; - if y is zero then x+y = x
; use ADD1, SUB1, COND and ZEROP

(defun add1 (x)
  (+ x 1))

(defun sub1 (x)
  (- x 1))

(defun rec-plus (x y)
  (cond ((zerop y) x)
        (t (rec-plus (add1 x) (sub1 y)))))
 
(rec-plus 1 2)
; 3

(rec-plus 0 0) ; FIB
; 0


(defun collatz (n)
  (cond ((equal n 1) t)
        ((evenp n) (collatz (/ n 2)))
        (t (collatz (+ (* 3 n) 1)))))

(dtrace collatz)


; Collatz's conjecture - there are no (positive) inputs which cause the function 
; to recurse infinitely
; There is also no clear relation between the size of the input and number of
; recursive calls

(collatz 1)
; ----Enter COLLATZ
; |     Arg-1 = 1
;  \--COLLATZ returned T

(collatz 3)
; ----Enter COLLATZ
; |     Arg-1 = 3
; |   ----Enter COLLATZ
; |   |     Arg-1 = 10
; |   |   ----Enter COLLATZ
; |   |   |     Arg-1 = 5
; |   |   |   ----Enter COLLATZ
; |   |   |   |     Arg-1 = 16
; |   |   |   |   ----Enter COLLATZ
; |   |   |   |   |     Arg-1 = 8
; |   |   |   |   |   ----Enter COLLATZ
; |   |   |   |   |   |     Arg-1 = 4
; |   |   |   |   |   |   ----Enter COLLATZ
; |   |   |   |   |   |   |     Arg-1 = 2
; |   |   |   |   |   |   |   ----Enter COLLATZ
; |   |   |   |   |   |   |   |     Arg-1 = 1
; |   |   |   |   |   |   |    \--COLLATZ returned T
; |   |   |   |   |   |    \--COLLATZ returned T
; |   |   |   |   |    \--COLLATZ returned T
; |   |   |   |    \--COLLATZ returned T
; |   |   |    \--COLLATZ returned T
; |   |    \--COLLATZ returned T
; |    \--COLLATZ returned T
;  \--COLLATZ returned T

(collatz 8)
; ----Enter COLLATZ
; |     Arg-1 = 8
; |   ----Enter COLLATZ
; |   |     Arg-1 = 4
; |   |   ----Enter COLLATZ
; |   |   |     Arg-1 = 2
; |   |   |   ----Enter COLLATZ
; |   |   |   |     Arg-1 = 1
; |   |   |    \--COLLATZ returned T
; |   |    \--COLLATZ returned T
; |    \--COLLATZ returned T
;  \--COLLATZ returned T


; 8.11. write a correct version of the FIB function

(defun fib (n)
  (cond ((or (equal n 0) (equal n 1)) 1)
         (t (+ (fib (- n 1)) 
               (fib (- n 2))))))

; (dtrace fib)

(fib 4)
; 5
; ----Enter FIB
; |     Arg-1 = 4
; |   ----Enter FIB
; |   |     Arg-1 = 3
; |   |   ----Enter FIB
; |   |   |     Arg-1 = 2
; |   |   |   ----Enter FIB
; |   |   |   |     Arg-1 = 1
; |   |   |    \--FIB returned 1
; |   |   |   ----Enter FIB
; |   |   |   |     Arg-1 = 0
; |   |   |    \--FIB returned 1
; |   |    \--FIB returned 2
; |   |   ----Enter FIB
; |   |   |     Arg-1 = 1
; |   |    \--FIB returned 1
; |    \--FIB returned 3
; |   ----Enter FIB
; |   |     Arg-1 = 2
; |   |   ----Enter FIB
; |   |   |     Arg-1 = 1
; |   |    \--FIB returned 1
; |   |   ----Enter FIB
; |   |   |     Arg-1 = 0
; |   |    \--FIB returned 1
; |    \--FIB returned 2
;  \--FIB returned 5

(fib 5)
; 8
; ----Enter FIB
; |     Arg-1 = 5
; |   ----Enter FIB
; |   |     Arg-1 = 4
; |   |   ----Enter FIB
; |   |   |     Arg-1 = 3
; |   |   |   ----Enter FIB
; |   |   |   |     Arg-1 = 2
; |   |   |   |   ----Enter FIB
; |   |   |   |   |     Arg-1 = 1
; |   |   |   |    \--FIB returned 1
; |   |   |   |   ----Enter FIB
; |   |   |   |   |     Arg-1 = 0
; |   |   |   |    \--FIB returned 1
; |   |   |    \--FIB returned 2
; |   |   |   ----Enter FIB
; |   |   |   |     Arg-1 = 1
; |   |   |    \--FIB returned 1
; |   |    \--FIB returned 3
; |   |   ----Enter FIB
; |   |   |     Arg-1 = 2
; |   |   |   ----Enter FIB
; |   |   |   |     Arg-1 = 1
; |   |   |    \--FIB returned 1
; |   |   |   ----Enter FIB
; |   |   |   |     Arg-1 = 0
; |   |   |    \--FIB returned 1
; |   |    \--FIB returned 2
; |    \--FIB returned 5
; |   ----Enter FIB
; |   |     Arg-1 = 3
; |   |   ----Enter FIB
; |   |   |     Arg-1 = 2
; |   |   |   ----Enter FIB
; |   |   |   |     Arg-1 = 1
; |   |   |    \--FIB returned 1
; |   |   |   ----Enter FIB
; |   |   |   |     Arg-1 = 0
; |   |   |    \--FIB returned 1
; |   |    \--FIB returned 2
; |   |   ----Enter FIB
; |   |   |     Arg-1 = 1
; |   |    \--FIB returned 1
; |    \--FIB returned 3
;  \--FIB returned 8


; 8.12. consider ANY-7-P 
(defun any-7-p (x)
  (cond ((equal (first x) 7) t)
        (t (any-7-p (rest x)))))

; give a sample input for which the function will work correctly
 (any-7-p '(1 8 7 5 4))
; T

; give an example where it will recurse infinitely
 ; (any-7-p nil)


; 8.13. review the definition of the function FACT. What sort of input could you
; give it to cause an infinite recursion?
; (fact -1)


; 8.14. write the very shortest infinite recursion function you can
(defun inf-rec (n)
  (inf-rec (- n 1)))

; (inf-rec 5)


; 8.15
; what is the car if this list? x
; what is the cdr? the list
; what will COUNT-SLICES do when given this list as input? recurse infinitely


; Recursion templates

; Double-test tail recursion
; (defun func (x)
;   (cond (end-test-1 end-value-1)
;         (end-test-2 end-value-2)
;         (t (func reduced-x))))

; Func: ANYODDP
; End-test-1: (NULL X)
; End-value-1: NIL
; End-test-2: (ODDP (FIRST X))
; End-value-2: T
; Reduced-x: (REST X)

(defun anyoddp (x)
  (cond ((null x) nil)
        ((oddp (first x)) t)
        (t (anyoddp (rest x)))))

; This function is said to be tail-recursive because the action part of the
; last COND clause does not do any work after the recursive call


; 8.16. what would happen if we switched the first and second COND clauses in
; ANYODDP?
; It works for all cases except the nil case where it throws an error

(defun anyoddp-re (x)
  (cond ((oddp (first x)) t)
        ((null x) nil)
        (t (anyoddp (rest x)))))

(anyoddp nil)
; NIL

(anyoddp-re nil)
; The value NIL is not of type INTEGER

(anyoddp '(7))
; T

(anyoddp-re '(7))
; T

(anyoddp '(6))
; NIL

(anyoddp-re '(6))
; NIL

(anyoddp '(6 7))
; T

(anyoddp-re '(6 7))
; T

(anyoddp '(2 4 6 7 8 9))
; T

(anyoddp-re '(2 4 6 7 8 9))
; T


; 8.17. use double-test tail recursion to write FIND-FIRST-ODD, a function
; that returns the first odd number in a list, or NIL if there are none

(defun find-first-odd (x)
  (cond ((null x) nil)
        ((oddp (first x)) (first x))
        (t (find-first-odd (rest x)))))

(find-first-odd nil)
; NIL

(find-first-odd '(7))
; 7

(find-first-odd '(6))
; NIL

(find-first-odd '(6 7))
; 7

(find-first-odd '(2 4 6 7 8 9))
; 7


; Single-test tail recursion
; In general single-test recursion is used when we know the function will always
; find what it's looking for eventually
; double-test recursion is used when there is a possibility the function might
; not find what it's looking for

; Template:
; (defun func (x)
;   (cond (end-test end-value)
;         (t (func reduced-x))))

; Example:
; Func: FIND-FIRST-ATOM
; End-test: (atom x)
; End-value: x
; Reduced-x: (first x)

(defun find-first-atom (x)
  (cond ((atom x) x)
        (t (find-first-atom (first x)))))

(find-first-atom '(ooh ah eee))
; OOH

(find-first-atom '((((a f)) i) r))
; A

(find-first-atom 'fred)
; FRED


; 8.18. use single-test tail recursion to write LAST-ELEMENT, a function that
; returns the last element of a list
(defun last-element (x)
  (cond ((atom (cdr x)) (car x))
        (t (last-element (cdr x)))))

(find-last-element '((((a f)) i) r))
; R


; 8.19. if we convert anyoddp to use singlne-test tail recursion in which
; cases would the function still work? where would it fail?
(defun anyoddp-single (x)
  (cond ((oddp (first x)) t)
        (t (anyoddp (rest x)))))

(anyoddp-single nil)
; The value NIL is not of type INTEGER

(anyoddp-single '(7))
; T

(anyoddp-single '(6))
; NIL

(anyoddp-single '(6 7))
; T

(anyoddp-single '(2 4 6 7 8 9))
; T


; Single-test augmenting recursion
; template
; (defun func (x)
;   (cond (end-test end-value)
;         (t (aug-fun aug-val)
;            (func reduced-x))))

; example
; Func: COUNT-SLICES
; End-test: (NULL X)
; End-value: 0
; Aug-fun: +
; Aug-val: 1
; Reduced-x: (REST X)

(defun count-slices-aug (x)
  (cond ((null x) 0)
        (t (+ 1 (count-slices (rest x))))))


; 8.20. which template describes FACT, the factorial function?
; write down the values of he various template components of FACT

; Single-test augmenting recursion

; Func: FACT-AUG
; End-test: (ZEROP N)
; End-value: 1
; Aug-fun: *
; Aug-val: N
; Reduced-x: (- N 1)

(defun fact-aug (n)
  (cond ((zerop n) 1)
        (t (* n (fact (- n 1))))))


; 8.21. write a recursive function ADD-NUMS that adds up the numbers N, N-1,
; N-2 etc down to 0 and returns the result
; (ADD-NUMS 5) should compute 5+4+3+2+1+0 which is 15

(defun add-nums (n)
  (cond ((zerop n) 0)
        (t (+ n (add-nums (- n 1))))))

; (dtrace add-nums)

(add-nums 5)
; 15
; ----Enter ADD-NUMS
; |     Arg-1 = 5
; |   ----Enter ADD-NUMS
; |   |     Arg-1 = 4
; |   |   ----Enter ADD-NUMS
; |   |   |     Arg-1 = 3
; |   |   |   ----Enter ADD-NUMS
; |   |   |   |     Arg-1 = 2
; |   |   |   |   ----Enter ADD-NUMS
; |   |   |   |   |     Arg-1 = 1
; |   |   |   |   |   ----Enter ADD-NUMS
; |   |   |   |   |   |     Arg-1 = 0
; |   |   |   |   |    \--ADD-NUMS returned 0
; |   |   |   |    \--ADD-NUMS returned 1
; |   |   |    \--ADD-NUMS returned 3
; |   |    \--ADD-NUMS returned 6
; |    \--ADD-NUMS returned 10
;  \--ADD-NUMS returned 15


; 8.22. write a recursive function ALL-EQUAL that returns T if the first element
; of a list is equal to the second, the second is equal to the third, the third
; is equal to the fourth etc
; ALL-EQUAL should return T for lists with less than two elements
; Does this problem require augmentation? No
; Which template will you use to solve it? double-test tail recursion

(defun all-equal (x)
  (cond ((< (length x) 2) t)
        ((not (equal (first x) (second x))) nil)
        (t (all-equal (rest x)))))
; Book suggests (null (rest x)) rather than length check

(all-equal '(I I I I))
; T

(all-equal '(I I E I))
; NIL

(all-equal '(I))
; T

(all-equal '())
; T


; List-consing recursion
; Used frequently in Lisp - a special case of augmenting recursion where the
; augmentation function is CONS

; template
; (defun func (n)
;   (cond (end-test nil)
;         (t (cons new-element
;                  (func reduced-n)))))

; example
; Func: LAUGH
; End-test: (ZEROP N)
; New-element: 'HA
; Reduced-n: (- N 1)

(defun laugh-cons (n)
  (cond ((zerop n) nil)
        (t (cons 'ha (laugh (- n 1))))))


; Simultaneous recursion on several variables
; template:
; (defun func (n x)
;   (cond (end-test end-value)
;         (t (func reduced-n reduced-x))))
;

; example:
; Func: MY-NTH
; End-test: (ZEROP N)
; End-value: (FIRST X)
; Reduced-n: (- N 1)
; Reduced-x: (REST X)

(defun my-nth-sim (n x)
  (cond ((zerop n) (first x))
        (t (my-nth-sim (- n 1) (rest x)))))


; 8.28. the expressions (MY-NTH 5 '(A B C)) and (MY-NTH 1000 '(A B C)) both run
; off the end of the list and hence produce a NIL result
; The second expressions takes much longer to execute than the first
; Modify MY-NTH-SIM so that the recursion stops as soon as the function runs off
; the end of the list

(time (my-nth-sim 5 '(a b c)))  
; NIL
; 0.000 seconds of real time
; 0.000012 seconds of total run time (0.000012 user, 0.000000 system)
; 100.00% CPU
; 1,505 processor cycles
; 0 bytes consed

(time (my-nth-sim 100005000 '(a b c))) 
; NIL
; 1.057 seconds of real time
; 4.078989 seconds of total run time (4.078989 user, 0.000000 system)
; 385.90% CPU
; 2,320,488,262 processor cycles
; 0 bytes consed

(defun my-nth-sim2 (n x)
  (cond ((zerop n) (first x))
        ((null x) nil)
        (t (my-nth-sim2 (- n 1) (rest x)))))


(time (my-nth-sim2 5 '(a b c)))  
; NIL
; 0.000 seconds of real time
; 0.000007 seconds of total run time (0.000007 user, 0.000000 system)
; 100.00% CPU
; 1,372 processor cycles
; 0 bytes consed

(time (my-nth-sim2 100005000 '(a b c))) 
; NIL
; 0.000 seconds of real time
; 0.000008 seconds of total run time (0.000008 user, 0.000000 system)
; 100.00% CPU
; 1,129 processor cycles
; 0 bytes consed


; 8.29. write MY-MEMBER, a recursive version of MEMBER.
(defun my-member (match l)
  (cond ((null l) nil)
        ((equal match (first l)) l)
        (t (my-member match (rest l)))))

(my-member 'huey ducks)
; (HUEY DEWEY LOUIE)

(my-member 'dewey ducks)
; (DEWEY LOUIE)

(my-member 'louie ducks)
; (LOUIE)

(my-member 'kablouie ducks)
; NIL


; 8.30. write MY-ASSOC, a recursive version of ASSOC
(defun my-assoc (x l)
   (cond ((null l) nil)
         ((equal x (car (first l))) (first l))
         (t (my-assoc x (rest l)))))

(my-assoc 'apple produce2)
; (APPLE FRUIT)

(my-assoc 'celery produce2)
; (CELERY VEGGIE)

(my-assoc 'banana produce2)
; (BANANA FRUIT)

(my-assoc 'lettuce produce2)
; (LETTUCE VEGGIE)

(my-assoc 'kiwi produce2)
; NIL

(my-assoc 'fruit produce2)
; NIL


; 8.31.
; - Want to tell as quickly as possible whether one list is shorter than another
; - Write a recursive function COMPARE-LENGTHS that takes two lists as input
; and returns SAME-LENGTH, FIRST-IS-LONGER or SECOND-IS-LONGER
; - Use triple-test simultaneous recursion
; - If x is shorter than y and both are nonempty (REST x) is shorter than (REST y)

; (defun func (n x)
;   (cond (end-test end-value)
;         (t (func reduced-n reduced-x))))

(defun compare-lengths (x y)
  (cond ((and (null x) (null y)) 'SAME-LENGTH)
        ((null y) 'FIRST-IS-LONGER)
        ((null x) 'SECOND-IS-LONGER)
        (t (compare-lengths (rest x) (rest y)))))

(compare-lengths '(a b c) '(d e f))
; SAME-LENGTH

(compare-lengths '(a b c d) '(e f))
; FIRST-IS-LONGER

(compare-lengths '(a b) '(c d e f))
; SECOND-IS-LONGER


; Conditional augmentation
; in some list processing problems we want to skip certain elements of the list
; and use only the remaining ones to build up the result

; template
; (defun func (x)
;   (cond (end-test end-value)
;         (aug-test (aug-fun aug-val
;                            (func reduced-x)))
;         (t (func reduced-x))))

; example
; Func: EXTRACT-SYMBOLS
; End-test: (NULL X)
; End-value: NIL
; Aug-test: (SYMBOLP (FIRST X))
; Aug-fun: CONS
; Aug-val: (FIRST X)
; Reduced-x: (REST X)

(defun extract-symbols (x)
  (cond ((null x) nil)
        ((symbolp (first x))
         (cons (first x)
               (extract-symbols (rest x))))
        (t (extract-symbols (rest x)))))

; (dtrace extract-symbols)

(extract-symbols '(3 bears and 1 girl)) 
; (BEARS AND GIRL)
; ----Enter EXTRACT-SYMBOLS
; |     Arg-1 = (3 BEARS AND 1 GIRL)
; |   ----Enter EXTRACT-SYMBOLS
; |   |     Arg-1 = (BEARS AND 1 GIRL)
; |   |   ----Enter EXTRACT-SYMBOLS
; |   |   |     Arg-1 = (AND 1 GIRL)
; |   |   |   ----Enter EXTRACT-SYMBOLS
; |   |   |   |     Arg-1 = (1 GIRL)
; |   |   |   |   ----Enter EXTRACT-SYMBOLS
; |   |   |   |   |     Arg-1 = (GIRL)
; |   |   |   |   |   ----Enter EXTRACT-SYMBOLS
; |   |   |   |   |   |     Arg-1 = NIL
; |   |   |   |   |    \--EXTRACT-SYMBOLS returned NIL
; |   |   |   |    \--EXTRACT-SYMBOLS returned (GIRL)
; |   |   |    \--EXTRACT-SYMBOLS returned (GIRL)
; |   |    \--EXTRACT-SYMBOLS returned (AND GIRL)
; |    \--EXTRACT-SYMBOLS returned (BEARS AND GIRL)
;  \--EXTRACT-SYMBOLS returned (BEARS AND GIRL)


; 8.32. write the function SUM-NUMERIC-ELEMENTS which adds up all the numbers
; in a list and ignores the non-numbers
 (defun sum-numeric-elements (x)
   (cond ((null x) 0)
         ((numberp (first x))
          (+ (first x)
             (sum-numeric-elements (rest x))))
         (t (sum-numeric-elements (rest x)))))

(sum-numeric-elements '(3 bears 3 bowls and 1 girl)) 
; 7


; 8.33. write MY-REMOVE, a recursive version of the REMOVE function
(setf line-3 '(roses are red and blue and so are you))

(defun my-remove (m l)
  (cond ((null l) nil)
        ((not (equal m (first l)))
         (cons (first l)
               (my-remove m (rest l))))
        (t (my-remove m (rest l)))))

(remove 'are line-2)
; (ROSES RED AND BLUE AND SO YOU)

(my-remove 'are line-2)
; (ROSES RED AND BLUE AND SO YOU)

(remove 'and line-2)
; (ROSES ARE RED BLUE SO ARE YOU)

(my-remove 'and line-2)
; (ROSES ARE RED BLUE SO ARE YOU)


; 8.34. write MY-INTERSECTION, a recursive version of the INTERSECTION function
(setf line-4 '(roses are green at haloween))

(member 'green line-4)

(defun my-intersection (x y)
  (cond ((null x) nil)
        ((member (first x) y)
         (cons (first x)
               (my-intersection (rest x) y)))
        (t (my-intersection (rest x) y))))

(intersection line-3 line-4)
; (ARE ARE ROSES)

(my-intersection line-3 line-4)
; (ROSES ARE ARE)


; 8.35. write MY-SET-DIFFERENCE, a recursive version of the SET-DIFFERENCE function
(defun my-set-difference (x y)
  (cond ((null x) nil)
        ((not (member (first x) y))
         (cons (first x)
               (my-set-difference (rest x) y)))
        (t (my-set-difference (rest x) y))))

(set-difference line-3 line-4)
; (YOU SO AND BLUE AND RED)

(my-set-difference line-3 line-4)
; (RED AND BLUE AND SO YOU)


; 8.36. COUNT-ODD counts the number of odd elements in a list of numbers
; (COUNT-ODD '(4 5 6 7 8)) should return 2
; Write COUNT-ODD using conditional augmentation
; Write another version of COUNT-ODD using the regular augmenting template (to
; do this write a conditional expression for the augmentation value)

(defun count-odd-aug (x)
  (cond ((null x) 0)
        ((oddp (first x))
         (+ 1 (count-odd-aug (rest x))))
        (t (count-odd-aug (rest x)))))

(count-odd-aug '(4 5 6 7 8))
; 2

(count-odd-aug '(4 6 8))
; 0

(defun count-odd-reg (x)
  (cond ((null x) 0)
        (t (if (oddp (first x))
             (+ 1 (count-odd-reg (rest x)))
             (count-odd-reg (rest x))))))

(count-odd-reg '(4 5 6 7 8))
; 2

(count-odd-reg '(4 6 8))
; 0


; Multiple recursion
; A function is multiple recursive if it makes more than one recursive call
; with each invocation
; The fibonacci function is a classic example of multiple recursion. Fib(N) calls
; itself twice: once for Fib(N-1) and again for Fib(N-2). The result of the two 
; calls are combined using +

; Template
; (defun func (n)
;   (cond (end-test-1 end-value-1)
;         (end-test-2 end-value-l)
;         (t (combiner (func first-reduced-n)
;                      (func second-reduced-n)))))

; Example
; Func: FIB
; End-test-1: (EQUAL N 0)
; End-value-1: (EQUAL N 1)
; End-value-2: 1
; Combiner: +
; First-reduced-n: (- N 1)
; Second-reduced-n: (- N 2)

(defun fib-2 (n)
  (cond ((equal n 0) 1)
        ((equal n 1) 1)
        (t (+ (fib (- n 1))
              (fib (- n 2))))))

; (dtrace fib-2)

(fib 3)
; 3
; ----Enter FIB
; |     Arg-1 = 3
; |   ----Enter FIB
; |   |     Arg-1 = 2
; |   |   ----Enter FIB
; |   |   |     Arg-1 = 1
; |   |    \--FIB returned 1
; |   |   ----Enter FIB
; |   |   |     Arg-1 = 0
; |   |    \--FIB returned 1
; |    \--FIB returned 2
; |   ----Enter FIB
; |   |     Arg-1 = 1
; |    \--FIB returned 1
;  \--FIB returned 3


; 8.37. define a function COMBINE that takes two numbers as input and returns
; their sum
; Replace the occurrence of + in FIB with COMBINE
; Trace FIB and COMBINE and try evaluating (FIB 3) or (FIB 4)
; What can you say about the relationship between COMBINE, terminal calls and
; nonterminal calls?

(defun combine (x y)
  (+ x y))

(dtrace combine)

(defun fib-3 (n)
  (cond ((equal n 0) 1)
        ((equal n 1) 1)
        (t (combine (fib (- n 1))
                    (fib (- n 2))))))

(dtrace fib-3)

(fib-3 3)
; 3
; ----Enter FIB-3
; |     Arg-1 = 3
; |   ----Enter FIB
; |   |     Arg-1 = 2
; |   |   ----Enter FIB
; |   |   |     Arg-1 = 1
; |   |    \--FIB returned 1
; |   |   ----Enter FIB
; |   |   |     Arg-1 = 0
; |   |    \--FIB returned 1
; |    \--FIB returned 2
; |   ----Enter FIB
; |   |     Arg-1 = 1
; |    \--FIB returned 1
; |   ----Enter COMBINE
; |   |     Arg-1 = 2
; |   |     Arg-2 = 1
; |    \--COMBINE returned 3
;  \--FIB-3 returned 3

(fib-3 4)
; ----Enter FIB-3
; |     Arg-1 = 4
; |   ----Enter FIB
; |   |     Arg-1 = 3
; |   |   ----Enter FIB
; |   |   |     Arg-1 = 2
; |   |   |   ----Enter FIB
; |   |   |   |     Arg-1 = 1
; |   |   |    \--FIB returned 1
; |   |   |   ----Enter FIB
; |   |   |   |     Arg-1 = 0
; |   |   |    \--FIB returned 1
; |   |    \--FIB returned 2
; |   |   ----Enter FIB
; |   |   |     Arg-1 = 1
; |   |    \--FIB returned 1
; |    \--FIB returned 3
; |   ----Enter FIB
; |   |     Arg-1 = 2
; |   |   ----Enter FIB
; |   |   |     Arg-1 = 1
; |   |    \--FIB returned 1
; |   |   ----Enter FIB
; |   |   |     Arg-1 = 0
; |   |    \--FIB returned 1
; |    \--FIB returned 2
; |   ----Enter COMBINE
; |   |     Arg-1 = 3
; |   |     Arg-2 = 2
; |    \--COMBINE returned 5
;  \--FIB-3 returned 5

; Every nonterminal call to FIB makes one call to combine
; Every call to COMBINE combines the results of two more calls to FIB


; Trees and CAR/CDR recursion

; CAR/CDR recursion
; A special case of multiple recursion

; Template:
; (defun func (x)
;   (cond (end-test-1 end-value-1)
;         (end-test-2 end-value-2)
;         (t (combiner (func (car x)
;                            (cdr x))))))

; Example:
; Func: FIND-NUMBER
; End-test-1: (NUMBERP X)
; End-value-1: X
; End-test-2: (ATOM X)
; End-value-2: NIL
; Combiner: OR

(defun find-number (x)
  (cond ((numberp x) x)
        ((atom x) nil)
        (t (or (find-number (car x))
               (find-number (cdr x))))))

(find-number '(a b c d))
; NIL

(find-number '(a b 5 d 7))
; 5

(defun atoms-to-q (x)
  (cond ((null x) nil)
        ((atom x) 'q)
        (t (cons (atoms-to-q (car x))
                 (atoms-to-q (cdr x))))))

(atoms-to-q '(a . b))
; (Q . Q)

(atoms-to-q '(hark (harold the angel) sings))
; (Q (Q Q Q) Q)


; 8.38. what would be the effect of deleting the first COND clause in ATOMS-TO-Q?

(defun atoms-to-q-no-null (x)
  (cond ((atom x) 'q)
        (t (cons (atoms-to-q-no-null (car x))
                 (atoms-to-q-no-null (cdr x))))))

(atoms-to-q-no-null '(a . b))
; (Q . Q)

(atoms-to-q-no-null '(hark (harold the angel) sings))
; (Q (Q Q Q . Q) Q . Q)

; It converts NIL to Q in the output


; 8.39. write a function COUNT-ATOMS that returns the number of atoms in a tree

(defun atoms-to-q (x)
  (cond ((null x) nil)
        ((atom x) 'q)
        (t (cons (atoms-to-q (car x))
                 (atoms-to-q (cdr x))))))

(defun count-atoms (x)
  (cond ((null x) 1)
        ((atom x) 1)
        (t (+ (count-atoms (car x))
              (count-atoms (cdr x))))))

(count-atoms '(a (b) c))
; 5


; 8.40. write a function COUNT-CONS that returns the number of cons cells in a
; tree

(defun count-cons (x)
  (cond ((atom x) 0)
        (t (+ 1 
              (count-cons (car x))
              (count-cons (cdr x))))))

(count-cons 'fred)
; 0

(count-cons '(foo bar))
; 2

(count-cons '(foo)) 
; 1

(count-cons '((foo))) 
; 2


; 8.41. write a function SUM-TREE that returns the sum of all the numbers appearing
; in a tree. Non-numbers should be ignored

(defun sum-tree (x)
  (cond ((numberp x) x)
        ((atom x) 0)
        (t (+ (sum-tree (car x))
              (sum-tree (cdr x))))))

(sum-tree '((3 bears) (3 bowls) (1 girl)))
; 7


; 8.42. write MY-SUBST, a recursive version of the SUBST function
(setf subst-l '(if i learn lisp i will be pleased))
(subst 'we 'i subst-l)
; (IF WE LEARN LISP WE WILL BE PLEASED)

(defun my-subst (x y l)
  (cond ((equal l y) x)
        ((atom l) l)
        (t (cons (my-subst x y (car l))
                 (my-subst x y (cdr l))))))

(my-subst 'we 'i subst-l)
; (IF WE LEARN LISP WE WILL BE PLEASED)


; 8.43. write FLATTEN, a function that returns all the elements of an arbitrarily
; nested list in a single-leel list
; '((A B (R)) A C (A D ((A (B)) R) A))) should return (A B R A C A D A B R A)

(defun flatten (l)
  (cond ((atom l) (list l))
        (t (append (flatten (car l))
                   (and (cdr l) (flatten (cdr l)))))))

(flatten '((A B (R)) A C (A D ((A (B)) R) A))) 
; (A B R A C A D A B R A)


; 8.44. write a function TREE-DEPTH that returns the maximum depth of a binary
; tree

(defun tree-depth (l)
  (cond ((atom l) 0)
        (t (+ 1
              (max 
                (tree-depth (car l))
                (tree-depth (cdr l)))))))

(tree-depth '(a . b))
; 1

(tree-depth '((a b c d)))
; 5

(tree-depth '((a . b) . (c . d)))
; 2


; 8.45. write a function PAREN-DEPTH that returns the maximum depth of nested
; parentheses in a list

(defun paren-depth (l)
  (cond ((atom l) 0)
        (t (max 
             (+ 1 (paren-depth (first l)))
             (paren-depth (rest l))))))

(paren-depth '(a b c))
; 1

(paren-depth '(a b ((c) d) e))
; 3


; Using helping functions
; For some problems it is useful to structure the solution as a helping function
; plus a recursive function
; The recursive function does most of the work. The helping function is the one 
; you call from the top level

(defun count-up-recursively (c n)
  (cond ((> c n) nil)
        (t (cons c
                 (count-up-recursively (+ c 1) n)))))

(defun count-up (n)
  (count-up-recursively 1 n))

; (dtrace count-up count-up-recursively)

(count-up 3)
; (1 2 3)
; ----Enter COUNT-UP
; |     Arg-1 = 3
; |   ----Enter COUNT-UP-RECURSIVELY
; |   |     Arg-1 = 1
; |   |     Arg-2 = 3
; |   |   ----Enter COUNT-UP-RECURSIVELY
; |   |   |     Arg-1 = 2
; |   |   |     Arg-2 = 3
; |   |   |   ----Enter COUNT-UP-RECURSIVELY
; |   |   |   |     Arg-1 = 3
; |   |   |   |     Arg-2 = 3
; |   |   |   |   ----Enter COUNT-UP-RECURSIVELY
; |   |   |   |   |     Arg-1 = 4
; |   |   |   |   |     Arg-2 = 3
; |   |   |   |    \--COUNT-UP-RECURSIVELY returned NIL
; |   |   |    \--COUNT-UP-RECURSIVELY returned (3)
; |   |    \--COUNT-UP-RECURSIVELY returned (2 3)
; |    \--COUNT-UP-RECURSIVELY returned (1 2 3)
;  \--COUNT-UP returned (1 2 3)


; 8.46. counting upward can also be solved by adding an element to the end of
; the list with each recursive call instead of adding elements to the beginning

(defun count-up-recursively-end (n)
  (cond ((zerop n) nil)
        (t (append (count-up-recursively-end (- n 1))
                   (list n)))))

(count-up-recursively-end 5)
; (1 2 3 4 5)

(count-up-recursively-end 0)
; NIL


; 8.47. write MAKE-LOAF, a function that returns a loaf of size N.

(defun make-loaf (n)
  (cond ((<= n 0) nil)
        (t (append (make-loaf (- n 1))
                   (list 'x)))))

(make-loaf 4)
; (X X X X)

(make-loaf 0)
; NIL

(make-loaf -1)
; NIL


; 8.48. write a recursive function BURY that buries an item under N levels of
; parens
; Recursion template: Single-test tail recursion

(defun bury (x n)
  (cond ((<= n 0) x)
        (t (bury (list x) (- n 1)))))

(bury 'fred 2)
; ((FRED))

(bury 'fred 5)
; (((((FRED)))))


; 8.49. write PAIRINGS, a function that pairs the elements of two lists
; You may assume that the two lists will be of equal length

(defun pairings (x y)
  (cond ((null x) y)
        (t (cons (list (first x) (first y))
                 (pairings (rest x) (rest y))))))

(pairings '(a b c) '(1 2 3))
; ((A 1) (B 2) (C 3))


; 8.50. write SUBLISTS, a function that returns the successive sublists of a list

(defun sublists (l)
  (cond ((null l) nil)
        (t (cons l
                 (sublists (rest l))))))

(sublists '(fee fie foe))
; ((FEE FIE FOE) (FIE FOE) (FOE))


; 8.51. write MY-REVERSE with a helping function plus a recursive function of
; two inputs

(setf r-test-list '(a b c))

(defun my-reverse-recursively (x y)
  (cond ((null x) y)
        (t (my-reverse-recursively 
             (rest x)
             (cons (first x) y)))))

(defun my-reverse (x)
  (my-reverse-recursively x nil))

(my-reverse r-test-list)
; (C B A)


; 8.52. write MY-UNION, a recursive version of UNION
(setf a '(soap water))

(union a '(no soap radio))
; (RADIO NO SOAP WATER)

(defun my-union-2 (x y)
  (append x (my-union-recursively x y)))

(defun my-union-recursively (x y)
  (cond ((null y) nil)
        ((member (first y) x)
         (my-union-recursively x (rest y)))
        (t (cons (first y)
                 (my-union-recursively
                   x
                   (rest y))))))

(my-union-recursively a '(no soap radio))
; (NO RADIO)

(my-union-2 a '(no soap radio))
; (SOAP WATER NO RADIO)


; 8.53. write LARGEST-EVEN, a recursive function that returns the largest even
; number in a list of non-negative integers
; Use the built in MAX function, which returns the largest of its inputs

(defun largest-even (l)
  (cond ((null l) 0)
        ((oddp (first l))
         (largest-even (rest l)))
        (t (max (first l)
                (largest-even (rest l))))))

(largest-even nil)
; 0

(largest-even '(5 2 4 3))
; 4


; 8.54. write HUGE, a recursive function that raises a number to its own power

(defun huge (x)
  (huge-helper x x))

(defun huge-helper (x n)
  (cond ((equal n 0) 1)
        (t (* x (huge-helper x (- n 1))))))

(huge 2)
; 4

(huge 3)
; 27

(huge 4)
; 256


; 8.55. what distinguishes a recursive function from a nonrecursive one?
; A recursive function will call itself until a base condition is met

; 8.56. write EVERY-OTHER, a recursive function that returns every other
; element of a list

(defun every-other (l)
  (cond
    ((null l) nil)
    (t (cons (first l)
             (every-other (rest (rest l)))))))

(every-other '(a b c d e f g))
; (A C E G)

(every-other '(I came I saw I conquered))
; (I I I)

; 8.57. write LEFT-HALF, a recursive function in two parts that returns the first
; n/2 elements of a list of length n.
; write the function so that the list does not have to be of even length
; you may use length but not reverse

(defun left-half (l)
  (let ((half-rounded (first (multiple-value-list (ceiling (/ (length l) 2.0))))))
    (left-half-helper l half-rounded)))

(defun left-half-helper (l x)
  (cond ((equal x 0) nil)
        (t (cons (first l)
                 (left-half-helper (rest l) (- x 1))))))

(left-half '())
; NIL

(left-half '(a b c d e))
; (A B C)

(left-half '(1 2 3 4 5 6 7 8))
; (1 2 3 4)


; 8.58. write MERGE-LISTS, a function that takes two lists of numbers, each in
; increasing order, as input and returns a list that is a merger of the elements
; in its inputs, in order

(defun merge-lists (x y)
  (cond
    ((null x) y)
    ((null y) x)
    ((< (first x) (first y))
     (cons (first x)
           (merge-lists (rest x) y)))
    (t (cons (first y)
              (merge-lists x (rest y))))))

(merge-lists '(1 2 6 8 10 12) '(2 3 5 9 13))
; (1 2 2 3 5 6 8 9 10 12 13)


; 8.59. recursive factorial
; - Is this definition recursive? yes
; - It appears to work as expected
(defun fact-r (n)
  (cond ((zerop n) 1)
        (t (/ (fact (+ n 1))
              (+ n 1)))))

(fact-r 0)
; 1

(time (fact-r 5))
; 120


; 8.60. Keyboard exercise
(setf family
      '((colin nil nil)
        (deirdre nil nil)
        (arthur nil nil)
        (kate nil nil)
        (frank nil nil)
        (linda nil nil)
        (suzanne colin deirdre)
        (bruce arthur kate)
        (charles arthur kate)
        (david arthur kate)
        (ellen arthur kate)
        (george frank linda)
        (hillary frank linda)
        (andre nil nil)
        (tamara bruce suzanne)
        (vincent bruce suzanne)
        (wanda nil nil)
        (ivan george ellen)
        (julie george ellen)
        (marie george ellen)
        (nigel andre hillary)
        (frederick nil tamara)
        (zelda vincent wanda)
        (joshua ivan wanda)
        (quentin nil nil)
        (robert quentin julie)
        (olivia nigel marie)
        (peter nigel marie)
        (erica nil nil)
        (yvette robert zelda)
        (diane peter erica)))

; a. write the functions FATHER, MOTHER, PARENTS and children
(defun father (x)
  (second (assoc x family)))

(defun mother (x) 
  (third (assoc x family)))

(defun children (x)
  (and x
       (mapcar #'first
               (remove-if-not
                 #'(lambda (y)
                     (member x (rest y)))
                 family))))

(defun parents (x)
  (union (and (father x) (list (father x)))
         (and (mother x) (list (mother x)))))

; parents
; find childs name in first position, remove the others
; second is father
; third is mother

(father 'suzanne)
; COLIN

(father nil) 
; NIL

(mother 'suzanne)
; DEIRDRE

(mother nil)
; NIL

(parents 'suzanne)
; (COLIN DEIRDRE)

(parents nil)
; NIL

(parents 'frederick)
; (TAMARA)

(children 'deirdre)
; (SUZANNE)

(children 'colin)
; (SUZANNE)

(children nil)
; NIL


; b. write SIBLINGS, a function that returns a list of a person's siblings,
; including genetic half-siblings

; siblings share one parent
; (siblings 'bruce)
; ('charles 'david 'ellen)
; find anyone who has arthur in second position or kate in third position
; remove the bruce from the collection

(defun siblings (x)
  (set-difference (union (children (father x))
                         (children (mother x)))
                  (list x)))


(siblings 'bruce)
; (CHARLES DAVID ELLEN)

(siblings 'zelda) 
; (JOSHUA)


; c. write MAPUNION, an applicative operator that takes a function and a list
; as input, applies the function to every element of the list, and computes the 
; union of all results
; hint: MAPUNION can be defined as a combination of two applicative operators 
; you already know

(defun mapunion (f l)
  (reduce #'union 
          (mapcar f l)))

(mapunion #'rest '((1 a b c) (2 e c j) (3 f a b c d)))
; (D B A F E C J)


; d. write GRANDPARENTS, a function that returns the set of a person's grandparents
; Use MAPUNION in your solution

(defun grandparents (x)
  (mapunion #'parents (parents x)))

(grandparents 'diane)
; (MARIE NIGEL)

(grandparents 'yvette)
; (JULIE QUENTIN VINCENT WANDA)


; e. write COUSINS, a function that returns the set of a person's genetically 
; related first cousins
; the chlidren of any of their parent's siblings
; (cousins 'julie)
; (tamara vincent nigel)

(defun cousins (x)
  (mapunion #'children
            (mapunion #'siblings (parents x))))

(cousins 'julie)
; (TAMARA VINCENT NIGEL)


; f. write the two-input recursive predicate DESCENDED-FROM that returns a true
; value if the first person is descended from the second
; hint: you are descended from someone if they are one of your parents, or if
; either your father or mother is descended from them. This is a recursive 
; definition

(defun descended-from (x y)
  (cond ((null x) nil)
        ((member y (parents x)) t)
        (t (or
             (descended-from (father x) y)
             (descended-from (mother x) y)))))

(descended-from 'tamara 'arthur)
; T

(descended-from 'tamara 'linda)
; NIL


; g. write the recursive function ANCESTORS that returns a person's set of 
; ancestors.
; hint: a person's ancestors are their parents plus their parents' ancestors

(defun ancestors (x)
  (cond ((null x) nil)
        (t (union
             (parents x)
             (union (ancestors (father x))
                    (ancestors (mother x)))))))

(ancestors 'marie) 
; (ARTHUR KATE LINDA FRANK GEORGE ELLEN)


; h. write the recursive function GENERATION-GAP that returns the number of 
; generations separating a person and one of his or her ancestors

(defun generation-gap-helper (x y n)
  (cond ((null x) nil)
        ((equal x y) n)
        (t (or (generation-gap-helper
                 (father x) y (1+ n))
               (generation-gap-helper
                 (mother x) y (1+ n))))))

(defun generation-gap (x y)
   (generation-gap-helper x y 0))

(generation-gap 'suzanne 'colin)
; 1

(generation-gap 'frederick 'colin)
; 3

(generation-gap 'frederick 'linda)
; nil


; i.
; 1. Is Robert descended from Deidre?
(descended-from 'robert 'deidre)
; NIL

; 2. Who are Yvette's ancestors?
(ancestors 'yvette)
; (WANDA VINCENT SUZANNE BRUCE ARTHUR KATE DEIRDRE COLIN LINDA FRANK GEORGE ELLEN
;  QUENTIN JULIE ROBERT ZELDA)

; 3. What is the generation gap between Olivia and Frank?
(generation-gap 'olivia 'frank)
; 3

; 4. Who are Peter's cousins?
(cousins 'peter)
; (JOSHUA ROBERT)

; 5. Who are Olivia's grandparents?
(grandparents 'olivia)
; (HILLARY ANDRE GEORGE ELLEN)


; Advanced topic
; Advantages of tail recursion

; Producing a tail-recursive version of an ordinary recursive function is to introduce
; an extra variable for accumulating augmentation values

(defun tr-count-slices (loaf)
  (tr-cs1 loaf 0))

(defun tr-cs1 (loaf n)
  (cond ((null loaf) n)
        (t (tr-cs1 (rest loaf (+ n 1))))))

; not tail recursive
(defun my-reverse-2 (x)
  (cond ((null x) nil)
        (t (append (reverse (rest x))
                   (list (first x))))))

(defun tr-reverse (x)
  (tr-rev1 x nil))

(defun tr-rev1 (x result)
  (cond ((null x) result)
        (t (tr-rev1
             (rest x)
             (cons (first x) result)))))

; (dtrace tr-reverse tr-rev1)

(tr-reverse '(a b c d))
; (D C B A)
; ----Enter TR-REVERSE
; |     Arg-1 = (A B C D)
; |   ----Enter TR-REV1
; |   |     Arg-1 = (A B C D)
; |   |     Arg-2 = NIL
; |   |   ----Enter TR-REV1
; |   |   |     Arg-1 = (B C D)
; |   |   |     Arg-2 = (A)
; |   |   |   ----Enter TR-REV1
; |   |   |   |     Arg-1 = (C D)
; |   |   |   |     Arg-2 = (B A)
; |   |   |   |   ----Enter TR-REV1
; |   |   |   |   |     Arg-1 = (D)
; |   |   |   |   |     Arg-2 = (C B A)
; |   |   |   |   |   ----Enter TR-REV1
; |   |   |   |   |   |     Arg-1 = NIL
; |   |   |   |   |   |     Arg-2 = (D C B A)
; |   |   |   |   |    \--TR-REV1 returned (D C B A)
; |   |   |   |    \--TR-REV1 returned (D C B A)
; |   |   |    \--TR-REV1 returned (D C B A)
; |   |    \--TR-REV1 returned (D C B A)
; |    \--TR-REV1 returned (D C B A)
;  \--TR-REVERSE returned (D C B A)


; 8.61. Write a tail-recursive version of COUNT-UP
(defun tr-count-up1 (n result)
  (cond ((zerop n) result)
        (t (tr-count-up1
             (- n 1)
             (cons n result)))))

(defun tr-count-up (n)
  (tr-count-up1 n nil))

(tr-count-up 5)
; (1 2 3 4 5)


; 8.62. Write a tail-recursive version of FACT
(defun tr-fact1 (x y)
  (cond ((zerop x) y)
        (t (tr-fact1 (- x 1) (* x y)))))

(defun tr-fact (n)
  (tr-fact1 n 1))

(tr-fact 5)
; 120


; 8.63. Write tail-recursive versions of UNION, INTERSECTION, and SET-DIFFERENCE
(defun tr-union (x y)
  (cond ((null x) y)
        ((member (first x) y )
         (tr-union (rest x) y))
        (t (tr-union
             (rest x)
             (cons (first x) y)))))

(tr-union '(a b c) '(c d e)) 
; (B A C D E)

(defun tr-intersect (x y)
  (tr-int1 x y nil))

(defun tr-int1 (x y result)
  (cond ((null x) result)
        ((member (first x) y)
         (tr-int1
           (rest x)
           y
           (cons (first x) result)))
        (t (tr-int1
             (rest x) y result))))

(tr-intersect '(a b c) '(c d e))
; (C)

(defun tr-set-difference (x y)
  (tr-setdiff1 x y nil))

(defun tr-setdiff1 (x y result)
  (cond ((null x) result)
        ((not (member (first x) y))
         (tr-setdiff1
           (rest x)
           y
           (cons (first x) result)))
        (t (tr-setdiff1
             (rest x) y result))))

(tr-set-difference '(a b c) '(c d e))
; (B A)


; Writing new applicative operators
; We can use FUNCALL to invoke a function that the user supplies. This allows
; us to write our own applicative operators.
(defun my-mapcar (fn x)
  (cond ((null x) nil)
        (t (cons (funcall fn (first x))
                 (my-mapcar fn (rest x))))))


; 8.64. Write a TREE-FIND-IF operator that returns the first non-NIL atom of
; a tree that satisfies a predicate

(defun tree-find-if (pred tree)
  (cond ((and tree
              (atom tree)
              (funcall pred tree))
         tree)
        ((atom tree) nil)
        (t (or (tree-find-if
                 pred (car tree))
               (tree-find-if
                 pred (cdr tree))))))

(tree-find-if #'oddp '((2 4) (5 6 7))) 
; 5


; The labels special function
; So far we've been writing helper functions as separate DEFUNs. This can be
; problematic because we might call a helper function accidentally.

; The LABELS special functiion allows us to establish local function definitions
; inside the body of the main function

(defun count-up-l (n)
  (labels ((count-up-recursively (c)
                                 (if (> c n) nil
                                   (cons c
                                         (count-up-recursively
                                           (+ c 1))))))
    (count-up-recursively 1)))


; 8.65. Use LABELS to write versions of TR-COUNT-SLICES and TR-REVERSE
(defun tr-count-slices (x)
  (labels ((trc1 (x n)
                 (if x
                   (trc1 (rest x)
                         (+ n 1))
                   n)))
    (trc1 x 0)))


(tr-count-slices '(x x x x x))
; 5

(defun tr-reverse (x)
  (labels ((trrev1 (x r)
                   (if x
                     (trrev1
                       (rest x)
                       (cons (first x) r))
                     r)))
    (trrev1 x nil)))

(tr-reverse '(a b c d))
; (D C B A)


; 8.66. write ARITH-EVAL, a function that evaluates arithmetic expressions

(defun arith-eval (x)
  (cond ((numberp x) x)
        (t (funcall (second x)
                    (arith-eval (first x))
                    (arith-eval (third x))))))

(arith-eval '(2 + (3 * 4)))
; 14


; 8.67. write a predicate LEGALP that returns T if its input is a legal arithmetic
; expression

(defun legalp (x)
  (cond ((numberp x) t)
        ((atom x) nil)
        (t (and (equal (length x) 3)
                (legalp (first x))
                (member (second x)
                        '(+ - * /))
                (legalp (third x))))))

(legalp 4)
; T

(legalp '((2 * 2) - 3))
; T

(legalp nil)
; NIL

(legalp '(a b c d))
; NIL


; 8.68. complete the sentence
; A proper list is a cons cell chain ending in NIL. Lists that aren't proper lists
; are called dotted lists, because they must be written with a dot. If we wanted 
; to define the concept of proper list recursively, we could say "NIL is a proper
; list, and so is any cons cell whose..." cdr is a proper list


; 8.69. write a recursive definition for positive integers greater than one in the
; terms of prime numbers
; A positive integer greater than 1 or the product of a prime and a positive integera
; greater than 1


; 8.70. write the function FACTOR-TREE that returns a factorization tree

(defun factor-tree (n)
  (fact-tree-help n 2))

(defun fact-tree-help (n p)
  (cond ((equal n p) n)
        ((zerop (rem n p))
         (list n p (fact-tree-help (/ n p) p)))
        (t (fact-tree-help n (+ p 1)))))

(factor-tree 60)
; (60 2 (30 2 (15 3 5)))


; 8.71. what are the terminal / nonterminal nodes of (A B (C D) E)
; A, B, C, D, E, NIL
; nonterminal nodes are the cons cells


; 8.72. pick a concept or object and describe it in terms of a general tree
; structure
; An organisation is often a hierarchical structure with a varying numbers of braches
; Nonterminal nodes: company, leadership, departments,
; Terminal nodes: employees
