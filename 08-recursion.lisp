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
