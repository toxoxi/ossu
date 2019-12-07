(require 2htdp/image)
(require 2htdp/universe)

;; traffic-light-starter.rkt

; 
; PROBLEM:
; 
; Design an animation of a traffic light. 
; 
; Your program should show a traffic light that is red, then green, 
; then yellow, then red etc. For this program, your changing world 
; state data definition should be an enumeration.
; 
; Here is what your program might look like if the initial world 
; state was the red traffic light:
; .
; Next:
; .
; Next:
; .
; Next is red, and so on.
; 
; To make your lights change at a reasonable speed, you can use the 
; rate option to on-tick. If you say, for example, (on-tick next-color 1) 
; then big-bang will wait 1 second between calls to next-color.
; 
; Remember to follow the HtDW recipe! Be sure to do a proper domain 
; analysis before starting to work on the code file.
; 
; Note: If you want to design a slightly simpler version of the program,
; you can modify it to display a single circle that changes color, rather
; than three stacked circles. 
; 


(require 2htdp/image)
(require 2htdp/universe)

;; Traffilc light which changes color every second. (simpler version)

;; =================
;; Constants:
(define WIDTH 220)
(define HEIGHT 640)

;; =================
;; Data definitions:

;; LightState represent color of traffic light

;; LightState is one of:
;;  - "red"
;;  - "yellow"
;;  - "green"
;; interp. the color of a traffic light

;; <examples are redundant for enumerations>
 
#;
(define (fn-for-light-state ls)
  (cond [(string=? "red" ls) (...)]
        [(string=? "yellow" ls) (...)]
        [(string=? "green" ls) (...)]))
;; Template rules used:
;;  - one of: 3 cases
;;  - atomic distinct: "red"
;;  - atomic distinct: "yellow"
;;  - atomic distinct: "green"


;; =================
;; Functions:

;; LightState -> LightState
;; start the world with (main "red")
;; 
(define (main ls)
  (big-bang ls                        ; LightState
    (on-tick   advance-light-state 1) ; LightState -> LightState
    (to-draw   render-light)))        ; LightState -> Image

;; LightState -> LightState
;; produce the next light state with current light state
(check-expect (advance-light-state "red") "green")
(check-expect (advance-light-state "yellow") "red")
(check-expect (advance-light-state "green") "yellow")

;(define (advance-light-state ls) "red") ;stub

(define (advance-light-state ls)
  (cond [(string=? "red" ls) "green"]
        [(string=? "yellow" ls) "red"]
        [(string=? "green" ls) "yellow"]))


;; LightState -> Image
;; render traffic light with current light state
(check-expect (render-light "red") (light-circle "red"))
(check-expect (render-light "yellow") (light-circle "yellow"))
(check-expect (render-light "green") (light-circle "green"))

;(define (render-light ls) MTS) ;stub

(define (render-light ls) (light-circle ls))

(define (light-circle color) (circle 50 "solid" color))