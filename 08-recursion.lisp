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
