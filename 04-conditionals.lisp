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
