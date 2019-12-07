;; HtDD Design Quiz

;; Age is Natural
;; interp. the age of a person in years
(define A0 18)
(define A1 25)

#;
(define (fn-for-age a)
  (... a))

;; Template rules used:
;; - atomic non-distinct: Natural


; Problem 1:
; 
; Consider the above data definition for the age of a person.
; 
; Design a function called teenager? that determines whether a person
; of a particular age is a teenager (i.e., between the ages of 13 and 19).


;; Age → Boolean
;; produce true if given age is teenager
(check-expect (teenager? 12) false)
(check-expect (teenager? 13) true)
(check-expect (teenager? 19) true)
(check-expect (teenager? 30) false)

;(define (teenager? a) true) ;stub

;<template from Age>
(define (teenager? a)
  (and (<= 13 a) (<= a 19)))


; Problem 2:
; 
; Design a data definition called MonthAge to represent a person's age
; in months.


;; MonthAge is Natural
;; interp. the month age represent age in month
(define MA1 56)
(define MA2 144)

#;
(define (fn-for-month-age ma)
  (... ma))

;; Template rules used:
;; - atomic non-distinct: Natural


; Problem 3:
; 
; Design a function called months-old that takes a person's age in years 
; and yields that person's age in months.
; 


;; Age → MonthAge
;; calculate month age with given age
(check-expect (months-old 5) (* 5 12))
(check-expect (months-old 20) (* 20 12))
(check-expect (months-old 57) (* 57 12))

;(define (months-old ma) 60) ;stub

;<template from MonthAge>
(define (months-old ma) (* ma 12))

; Problem 4:
; 
; Consider a video game where you need to represent the health of your
; character. The only thing that matters about their health is:
; 
;   - if they are dead (which is shockingly poor health)
;   - if they are alive then they can have 0 or more extra lives
; 
; Design a data definition called Health to represent the health of your
; character.
; 
; Design a function called increase-health that allows you to increase the
; lives of a character.  The function should only increase the lives
; of the character if the character is not dead, otherwise the character
; remains dead.


;; Definition

;; Health is one of:
;; - false
;; - Natural[0..)
;; interp.
;;   false        means the character is dead
;;   Natural[0..) means the character alive and their number of lives
(define H1 false)
(define H2 3)

#;
(define (fn-for-health h)
  (cond [(false? h) (...)]
        [else (... h)]))

;; Template rules used:
;;  - one of: 2 cases
;;  - atomic distinct: false
;;  - atomic non-distinct: Natural[0..)


;; Function

;; Health → Health
;; increase health unless character is dead
(check-expect (increase-health false) false)
(check-expect (increase-health 1) 2)
(check-expect (increase-health 5) 6)

;(define (increase-health h) 6) ;stub

;<template from Health>
(define (increase-health h)
  (cond [(false? h) false]
        [else (add1 h)]))