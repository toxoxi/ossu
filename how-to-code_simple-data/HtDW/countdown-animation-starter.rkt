(require 2htdp/image)
(require 2htdp/universe)

;; countdown-animation starter.rkt

; 
; PROBLEM:
; 
; Design an animation of a simple countdown. 
; 
; Your program should display a simple countdown, that starts at ten, and
; decreases by one each clock tick until it reaches zero, and stays there.
; 
; To make your countdown progress at a reasonable speed, you can use the 
; rate option to on-tick. If you say, for example, 
; (on-tick advance-countdown 1) then big-bang will wait 1 second between 
; calls to advance-countdown.
; 
; Remember to follow the HtDW recipe! Be sure to do a proper domain 
; analysis before starting to work on the code file.
; 
; Once you are finished the simple version of the program, you can improve
; it by reseting the countdown to ten when you press the spacebar.
; 


(require 2htdp/image)
(require 2htdp/universe)

;; Simple Countdown which display a number, ten to zero each 1 sec.

;; =================
;; Constants:
(define WIDTH 200)
(define HEIGHT 200)

(define MTS (empty-scene WIDTH HEIGHT))
(define TEXT-SIZE 50)

(define DECREASE-NUM 1)
(define INTERVAL 1)

;; =================
;; Data definitions:

;; Countdown is Number
;; interp. which represent current number on countdown
(define CD1 10) ;not started yet if created world with 10
(define CD2 5)  ;at the middle
(define CD3 0)  ;finished
#;
(define (fn-for-countdown cd)
  (... cd))

;; =================
;; Functions:

;; Countdown -> Countdown
;; start the world (main 11)
;; 
(define (main cd)
  (big-bang cd                                      ; Countdown
            (on-tick   decrease-countdown INTERVAL) ; Countdown -> Countdown
            (to-draw   render)                      ; Countdown -> Image
            (stop-when countdown-finished?)         ; Countdown -> Boolean
            (on-key    handle-key)))                ; Countdown KeyEvent -> Countdown

;; Countdown -> Countdown
;; produce the next countdown, by decreasing it with DECREASE-NUM
(check-expect (decrease-countdown 10) (- 10 DECREASE-NUM))
(check-expect (decrease-countdown 6) (- 6 DECREASE-NUM))
(check-expect (decrease-countdown 10) (- 10 DECREASE-NUM))

;(define (decrease-countdown cd) 5) ;stub

(define (decrease-countdown cd) (- cd DECREASE-NUM))

;; Countdown -> Image
;; render the countdown image at appropriate place on MTS 
(check-expect (render 5) (overlay (text "5" TEXT-SIZE "orange") MTS))

;(define (render cd) MTS) ;stub

(define (render cd)
  (overlay (text (number->string cd) TEXT-SIZE "orange") MTS))

;; Countdown -> Boolean
;; check whether countdown has finished or not.
(check-expect (countdown-finished? 10)  false)
(check-expect (countdown-finished? 0)   false)
(check-expect (countdown-finished? -1)  true)

;(define (countdown-finished? cd) true) ;stub

(define (countdown-finished? cd) (> 0 cd))

;; Countdown KeyEvent → Countdown
;; reset number to initial number
(check-expect (handle-key 10 " ")  11)
(check-expect (handle-key 10 "a")  10)
(check-expect (handle-key  0 " ")  11)
(check-expect (handle-key  0 "a")  0)

;(define (handle-key c ke) 0) ;stub

(define (handle-key c ke)
  (cond [(key=? ke " ") 10]
        [else c]))