; 6.1 why is (NTH 4 '(A B C)) equal to NIL?
; because there are only 3 elements in the list and nth uses a 0-based index
(nth 2 '(a b c))
; C
(nth 3 '(a b c))
; NIL
(nth 4 '(a b c))
; NIL


; 6.2 what is the value of (NTH 3 '(A B C . D)) and why?
(nth 3 '(a b c . d))
; An error because D is not a list


; 6.3 what is the alue of (LAST '(ROSEBUD))
(last '(rosebud))
; (ROSEBUD)


; 6.4 what is the value of (LAST '((A B C)))
(last '((a b c)))
; ((A B C)) - because there is only one list inside the main list


; 6.5 write an expression to set the global variable LINE to the list 
; (ROSES ARE RED). Then evaluate the following expressions:
(setf line '(roses are red))

(reverse line)
; (RED ARE ROSES)

(nth 1 line)
; ARE

(reverse (reverse line))
; (ROSES ARE RED)

(append line (list (first line)))
; (ROSES ARE RED ROSES)

(append (last line) line)
; (RED ROSES ARE RED)

(list (first line) (last line))
; (ROSES (RED))

(cons (last line) line)
; ((RED) ROSES ARE RED)

(remove 'are line)
; (ROSES RED)

(append line '(violets are blue))
; (ROSES ARE RED VIOLETS ARE BLUE)


; 6.6 use the LAST function to write a function called LAST-ELEMENT that returns
; the last element of a list instead of the last cons cell. Write another version
; of LAST-ELEMENT using REVERSE instead of LAST. Write another version using NTH
; and LENGTH
(defun last-element (l)
  (first (last l)))

(last-element line)
; RED

(defun last-element-reverse (l)
  (first (reverse l)))

(last-element-reverse line)
; RED

(defun last-element-nth (l)
  (nth (- (length l) 1) l))

(last-element-nth line)
; RED


; 6.7 Use REVERSE to write a NEXT-TO-LAST function that returns the next-to-last
; element of a list. Write another version using NTH
(setf line-2 '(roses are red and blue))

(defun next-to-last (l)
  (second (reverse l)))

(defun next-to-last-nth (l)
  (nth (- (length l) 2) l))

(next-to-last line-2)
; AND

(next-to-last-nth line-2)
; AND


; 6.8 write a function my-butlast that returns a list with the last element 
; removed
(setf line-3 '(roses are red))
(setf line-4 '(g a g a))

(defun my-butlast (l)
  (reverse (cdr (reverse l))))

(my-butlast line-3)
; (ROSES ARE)

(my-butlast line-4)
; (G A G)


; 6.9 what primitive function does the following reduce to?
(defun mystery (x)
  (first (last (reverse x))))

(mystery line-3)
; ROSES (a symbol)


; 6.10 write a PALINDROMEP function
(defun palindromep (x)
  (equal x (reverse x)))

(palindromep '(A B C D C B A))
; T

(palindromep '(A B C A B C))
; NIL


; 6.11 write a MAKE-PALINDROME function
(defun make-palindrome (x)
  (append x (reverse x)))

(make-palindrome '(you and me))
; (YOU AND ME ME AND YOU)


; 6.12 does MEMBER have to copy its input to produce its result?
; Member points to one of the cons cells that make up its input or nil

(setf ducks '(huey dewey louie))
; (HUEY DEWEY LOUIE)

(member 'dewey ducks)
; (DEWEY LOUIE)


; 6.13 what is the result of intersecting a set with NIL?
(intersection ducks nil)
; NIL


; 6.14 what is the result of intersecting a set with itself?
(intersection ducks ducks)
; (LOUIE DEWEY HUEY)


; 6.15  write a CONTAINS-ARTICLE-P function that returns true if a sentence contains
; any article, such as "the", "a" or "an"
; write a version using MEMBER and OR
; could you solve this problem with AND instead of OR?
(defun contains-the-p (sent)
  (member 'the sent))

(defun contains-article-p (sent)
  (or
    (member 'a sent)
    (member 'the sent)
    (member 'an sent)))

(defun contains-article-p-and (sent)
  (not
    (and
      (not (member 'a sent))
      (not (member 'the sent))
      (not (member 'an sent)))))


(contains-article-p '(the cat sat on the mat))
; (THE CAT SAT ON THE MAT)

(contains-article-p-and '(the cat sat on the mat))
; T

(contains-article-p '(cat sat mat))
; NIL

(contains-article-p-and '(cat sat mat))
; NIL


; 6.16 what is the union of a set with nil?
(union ducks nil)
; (LOUIE DEWEY HUEY)


; 6.17 what is the union of a set with itself?
(union ducks ducks)
; (HUEY DEWEY LOUIE)


; 6.18 write a function ADD-VOWELS that takes a set of letters as input and
; adds the vowels (A E I O U) to the set
(defun add-vowels (s)
  (union s '(a e i o u)))

(add-vowels '(X A E Z))
; (U O I X A E Z)
