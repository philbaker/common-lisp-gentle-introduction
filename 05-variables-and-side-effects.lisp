; 5.1 rewrite POOR-STYLE to create a new local variable Q using LET instead of
; SETF to change P
(defun poor-style (p)
  (setf p (+ p 5))
  (list 'result 'is p))

(poor-style 5)
; (RESULT IS 10)

(defun good-style (p)
  (let ((q (+ p 5)))
    (list 'result 'is q)))

(good-style 5)
; (RESULT IS 10)


; 5.2 What is is a side effect?
; Something that mutates a value or does something other than simply return
; a value


; 5.3 what is the difference between a local and global variable?
; A local variable is only available in its scope. A global variable is available
; everywhere


; 5.4 why must SETF be a macro function instead of a regular function?
; It has to be a macro so that it doesn't evaluate expressions passed to it 
; when assigning variables


; 5.5 are LET and LET* equivalent when you are only creating one local variable?
; Yes because there are no intermediate varibles


; 5.6 dice exercise
; a. write a function THROW-DIE that returns a random number from 1 to 6 inclusive
(defun throw-die ()
  "Returns a random number from 1 to 6 inclusive"
  (+ (random 6) 1))

(throw-die)

; b. write a function THROW-DICE that throws two dice and returns a list of
; two numbers
(defun throw-dice ()
  "Calls throw-die two times and returns the two numbers in a list"
  (let ((x (throw-die))
        (y (throw-die)))
    (list x y)))

(throw-dice)
