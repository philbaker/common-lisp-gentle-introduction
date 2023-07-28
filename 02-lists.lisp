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

