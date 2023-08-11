; 4.1 Write a function MAKE-EVEN that makes an odd number even by adding one to it
(defun make-even (x)
  (if (oddp x) (+ x 1) x))

(make-even 1)
; 2

(make-even 2)
; 2


; 4.2 write a function FURTHER that makes a positive number larger by adding 
; one to it
(defun further (x)
  (if (zerop x)
    0
    (if (> x 0)
      (+ x 1)
      (- x 1))))

(further 5)
; 6

(further 0)
; 0

(further -5)
; -6


; 4.3 create the function MY-NOT using if and constants only
(defun my-not (x)
  (if x
    nil
    t))

(my-not t)
; NIL

(my-not nil)
; T

(my-not 'a)
; NIL


; 4.4 write a function ORDERED that takes two numbers as input and makes a
; list of them in ascending order
(defun ordered (x y)
  (if (> x y)
    (list y x)
    (list x y)))

(ordered 3 4)
; (3 4)

(ordered 4 3)
; (3 4)


; 4.5 - 3, 2, 1


; 4.6 write a version of my-abs-if using cond
(defun my-abs-if (x)
  (if (> x 0)
    x
    (- x)))

(my-abs-if 5)
; 5

(my-abs-if -5)
; 5

(my-abs-if 0)
; 0

(defun my-abs-cond (x)
  (cond ((> x 0) x)
        (t (- x))))

(my-abs-cond 5)
; 5

(my-abs-cond -5)
; 5

(my-abs-cond 0)
; 0


; 4.7 state whether parens are correct for the following cond expressions - if
; not show where the error is

; (cond (symbolp 'x) 'symbol
;       (t 'not-a-symbol))
; Incorrect - correction below
;
(cond ((symbolp 'x) 'symbol)
      (t 'not-a-symbol))
; SYMBOL

(cond ((symbolp 5) 'symbol)
      (t 'not-a-symbol))
; Correct
; NOT-A-SYMBOL

; (cond ((symbolp 'x) ('symbol))
;       (t 'not-a-symbol))
; Incorrect - correction below

(cond ((symbolp 'x) 'symbol)
      (t 'not-a-symbol))
; SYMBOL

; (cond ((symbolp 'x) 'symbol)
;       ((t 'not-a-symbol)))
; Incorrect - correction below

(cond ((symbolp 'x) 'symbol)
      (t 'not-a-symbol)) 
; SYMBOL


; 4.8 write EMPHASIZE3 which adds a symbol VERY onto the list if it doesn't
; know how to emphasize it
(defun emphasize2 (x)
  (cond ((equal (first x) 'good) (cons 'great (rest x)))
        ((equal (first x) 'bad) (cons 'awful (rest x)))
        (t x)))

(defun emphasize3 (x)
  (cond ((equal (first x) 'good) (cons 'great (rest x)))
        ((equal (first x) 'bad) (cons 'awful (rest x)))
        (t (cons 'very x))))

(emphasize3 '(long day))
; (VERY LONG DAY)

(emphasize3 '(very long day))
; (VERY VERY LONG DAY)


; 4.9 what is wrong with the following function?
; (defun make-odd (x)
;   (cond (t x)
;         ((not oddp x)) (+ 1 x)))

; (make-odd 3)
; 3

; (make-odd 4)
; 4

; (make-odd -2)
; -2

(defun make-odd (x)
  (cond ((not (oddp x)) (+ 1 x))
        (t x)))

(make-odd 3)
; 3

(make-odd 4)
; 5

(make-odd -2)
; -1


; 4.10 write a function CONSTRAIN that takes X, MAX, and min
(defun constrain-cond (x max min)
  (cond ((< x min) min)
        ((> x max) max)
        (t x)))

(constrain-cond 3 -50 -50)
; -50

(constrain-cond 92 -50 50)
; -50

(defun constrain-if (x max min)
  (if (< x min) min
    (if (> x max) max
      x)))

(constrain-if 3 -50 -50)
; -50

(constrain-if 92 -50 50)
; -50


; 4.11 write a function FIRSTZERO that takes a list of three numbers as input
; and returns a word "first", "second", "third" or "none" based on where zero
; is in the list
(defun firstzero (l)
  (cond ((equal (first l) 0) 'first)
        ((equal (second l) 0) 'second)
        ((equal (third l) 0) 'third)
        (t 'none)))

(firstzero '(0 1 2))
; FIRST

(firstzero '(3 0 4))
; SECOND

(firstzero '(1 2 0))
; THIRD

(firstzero '(1 2 3))
; NONE

; (firstzero 5 4 0) ; invalid number of arguments: 3


; 4.12 write a function CYCLE that cyclically counts from 1 to 99
(defun cycle (n)
  (cond 
    ((>= n 99) 1)
    ((> n 0) (+ n 1))))

(cycle 1)
; 2

(cycle 2)
; 3

(cycle 98)
; 99

 (cycle 99)
; 1

 (cycle 105)
; 1


; 4.13 write a function HOWCOMPUTE that is the inverse of the defined COMPUTE function
; ways to extend howcompute:
; - subtraction
; - division
; - find square root
; - find cube value
(defun compute (op x y)
  (cond ((equal op 'sum-of) (+ x y))
        ((equal op 'product-of) (* x y))
        (t '(that does not compute))))

(defun howcompute (x y res)
  (cond ((equal (+ x y) res) 'sum-of)
        ((equal (* x y) res) 'product-of)
        (t '(beats me))))

(compute 'sum-of 3 7)
; 10

(howcompute 3 7 10)
; SUM-OF

(compute 'product-of 2 4)
; 8

(howcompute 2 4 8)
; PRODUCT-OF

(compute 'zorch-of 3 1)
; (THAT DOES NOT COMPUTE)

(howcompute 3 1 55)
; (BEATS ME)


; 4.14 what results do the following expressions produce?

(and 'fee 'fie 'fum)
; FUM

(or 'fee 'fie 'foe)
; FEE

(or nil 'foe nil)
; FOE

(and 'fee 'fie nil)
; NIL

(and (equal 'abc 'abc) 'yes)
; YES

(or (equal 'abc 'abc) 'yes)
; T


; 4.15 write a predicate called GEQ that returns T if its first input is greater
; than or equal to its second input
(defun geq (x y)
  (if (>= x y)
    t
    nil))

(geq 5 5)
; T

(geq 8 5)
; T

(geq 1 5)
; NIL


; 4.16 write a function that squares a number if it is odd and positive, doubles
; it if it is odd and negative, and otherwise divides by 2
(defun my-calc (x)
  (cond ((and (oddp x) (> x 0)) (* x x))
        ((and (oddp x) (< x 0)) (* x 2))
        (t (/ x 2))))

(my-calc 3)
; 9

(my-calc -3)
; -6

(my-calc 6)
; 3

(my-calc -6)
; -3


; 4.17 write a predicate that returns T if the first input is BOY or GIRL,
; and the second input is CHILD, or the first input is either MAN or WOMAN and
; the second input is ADULT
(defun child-or-adult (x y)
  (or (and (or (equal x 'BOY) 
               (equal x 'GIRL)) 
           (equal y 'CHILD))
      (and (or (equal x 'MAN) 
               (equal x 'WOMAN)) 
           (equal y 'ADULT))))

 (child-or-adult 'BOY 'CHILD)
; T

 (child-or-adult 'BOY 'ADULT)
; NIL

 (child-or-adult 'GIRL 'CHILD)
; T

 (child-or-adult 'GIRL 'ADULT)
; NIL

 (child-or-adult 'MAN 'ADULT)
; T

 (child-or-adult 'MAN 'CHILD)
; NIL

 (child-or-adult 'WOMAN 'ADULT)
; T

 (child-or-adult 'WOMAN 'CHILD)
; NIL

 (child-or-adult 'CHAIR 'ADULT)
; NIL


; 4.18 write a function to act as a referee in Rock-Paper-Scissors
(defun play-rps (x y)
  (cond ((equal x y) 'tie)
        ((or (and (equal x 'rock)
                  (equal y 'scissors))
             (and (equal x 'scissors)
                  (equal y 'paper))
             (and (equal x 'paper)
                  (equal y 'rock)))
         'first-wins)
        (t 'second-wins)))

(play-rps 'scissors 'scissors)
; TIE

(play-rps 'rock 'scissors)
; FIRST-WINS

(play-rps 'rock 'paper)
; SECOND-WINS


; 4.19 show how to write (AND X Y Z W) using COND instead of AND. Then show
; how to write it with nested IFs
(and 'x 'y 'z 'w)
; W

(cond ((not 'x) nil)
      ((not 'y) nil)
      ((not 'z) nil)
      (t 'w))
; W

(if 'x
  (if 'y
    (if 'z 'w)))
; W


; 4.20 write a version of COMPARE using IF instead of COND. Also write a version
; using AND and OR
(defun compare (x y)
  (cond ((equal x y) 'numbers-are-the-same)
        ((< x y) 'first-is-smaller)
        ((> x y) 'first-is-bigger)))

(defun compare-if (x y)
  (if (equal x y)
    'numbers-are-the-same
    (if (< x y)
      'first-is-smaller
      'first-is-bigger)))

(defun compare-and-or (x y)
  (or
    (and (equal x y) 'numbers-are-the-same)
    (and (< x y) 'first-is-smaller)
    'first-is-bigger))

(compare 1 1)
; NUMBERS-ARE-THE-SAME

(compare-if 1 1)
; NUMBERS-ARE-THE-SAME

(compare-and-or 1 1)
; NUMBERS-ARE-THE-SAME

(compare 1 5)
; FIRST-IS-SMALLER

(compare-if 1 5)
; FIRST-IS-SMALLER

(compare-and-or 1 5)
; FIRST-IS-SMALLER

(compare 5 1)
; FIRST-IS-BIGGER

(compare-if 5 1)
; FIRST-IS-BIGGER

(compare-and-or 5 1)
; FIRST-IS-BIGGER


; 4.21 write versions of GTEST using IF and COND
(defun gtest (x y)
  (or (> x y)
      (zerop x)
      (zerop y)))

(defun gtest-if (x y)
  (if 
    (> x y) t
    (if 
      (zerop x) t
      (zerop y))))

(defun gtest-cond (x y)
  (cond ((> x y) t)
        ((zerop x) t)
        (t (zerop y))))

(gtest 5 1)
; T

(gtest-if 5 1)
; T

(gtest-cond 5 1)
; T

(gtest 5 5)
; NIL

(gtest-if 5 5)
; NIL

(gtest-cond 5 5)
; NIL

(gtest 0 0)
; T

(gtest-if 0 0)
; T

(gtest-cond 0 0)
; T

(gtest -5 0)
; T

(gtest-if -5 0)
; T

(gtest-cond -5 0)
; T

(gtest 0 -5)
; T

(gtest-if 0 -5)
; T

(gtest-cond 0 -5)
; T

; 4.22 write a predicate BOILINGP using COND, IF and AND/OR
; Rules:
; - takes two inputs: TEMP and SCALE
; - returns T if temp is above boiling point specified in scale
; - if scale is fahrenheit the boiling point is 212 degrees
; - if scale is celsius the boiling point is 100 degrees
(defun boilingp (temp scale)
  (cond
    ((and (> temp 212) (equal scale 'fahrenheit)) t)
    ((and (> temp 100) (equal scale 'celsius)) t)
    (t nil)))

(defun boilingp-if (temp scale)
  (if 
    (and (> temp 212) (equal scale 'fahrenheit)) 
    t
    (if
      (and (> temp 100) (equal scale 'celsius)) 
      t
      nil)))

(defun boilingp-and-or (temp scale)
  (or (and (> temp 212) (equal scale 'fahrenheit))
      (and (> temp 100) (equal scale 'celsius))))

(boilingp 201 'fahrenheit)
; NIL

(boilingp-if 201 'fahrenheit)
; NIL

(boilingp-and-or 201 'fahrenheit)
; NIL

(boilingp 250 'fahrenheit)
; T

(boilingp-if 250 'fahrenheit)
; T

(boilingp-and-or 250 'fahrenheit)
; T

(boilingp 50 'celsius)
; NIL

(boilingp-if 50 'celsius)
; NIL

(boilingp-and-or 50 'celsius)
; NIL

(boilingp 150 'celsius)
; T

(boilingp-if 150 'celsius)
; T

(boilingp-and-or 150 'celsius)
; T


; 4.23 if WHERE-IS had eight COND clauses, how many IFs, ORs and ANDs would equivalent functions need?
; 7 IFS
; 1 OR and 7 ANDs


; 4.24 why are conditionals important?
; they let you make decisions in a program


; 4.25 what does IF do if given two inputs instead of three
; it will return the last argument
(if
  t
  'hello
  nil)
; HELLO

(if
  t
  nil)
; NIL


; 4.26 You can always write a COND using IF because IF expressions can be nested


; 4.27 what does COND return if given no clauses, in other words what does COND evaluate to?
; it will return nil


; 4.28 suggest a more sophisticated way to rewrite IF as a combination of ANDs and
; ORs that does not fail
(if
  (oddp 5)
  (evenp 7)
  'foo)
; NIL

(or 
  (and (oddp 5) 
       (evenp 7)) 
  'foo)
; FOO

(or (and (oddp 5) (evenp 7))
    (and (not (oddp 5)) 'foo))
; NIL


; 4.29 write versions of LOGICAL-AND using IF and COND instead of AND
(defun logical-and (x y)
  (and y x t))

(defun logical-and-if (x y)
  (if x
    (if y
      t)))

(defun logical-and-cond (x y)
  (cond (x (cond (y t)))))

(logical-and 'a 'b)
; T

(logical-and-if 'a 'b)
; T

(logical-and-cond 'a 'b)
; T

(logical-and 'a nil)
; NIL

(logical-and-if 'a nil)
; NIL

(logical-and-cond 'a nil)
; NIL
