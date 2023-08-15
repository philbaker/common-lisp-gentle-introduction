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

; c. write SNAKE-EYES-P and BOXCARS-P predicate functions
(defun snake-eyes-p (x)
  (equal x '(1 1)))

(snake-eyes-p '(1 1))
; T
(snake-eyes-p (throw-dice))

(defun boxcars-p (x)
  (equal x '(6 6)))

(boxcars-p '(6 6))
; T
(boxcars-p (throw-dice))

; d. write INSTANT-WIN-P and INSTANT-LOSS-P functions for the game of craps
 (defun instant-loss-p (x)
   (let ((total (+ (first x) (second x))))
     (or (equal total 2) (equal total 3) (equal total 12))))

(instant-loss-p '(1 1))
; T
(instant-loss-p '(1 2))
; T
(instant-loss-p '(2 1))
; T
(instant-loss-p '(6 6))
; T
(instant-loss-p (throw-dice))

 (defun instant-win-p (x)
   (let ((total (+ (first x) (second x))))
     (or (equal total 7) (equal total 11))))

(instant-win-p '(3 4))
; T
(instant-win-p '(4 3))
; T
(instant-win-p '(5 6))
; T
(instant-win-p '(6 5))
; T
(instant-win-p (throw-dice))

; e. write a SAY-THROW function
(defun say-throw (x)
  (cond ((instant-loss-p x) 'SNAKEYES)
        ((instant-win-p x) 'BOXCARS)
        (t (+ (first x) (second x)))))

(say-throw '(1 1))
; SNAKEYES
(say-throw '(6 5))
; BOXCARS
(say-throw (throw-dice))

; f. write a CRAPS function that plays the game
(defun craps ()
  (let ((throw (throw-dice)))
    (append
      (list 'throw (first throw)
            'and (second throw)
            '--
            (say-throw throw)
            '--)
      (cond ((instant-win-p throw) '(you win))
            ((instant-loss-p throw) '(you lose))
            (t (list 'your 'point 'is (+ (first throw) (second throw))))))))
(craps)
; (THROW 5 AND 3 -- 8 -- YOUR POINT IS 8)

; g. write a TRY-FOR-POINT function that simulates the part of the game after
; the first throw 
(defun try-for-point (x)
  (let* ((throw (throw-dice))
        (val (+ (first throw) (second throw))))
    (append
      (list 'throw (first throw)
            'and (second throw)
            '--
            (say-throw throw)
            '--)
      (cond ((equal val x) '(you win))
            ((equal val 7) '(you lose))
            (t '(throw again))))))

 (try-for-point 5)
