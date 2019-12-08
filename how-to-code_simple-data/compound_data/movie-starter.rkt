
;; movie-starter.rkt

;; =================
;; Data definitions:

; 
; PROBLEM A:
; 
; Design a data definition to represent a movie, including  
; title, budget, and year released.
; 
; To help you to create some examples, find some interesting movie facts below: 
; "Titanic" - budget: 200000000 released: 1997
; "Avatar" - budget: 237000000 released: 2009
; "The Avengers" - budget: 220000000 released: 2012
; 
; However, feel free to resarch more on your own!
; 


(define-struct movie (title budget released))
;; Movie is (make-movie String, Number, Natural)
;; interp. (make-movie title budget released) is a movie
;;          title    is the title of the movie
;;          budget   is the budget of the movie
;;          released is the year at the released of the movie
(define M1 (make-movie "Titanic" 200000000 1997))
(define M2 (make-movie "Avatar" 237000000 2009))
(define M3 (make-movie "The Avengers" 220000000 2012))

;; =================
;; Functions:
(define (fn-for-movie m)
  (... (movie-title m)      ;String
       (movie-budget m)     ;Number
       (movie-released m))) ;Natural

; 
; PROBLEM B:
; 
; You have a list of movies you want to watch, but you like to watch your 
; rentals in chronological order. Design a function that consumes two movies 
; and produces the title of the most recently released movie.
; 
; Note that the rule for templating a function that consumes two compound data 
; parameters is for the template to include all the selectors for both 
; parameters.
; 


;; movie movie -> movie-title
;; produce title of the newer movie in given two movies
(check-expect (newer-movie-title M1 M2) "Avatar")
(check-expect (newer-movie-title M2 M3) "The Avengers")
(check-expect (newer-movie-title M3 M1) "The Avengers")

;(define (recently-movie-title m1 m2) "Avatar") ;stub

(define (newer-movie-title m1 m2)
  (if (>= (movie-released m1) (movie-released m2))
      (movie-title m1)
      (movie-title m2)))