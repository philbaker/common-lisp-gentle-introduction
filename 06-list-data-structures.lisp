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


; 6.19 what are the results of using NIL as an input to SET-DIFFERENCE?
(set-difference ducks nil)
; (HUEY DEWEY LOUIE)

(set-difference nil ducks)
; NIL


; 6.20 which of its two inputs does SET-DIFFERENCE need to copy? Which input 
; never needs to be copied?
(setf line1 '(all things in moderation))

(setf line2 '(moderation in the defense of liberty is no virtue))

(set-difference line1 line2)
; (THINGS ALL)

(set-difference line2 line1)
; (VIRTUE NO IS LIBERTY OF DEFENSE THE)

; The first input needs to be copied but the second one doesn't. This is because
; the first input is returned minus the matches in the second input


; 6.21 write the function MY-SUBSETP a version of SUBSETP that returns T if its
; first input is a subset of its second input
(subsetp '(a i) '(a e i o u))
; T

(subsetp '(a x) '(a e i o u))
; NIL

(defun my-subsetp (x y)
  (not (set-difference x y)))

(my-subsetp '(a i) '(a e i o u))
; T

(my-subsetp '(a x) '(a e i o u))
; NIL


; 6.22 what is the result of the following expressions?
(setf a '(soap water))

(union a '(no soap radio))
; (RADIO NO SOAP WATER)

(intersection a (reverse a))
; (WATER SOAP)

(set-difference a '(stop for water))
; (SOAP)

(set-difference a a)
; NIL

(member 'soap a)
; (SOAP WATER)

(member 'water a)
; (WATER)

(member 'washcloth a)
; NIL


; 6.23 what lisp primitive determines the cardinality of a set?
(length '(a b c))


; 6.24 write a SET-EQUAL predicate that returns T if two things are equal as sets
(defun set-equal (x y)
  (equal (subsetp x y) (subsetp y x)))

(set-equal '(a b c) '(b c a))
; T

(set-equal '(a b c d) '(b c a))
; NIL


; 6.25 write the PROPER-SUBSETP predicate which returns T if its first input
; is a proper subset of its second input
(defun proper-subsetp (x y)
  (and (subsetp x y)
       (not (subsetp y x))))

(proper-subsetp '(a c) '(c a b))
; T

(proper-subsetp '(a b c) '(c a b))
; NIL

; Programming with sets
(defun titledp (name)
  (member (first name) '(mr ms miss mrs)))

(titledp '(jane doe))

(titledp '(ms jane doe))
; (MS MISS MRS)

(setf male-first-names
      '(john kim richard fred george))

(setf female-first-names
      '(jane mary wanda barbara kim))

(defun malep (name)
  (and (member name male-first-names)
       (not (member name female-first-names))))

(defun femalep (name)
  (and (member name female-first-names)
       (not (member name male-first-names))))

(malep 'richard)
; T

(malep 'barbara)
; NIL

(femalep 'barbara)
; T

(malep 'kim)
; NIL

(defun give-title (name)
  "Returns a name with an appropriate title on the front."
  (cond ((titledp name) name)
        ((malep (first name)) (cons 'mr name))
        ((femalep (first name)) (cons 'ms name))
        (t (append '(mr or ms) name))))

(give-title '(miss jane adams))
; (MISS JANE ADAMS)

(give-title '(john q public))
; (MR JOHN Q PUBLIC)

(give-title '(barbara smith))
; (MS BARBARA SMITH)

(give-title '(kim johnson))
; (MR OR MS KIM JOHNSON)

(defun gender-ambiguous-names ()
  (intersection male-first-names female-first-names))

(gender-ambiguous-names)
; (KIM)

(defun uniquely-male-names ()
  (set-difference male-first-names female-first-names))

(uniquely-male-names)
; (GEORGE FRED RICHARD JOHN)

; 6.26
(setf list-shapes '(large red shiny cube -vs- small shiny red four-sided pyramid))

; a. write a RIGHT-SIDE function that returns all features to the right of the
; -VS- symbol
(defun right-side (l)
  (cdr (member '-vs- l)))


(right-side list-shapes)

; b. write a function LEFT-SIDE that returns all the features to the lef of the
; -VS-
(defun left-side (l)
  (reverse (cdr (member '-vs- (reverse l)))))

; c. write a function COUNT-COMMON that returns the number of features the left
; and right sides of the input have in common
(defun count-common (l)
  (length 
    (intersection (left-side l) 
                  (right-side l))))

(count-common list-shapes)
; 2

; d. write the main function COMPARE that takes a list of features and returns
; (n COMMON FEATURES)
(defun compare (l)
  (list (count-common l) 'common 'features))

(compare list-shapes)
; (2 COMMON FEATURES)

(compare '(small red metal cube -vs- red plastic small cube))
; (3 COMMON FEATURES)


; 6.27 should ASSOC be considered a predicate even though it never returns T?
; Yes because it either returns an entry in a table or nil


; 6.28 assoc and rassoc - evaluate the following
(setf produce 
      '((apple . fruit) 
        (celery . veggie)
        (banana . fruit)
        (lettuce . veggie)))

(assoc 'banana produce)
; (BANANA . FRUIT)

(rassoc 'fruit produce)
; (APPLE . FRUIT)

(assoc 'lettuce produce)
; (LETTUCE . VEGGIE)

(rassoc 'veggie produce)
; (CELERY . VEGGIE)


; Programming with tables
(setf things
      '((object1 large green shiny cube)
        (object2 small red dull metal cube)
        (object3 red small dull plastic cube)
        (object4 small dull blue metal cube)
        (object5 small shiny red four-sided pyramid)
        (object6 large shiny green sphere)))

(defun description (x)
  (rest (assoc x things)))

(description 'object3)
; (RED SMALL DULL PLASTIC CUBE)

(defun differences (x y)
  (set-exclusive-or (description x)
                    (description y)))

(differences 'object2 'object3)
; (PLASTIC METAL)

(setf quality-table
      '((large . size)
        (small . size)
        (red . color)
        (green . color)
        (blue . color)
        (shiny . luster)
        (dull . luster)
        (metal . material)
        (plastic . material)
        (cube . shape)
        (sphere . shape)
        (pyramid . shape)
        (four-sided . shape)))

(defun quality (x)
  (cdr (assoc x quality-table)))

(quality 'red)
; COLOR

(quality 'large)
; SIZE

(defun quality-difference (x y)
  (quality (first (differences x y))))

(quality-difference 'object2 'object3)
; MATERIAL

(quality-difference 'object2 'object6)
; SHAPE

(quality-difference 'object2 'object4)
; COLOR

(differences 'object3 'object4)
; (METAL BLUE PLASTIC RED)

(sublis quality-table
        (differences 'object3 'object4))
; (MATERIAL COLOR MATERIAL COLOR)

(defun contrast (x y)
  (remove-duplicates
    (sublis quality-table (differences x y))))

(contrast 'object3 'object4)
; (MATERIAL COLOR)


; 6.29. what Lisp primitive returns the number of entries in a table?
; LENGTH

; 6.30. make a table called BOOKS of five books and their authors 
(setf books '((war-and-peace leo-tolstoy)
              (harry-potter j-k-rowling)
              (hamlet william-shakespeare)
              (miss-marple agatha-christie)
              (dragon-ball akira-toriyama)))


; 6.31. write the function WHO-WROTE that takes the name of a book as input
; and returns the book's author
(defun who-wrote (x)
  (second (assoc x books)))

(who-wrote 'hamlet)
; WILLIAM-SHAKESPEARE


; 6.32. what happens if we change the order books?
; nothing because we are looking up values by named key
(setf books (reverse books))

(who-wrote 'hamlet)
; WILLIAM-SHAKESPEARE


; 6.33. write a WHAT-WROTE function that takes an author's name as input and
; returns the title of one of their books
(setf books2 '((war-and-peace . leo-tolstoy)
               (harry-potter . j-k-rowling)
               (hamlet . william-shakespeare)
               (miss-marple . agatha-christie)
               (dragon-ball . akira-toriyama)))

(defun what-wrote (x)
  (first (rassoc x books2)))

(what-wrote 'leo-tolstoy)
; WAR-AND-PEACE


; 6.34. redesign the ATLAS table so that assoc can be used successfully
(setf atlas
      '((pennsylvania (pittsburgh johnstown))
        (ohio (columbus))
        (new-jersey (newark princeton trenton))))

(second (assoc 'new-jersey atlas))
; (NEWARK PRINCETON TRENTON)

(second (assoc 'pennsylvania atlas))
; (PITTSBURGH JOHNSTOWN)

(second (assoc 'ohio atlas))
; (COLUMBUS)


; 6.35. simulate the behavior of Nerdus Americanus
; a. design a data structure to capture its five states
(setf nerd-states '((sleeping . eating)
                    (eating . waiting)
                    (waiting . programming)
                    (programming . debugging)
                    (debugging . sleeping)))

; b. write a function NERDUS that given the name of a state returns its successor
(defun nerdus (x)
  (cdr (assoc x nerd-states)))

(nerdus 'sleeping)
; EATING
(nerdus 'eating)
; WAITING
(nerdus 'waiting)
; PROGRAMMING
(nerdus 'programming)
; DEBUGGING
(nerdus 'debugging)
; SLEEPING

; c. what is the result of (NERDUS 'PLAYING-GUITAR)
(nerdus 'playing-guitar)
; NIL

; d. write a function SLEEPLESS that works like NERDUS except it never sleeps
(defun sleepless (x)
   (let ((y (nerdus x)))
     (if (equal y 'sleeping)
       (nerdus y)
       y)))

(sleepless 'eating)
; WAITING
(sleepless 'waiting)
; PROGRAMMING
(sleepless 'programming)
; DEBUGGING
(sleepless 'debugging)
; EATING

; e. write a function NERD-ON-CAFFEINE that advances two states instead of one
(defun nerd-on-caffeine (x)
  (nerdus (nerdus x)))

(nerd-on-caffeine 'sleeping)
; WAITING
(nerd-on-caffeine 'eating)
; PROGRAMMING
(nerd-on-caffeine 'waiting)
; DEBUGGING
(nerd-on-caffeine 'programming)
; SLEEPING
(nerd-on-caffeine 'debugging)
; EATING

; f. if nerd on caffeine is currently programming, how many states will it 
; have to go through before it is debugging?
; 3


; 6.36. write a function to swap the first and last elements of any list
(setf lswap '(you cant buy love))

(defun swap-first-last (x)
  (let* ((a (reverse (rest x)))
         (b (reverse (rest a))))
    (cons (first a)
          (append b (list (first x))))))

(swap-first-last lswap)
; (LOVE CANT BUY YOU)


; 6.37. write ROTATE-LEFT and ROTATE-RIGHT functions that rotate the elements
; of a list
(setf letters '(A B C D E))
(first letters)
; A
(rest letters)
; (B C D E)

(last letters)
; (E)



(defun rotate-left (l)
  (append (rest l) 
          (list (first l))))

(rotate-left letters)
; (B C D E A)

(defun rotate-right (l)
  (let ((last-item (first (last l))))
    (cons last-item (remove last-item letters))))


; 6.38. give an example of two sets X and Y such that (SET-DIFFERENCE X Y) equals
; (SET-DIFFERENCE Y X)

(set-difference '(a b c) '(a b c))
; NIL

(set-difference '(a b c) '(x y z))
; (C B A)


; 6.39. what list function performs unary addition?
; APPEND


; 6.40. show how to transform the list (A B C D) into a table so that the ASSOC
; function using the table gives the same result as MEMBER using the list
(setf letters-2 '(a b c d))

(member 'a letters-2)
; (A B C D)
(member 'b letters-2)
; (B C D)
(member 'c letters-2)
; (C D)
(member 'd letters-2)
; (D)

(setf letters-table '((a b c d)
                      (b c d)
                      (c d)
                      (d)))

(assoc 'a letters-table)
; (A B C D)
(assoc 'b letters-table)
; (B C D)
(assoc 'c letters-table)
; (C D)
(assoc 'd letters-table)
; (D)


; 6.41
(setf rooms '((living-room 
                (north front-stairs)
                (south dining-room)
                (east kitchen))
              (upstairs-bedroom 
                (west library)
                (south front-stairs))
              (dining-room 
                (north living-room)
                (east pantry)
                (west downstairs-bedroom))
              (kitchen 
                (west living-room)
                (south pantry))
              (pantry 
                (north kitchen)
                (west dining-room))
              (downstairs-bedroom 
                (north back-stairs)
                (east dining-room))
              (back-stairs 
                (north library)
                (south downstairs-bedroom))
              (front-stairs 
                (north upstairs-bedroom)
                (south living-room))
              (library 
                (south back-stairs)
                (east upstairs-bedroom))))

(sdraw rooms)
; [*|*]--->etc.
;  |
;  v
; [*|*]-------->[*|*]------------------>[*|*]------------------>[*|*]--->NIL
;  |             |                       |                       |
;  v             v                       v                       v
; LIVING-ROOM   [*|*]--->[*|*]--->NIL   [*|*]--->[*|*]--->NIL   [*|*]--->etc.
;                |        |              |        |              |
;                v        v              v        v              v
;               NORTH    FRONT-STAIRS   SOUTH    DINING-ROOM    EAST

; a. write a function CHOICES that takes the name of a room as input and returns
; permissible directions Robbie may take from that room

(defun choices (x)
  (rest (assoc x rooms)))

(choices 'living-room)
; ((NORTH FRONT-STAIRS) (SOUTH DINING-ROOM) (EAST KITCHEN))

(choices 'back-stairs)
; ((NORTH LIBRARY) (SOUTH DOWNSTAIRS-BEDROOM))

; b. write a function LOOK that takes two inputs, a direction and a room and tells
; where Robbie would end up if he moved in that direction from the room
(defun look (direction room)
  (second (assoc direction (choices room))))

(look 'north 'pantry)
; KITCHEN

(look 'west 'pantry)
; DINING-ROOM

(look 'south 'pantry)
; NIL

; c. set Robbie's location to pantry
(defun set-robbie-location (place)
  "Moves Robbie to PLACE by setting the variable LOC"
  (setf loc place))

(set-robbie-location 'pantry)

; d. write a function HOW-MANY-CHOICES that tells how many choices Robbie has for
; where to move next
(defun how-many-choices ()
  (length (choices loc)))

(how-many-choices)
; 2

; e. 
; write a predicate UPSTAIRSP that returns T if its input is an upstairs location
; write a predicate ONSTAIRSP
(defun upstairsp (location)
  (or (equal location 'library)
      (equal location 'upstairs-bedroom)))

(defun onstairsp (location)
  (or (equal location 'backs-stairs)
      (equal location 'front-stairs)))

(upstairsp 'library)
; T
(upstairsp 'upstairs-bedroom)
; T
(upstairsp 'living-room)
; NIL

(defun onstairsp (location)
  (or (equal location 'backs-stairs)
      (equal location 'front-stairs)))

(onstairsp 'front-stairs)
; T
(onstairsp 'back-stairs)
; T
(onstairsp 'living-room)
; NIL

; f. write a function WHERE that returns where Robbie is
(defun where ()
  (if (onstairsp loc)
     (list 'robbie 'is 'on 'the loc)
     (list 'robbie 'is
           (if (upstairsp loc)
             'upstairs
             'downstairs) 
           'in 'the loc)))

(where)
; (ROBBIE IS DOWNSTAIRS IN THE DINING-ROOM)

; g. write a function MOVE that takes one input, a direction, and moves Robbie
; in that direction
(defun move (dir)
  (let ((new-loc (look dir loc)))
    (cond ((null new-loc)
           '(ouch! robbie hit a wall))
          (t (set-robbie-location new-loc)
             (where)))))

(move 'north)
; (ROBBIE IS DOWNSTAIRS IN THE KITCHEN)

; h. starting from the pantry, take Robbie to the library via the back stairs.
; Then take him to the kitchen, but do not lead him through the downstairs
; bedroom on the way
(set-robbie-location 'pantry)
(where)
; (ROBBIE IS DOWNSTAIRS IN THE PANTRY)

(move 'west)
; (ROBBIE IS DOWNSTAIRS IN THE DINING-ROOM)
(move 'west)
; (ROBBIE IS DOWNSTAIRS IN THE DOWNSTAIRS-BEDROOM)
(move 'north)
; (ROBBIE IS DOWNSTAIRS IN THE BACK-STAIRS)
(move 'north)
; (ROBBIE IS UPSTAIRS IN THE LIBRARY)
(move 'east)
; (ROBBIE IS UPSTAIRS IN THE UPSTAIRS-BEDROOM)
(move 'south)
; (ROBBIE IS ON THE FRONT-STAIRS)
(move 'south)
; (ROBBIE IS DOWNSTAIRS IN THE LIVING-ROOM)
(move 'east)
; (ROBBIE IS DOWNSTAIRS IN THE KITCHEN)


; 6.42. write a function ROYAL-WE that changes every occurrence of the symbol
; I in a list to the symbol WE
(defun royal-we (l)
  (subst 'we 'i l))

(royal-we '(if i learn lisp i will be pleased))
; (IF WE LEARN LISP WE WILL BE PLEASED)
