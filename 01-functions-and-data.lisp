; Exercises

; 1.4 Define a SUB2 function that subtracts two from its input
(defun SUB1 (n)
  (- n 1))

(defun SUB2 (n)
  (SUB1 (SUB1 n)))

(SUB2 5)
; 3

; 1.5 Show how to write TWOP in terms of ZEROP and SUB2
(defun TWOP (n)
  (zerop (SUB2 n)))

(TWOP 2)
; T
