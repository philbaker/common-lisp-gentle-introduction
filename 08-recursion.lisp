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
